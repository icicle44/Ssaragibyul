package com.ssaragibyul.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssaragibyul.member.domain.Member;
import com.ssaragibyul.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping(value = "login.do", method =  {RequestMethod.GET, RequestMethod.POST})
	  public String loginView() {
	        return "member/login";
	  }
	
	
	@RequestMapping(value="memberLogin.do", method =  {RequestMethod.GET, RequestMethod.POST})
	public String memberLogin(HttpServletRequest request,
							@ModelAttribute Member member, Model model) {
		
		Member mOne = new Member(member.getUserId(), member.getUserPw());
		Member loginUser = mService.loginMember(mOne);
		if (loginUser != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			return "redirect:index.jsp";
		}else {
			model.addAttribute("msg", "로그인 실패");
			return "common/errorPage";
		}
	}
	@RequestMapping(value="logout.do", method=RequestMethod.GET)
	public String memberLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:index"; // sendRedirect와 유사함
	}
	
	/*
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
	@ResponseBody 
	@RequestMapping(value="dupId.kh", method=RequestMethod.GET)
	public String idDuplicateCheck(@RequestParam("userId") String userId) {
		return "";
		
	}
	
	// 아아디 찾기
	public String searchId(@RequestParam("userId") String userId, Model model) {

		return "common/errorPage";
	}
	
	// 비밀번호 찾기
	public String searchPw(@RequestParam("userPw") String userPw, Model model) {

		return "common/errorPage";
	}
	*/
}