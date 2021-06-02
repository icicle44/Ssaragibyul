package com.ssaragibyul.donation.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.donation.domain.Donation;
import com.ssaragibyul.donation.domain.DonationComments;
import com.ssaragibyul.donation.domain.DonationLike;
import com.ssaragibyul.donation.domain.DonationReport;
import com.ssaragibyul.donation.service.DonationService;

@Controller
public class DonationController {

	@Autowired
	private DonationService dService;

	
	// 기부 리스트 보여주기: 테이블 2개 조인해서 불러오는 것
	@RequestMapping(value = "donationList.do", method = RequestMethod.GET) 
	public String donationList(Model model) { 
		ArrayList<Donation> dListandFile = dService.printAllProject(); 
		if (!dListandFile.isEmpty()) {
			model.addAttribute("dListandFile", dListandFile); 
			return "donation/donationList"; 
		} else { 
			model.addAttribute("msg", "기부 목록 조회 실패");
			return "common/errorPage"; 
		} 
	}

  	// 제안하기 페이지 -> 기부 페이지로 이동 
  	@RequestMapping(value="donationSuggest.do", method=RequestMethod.GET) 
  	public String donationSuggestMain() { 
  		return "donation/donationSuggest"; 
	}

  	// 제안하기 업로드(등록)
  	
  	
  	
  	
  	
  	
  	
  	
	
	// 기부 리스트 상세 조회(dDetail)
	public ModelAndView dDetail(ModelAndView mv, @RequestParam("dProjectNo") int dProjectNo,
			@ModelAttribute DonationLike dLike) {

		// 좋아요 카운트
		dService.addLikeCount(dProjectNo, dLike);

		// 금액 카운트..?
		dService.goalPriceCount(dProjectNo);

		// 달성률
		dService.achieve(dProjectNo);

		// 남은 기간
		dService.dateRemain(dProjectNo);

		// 참여자
		dService.participant(dProjectNo);

		// 게시물 조회
		Donation donation = dService.printOne(dProjectNo);
		return mv;
	}

	// 기부 등록화면
	public String dWriteView() {
		return "";
	}

	// 기부 등록
	public ModelAndView dRegister(ModelAndView mv, @ModelAttribute Donation donation) {

		// 서버에 파일 저장

		// 디비에 데이터 저장
		int result = 0;
		result = dService.registerDonation(donation);
		return mv;
	}

	// 파일 저장
	public String saveFile() {
		// 파일 저장 경로 설정
		// 저장 폴더 선택
		// 폴더가 없을 시 자동 생성
		// 파일명 변경
		// 파일 저장
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
