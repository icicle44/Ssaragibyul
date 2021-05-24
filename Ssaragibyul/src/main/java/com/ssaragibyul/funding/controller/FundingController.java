package com.ssaragibyul.funding.controller;

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
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.donation.domain.Donation;
import com.ssaragibyul.donation.domain.DonationLike;
import com.ssaragibyul.donation.domain.DonationReport;
import com.ssaragibyul.funding.domain.Funding;
import com.ssaragibyul.funding.domain.FundingReport;
import com.ssaragibyul.funding.service.FundingService;
import com.ssaragibyul.member.domain.Member;
import com.ssaragibyul.visit.domain.Visit;
// 깃 확인용 주석

@Controller
public class FundingController {

	// 깃 확인용
	@Autowired
	private FundingService fService;
	
	@RequestMapping(value = "fundingListView.do", method = RequestMethod.GET)
	public ModelAndView fundingListView(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page) {

		return mv;
	}
	 @RequestMapping(value="/fundingIndex.do", method=RequestMethod.GET)
	 public String fundingIndex() {
		 return "../../index";
	 }
	
	 @RequestMapping(value="fundingList.do", method=RequestMethod.GET)
	 public String fundingList(Model model) {
		 ArrayList<Funding> fList = fService.printAllProject();
		 if(!fList.isEmpty()) {
				model.addAttribute("fList", fList);
				return "funding/fundingList";
			}else {
				model.addAttribute("msg", "펀딩 목록조회 실패");
				return "common/errorPage";
			}
		}
	 

	 @RequestMapping(value="suggestPage.do", method=RequestMethod.GET)
	 public String SuggestMain() {
		 return "common/suggestPage";
	 }
	 						
	 @RequestMapping(value="fundingSuggest.do", method=RequestMethod.GET)
	 public String FsuggestMain() {
		 return "funding/fundingSuggest";
	 }
	 
	@RequestMapping(value = "fundingDetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView fundingDetail(ModelAndView mv, @RequestParam("projectNo") int projectNo) {
		
		return mv;
	}


	@RequestMapping(value = "fundingWriteView.do", method = RequestMethod.GET)
	public String fundingOfferView() {
		return "";
	}
	
	 @RequestMapping(value="fundingRegister.do", method=RequestMethod.POST)
	 public String memberRegister( @ModelAttribute Funding funding, Model model) {
		 int result = fService.registerProject(funding);
		 if(result > 0) {
			 return "redirect:fundingIndex.do";
		 }else {
			 model.addAttribute("msg", "회원 가입 실패!!");
			 return "common/errorPage";
		 }
	 }


//	@RequestMapping(value = "fundingRegister.do", method = RequestMethod.POST)
//	public ModelAndView fundingRegister(ModelAndView mv, @ModelAttribute Funding funding, @RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile, HttpServletRequest request) {
//
//		return mv;
//	}

	public String saveFile(MultipartFile file, HttpServletRequest request) {
	
		return null;
	}

	@RequestMapping(value = "fundingModifyView.do")
	public ModelAndView fundingModifyView(ModelAndView mv, @RequestParam("projectNo") int projectNo) {

		return mv;
	}

	@RequestMapping(value = "fundingUpdate.do", method = RequestMethod.POST)
	public ModelAndView fundingUpdate(ModelAndView mv, HttpServletRequest request, @ModelAttribute Funding funding, @RequestParam(value = "reloadFile", required = false) MultipartFile reloadFile) {
	
		return mv;
	}

	// 게시글 삭제(실제로는 상태 업데이트)
	@RequestMapping(value = "fundingDelete.do", method = RequestMethod.GET)
	public String fundingDelete(Model model, @RequestParam("projectNo") int projectNo, @RequestParam("renameFilename") String renameFilename, HttpServletRequest request) {
	
		return "";
	}

	public void deleteFile(String fileName, HttpServletRequest request) {

	}
	
	@ResponseBody
	@RequestMapping(value="addComments.do", method=RequestMethod.POST)
	public String addComments(@ModelAttribute Reply reply, HttpSession session) {
			
	return "";
	}
	
	@RequestMapping(value="CommentsList.do", method=RequestMethod.GET)
	public void CommentsList(HttpServletResponse response, @RequestParam("projectNo") int boarprojectNodNo) throws Exception {

	}
	
	public void RecommendList(@RequestParam("dProjectNo.do") int projectNo) {
		ArrayList<Funding> fList = fService.printAllRecommend(projectNo);
		
	}
	
	public void changeLikeStatus() {

	}
	
	public void changeFundingStatus() {

	}
	
	public int checkLikes(int projectNo, String userId) {
		int result = 0;
		return result;
	}
	public int updateLikesCount(int projectNo, String userId, String state) {
		int result = 0;
		return result;
	}
	public int plusLikesCount(String userId, int projectNo) {
		int result = 0;
		return result;
	}
	public int minusLikesCount(String userId, int projectNo, String state) {
		int result = 0;
		return result;
	}
	public int getLikes(String userId, int projectNo) {
		int likes = 0;
		return likes;
	}
	public String ReportView(FundingReport fReport) {
		return "";
	}
	
	public String fundingPay() {
		return "";
	}
	
}
