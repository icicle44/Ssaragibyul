package com.ssaragibyul.donation.controller;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.donation.domain.Donation;
import com.ssaragibyul.donation.domain.DonationComments;
import com.ssaragibyul.donation.domain.DonationFile;
import com.ssaragibyul.donation.domain.DonationLike;
import com.ssaragibyul.donation.domain.DonationLog;
import com.ssaragibyul.donation.domain.DonationReport;
import com.ssaragibyul.donation.service.DonationService;
;


@Controller
public class DonationController {

	@Autowired
	private DonationService dService;
	
	// 기부 리스트 보여주기: 테이블 2개 조인해서 불러오는 것
	@RequestMapping(value = "donationList.do", method = RequestMethod.GET) 
	public String donationList(Model model) { 
		ArrayList<Donation> dListandFile = dService.printAllProject();
		ArrayList<Donation> dListandFileEnd = dService.printAllProjectEnd();  
		if (!dListandFile.isEmpty()) {
			model.addAttribute("dListandFile", dListandFile); 
			model.addAttribute("dListandFileEnd", dListandFileEnd);
			return "donation/donationList"; 
		} else { 
			model.addAttribute("msg", "기부 목록 조회 실패");
			return "common/errorPage"; 
		} 
	}

	
	@RequestMapping(value = "donationListFullPro.do", method = RequestMethod.GET)
	public String donationListFullPro(Model model) {
		ArrayList<Donation> dListandFile = dService.printAllProjectLimit();
		ArrayList<Donation> dListandFileEnd = dService.printAllProjectEnd();   
		 if(!dListandFile.isEmpty()) {				
			model.addAttribute("dListandFile", dListandFile);
			model.addAttribute("dListandFileEnd", dListandFileEnd);
			return "donation/donationList";
		}else {
			model.addAttribute("msg", "펀딩 목록조회 실패");
			return "common/errorPage";
		}
	}
	
