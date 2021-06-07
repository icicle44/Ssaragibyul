package com.ssaragibyul.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Pagination;
import com.ssaragibyul.funding.domain.Funding;
import com.ssaragibyul.funding.domain.FundingFile;
import com.ssaragibyul.funding.domain.FundingLike;
import com.ssaragibyul.funding.domain.FundingLog;
import com.ssaragibyul.funding.service.FundingService;
import com.ssaragibyul.independence.domain.Independence;
import com.ssaragibyul.member.domain.Member;
import com.ssaragibyul.member.service.MemberService;
import com.ssaragibyul.point.domain.MyPoint;
import com.ssaragibyul.point.service.PointService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private PointService pntService;

	@Autowired
	private FundingService fService;
	
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
	
	// 닉네임 새로고침
	@ResponseBody
	@RequestMapping(value="nickRefresh.do", method= {RequestMethod.GET,RequestMethod.POST})
	public void refreshNickname(Model model, HttpServletResponse response) throws JsonIOException, IOException {
		Member member = mService.refreshNickName();
		Gson gson = new Gson();
		gson.toJson(member, response.getWriter());
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
	System.out.println(member.toString());
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
	@RequestMapping(value="idFind.do", method = RequestMethod.GET)
	public String searchId(HttpServletRequest request, Model model) {
		
		HashMap<String,String> param = new HashMap<String,String>();
		param.put("userName", request.getParameter("userName"));
		param.put("userEmail", request.getParameter("userEmail"));
		
		String result = mService.searchId(param);
		System.out.println(result);
		if (result != null ) {
			model.addAttribute("userId", result);
			return "member/idCheck";
		}else {
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

//	// 마이페이지 뷰    원본
//	@RequestMapping(value="myPage.do", method=RequestMethod.GET)
//	public String myInfoView(Member member, HttpSession session, Model model) {
//		String userId = ((Member)session.getAttribute("loginUser")).getUserId(); // member 객체로 강제 변환!
//		Independence independence = mService.mypage(userId);
//		MyPoint myPoint = pntService.getMyPoint(userId);
//		if (independence != null) {
//			model.addAttribute("independence", independence);
//			if(myPoint != null) {
//				model.addAttribute("myPoint", myPoint);
//			}
//			return "mypage/myPageMain";
//		}
//		model.addAttribute("msg","정보 수정 실패");
//		return "common/errorPage";   
//	}
	
	@RequestMapping(value="myPage.do", method=RequestMethod.GET)
	public String myInfoView(Member member, HttpSession session, Model model) {
		String userId = ((Member)session.getAttribute("loginUser")).getUserId(); // member 객체로 강제 변환!
		Independence independence = mService.mypage(userId);
		MyPoint myPoint = pntService.getMyPoint(userId);
		if (independence != null) {
			model.addAttribute("independence", independence);
			if(myPoint != null) {
				model.addAttribute("myPoint", myPoint);
			}
			return "mypage/myPageMain";
		}
		model.addAttribute("msg","정보 수정 실패");
		return "common/errorPage";   
	}
	
	// 정보 수정 비밀번호 확인 페이지
	@RequestMapping(value="pwConfirm.do", method=RequestMethod.GET)
	public String pwConfirm() {
		return "member/pwConfirm";
	}
	
	// 정보 수정 페이지
	@RequestMapping(value="userUpdate.do", method=RequestMethod.GET)
	public String updateView(Member member) {
		return "mypage/userUpdate";
	}
	
//	// 참여한 펀딩 프로젝트 페이지
//	@RequestMapping(value="myFunding.do", method = { RequestMethod.GET, RequestMethod.POST })
//	public ModelAndView myFundingView(ModelAndView mv, HttpSession session, @ModelAttribute Member member) {
//		Member loginUser = (Member) session.getAttribute("loginUser");
//		member.setUserId(loginUser.getUserId());
//		
//		ArrayList<FundingLog> myFundingList = fService.printMyFunding(member);
//		if (myFundingList != null) {
//			int fundingCnt = myFundingList.size();
//			mv.addObject("fundingCnt", fundingCnt);
//			mv.addObject("myFundingList", myFundingList).setViewName("mypage/myFunding");
//		}else{
//			mv.addObject("msg", "펀딩 상세 조회 실패!");
//			mv.setViewName("common/errorPage");
//		}
//			return mv;
//		}	
	
	// 참여한 펀딩 프로젝트 페이지
	@RequestMapping(value="myFunding.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myFundingView(ModelAndView mv, HttpSession session, @ModelAttribute Member member,
												@RequestParam(value="page", required=false) Integer page) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		int currentPage = (page != null) ? page : 1;
		int listCount = fService.getListCount(userId);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount); 
		ArrayList<FundingLog> myFundingList = fService.printMyFunding(userId,pi);
		if (myFundingList != null) {
			int fundingCnt = myFundingList.size();
			mv.addObject("fundingCnt", fundingCnt);
			mv.addObject("pi", pi);
			mv.addObject("myFundingList", myFundingList).setViewName("mypage/myFunding");
		}else{
			mv.addObject("msg", "펀딩 상세 조회 실패!");
			mv.setViewName("common/errorPage");
		}
			return mv;
		}	
	
	
	// 참여한 기부 프로젝트 페이지
	@RequestMapping(value="myDonation.do", method=RequestMethod.GET)
	public String myDonationView(Member member) {
		return "mypage/myDonation";
	}
	
	// 제안한 펀딩 프로젝트 페이지
	@RequestMapping(value="proposeFunding.do", method=RequestMethod.GET)
	public String proposeFunding(Member member) {
		return "mypage/ProposeFunding";
	}
	
	// 제안한 기부프로젝트 페이지
	@RequestMapping(value="proposeDonaion.do", method=RequestMethod.GET)
	public String proposeDonation(Member member) {
		return "mypage/ProposeDonation";
	}
	
	// 좋아한 펀딩 프로젝트 페이지
	@RequestMapping(value="likeFunding.do", method=RequestMethod.GET)
	public String likeFunding(Member member) {
		return "mypage/likeFunding";
	}
	
	// 좋아한 기부 프로젝트 페이지
	@RequestMapping(value="likeDonation.do", method=RequestMethod.GET)
	public String likeDonation(Member member) {
		return "mypage/likeDonation";
	}
	
	// 내가 쓴 게시물 페이지
	@RequestMapping(value="myPostList.do", method=RequestMethod.GET)
	public String postList(Member member) {
		return "mypage/myPostList";
	}
	
	// 내가 쓴 댓글 페이지
	@RequestMapping(value="myCommentList.do", method=RequestMethod.GET)
	public String commentList(Member member) {
		return "mypage/myCommentList";
	}
	
	// 정보수정
	@RequestMapping(value="memberModify.do", method=RequestMethod.POST)
	public String modifyMember(@ModelAttribute Member member,
							@RequestParam("post") String post, 
							@RequestParam("address1")String address1, 
							@RequestParam("address2") String address2,
							Model model, 
							HttpServletRequest request) {
	HttpSession session = request.getSession();
	member.setUserAddr(post + ", " + address1 + ", " + address2);
	int result = mService.modifyMember(member);
	if(result > 0) {
		return "mypage/myPageMain";
	} else {
		model.addAttribute("msg","정보 수정 실패");
		return "common/errorPage";
	}
	}
	
	
	// 회원 탈퇴
	@RequestMapping(value="memberDelete.do", method=RequestMethod.GET)
	public String memberDelete(@RequestParam("userId") String userId, Model model) {
		int result = mService.removeMember(userId);
		if (result > 0) {
			return "redirect:logout.do";
		}else {
			model.addAttribute("msg", "회원 탈퇴 실패");
			return "common/errorPage";
		}
	}
	
	
}