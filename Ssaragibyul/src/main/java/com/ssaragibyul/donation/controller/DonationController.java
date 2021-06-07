package com.ssaragibyul.donation.controller;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.donation.domain.Donation;
import com.ssaragibyul.donation.domain.DonationComments;
import com.ssaragibyul.donation.domain.DonationFile;
import com.ssaragibyul.donation.domain.DonationLike;
import com.ssaragibyul.donation.domain.DonationLog;
import com.ssaragibyul.donation.domain.DonationReport;
import com.ssaragibyul.donation.service.DonationService;
import com.ssaragibyul.member.domain.Member;

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

	// 텍스트 에디터 입력시 파일 저장 
	   @RequestMapping(value="donationRegister_Editer.do", method=RequestMethod.POST)
	   public void saveBoardImage(HttpServletRequest request, HttpServletResponse response, 
			   					@RequestParam("uploadImage") MultipartFile uploadImage) throws Exception {
	      String savePath = request.getSession().getServletContext().getRealPath("resources") + "\\upLoadFile_Editer";
	      String fiStoredName = saveImageFile(uploadImage, savePath);
	      
	      // 텍스트 에디터에 저장정보 보내주기
	      String image = "/resources/dUpLoadFile_Editer/" + fiStoredName;
	      Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	      gson.toJson(image, response.getWriter());
	   }
  	

	// 제안하기 업로드(등록)
  	@RequestMapping(value = "donationRegister.do", method = RequestMethod.POST)
  	public String donationRegister(@ModelAttribute Donation donation, DonationFile donationFile,
  									@RequestParam(value = "uploadFile", required=false) MultipartFile uploadFile,
  									@RequestParam(value = "uploadFileSub1", required = false) MultipartFile uploadFileSub1,
  									@RequestParam(value = "uploadFileSub2", required = false) MultipartFile uploadFileSub2,
  									HttpServletRequest request, Model model) {
  		
  		if(!uploadFile.getOriginalFilename().equals("") && uploadFile.getOriginalFilename() != null) {
  			// 이클립스 워크스페이스에 파일 저장하는 부분
  			// 길어지기때문에 saveFile 메소드를 따로 빼서 작성
  			String filePath = saveFile(uploadFile, request);
  			if (filePath != null) {
				donationFile.setFileName(uploadFile.getOriginalFilename());
			}
  		}
  		if (!uploadFileSub1.getOriginalFilename().equals("") && uploadFileSub1.getOriginalFilename() != null) {
			String filePath = saveFile(uploadFileSub1, request);
			if (filePath != null) {
				donationFile.setFileSub1Name(uploadFileSub1.getOriginalFilename());
			}
		}
  		if (!uploadFileSub2.getOriginalFilename().equals("") && uploadFileSub2.getOriginalFilename() != null) {
			String filePath = saveFile(uploadFileSub2, request);
			if (filePath != null) {
				donationFile.setFileSub2Name(uploadFileSub2.getOriginalFilename());
			}
		}

  		int result = dService.registerDonation(donation, donationFile);
  		System.out.println(result);
  		if (result > 0) {
			return "redirect:donationList.do";
		} else {
			model.addAttribute("msg", "제안 등록 실패");
			return "common/errorPage";
		}
  	}
  	
  	// Image 이름 변경 및 에디터용
  	public String saveImageFile(MultipartFile file, String savePath) {
		      
  		// 저장폴더 선택
  		File folder = new File(savePath);
	  
  		// 폴더가 없을 경우 자동 생성 (한 번만 만들면 됨)
  		if(!folder.exists()) {
  			folder.mkdir();
  		}
  		
		// 파일명 변경하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmSS");
		String originalFilename = file.getOriginalFilename();
		String renameFilename = sdf.format(new Date(System.currentTimeMillis())) + "." + originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
	  
		String filePath = folder + "\\" + renameFilename;
	  
		// 파일 저장
		try {
			file.transferTo(new File(filePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
			return renameFilename;
    }
  	
	      
	// 기존 코드(에디터 사용 전)
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
		
		dService.addReadCountHit(projectNo);
		
		Donation donation = dService.printOne(projectNo);
		System.out.println(donation);
		
		DonationFile donationFile = dService.printOneFile(projectNo);
		
		DonationLog donationLog = dService.printSponserNumber(projectNo);
		
		ArrayList<DonationLike> donationLikeUser = dService.printOneLike(projectNo);
		
		if ((donation != null)&&(donationFile != null)) {
			mv.addObject("donationFile", donationFile);
			mv.addObject("donationLikeUser", donationLikeUser);
			mv.addObject("donationLog", donationLog);
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
		// 게시물 상세 조회
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
	
	// 신고하기 페이지로 이동하기
	@RequestMapping(value="donationAccusation.do", method=RequestMethod.POST)
	public ModelAndView donationAccusation(ModelAndView mv, @RequestParam("projectNo") int projectNo) {
		// 게시글 상세 조회
		Donation donation = dService.printOne(projectNo);
		if (donation != null) {
			// 메소드 체이닝 방식
			mv.addObject("donation", donation).setViewName("donation/accusationPage");
		} else {
			mv.addObject("msg", "기부 참여 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}		
 
	// 신고하기 
	@RequestMapping(value="accusation.do", method = RequestMethod.POST )
	public String accusation_ReportRegister(@ModelAttribute DonationReport donationReport) { 
		int result = dService.accusationRegister(donationReport);
		if(result > 0) {
			return "donation/donationList";
		}else {
			return "common/errorPage";
		}
	}		

	
	
	
	//펀딩 참여 페이지에서 '참여완료' 했을시 펀딩로그와 펀딩 프로젝트 테이블에 인서트
	@RequestMapping(value = "donationJoinComplete.do", method = RequestMethod.POST)
	public String donationJoincomplete(@ModelAttribute DonationLog donationLog, Donation donation,
										@RequestParam("projectNo")int projectNo, Model model) {
		int result = dService.registerDonationLog(donation, donationLog); // serviceImpl에서 store 메소드 2개 사용 + 포인트 내역 업데이트 메소드 추가
		ArrayList<DonationLog> donationLogOne = dService.printDonationLogOne(projectNo);
		if ((result > 0 )&&(donationLogOne != null)) {
			model.addAttribute("donationLogOne", donationLogOne);
			return "redirect:donationList.do";
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
			return "redirect:donationList.do";
		}else {
			model.addAttribute("msg", "좋아요 등록 실패");
			return "common.errorPage";
		}
	}
	
	// 좋아요 취소
	@RequestMapping(value="donationLikeDelete.do", method = RequestMethod.POST)
	 public String donationLikeDelete(@ModelAttribute Donation donation, DonationLike donationLike, 
			 					  HttpServletRequest request,
			 					  Model model) { 
		 int result = dService.donationLikeRemove(donation, donationLike);
		 if(result > 0) {
			 return "redirect:donationList.do";
		 }else {
			 model.addAttribute("msg", "좋아요 취소 실패!!");
			 return "common/errorPage";
		 }
	 }
	
	
	// 댓글 작성
	@ResponseBody
	@RequestMapping(value = "addWriteComment.do", method = RequestMethod.POST)
	public String addWriteReply(@ModelAttribute Reply reply, HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		reply.setUserId(loginUser.getUserId());
		int result = dService.registerReply(reply);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}	
	}
  	
	// 댓글 목록 출력
	@RequestMapping(value = "commentAllList.do", method = RequestMethod.GET)
	public void replyList(HttpServletResponse response, @RequestParam("projectNo") int projectNo) throws Exception {
		ArrayList<Reply> rList = dService.printAllReply(projectNo);
		if (!rList.isEmpty()) {
			Gson gson = new GsonBuilder().setDateFormat("yy-MM-dd").create(); // 날짜 포맷 변경!
			gson.toJson(rList, response.getWriter());
		} else {
			System.out.println("데이터가 없습니다.");
		}
	}	
	
	// 댓글 수정
	@ResponseBody
	@RequestMapping(value="updateComment.do", method=RequestMethod.POST)
	public String updateReply(@ModelAttribute Reply reply) {
		int result = dService.updateReply(reply);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 댓글 삭제
	@ResponseBody
	@RequestMapping(value = "removeComment.do", method = RequestMethod.GET)
	public String deleteReply(@ModelAttribute Reply reply) {
		int result = dService.deleteReply(reply);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
//	@RequestMapping(value="donationSelectMoney.do", method=RequestMethod.GET)
//	 public String donationSelectMoney(Model model) {
//		 ArrayList<Donation> fListandFile = dService.printAllProjectForMoney();   
//		 ArrayList<Donation> fListandFileEnd = dService.printAllProjectEnd();   
//		 if(!fListandFile.isEmpty()) {				
//				model.addAttribute("fListandFile", fListandFile);
//				model.addAttribute("fListandFileEnd", fListandFileEnd);
//				return "funding/fundingList";
//			}else {
//				model.addAttribute("msg", "펀딩 목록조회 실패");
//				return "common/errorPage";
//			}
//	
//	 }
//	 
//	 @RequestMapping(value="fundingSelectLike.do", method=RequestMethod.GET)
//	 public String fundingSelectLike(Model model) {
//		 ArrayList<Funding> fListandFile = fService.printAllProjectForLike();   
//		 ArrayList<Funding> fListandFileEnd = fService.printAllProjectEnd();   
//		 if(!fListandFile.isEmpty()) {				
//				model.addAttribute("fListandFile", fListandFile);
//				model.addAttribute("fListandFileEnd", fListandFileEnd);
//				return "funding/fundingList";
//			}else {
//				model.addAttribute("msg", "펀딩 목록조회 실패");
//				return "common/errorPage";
//			}
//	
//	 }
	
	

}
