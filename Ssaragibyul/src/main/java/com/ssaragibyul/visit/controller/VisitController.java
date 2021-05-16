package com.ssaragibyul.visit.controller;

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

import com.ssaragibyul.common.Reply;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.visit.domain.Visit;
import com.ssaragibyul.visit.service.VisitService;

@Controller
public class VisitController {
	
	@Autowired
	private VisitService vService;
	
	public ModelAndView visitListView(ModelAndView mv,@RequestParam(value="page", required=false) Integer page) {

		return mv;
	}
	
	@RequestMapping(value="visitDetail", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView visitDetail(ModelAndView mv, @RequestParam("visitNo") int visitNo) {
		
		
		return mv;
	}
	// 게시글 등록화면
	@RequestMapping(value="visitWriteView", method=RequestMethod.GET)
	public String visitWriteView() {
		return "";
	}
	// 게시글 등록
	@RequestMapping(value="visitRegister", method=RequestMethod.POST)
	public ModelAndView visitRegister(ModelAndView mv,@ModelAttribute Visit visit,@RequestParam(value="uploadFile", required=false) MultipartFile uploadFile, HttpServletRequest request) {

		return mv;
	}
	
	// 게시글 수정화면
	@RequestMapping(value="visitModifyView")
	public ModelAndView visitModifyView(ModelAndView mv, @RequestParam("visitNo") int visitNo) {

		return mv;
	}
	// 게시글 수정
	@RequestMapping(value="visitUpdate", method=RequestMethod.POST)
	public ModelAndView visitUpdate(ModelAndView mv, HttpServletRequest request, @ModelAttribute Visit visit, @RequestParam(value="reloadFile", required=false) MultipartFile reloadFile) {

		return mv;
	}
	
	// 게시글 삭제
	@RequestMapping(value="visitDelete", method=RequestMethod.GET)
	public String visitDelete(Model model, @RequestParam("visitNo") int visitNo,@RequestParam("renameFilename") String renameFilename,HttpServletRequest request) {

		return "common/errorPage";
	}
	// 파일저장
	public String saveFile(MultipartFile file, HttpServletRequest request) {

		return "";
	}
	// 파일 삭제
	public void deleteFile(String fileName, HttpServletRequest request) {
		
	}
	// 댓글등록
	@ResponseBody
	@RequestMapping(value="addReply", method=RequestMethod.POST)
	public String addReply(@ModelAttribute Reply reply, HttpSession session) {

		return "fail";
	}
	// 댓글삭제
	@RequestMapping(value="replyList", method=RequestMethod.GET)
	public void getReplyList(HttpServletResponse response, @RequestParam("visitNo") int visitNo) throws Exception {
		
		
	}
	@RequestMapping(value="noticeSearch.kh", method=RequestMethod.GET)
	public String noticeSearch(@ModelAttribute Search search, Model model) {
		
		// 2개의 값을 하나에 담아서 보내는 방법
		// 1. Domain(VO) 클래스 이용
		// 2. HashMap 사용하기
			return "common/errorPage";
		}
	public int addHitsCount(int visitNo) {
		int result = 0;
		
		return result;
	}
	public int checkLikes(int visitNo, String userId) {
		int result = 0;
		return result;
	}
	public int updateLikesCount(int visitNo, String userId, String state) {
		int result = 0;
		return result;
	}
	public int plusLikesCount(String userId, int visitNo) {
		int result = 0;
		
		return result;
	}
	public int minusLikesCount(String userId, int visitNo, String state) {
		int result = 0;
		
		return result;
	}
	public int getLikes(String userId, int visitNo) {
		int likes = 0;

		return likes;
	}
}
