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
import com.ssaragibyul.funding.domain.FundingLike;
import com.ssaragibyul.funding.domain.FundingLog;
import com.ssaragibyul.funding.service.FundingService;
import com.ssaragibyul.independence.domain.Independence;
import com.ssaragibyul.member.domain.CommentAndProject;
import com.ssaragibyul.member.domain.Member;
import com.ssaragibyul.member.domain.PaginationMy;
import com.ssaragibyul.member.domain.PaginationPro;
import com.ssaragibyul.member.service.MemberService;
import com.ssaragibyul.message.domain.SearchMsg;
import com.ssaragibyul.point.domain.MyPoint;
import com.ssaragibyul.point.service.PointService;
import com.ssaragibyul.visit.domain.Visit;
import com.ssaragibyul.visit.service.VisitService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private PointService pntService;

	@Autowired
	private FundingService fService;
	
	@Autowired
	private VisitService vService;
	
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
		
		PageInfo pi = PaginationMy.getPageInfo(currentPage, listCount); 
		FundingLog fundingCnt = fService.calListNumberMyFunding(userId);
		ArrayList<FundingLog> myFundingList = fService.printMyFunding(userId,pi);
		if (myFundingList != null) {
			mv.addObject("fundingCnt", fundingCnt);
			mv.addObject("pi", pi);
			mv.addObject("myFundingList", myFundingList).setViewName("mypage/myFunding");
		}else{
			mv.addObject("msg", "펀딩 상세 조회 실패!");
			mv.setViewName("common/errorPage");
		}
			return mv;
		}	
	
	@RequestMapping(value="myFundingLike.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myFundingViewLike(ModelAndView mv, HttpSession session, @ModelAttribute Member member,
												@RequestParam(value="page", required=false) Integer page) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		int currentPage = (page != null) ? page : 1;
		int listCount = fService.getListCount(userId);
		
		PageInfo pi = PaginationMy.getPageInfo(currentPage, listCount); 
		FundingLog fundingCnt = fService.calListNumberMyFunding(userId);
		ArrayList<FundingLog> myFundingList = fService.printMyFundingLike(userId,pi);
		if (myFundingList != null) {
			mv.addObject("fundingCnt", fundingCnt);
			mv.addObject("pi", pi);
			mv.addObject("myFundingList", myFundingList).setViewName("mypage/myFunding");
		}else{
			mv.addObject("msg", "펀딩 상세 조회 실패!");
			mv.setViewName("common/errorPage");
		}
			return mv;
		}	
	
	@RequestMapping(value="myFundingMoney.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myFundingViewMoney(ModelAndView mv, HttpSession session, @ModelAttribute Member member,
												@RequestParam(value="page", required=false) Integer page) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		int currentPage = (page != null) ? page : 1;
		int listCount = fService.getListCount(userId);
		
		PageInfo pi = PaginationMy.getPageInfo(currentPage, listCount);
		FundingLog fundingCnt = fService.calListNumberMyFunding(userId);
		ArrayList<FundingLog> myFundingList = fService.printMyFundingMoney(userId,pi);
		if (myFundingList != null) {
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
	@RequestMapping(value="proposeFunding.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView proposeFundingView(ModelAndView mv, HttpSession session, @ModelAttribute Member member,
												@RequestParam(value="page", required=false) Integer page) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		int currentPage = (page != null) ? page : 1;
		int listCount = fService.getListCountProp(userId);
		
		PageInfo pi = PaginationPro.getPageInfo(currentPage, listCount); 
		Funding fundingCnt = fService.calListNumberProspFunding(userId);
		ArrayList<Funding> likeFundingList = fService.printPropFunding(userId,pi);
		if (likeFundingList != null) {
			mv.addObject("fundingCnt", fundingCnt);
			mv.addObject("pi", pi);
			mv.addObject("likeFundingList", likeFundingList).setViewName("mypage/ProposeFunding");
		}else{
			mv.addObject("msg", "펀딩 상세 조회 실패!");
			mv.setViewName("common/errorPage");
		}
			return mv;
		}	
	
	@RequestMapping(value="proposeFundingLike.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView proposeFundingLikeView(ModelAndView mv, HttpSession session, @ModelAttribute Member member,
												@RequestParam(value="page", required=false) Integer page) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		int currentPage = (page != null) ? page : 1;
		int listCount = fService.getListCountProp(userId);
		
		PageInfo pi = PaginationPro.getPageInfo(currentPage, listCount); 
		Funding fundingCnt = fService.calListNumberProspFunding(userId);
		ArrayList<Funding> likeFundingList = fService.printPropFundingLike(userId,pi);
		if (likeFundingList != null) {
			mv.addObject("fundingCnt", fundingCnt);
			mv.addObject("pi", pi);
			mv.addObject("likeFundingList", likeFundingList).setViewName("mypage/ProposeFunding");
		}else{
			mv.addObject("msg", "펀딩 상세 조회 실패!");
			mv.setViewName("common/errorPage");
		}
			return mv;
		}	
	
	@RequestMapping(value="proposeFundingMoney.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView proposeFundingViewMoney(ModelAndView mv, HttpSession session, @ModelAttribute Member member,
												@RequestParam(value="page", required=false) Integer page) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		int currentPage = (page != null) ? page : 1;
		int listCount = fService.getListCountProp(userId);
		
		PageInfo pi = PaginationPro.getPageInfo(currentPage, listCount);
		Funding fundingCnt = fService.calListNumberProspFunding(userId);
		ArrayList<Funding> likeFundingList = fService.printPropFundingMoney(userId,pi);
		if (likeFundingList != null) {
			mv.addObject("fundingCnt", fundingCnt);
			mv.addObject("pi", pi);
			mv.addObject("likeFundingList", likeFundingList).setViewName("mypage/ProposeFunding");
		}else{
			mv.addObject("msg", "펀딩 상세 조회 실패!");
			mv.setViewName("common/errorPage");
		}
			return mv;
		}	  
	
	// 제안한 기부프로젝트 페이지
	@RequestMapping(value="proposeDonaion.do", method=RequestMethod.GET)
	public String proposeDonation(Member member) {
		return "mypage/ProposeDonation";
	}
	
	// 좋아한 펀딩 프로젝트 페이지
	// 참여한 펀딩 프로젝트 페이지
		@RequestMapping(value="likeFunding.do", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView likeFundingView(ModelAndView mv, HttpSession session, @ModelAttribute Member member,
													@RequestParam(value="page", required=false) Integer page) {
			Member loginUser = (Member) session.getAttribute("loginUser");
			String userId = loginUser.getUserId();
			int currentPage = (page != null) ? page : 1;
			int listCount = fService.getListCountLike(userId);
			
			PageInfo pi = PaginationMy.getPageInfo(currentPage, listCount); 
			FundingLike fundingCnt = fService.calListNumberLikeFunding(userId);
			ArrayList<FundingLike> likeFundingList = fService.printLikeFunding(userId,pi);
			if (likeFundingList != null) {
				mv.addObject("fundingCnt", fundingCnt);
				mv.addObject("pi", pi);
				mv.addObject("likeFundingList", likeFundingList).setViewName("mypage/likeFunding");
			}else{
				mv.addObject("msg", "펀딩 상세 조회 실패!");
				mv.setViewName("common/errorPage");
			}
				return mv;
			}	
		
		@RequestMapping(value="likeFundingLike.do", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView likeFundingViewLike(ModelAndView mv, HttpSession session, @ModelAttribute Member member,
													@RequestParam(value="page", required=false) Integer page) {
			Member loginUser = (Member) session.getAttribute("loginUser");
			String userId = loginUser.getUserId();
			int currentPage = (page != null) ? page : 1;
			int listCount = fService.getListCountLike(userId);
			
			PageInfo pi = PaginationMy.getPageInfo(currentPage, listCount); 
			FundingLike fundingCnt = fService.calListNumberLikeFunding(userId);
			ArrayList<FundingLike> likeFundingList = fService.printLikeFundingLike(userId,pi);
			if (likeFundingList != null) {
				mv.addObject("fundingCnt", fundingCnt);
				mv.addObject("pi", pi);
				mv.addObject("likeFundingList", likeFundingList).setViewName("mypage/likeFunding");
			}else{
				mv.addObject("msg", "펀딩 상세 조회 실패!");
				mv.setViewName("common/errorPage");
			}
				return mv;
			}	
		
		@RequestMapping(value="likeFundingMoney.do", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView likeFundingViewMoney(ModelAndView mv, HttpSession session, @ModelAttribute Member member,
													@RequestParam(value="page", required=false) Integer page) {
			Member loginUser = (Member) session.getAttribute("loginUser");
			String userId = loginUser.getUserId();
			int currentPage = (page != null) ? page : 1;
			int listCount = fService.getListCountLike(userId);
			
			PageInfo pi = PaginationMy.getPageInfo(currentPage, listCount);
			FundingLike fundingCnt = fService.calListNumberLikeFunding(userId);
			ArrayList<FundingLike> likeFundingList = fService.printLikeFundingMoney(userId,pi);
			if (likeFundingList != null) {
				mv.addObject("fundingCnt", fundingCnt);
				mv.addObject("pi", pi);
				mv.addObject("likeFundingList", likeFundingList).setViewName("mypage/likeFunding");
			}else{
				mv.addObject("msg", "펀딩 상세 조회 실패!");
				mv.setViewName("common/errorPage");
			}
				return mv;
			}
		
		
	// 좋아한 기부 프로젝트 페이지
	@RequestMapping(value="likeDonation.do", method=RequestMethod.GET)
	public String likeDonation(Member member) {
		return "mypage/likeDonation";
	}
	
	// 내가 쓴 게시물 리스트
	@RequestMapping(value="myPostList.do", method=RequestMethod.GET)
	public ModelAndView postList(ModelAndView mv, HttpSession session, Visit visit, @RequestParam(value="page", required=false) Integer page) {
		System.out.println("================== 내가 쓴 게시글 리스트");
		int currentPage = (page != null) ? page : 1;
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		int listCount =mService.getMyListCount(userId);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount); 
		ArrayList<Visit> vList = mService.printAllList(pi, userId);
		System.out.println("vList, 내가 쓴 게시물 : "+vList);
		
		if(!vList.isEmpty()) {
			mv.addObject("vList", vList);
			mv.addObject("pi", pi);
			mv.setViewName("mypage/myPostList");
		}else {
			mv.addObject("msg", "게시글 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}

	
	// 내가 쓴 댓글 페이지
	@RequestMapping(value="myCommentList.do", method=RequestMethod.GET)
	public ModelAndView commentList(ModelAndView mv,
									HttpSession session,
									@RequestParam(value="page", required=false) Integer page) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		int currentPage = (page != null)? page : 1;
		int listCount = mService.getcommentsListCount(userId);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<CommentAndProject> cpList = mService.printAllComment(pi, userId);
		
		if(!cpList.isEmpty()) {
			mv.addObject("cpList", cpList);
		}else {
			mv.addObject("tblMsg", "남기신 댓글이 없습니다.");
		}
		mv.addObject("pi", pi);
		mv.setViewName("mypage/myCommentList");			
		return mv;
	}
	//댓글 카테고리 모아보기
	@RequestMapping(value="mySearchComment.do", method=RequestMethod.GET)
	public ModelAndView searchCommentList(ModelAndView mv,
									HttpSession session,
									@ModelAttribute SearchMsg search,
									@RequestParam(value="page", required=false) Integer page) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		search.setUserId(userId);
		int currentPage = (page != null)? page : 1;
		int listCount = mService.getSearchCommentsCount(search);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<CommentAndProject> cpList = mService.printSearchComment(pi, search);
		
		if(!cpList.isEmpty()) {
			mv.addObject("cpList", cpList);
		}else {
			mv.addObject("tblMsg", "남기신 댓글이 없습니다.");
		}
		mv.addObject("pi", pi);
		mv.setViewName("mypage/myCommentList");			
		return mv;
	}
	//댓글 삭제
	@ResponseBody
	@RequestMapping(value="commentDelete.do", method=RequestMethod.POST)
	public String commentDelete(@RequestParam("commNo") int commNo, @RequestParam("boardType") String boardType) {
		String replyNo = Integer.toString(commNo);
		HashMap<String, String> dMap = new HashMap<String, String>();
		dMap.put("commNo", replyNo);
		dMap.put("boardType", boardType);
		int result = mService.deleteComment(dMap);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	//댓글 수정
	@ResponseBody
	@RequestMapping(value="myCommentModify.do", method=RequestMethod.POST)
	public String commentModify(@RequestParam("commNo") int commNo,
								@RequestParam("boardType") String boardType,
								@RequestParam("commContents") String commContents) {
		String replyNo = Integer.toString(commNo);
		HashMap<String, String> mMap = new HashMap<String, String>();
		mMap.put("commNo", replyNo);
		mMap.put("boardType", boardType);
		mMap.put("commContents", commContents);
		int result = mService.modifyComment(mMap);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
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