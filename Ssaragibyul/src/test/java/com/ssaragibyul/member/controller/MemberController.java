package com.ssaragibyul.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssaragibyul.member.domain.Member;

public class MemberController {
	
	@RequestMapping(value="login.kh", method=RequestMethod.POST)
	public String memberLogin(HttpServletRequest request) {
			return "";
	}
	@RequestMapping(value="logout.kh", method=RequestMethod.GET)
	public String memberLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:"; // sendRedirect와 유사함
		
	}
	// 회원가입 폼
	@RequestMapping(value="enrollView.kh", method=RequestMethod.GET)
	public String enrollView() {
		return "member/memberJoin";
	}
	// 회원등록
	@RequestMapping(value="memberRegister.kh", method=RequestMethod.POST)
	public String memberRegister(@ModelAttribute Member member, @RequestParam("post") String post, @RequestParam("address1") String address1, @RequestParam("address2")String address2, Model model) {
		
		return "redirect:home.kh";
	}
	// 마이페이지 뷰
	@RequestMapping(value="myInfo.kh", method=RequestMethod.GET)
	public String myInfoView(Member member) {
		
		return "member/myPage";
	}
	// 정보수정
	@RequestMapping(value="memberModify.kh", method=RequestMethod.POST)
	public String modifyMember(@ModelAttribute Member member, @RequestParam("post") String post, @RequestParam("address1")String address1, @RequestParam("address2") String address2, Model model, HttpServletRequest request) {

		return "common/errorPage";
	}
	// 회원 탈퇴
	@RequestMapping(value="memberDelete.kh", method=RequestMethod.GET)
	public String memberDelete(@RequestParam("userId") String userId, Model model) {

		return "common/errorPage";
	}
	
	// 아이디 중복 검사
	@ResponseBody ///////중요
	@RequestMapping(value="dupId.kh", method=RequestMethod.GET)
	public String idDuplicateCheck(@RequestParam("userId") String userId) {
		return "";
		
	}
}