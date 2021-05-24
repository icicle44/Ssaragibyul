package com.ssaragibyul.member.controller;

import java.io.PrintWriter;

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

import com.ssaragibyul.member.domain.Member;
import com.ssaragibyul.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;


	
	
	//로그인 페이지로 이동
	@RequestMapping(value = "login.do", method =  {RequestMethod.GET, RequestMethod.POST})
	  public String loginView() {
	        return "member/login";
	  }
	
	// 로그인
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
	
	//로그아웃
	@RequestMapping(value="logout.do", method=RequestMethod.GET)
	public String memberLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:index.jsp"; // sendRedirect와 유사함
	}
	
	// 회원가입 폼
	@RequestMapping(value="enrollView.do", method=RequestMethod.GET)
	public String enrollView() {
		return "member/memberJoin";
	}
	
	// 아이디 중복 검사
	@ResponseBody 
	@RequestMapping(value="checkId.do", method=RequestMethod.GET)
	public String idDuplicateCheck(@RequestParam("userId") String userId) {
		return String.valueOf(mService.checkIdDup(userId));
	}
	
	// 회원등록
	@RequestMapping(value="memberRegister.do", method=RequestMethod.POST)
	public String memberRegister(@ModelAttribute Member member, 
								@RequestParam("post") String post, 
								@RequestParam("address1") String address1, 
								@RequestParam("address2")String address2, 
								@RequestParam("yy") String yy, 
								@RequestParam("mm") String mm, 
								@RequestParam("dd")String dd,
								Model model) {
	member.setUserAddr(post + ", " + address1 + ", " + address2);
	member.setBirthday(yy + "/" + mm + "/" + dd);
	int result = mService.registerMember(member);
	if (result > 0 ) {
		return "redirect:index.jsp";
	}else {
		return "common.errorPage";
	}
	}
	
	//아이디 찾기 페이지로 이동
	@RequestMapping(value = "idSearch.do", method = RequestMethod.GET)
	  public String idSearchView() {
	        return "member/idSearch";
	}
	
	// 아이디 찾기
	@RequestMapping(value = "findId.do", method = RequestMethod.POST)
	public String findId(HttpServletResponse response, 
			@RequestParam("userName") String userName,
			@RequestParam("userEmail") String userEmail,
			@ModelAttribute Member member,
			Model model) throws Exception{
		model.addAttribute("userId", mService.searchId(member));
		
	response.setContentType("text/html;charset=utf-8");
	PrintWriter out = response.getWriter();
	
		
	if (member == null) {
		out.println("<script>");
		out.println("alert('가입된 아이디가 없습니다.');");
		out.println("history.go(-1);");
		out.println("</script>");
		out.close();
		return "member/idSearch";
	} else {
		return "common.errorPage";
	}
	}
	
	//비밀번호 찾기 페이지로 이동
	@RequestMapping(value = "pwSearch.do", method = RequestMethod.GET)
	  public String pwSearchView() {
	        return "member/pwSearch";
	}
	
	// 비밀번호 찾기
	public String searchPw(@RequestParam("userPw") String userPw, Model model) {
		
		return "common/errorPage";
	}
	
	/*
	// 비밀번호 메일 보내기
	@RequestMapping(value = "sendpw.do", method = RequestMethod.POST)
	public ModelAndView sendEmailAction (@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
        ModelAndView mav;
        String id = (String) paramMap.get("id");
        String e_mail = (String) paramMap.get("email");
        String pw = mService.searchPw(paramMap);
        System.out.println(pw);
        if(pw!=null) {
            email.setContent("비밀번호는 "+pw+" 입니다.");
            email.setReceiver(e_mail);
            email.setSubject(id+"님 비밀번호 찾기 메일입니다.");
            emailSender.SendEmail(email);
            mav= new ModelAndView("redirect:/login.do");
            return mav;
        }else {
            mav=new ModelAndView("redirect:/logout.do");
            return mav;
        }
    }
	*/



	/*
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
	
	*/
}