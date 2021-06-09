package com.ssaragibyul.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;
import com.ssaragibyul.admin.service.AdminService;
import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Pagination;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.donation.domain.Donation;
import com.ssaragibyul.donation.domain.DonationFile;
import com.ssaragibyul.donation.domain.DonationReport;
import com.ssaragibyul.donation.service.DonationService;
import com.ssaragibyul.funding.domain.Funding;
import com.ssaragibyul.funding.domain.FundingFile;
import com.ssaragibyul.funding.domain.FundingReport;
import com.ssaragibyul.funding.service.FundingService;
import com.ssaragibyul.history.domain.History;
import com.ssaragibyul.history.service.HistoryService;
import com.ssaragibyul.independence.domain.Independence;
import com.ssaragibyul.independence.service.IndependenceService;
import com.ssaragibyul.member.domain.Member;
import com.ssaragibyul.member.service.MemberService;
import com.ssaragibyul.message.controller.MessageController;
import com.ssaragibyul.message.domain.Message;
import com.ssaragibyul.message.domain.MessageAndNick;
import com.ssaragibyul.message.domain.PaginationMsg;
import com.ssaragibyul.message.service.MessageService;
import com.ssaragibyul.visit.domain.Visit;
import com.ssaragibyul.visit.domain.VisitStat;
import com.ssaragibyul.visit.service.VisitService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService aService;
	
	@Autowired
	private MessageService msgService;
	
	@Autowired
	private IndependenceService iService;
	
	@Autowired
	private HistoryService hService;
	
	@Autowired
	private FundingService fService;
	
	@Autowired
	private DonationService dService;
	
	@Autowired
	private VisitService vService;
	
	@Autowired
	private MemberService mService;

	//히스토리랑 히스토리파일이랑 나눠져있어서 어캐해야되는지 모르겠어요!!
	
	// 관리자 메인페이지 들어가기
	@RequestMapping(value="adminMain.do", method = RequestMethod.GET)
	public ModelAndView adminMain(ModelAndView mv) {
		
		int allMember = aService.printAllMemberCount();		//전체회원 수 카운트(탈퇴, 관리자 제외)
		int newMemeber = aService.printTodayMemberCount(); // 오늘 가입한 회원 수
		int deleteMember = aService.getCountDeleteMember(); //탈퇴한 회원수 카운트
		int todayRepor = aService.getCountTodayRepor(); // 오늘 신고수
		int allRepor = aService.getFundingAccListCount();// 전체 신고수
		
		//int reportAll = aService.printReportAllCount(); //신고게시글 수 카운트
		// 펑딩 신고 요일별 현황
		ArrayList<VisitStat> fdList = aService.getCountReport();
		//별보러가자 게시글 현황
		ArrayList<VisitStat> vList = aService.getCountPostVisit();
		// 최근 보낸 쪽지 6개만
		ArrayList<Message> nmList = aService.getCountNewMessage();
		// 최근 받은 쪽지 6개만
		ArrayList<Message> rmList = aService.getCountNewRecMessage();
		System.out.println("vList입니다 - " + vList);
		
		for (VisitStat message : vList) {
			System.out.println(message.getVisitStatCount());			
		}

		// 기부 현황
		
		//펀딩 현황
		
		mv.addObject("allMember", allMember);
		mv.addObject("newMember", newMemeber);
		mv.addObject("deleteMember", deleteMember);
		
		mv.addObject("newSendMessage", nmList);
		mv.addObject("newrecMessage", rmList);
		
		//mv.addObject("reportAll", reportAll); //신고쪽지 보기
		
		mv.addObject("visitStat", vList);
		mv.addObject("report", fdList);
		mv.addObject("todayRepor", todayRepor);
		mv.addObject("allRepor", allRepor);
		
		mv.setViewName("admin/adminMain");
		return mv;
	}
	
	//관리자 메인 캘린더(펀딩)
	@ResponseBody
	@RequestMapping(value="FundingCalendar.do", method = RequestMethod.POST)
	public void printCalendar(HttpServletResponse respone) throws Exception{
		System.out.println("dd");
		ArrayList<Funding> fCalendar = aService.getFundingList(); 
		// 이것이 json [{}]에서 []를 먼저 만들어준다!
		
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>(); 
		// 이것이 [{}]에서 {}를 만들어주는 거야!!!
		// 민진왈 : []이것은 기차한칸!(arrayList), {}이것은 그 칸의 좌석(HashMap)!
		// ArrayList<HashMap<String, String>>는 json이랑 호환이됨
		
		for(int i = 0; i < fCalendar.size(); i++) {
			System.out.println(fCalendar.size()+"fCalendar.size()");
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("title", fCalendar.get(i).getSubjectName());
		    map.put("start", String.valueOf(fCalendar.get(i).getStartDate())); 
		    map.put("end", String.valueOf(fCalendar.get(i).getFinDate()));
			list.add(map);
			System.out.println("map잘나오나요? : " + map);
		}
		// 어레이 리스트를 제이슨 배열로 만들어줌!!! [{}, {}, {}, {}]
		new Gson().toJson(list, respone.getWriter());
	}
	
	//관리자 메인 캘린더(기부)
	@ResponseBody
	@RequestMapping(value="DonationCalendar.do", method = RequestMethod.POST)
	public void printDonationCalendar(HttpServletResponse respone) throws Exception{
		ArrayList<Donation> dCalendar = aService.getDonationList(); 
		// 이것이 json [{}]에서 []를 먼저 만들어준다!
		
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>(); 
		// 이것이 [{}]에서 {}를 만들어주는 거야!!!
		// 민진왈 : []이것은 기차한칸!(arrayList), {}이것은 그 칸의 좌석(HashMap)!
		// ArrayList<HashMap<String, String>>는 json이랑 호환이됨
		
		for(int i = 0; i < dCalendar.size(); i++) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("title", dCalendar.get(i).getSubjectName());
		    map.put("start", String.valueOf(dCalendar.get(i).getStartDate())); 
		    map.put("end", String.valueOf(dCalendar.get(i).getFinDate()));
			list.add(map);
			System.out.println("map잘나오나요? : " + map);
		}
		// 어레이 리스트를 제이슨 배열로 만들어줌!!! [{}, {}, {}, {}]
		new Gson().toJson(list, respone.getWriter());
	}
	
	// 관리자 메인 별보러가자 게시글 현황 그래프 자료
	@ResponseBody
	@RequestMapping(value="visitStat.do", method = RequestMethod.GET) 
	public ArrayList<HashMap<String, String>> visitStat(HttpServletResponse response) {
		
		//ArrayList<VisitStat> vList = aService.getCountPostVisit();
		ArrayList<VisitStat> vList = new ArrayList<VisitStat>();
		vList = aService.getCountPostVisit();
		
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
		
		for(int i = 0; i < vList.size(); i++) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put(vList.get(i).getVisitDay(), vList.get(i).getVisitStatCount());
			list.add(map);
		}
			System.out.println(list);
			return list;
		
		//HashMap<String, Object> result = new HashMap<String, Object>();
		//sonObject resultJSON = new JsonObject();
		
	}
	
