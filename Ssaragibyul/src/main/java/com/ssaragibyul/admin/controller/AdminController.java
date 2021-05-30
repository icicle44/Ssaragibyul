package com.ssaragibyul.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ssaragibyul.admin.service.AdminService;
import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Pagination;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.donation.domain.Donation;
import com.ssaragibyul.donation.service.DonationService;
import com.ssaragibyul.funding.domain.Funding;
import com.ssaragibyul.funding.domain.FundingFile;
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
		
		//int reportAll = aService.printReportAllCount(); //신고게시글 수 카운트
		// 오늘의 신고 게시글 수 카운
		
		//별보러가자 게시글 현황
		
		// 최근 보낸 쪽지 6개만
		ArrayList<Message> nmList = aService.getCountNewMessage();
		// 최근 받은 쪽지 6개만
		ArrayList<Message> rmList = aService.getCountNewRecMessage();
		
		// 기부 현황
		
		//펀딩 현황
		
		mv.addObject("allMember", allMember);
		mv.addObject("newMember", newMemeber);
		mv.addObject("deleteMember", deleteMember);
		
		mv.addObject("newSendMessage", nmList);
		mv.addObject("newrecMessage", rmList);
		
		//mv.addObject("reportAll", reportAll); //신고쪽지 보기
		
		mv.setViewName("admin/adminMain");
		return mv;
	}

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
		int listCount = aService.getListCount();
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
	@RequestMapping(value="adminFundingDetail.do", method = RequestMethod.POST)
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
	public String fundingDelete() {
		// TODO Auto-generated method stub
		return null;
	}

	//기부 리스트 출력
	@RequestMapping(value="adminDonationListView.do", method = RequestMethod.GET)
	public ModelAndView doantionListView(ModelAndView mv, Object Pagination) {
		int cuurentPage = 0;
		int listCount = dService.getListCount();
		PageInfo pi = null;
		ArrayList<Donation> dList = dService.PrintAll(pi);
		return mv;
	}

	// 기부 상세보기
	public Donation donationDetail() {
		// TODO Auto-generated method stub
		return null;
	}

	// 기부 삭제하기
	public String donationDelete() {
		// TODO Auto-generated method stub
		return null;
	}

	// 신고 게시물 리스트
	public ModelAndView reportListView() {
		// TODO Auto-generated method stub
		return null;
	}

	// 신고 상세보기
//	public Board reportDetail() {
//		// TODO Auto-generated method stub
//		return null;
//	}
	
	// 신고 삭제하기
	public String reportDelete() {
		// TODO Auto-generated method stub
		return null;
	}

	//댓글삭제하기
	@ResponseBody
	@RequestMapping(value="adminDeleteReply.do", method = RequestMethod.GET)
	public String replyRemove(@ModelAttribute Reply reply) {
		int result = 0; 
		if(reply.getReplyType() == "funding") {
			result = fService.removeCommnets(reply);
		} else if(reply.getReplyType() == "donation") {
			//result = dService.removeCommnets(reply);
		} else if(reply.getReplyType() == "visit") {
			result = vService.removeReply(reply);
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
		ArrayList<History> hList = hService.printAll(pi);
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
		History histoy = hService.printOne(siteNo);
		if(histoy != null) {
			mv.addObject("histoy", histoy).setViewName("admin/adminHistoryDetailView");
		} else {
			mv.addObject("msg", "별들의 발자취 리스트 조회 실패!");
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
	@RequestMapping(value="adminHistoryRegister.kh", method=RequestMethod.POST)
	public ModelAndView histoyRegister(ModelAndView mv,
										@ModelAttribute History history,
										@RequestParam(value="uploadFile", required = false) MultipartFile uploadFile,
										HttpServletRequest request) {
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
		String savePath = root + "\\hUpdateDate";
		
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
		String savePath = root + "\\huploadFiles";
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
	public Visit visitDetail() {
		// TODO Auto-generated method stub
		return null;
	}

	// 별보러가자 삭제
	public String visitDelete() {
		// TODO Auto-generated method stub
		return null;
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