	 @RequestMapping(value="donationListFullEnd.do", method=RequestMethod.GET)
	 public String donationListFullEnd(Model model) {
		 ArrayList<Donation> dListandFile = dService.printAllProject();
		 ArrayList<Donation> dListandFileEnd = dService.printAllProjectEndLimit();
		 if(!dListandFile.isEmpty()) {				
			model.addAttribute("dListandFile", dListandFile);
			model.addAttribute("dListandFileEnd", dListandFileEnd);
			return "donation/donationList";
		}else {
			model.addAttribute("msg", "펀딩 목록조회 실패");
			return "common/errorPage";
		}
	}
	 
	 
  	// 제안하기 페이지 -> 기부 페이지로 이동 
  	@RequestMapping(value="donationSuggest.do", method=RequestMethod.GET) 
  	public String donationSuggestMain() { 
  		return "donation/donationSuggest"; 
	}

  	
  	// 제안하기 업로드(등록)
  	@RequestMapping(value = "donationRegister.do", method = RequestMethod.POST)
  	public String donationRegister(@ModelAttribute Donation donation, DonationFile donationFile,
  									@RequestParam(value = "uploadFile", required=false) MultipartFile uploaFile,
  									@RequestParam(value = "uploadFileSub1", required = false) MultipartFile uploadFileSud1,
  									@RequestParam(value = "uploadFileSud2", required = false) MultipartFile uploadFileSud2,
  									HttpServletRequest request, Model model) {
  		if(!uploaFile.getOriginalFilename().equals("")) {
  			// 이클립스 워크스페이스에 파일 저장하는 부분
  			// 길어지기때문에 saveFile 메소드를 따로 빼서 작성
  			String filePath = saveFile(uploaFile, request);
  			if (filePath != null) {
				donationFile.setFileName(uploaFile.getOriginalFilename());
			}
  		}
  		if (!uploadFileSud1.getOriginalFilename().equals("")) {
			String filePath = saveFile(uploadFileSud1, request);
			if (filePath != null) {
				donationFile.setFileSub1Name(uploadFileSud1.getOriginalFilename());
			}
		}
  		if (!uploadFileSud2.getOriginalFilename().equals("")) {
			String filePath = saveFile(uploadFileSud2, request);
			if (filePath != null) {
				donationFile.setFileSub2Name(uploadFileSud2.getOriginalFilename());
			}
		}

  		int result = dService.registerDonation(donation, donationFile);
  		if (result > 0) {
			return "redirect:donationList.do";
		} else {
			model.addAttribute("msg", "제안 등록 실패");
			return "common/errorPage";
		}
  	}
  	
  	
	// 파일 저장
	public String saveFile(MultipartFile uploaFile, HttpServletRequest request) {
		// 파일 저장 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\dUpLoadFiles";
		// 저장 폴더 선택
		File folder = new File(savePath);
		// 폴더가 없을 시 자동 생성
		
		if (!folder.exists()) {
			folder.mkdir();
		}
		String filePath = folder + "\\" + uploaFile.getOriginalFilename();
		// 파일저장
		try {
			uploaFile.transferTo(new File(filePath));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 파일 저장
		// donationRegister에서 이어서 쓰는 이미지 파일을 이클립스 내에 저장하는 별도의 파일 저장 메소드
		return filePath;
	}
	
	// 기부 상세 페이지 
	@RequestMapping(value = "donationDetail.do", method = RequestMethod.GET)
	public ModelAndView donationdetail(ModelAndView mv, @RequestParam("projectNo") int projectNo) {
		System.out.println(projectNo);
		
		dService.addReadCountHit(projectNo);
		
		Donation donation = dService.printOne(projectNo);
		
		DonationFile donationFile = dService.printOneFile(projectNo);
		
		ArrayList<DonationLike> donationLike = dService.printOneLike(projectNo);
		
		if ((donation != null)&&(donationFile != null)) {
			mv.addObject("donationFile", donationFile);
			mv.addObject("donationLike", donationLike);
			mv.addObject("donation", donation).setViewName("donation/donationDetail");
		} else {
			mv.addObject("msg", "기부 상세 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 기부 참여 페이지
	@RequestMapping(value = "donationJoin.do", method = RequestMethod.POST)
	public ModelAndView donationJoin(ModelAndView mv, @RequestParam("projectNo") int projectNo) {
		Donation donation = dService.printOne(projectNo);
		if (donation != null) {
			// 메소드 체이닝 방식
			mv.addObject("donation", donation).setViewName("donation/donationJoin");
		} else {
			mv.addObject("msg", "기부 참여 실패");
			mv.setViewName("common/errorPage");
		}
		return mv; 
	}	
	
	//펀딩 참여 페이지에서 '참여완료' 했을시 펀딩로그와 펀딩 프로젝트 테이블에 인서트
	@RequestMapping(value = "donationJoinComplete.do", method = RequestMethod.POST)
	public String donationJoincomplete(@ModelAttribute DonationLog donationLog, Donation donation ) {
		int result = dService.registerDonationLog(donation, donationLog); // serviceImpl에서 store 메소드 2개 사용 + 포인트 내역 업데이트 메소드 추가
		if (result > 0 ) {
			return "donation/donationJoinCompleteView";
		} else {
			return "common.errorPage";
		}
	}
	
	// 좋아요 
	@RequestMapping(value = "donationLikeAdd.do", method = RequestMethod.POST)
	public String donationLikeAdd(@ModelAttribute Donation donation, DonationLike donationLike,
									HttpServletRequest resuest, Model model) {
		int result = dService.donationLikeRegister(donation, donationLike);
		if (result > 0) {
			return "donation/donationJoinCompleteView";
		}else {
			model.addAttribute("msg", "좋아요 등록 실패");
			return "common.errorPage";
		}
	}
	
  	
  	

	/*
	 * // 좋아요 카운트 dService.addLikeCount(dProjectNo, dLike);
	 * 
	 * // 금액 카운트..? dService.goalPriceCount(dProjectNo);
	 * 
	 * // 달성률 dService.achieve(dProjectNo);
	 * 
	 * // 남은 기간 dService.dateRemain(dProjectNo);
	 * 
	 * // 참여자 dService.participant(dProjectNo);
	 * 
	 * // 게시물 조회 Donation donation = dService.printOne(dProjectNo); return mv; }
	 */

	// 기부 등록화면
	public String dWriteView() {
		return "";
	}



	// 기부 게시글 수정
	public ModelAndView dModifyView(ModelAndView mv, @RequestParam("dProjectNo") int dProjectNo) {
		Donation donation = dService.printOne(dProjectNo);
		return mv;
	}

	// 파일 수정
	public ModelAndView dUpdate(ModelAndView mv, @ModelAttribute Donation donation) {
		// 삭제 후 업로드
		// 기존 파일 삭제
		// 새 파일 업로드
		// 디비 수정
		int result = dService.modifyDonation(donation);

		return mv;
	}

	// 기부 게시물 삭제
	public String dDelete(Model model, @RequestParam("dProjectNo") int dProjectNo) {
		// 업로드 된 파일 삭제
		// 디비에 데이터 업데이트
		int result = dService.removeDonation(dProjectNo);
		//
		return "";
	}

	// 파일 삭제
	public void deleteFile() {

	}

	// 댓글 등록
	public String addComments(@ModelAttribute DonationComments dComments) {
		int result = dService.resisterComment(dComments);
		return "";
	}

	// 댓글 목록
	public void CommentsList(@RequestParam("dProjectNo") int dProjectNo) {
		ArrayList<DonationComments> cList = dService.printAllCommnets(dProjectNo);
	}

	// 기부 추천(하단에 표시)
	public void RecommendList(@RequestParam("dProjectNo") int dProjectNo) {
		ArrayList<Donation> dList = dService.printAllRecommend(dProjectNo);
	}

	///////////////////////////

	// 프로젝트 신고하기 페이지가기
	public String dReportView(DonationReport dReport) {
		return "";
	}

	// 결제하기
	public String dPay() {
		return "";
	}

	// 참여한 기부 프로젝트(마이페이지)
	public String dMyView() {
		return "";
	}

	// 좋아요한 기부 프로젝트(마이페이지)
	public String likeView() {
		return "";
	}

	// 제안한 기부 프로젝트
	public String lDelete(Model model, @RequestParam("dProjectNo") int dProjectNo, @ModelAttribute DonationLike dLike) {
		// 업로드 된 파일 삭제
		// 디비에 데이터 업데이트
		int result = dService.removeLike(dProjectNo, dLike);
		//
		return "";
	}

	// 제안한 기부 프로젝트(마이페이지)
	public String suggestView() {
		return "";
	}

	// 제안한 기부 프로젝트 수정
	public ModelAndView sModifyView(ModelAndView mv, @RequestParam("dProjectNo") int dProjectNo) {
		Donation donation = dService.printOneSuggest(dProjectNo);
		return mv;
	}

	// 파일 수정
	public ModelAndView sUpdate(ModelAndView mv, @ModelAttribute Donation donation) {
		// 삭제 후 업로드
		// 기존 파일 삭제
		// 새 파일 업로드
		// 디비 수정
		int result = dService.modifySuggest(donation);

		return mv;
	}

	// 제안한 기부 프로젝트 삭제
	public String sDelete(Model model, @RequestParam("dProjectNo") int dProjectNo) {
		// 업로드 된 파일 삭제
		// 디비에 데이터 업데이트
		int result = dService.removeSuggest(dProjectNo);
		//
		return "";
	}

	// 파일 삭제
	public void deleteSuggestFile() {

	}
}