//	// 관리자 메인 별보러가자 게시글 현황 그래프 자료
//	@RequestMapping(value="visitStat.do", method = RequestMethod.GET) 
//	public @RequestBody void visitStat(@RequestParam(value="vList[]") List<String> examList) {
//		
//		//ArrayList<VisitStat> vList = aService.getCountPostVisit();
//		List<VisitStat> vList = new ArrayList<VisitStat>();
//		vList = aService.getCountPostVisit();
//		
//		HashMap<String, Object> result = new HashMap<String, Object>();
//		
		//sonObject resultJSON = new JsonObject();
		
		//Gson gson = gson.toJson(vList, response.getWriter());
		
//		if(!vList.isEmpty()) {
//		} else {
//			System.out.println("데이터가 없습니다.");
//		}
//	}

	// 전체 회원 수
	public int memberAllCount(ModelAndView mv, @RequestParam("userId") String userId) {
		return 0;
	}

	// 오늘 새로 가입한 회원 수 조회
	public int memberTodayCount(ModelAndView mv) {
		// int printTodayMemberCount(int MemberNo)
		return 0;
	}

	// 전체 신고건 조회
	public int reportAllCount(ModelAndView mv) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 미확인 신고건 수 조회
	public int unprocessedReport(ModelAndView mv) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 별보러가자 게시판 현황
	public int visitbrdCount(ModelAndView mv) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	// 회원 전체 리스트 가져오기
	@RequestMapping(value="adminMemberListView.do", method = RequestMethod.GET)
	public ModelAndView memberListView(ModelAndView mv, @RequestParam(value="page", required = false) Integer page) {
		// TODO Auto-generated method stub
		int currentPage = (page != null)?page : 1;
		int listCount = aService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Member> mList = aService.printAll(pi);
		if(!mList.isEmpty()) {
			mv.addObject("mList", mList);
			mv.addObject("pi", pi);
			mv.setViewName("admin/adminMemberListView");
		} else {
			mv.addObject("msg", "회원 관리에 들어가지 못하였습니다.");
		}
		return mv;
	}
	
	// 회원 상세정보(하나만 불러오기)
	@RequestMapping(value="adminMemberDetail.do", method = RequestMethod.GET)
	public String memberDetail(@RequestParam("userId") String userId,
								Model model) {
		Member member = aService.printOne(userId);
		if(member != null) {
			model.addAttribute("member", member);
			System.out.println(member);
			return "admin/adminMemberDetail";
		} else {
			model.addAttribute("msg", "회원 상세조회에 실패하였습니다.");
			return "common/errorPage";
		}
	}

	// 회원 수정하기
	@RequestMapping(value="daminMemberModify.do", method = RequestMethod.POST)
	public String memberModifyView(@ModelAttribute Member member,
										@RequestParam("post") String post, 
										@RequestParam("address1")String address1, 
										@RequestParam("address2") String address2,
										Model model) {
		member.setUserAddr(post + ", " + address1 + ", " + address2);
		int result = aService.modifyMember(member);
		if(result > 0) {
			return "admin/adminMemberListView";
		} else {
			model.addAttribute("msg","정보 수정 실패");
			return "common/errorPage";
		}
	}

	// 회원 탈퇴하기
	@RequestMapping(value="adminMemberDelete.do", method = RequestMethod.GET)
	public String memberDelete(@RequestParam("userId") String userId,
								Model model) {
		int result = aService.deleteMember(userId);
		if(result > 0) {
			return "redirect:adminMemberListView.do";
		} else {
			model.addAttribute("msg", "회원 탈퇴에 실패하였습니다.");
			return "common/errorPage";			
		}
	}

	// 회원 쪽지보내기
	public int SendNote(String MemberId) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 펀딩 리스트 출력
	@RequestMapping(value="adminFundingList.do", method = RequestMethod.GET)
	public ModelAndView fundingListView(ModelAndView mv,
										@RequestParam(value="page", required = false) Integer page) {
		int currentPage = (page != null) ? page :1;
		int listCount = aService.getFundingListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Funding> fList = aService.printAllFunding(pi);
		if(!fList.isEmpty()) {
			mv.addObject("fList", fList);
			mv.addObject("pi", pi);
			mv.setViewName("admin/adminFundingListView");
		} else {
			mv.addObject("msg", "펀딩 리스트 출력에 실패하였습니다.");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}

	// 펀딩 상세보기
	@RequestMapping(value="adminFundingDetail.do", method = RequestMethod.GET)
	public ModelAndView fundingDetail(ModelAndView mv, @RequestParam("projectNo") int projectNo) {
		// 게시글 상세 조회
		Funding funding = fService.printOne(projectNo);
		FundingFile fundingFile = fService.printOneFile(projectNo);
		if ((funding != null)&&(fundingFile != null)) {
			// 메소드 체이닝 방식
			mv.addObject("fundingFile", fundingFile);
			mv.addObject("funding", funding).setViewName("admin/adminFundingDetail");
		} else {
			mv.addObject("msg", "펀딩 상세 조회 실패!");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 펀딩 삭제하기
	@RequestMapping(value="adminFundingDelete.do", method = RequestMethod.GET)
	public String fundingDelete(Model model, @RequestParam("projectNo") int projectNo) {
		int result = aService.deleteFunding(projectNo);
		if(result > 0 ) {
			return "redirect:adminFundingList.do";
		} else {
			model.addAttribute("msg", "펀딩 삭제에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
//	//펀딩 검색하기
//	// 1. 
//	@RequestMapping(value="fundingSearch_1.do", method=RequestMethod.GET)
//	public String fundingSearchForProcessing(@ModelAttribute Search search, Model model) {
//		 ArrayList<Funding> fListandFileEnd = fService.printAllProjectEnd();   
//		ArrayList<Funding> searchList1 = fService.printSearchAll_1(search);
//		if(!searchList1.isEmpty()) {
//			model.addAttribute("fListandFileEnd", fListandFileEnd);
//			model.addAttribute("fListandFile", searchList1);
//			model.addAttribute("search", search);
//			return "funding/fundingList";
//		}else {
//			model.addAttribute("msg", "공지사항 검색 실패");
//			return "common/errorPage";
//		}
//	}
//	
//	@RequestMapping(value="fundingSearch_2.do", method=RequestMethod.GET)
//	public String fundingSearchForEnd(@ModelAttribute Search search, Model model) {
//		 ArrayList<Funding> fListandFile = fService.printAllProject();   
//		ArrayList<Funding> searchList2 = fService.printSearchAll_2(search);
//		if(!searchList2.isEmpty()) {
//			model.addAttribute("fListandFile", fListandFile);
//			model.addAttribute("fListandFileEnd", searchList2);
//			model.addAttribute("search", search);
//			return "funding/fundingList";
//		}else {
//			model.addAttribute("msg", "공지사항 검색 실패");
//			return "common/errorPage";
//		}
//	}
//	
//	 @RequestMapping(value="fundingSelectMoney.do", method=RequestMethod.GET)
//	 public String fundingSelectMoney(Model model) {
//		 ArrayList<Funding> fListandFile = fService.printAllProjectForMoney();   
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

	//기부 리스트 출력
	@RequestMapping(value="adminDonationList.do", method = RequestMethod.GET)
	public ModelAndView doantionListView(ModelAndView mv, @RequestParam(value="page", required = false) Integer page) {
		int cuurentPage = (page != null) ? page : 1;
		int listCount = aService.getDonationListCount();
		PageInfo pi = Pagination.getPageInfo(cuurentPage, listCount);
		ArrayList<Donation> dList = aService.printAllDoantion(pi);
		if(!dList.isEmpty()) {
			mv.addObject("dList", dList);
			mv.addObject("pi", pi);
			mv.setViewName("admin/adminDonationListView");
		} else {
			mv.addObject("msg", "펀딩 리스트 출력에 실패하였습니다.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 기부 상세보기
	@RequestMapping(value="adminDonationDelail.do", method = RequestMethod.GET)
	public ModelAndView donationDetail(ModelAndView mv, @RequestParam("projectNo") int projectNo) {
		// 게시글 상세 조회
		Donation donation = dService.printOne(projectNo);
		DonationFile donationFile = dService.printOneFile(projectNo);
		if ((donation != null)&&(donation != null)) {
			// 메소드 체이닝 방식
			mv.addObject("donationFile", donationFile);
			mv.addObject("donation", donation).setViewName("admin/adminDonationDetail");
		} else {
			mv.addObject("msg", "펀딩 상세 조회 실패!");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 기부 삭제하기
	@RequestMapping(value="adminDonationDelet.do", method = RequestMethod.GET)
	public String donationDelete(Model model, @RequestParam("projectNo") int projectNo) {
		int result = aService.deleteDonation(projectNo);
		if(result > 0 ) {
			return "redirect : adminDonationList.do";
		} else {
			model.addAttribute("msg", "기부프로젝트 삭제에 실패하였습니다.");
			return "common/errorPage";
		}
	}

	// 펀딩 신고 게시물 리스트
	@RequestMapping(value="adminFundingAccusationList.do", method = RequestMethod.GET)
	public ModelAndView reportListView(ModelAndView mv, @RequestParam(value="page", required = false) Integer page) {
		int cuurentPage = (page != null) ? page : 1;
		int listCount = aService.getFundingAccListCount();
		PageInfo pi = Pagination.getPageInfo(cuurentPage, listCount);
		ArrayList<FundingReport> fList = aService.printFundingAccList(pi);
		if(!fList.isEmpty()) {
			mv.addObject("faList", fList);
			mv.addObject("pi", pi);
			mv.setViewName("admin/adminFundingAccusationList");
		} else {
			mv.addObject("msg", "펀딩 신고내역 출력에 실패하였습니다.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 펀딩 신고 상세보기
	@RequestMapping(value="adminFundingAccusationDetail.do", method = RequestMethod.GET)
	public ModelAndView fundingAccusationDetail(ModelAndView mv, @RequestParam("accuFundingNo") int accuFundingNo) {
		// 게시글 상세 조회
		FundingReport fundingReport =  aService.prinOneFundingAcc(accuFundingNo);
		if (fundingReport != null) {
			// 메소드 체이닝 방식
			mv.addObject("fundingReport", fundingReport).setViewName("admin/adminFundingAccusationDetail");
		} else {
			mv.addObject("msg", "펀딩 상세 조회 실패!");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 신고 삭제하기
	@RequestMapping(value="adminFundingAccusationDelete.do", method = RequestMethod.GET)
	public String reportDelete(Model model, @RequestParam("accuFundingNo") int accuFundingNo) {
		// FundingReport에 accuFundingNo로 하나를 셀렉트 해온다
		FundingReport fundingNo = aService.prinOneFundingAcc(accuFundingNo);
		// FundingReport에 PROCESSING를 N으로 업데이트해준다
		int result = aService.deleteFundingReport(fundingNo);
		// Funding에서 PROJECT_CODE = 1로 업데이트해준다.
		result = aService.deleteFundingAdd(fundingNo);
		
		if(result > 0 ) {
			return "redirect:adminFundingAccusationList.do";
		} else {
			model.addAttribute("msg", "펀딩 신고 프로젝트 삭제에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	// 다중삭제
	@ResponseBody
	@RequestMapping(value="adminFundingAccDeleteAll.do", method=RequestMethod.GET)
	public String receivedMsgDelete(@RequestParam(value = "accuFundingNo[]") List<Integer> accuFundingNoArr, ModelAndView mv) {
		//배열에 해당하는 쪽지의 삭제표시컬럼 update
		// FundingReport에 accuFundingNo로 하나를 셀렉트 해온다
		int result = 0;
		int count = 0;
		for(int i=0; i < accuFundingNoArr.size() ; i++) {
			int accuFundingNo = accuFundingNoArr.get(i);
			FundingReport fundingNo = aService.prinOneFundingAcc(accuFundingNo);
			// FundingReport에 PROCESSING를 N으로 업데이트해준다
			result = aService.deleteFundingReport(fundingNo);
			// Funding에서 PROJECT_CODE = 1로 업데이트해준다.
			result = aService.deleteFundingAdd(fundingNo);
			count = count + result;
		}
		if(count == accuFundingNoArr.size() ) {
			return "success";
		} else {
			return "fail";
		}			
		
	}

	// 신고 기부 프로젝트 리스트
	@RequestMapping(value="adminDonationAccusationList.do", method = RequestMethod.GET)
	public ModelAndView donationReportListView(ModelAndView mv, @RequestParam(value="page", required = false) Integer page) {
		int cuurentPage = (page != null) ? page : 1;
		int listCount = aService.getDonationAccListCount();
		PageInfo pi = Pagination.getPageInfo(cuurentPage, listCount);
		ArrayList<DonationReport> dList = aService.printDonationAccList(pi);
		if(!dList.isEmpty()) {
			mv.addObject("dList", dList);
			mv.addObject("pi", pi);
			mv.setViewName("admin/adminDonationAccusationList");
		} else {
			mv.addObject("msg", "펀딩 신고내역 출력에 실패하였습니다.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 신고 기부 삭제하기
	@RequestMapping(value="adminDonationAccusationDelete.do", method = RequestMethod.GET)
	public String reportDonationDelete(Model model, @RequestParam("accuDonNo") int accuDonNo) {
		// FundingReport에 accuFundingNo로 하나를 셀렉트 해온다
		DonationReport donationNo = aService.printOneDonationAdd(accuDonNo);
		// FundingReport에 PROCESSING를 N으로 업데이트해준다
		int result = aService.deleteDonationReport(donationNo);
		// Funding에서 PROJECT_CODE = 1로 업데이트해준다.
		result = aService.deleteDanationAdd(donationNo);
		
		if(result > 0 ) {
			return "redirect:adminDonationAccusationList.do";
		} else {
			model.addAttribute("msg", "기부 신고 프로젝트 삭제에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	// 기부 다중삭제
	@ResponseBody
	@RequestMapping(value="adminDonationAccDeleteAll.do", method=RequestMethod.GET)
	public String receivedDonationDelete(@RequestParam(value = "accuDonNo[]") List<Integer> accuDonNoArr, ModelAndView mv) {
		//배열에 해당하는 쪽지의 삭제표시컬럼 update
		// FundingReport에 accuFundingNo로 하나를 셀렉트 해온다
		int result = 0;
		int count = 0;
		for(int i=0; i < accuDonNoArr.size() ; i++) {
			int accuDonNo = accuDonNoArr.get(i);
			DonationReport donationNo = aService.printOneDonationAdd(accuDonNo);
			// FundingReport에 PROCESSING를 N으로 업데이트해준다
			result = aService.deleteDonationReport(donationNo);
			// Funding에서 PROJECT_CODE = 1로 업데이트해준다.
			result = aService.deleteDanationAdd(donationNo);
			count = count + result;
		}
		if(count == accuDonNoArr.size() ) {
			return "success";
		} else {
			return "fail";
		}			
		
	}
	
	//댓글삭제하기
	@ResponseBody
	@RequestMapping(value="adminDeleteReply.do", method = RequestMethod.GET)
	public String replyRemove(@ModelAttribute Reply reply) {
		int result = 0; 
		int replyNo = reply.getReplyNo();
		if(reply.getReplyType() == "funding") {
			result = fService.removeCommnets(reply);
		} else if(reply.getReplyType() == "donation") {
			//result = dService.removeCommnets(reply);
		} else if(reply.getReplyType() == "visit") {
			result = vService.removeReply(replyNo);
		}
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}

	// 신고 게시판보기
	public ModelAndView replyListView() {
		// TODO Auto-generated method stub
		return null;
	}

	// 댓글보기
	public Reply replyDetail() {
		// TODO Auto-generated method stub
		return null;
	}

	// 독립유공자 공훈록 리스트
	@RequestMapping(value="adminIndependenceList.do", method=RequestMethod.GET)
	public ModelAndView independenceList(ModelAndView mv, @RequestParam(value="page", required=false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int listCount =iService.getListCount();
		// Pagination은 common의 pagination
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount); 
		ArrayList<Independence> iList = iService.printAll(pi);
//		int msgNo = 1;
//		Message message = mService.printOne(msgNo);
//		
//		String userId = "userId";
//		String flag = "rec";
//		
//		HashMap<String, String> cntMap = new HashMap<String, String>();
//		cntMap.put("flag", flag);
//		cntMap.put("userId", userId);
//		
//		int msgCount = mService.getMsgListCount(cntMap);
		
		
		if(!iList.isEmpty()) {
			mv.addObject("iList", iList);
			mv.addObject("pi", pi);
//			mv.addObject("message", message);
//			mv.addObject("messageCount", msgCount);
			mv.setViewName("admin/adminIndependenceList");
		}else {
			mv.addObject("msg", "데이터 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 별들의발자취 리스트
	@RequestMapping(value="adminHistoryList.do", method = RequestMethod.GET)
	public ModelAndView histoyListView(ModelAndView mv,
										@RequestParam(value="page", required = false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int listCount = aService.getHistoryListCount();/////////////////////history 셀릭트 카운트 완성되면 고치기!!!!
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<History> hList = aService.pringAllHistoy(pi);
		System.out.println("pi" + pi + " / " + hList);
		if(!hList.isEmpty()) {
			mv.addObject("hList", hList);
			mv.addObject("pi", pi);
			mv.setViewName("admin/adminHistoryListView");
		} else {
			mv.addObject("msg", "별들의 발자취 리스트 조회에 실패하였습니다.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 기념관 상세보기
	@RequestMapping(value="adminHistoryDetail.do", method = RequestMethod.GET)
	public ModelAndView histoyDetail(ModelAndView mv, @RequestParam("siteNo") int siteNo) {
		History histoy = aService.printOneHistoy(siteNo);
		//System.out.println("히스토리야 널이니???" + histoy);
		if(histoy != null) {
			mv.addObject("histoy", histoy).setViewName("admin/adminHistoryDetailView");
		} else {
			mv.addObject("msg", "별들의 발자취 상세보기 조회 실패!");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 별들의 발자취 리스트 등록화면
	@RequestMapping(value="adminHistoryWriteView.do", method = RequestMethod.GET)
	public String historyWriteView() {
		return "admin/adminHistoryWriteView";
	}
	
	// 기념관 등록하기
	@RequestMapping(value="adminHistoryRegister.do", method=RequestMethod.POST)
	public ModelAndView histoyRegister(ModelAndView mv,
										@ModelAttribute History history,
										@RequestParam("post") String post,
										@RequestParam("address1") String address1, 
										@RequestParam("address2") String address2,
										@RequestParam(value="uploadFile", required = false) MultipartFile uploadFile,
										HttpServletRequest request) {
		System.out.println("난 투스트링이야"+history.toString());
		history.setSiteAddr(post + ", " + address1 + ", " + address2);
		if(!uploadFile.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(uploadFile, request);
			if(renameFileName != null) {
				history.setOriginarFilename(uploadFile.getOriginalFilename());
				history.setRenameFilename(renameFileName);
			}
		}
		// 디비에 데이터를 저장하는 작업
		int result = 0;
		String path = "";
		result = aService.registerHistory(history);
		System.out.println("리저트값"+result);
		
		
		if(result > 0) {
			path = "redirect:adminHistoryDetail.do?siteNo="+history.getSiteNo();
		} else {
			mv.addObject("msg", "기념관 등록에 실패하였습니다.");
			path="common/errorPage";
		}
		mv.setViewName(path);
		return mv;
	}
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\upLoadFile";
		
		File folder = new File(savePath);
		// 폴더 없으면 자동 생성
		if (!folder.exists()) {
			folder.mkdir();
		}
		// 파일명 변경하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		// 시분초 형태를 yyyyMMddHHmmss이렇게 바꿔준다.
		String originalFileName = file.getOriginalFilename();
		// 실제 올린 파일명 그대로!
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "."
				+ originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		// abc.jpg
		// originalFileName.substring(originalFileName.lastIndexOf(".")+1) 는 확장자를 가져오기
		// 위해.
		// 파일명에 .이 있는 것을 방지하여 lastIndexOf로 마지막에.을 가져온다! +1은 . 빼고 확장자명만 담아오기 위해!
		String filePath = folder + "\\" + renameFileName;
		// 파일저장
		try {
			file.transferTo(new File(filePath));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 리턴
		return renameFileName;
	}

	// 게시글 수정화면
	@RequestMapping(value="adminModifyView.do")
	public ModelAndView historyModifyView(ModelAndView mv, @RequestParam("siteNo") int siteNo) {
		History history = aService.printOneHistoy(siteNo);
		if(history != null) {
			mv.addObject("history", history).setViewName("admin/adminHistoryUpdateView");
		} else {
			mv.addObject("msg", "별들의 발자취 수정 화면 접근에 실패하였습니다.").setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 기념관 수정하기
	@RequestMapping(value="adminHistoryUpdate.do", method = RequestMethod.POST)
	public ModelAndView historyUpdate(ModelAndView mv,
										HttpServletRequest request,
										@ModelAttribute History history,
										@RequestParam("post") String post,
										@RequestParam("address1") String address1, 
										@RequestParam("address2") String address2,
										@RequestParam(value="reloadFile", required = false) MultipartFile reloadFile ) {
		if(reloadFile != null && !reloadFile.isEmpty()) {
			// 파일변수가 없어서!!확인요망!!ㅠㅠ
			if(history.getSiteName() != "") {
				deleteFile(history.getRenameFilename(), request);
			}
			// 새 파일 업로드
			String renameFileName = saveFile(reloadFile, request);
			if(renameFileName != null) {
				history.setOriginarFilename(reloadFile.getOriginalFilename());
				history.setRenameFilename(renameFileName);
			}
		}
		// DB수정
		history.setSiteAddr(post + ", " + address1 + ", " + address2); 
		int result = aService.modifyHistory(history);
		if(result > 0) {
			mv.setViewName("redirect: adminHistoryList.do");
		} else {
			mv.addObject("msg", "별들의 발자취 수정에 실패하였습니다.").setViewName("common/errorPage");
		}
		return mv;
	}

	// 기념관 삭제하기
	@RequestMapping(value="adminHistoryDelete.do", method = RequestMethod.GET)
	public String historyDelete(Model model, @RequestParam("siteNo") int siteNo,
								@RequestParam("renameFilename") String renameFilename,
								HttpServletRequest request) {
		// 업로드된 파일 삭제
		if(renameFilename != "") {
			deleteFile(renameFilename, request);
		}
		
		// 디비에 데이터 업데이트
		int result = aService.removeHistory(siteNo);
		if(result > 0) {
			return "redirect:adminHistoryList.do";
		} else {
			model.addAttribute("msg", "게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	//기념관 파일 삭제
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\upLoadFile";
		File file = new File(savePath + "\\" + fileName);
		if(file.exists()) {
			file.delete();
		}
	}

	// 별보러가자 리스트
	@RequestMapping(value="adminVisitList.do", method = RequestMethod.GET)
	public ModelAndView visitListView(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int listCount = aService.getVisitListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Visit> vList = vService.printAll();
		if (!vList.isEmpty()) {
			mv.addObject("vList", vList);
			mv.addObject("pi", pi);
			mv.setViewName("admin/adminVisitListView");
		} else {
			mv.addObject("msg", "별들의 발자취 리스트 조회에 실패하였습니다.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 별보러가자 상세보기
	@RequestMapping(value="adminVisitDetail.do", method = RequestMethod.GET)
	public ModelAndView visitDetail(ModelAndView mv, @RequestParam("visitNo") int visitNo) {
		Visit visit = vService.printOne(visitNo);
				//aService.printOneVisit(visitNo);
		if(visit != null) {
			mv.addObject("visit", visit).setViewName("admin/adminVisitDetailView");
		} else {
			mv.addObject("msg", "별보러 가자 상세보기가 실패하였습니다.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 별보러가자 삭제
	@RequestMapping(value="adminVisitDelete.do", method = RequestMethod.GET)
	public String visitDelete(Model model, @RequestParam("visitNo") int visitNo,
								@RequestParam("renameFilename") String renameFilename,
								HttpServletRequest request) {
		// 업로드된 파일 삭제
		if(renameFilename != "") {
			deleteFile(renameFilename, request);
		}
		
		// 디비에 데이터 업데이트
		int result = vService.removeVisit(visitNo);
				//aService.removeVisit(visitNo);
		if(result > 0) {
			return "redirect:adminVisitList.do";
		} else {
			model.addAttribute("msg", "별보러가자 삭제 실패");
			return "common/errorPage";
		}
	}

	// 받은 쪽지함 리스트
	@RequestMapping(value="adminMessageList.do", method = RequestMethod.GET)
	public ModelAndView messageListView(ModelAndView mv,
										HttpSession session,
										@RequestParam(value="page", required=false) Integer page) {
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		String flag = "rec";
		
		HashMap<String, String> cntMap = new HashMap<String, String>();
		cntMap.put("flag", flag);
		cntMap.put("userId", userId);
		int currentPage = (page != null)? page : 1;
		int listCount = msgService.getMsgListCount(cntMap);
		PageInfo pi = PaginationMsg.getPageInfo(currentPage, listCount);

		ArrayList<MessageAndNick> rMList = msgService.printAllrMsg(pi, userId);
		rMList.toString();
		if(!rMList.isEmpty()) {
			mv.addObject("msgList", rMList);	
		}else {
			mv.addObject("tblMsg", "받은 쪽지가 없습니다.");
		}
		mv.addObject("pi", pi);
		mv.addObject("flag", flag);	
		mv.setViewName("admin/adminMessageList");
		return mv;
	}

//	// 쪽지 상세보기
//	@RequestMapping(value="adminMessageDetail.do", method = RequestMethod.GET)
//	public ModelAndView MessageDetail(@RequestParam("msgNo") int msgNo,
//										@RequestParam("nickName") String nickName,
//										@RequestParam("flag") String flag,
//										ModelAndView mv) {
//			//받은 쪽지 읽을 때만 읽음여부 컬럼 update
//					int result = 0;
//					if (flag.equals("rec")) {
//						result = msgService.updateRead(msgNo);
//					} else {
//						result = 1;
//					}
//			//message select하기
//					if (result > 0) {
//						Message message = msgService.printOne(msgNo);
//						if (message != null) {
//							mv.addObject("message", message);
//							mv.addObject("nickName", nickName);
//							mv.addObject("flag", flag);
//							mv.setViewName("admin/adminMessageDetailView");
//						} else {
//							mv.addObject("msg", "쪽지 상세보기에 실패하였습니다.");
//							if (flag.equals("rec")) {
//								mv.setViewName("redirect:adminMessageList.do");
//							} else if (flag.equals("send")) {
//								mv.setViewName("redirect:sendMsgList.do");
//							} else {
//								mv.setViewName("redirect:noticeMsgList.do");
//							}
//						}
//					} else {
//						mv.addObject("msg", "쪽지 상세보기에 실패하였습니다.");
//						if (flag.equals("rec")) {
//							mv.setViewName("redirect:adminMessageList.do");
//						} else if (flag.equals("send")) {
//							mv.setViewName("redirect:sendMsgList.do");
//						} else {
//							mv.setViewName("redirect:noticeMsgList.do");
//						}
//					}
//					return mv;
//				}

	// 쪽지 삭세하기
	public String messageDelete() {
		// TODO Auto-generated method stub
		return null;
	}

	// 보낸쪽지함
	@RequestMapping(value="adminSendMessageList.do", method = RequestMethod.GET)
	public ModelAndView sendMessage(ModelAndView mv,
									HttpSession session,
									@RequestParam(value="page", required=false) Integer page) {
			String userId = ((Member)session.getAttribute("loginUser")).getUserId();
			String flag = "send";
			
			HashMap<String, String> cntMap = new HashMap<String, String>();
			cntMap.put("flag", flag);
			cntMap.put("userId", userId);
			int currentPage = (page != null)? page : 1;
			int listCount = msgService.getMsgListCount(cntMap);
			PageInfo pi = PaginationMsg.getPageInfo(currentPage, listCount);
	
			ArrayList<MessageAndNick> sMList = msgService.printAllsMsg(pi, userId);
			if(!sMList.isEmpty()) {
				mv.addObject("msgList", sMList);
				
			}else {
				mv.addObject("tblMsg", "보낸 쪽지가 없습니다.");			
			}
			mv.addObject("pi", pi);
			mv.addObject("flag", flag);
			mv.setViewName("admin/adminSendMessageList");
		return mv;
	}
}

