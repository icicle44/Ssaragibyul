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
import com.ssaragibyul.funding.domain.Funding;
import com.ssaragibyul.funding.domain.FundingFile;
import com.ssaragibyul.funding.domain.FundingLike;
import com.ssaragibyul.funding.domain.FundingLog;
import com.ssaragibyul.funding.domain.FundingReport;
import com.ssaragibyul.funding.service.FundingService;
import com.ssaragibyul.member.domain.Member;
// 깃 확인용 주석

@Controller
public class FundingController {

	@Autowired
	private FundingService fService;	//펀딩 서비스 관련 빈 자동 생성(오토 와이어드)
	
	 @RequestMapping(value="/fundingIndex.do", method=RequestMethod.GET)
	 public String fundingIndex() {
		 return "../../index";
	 } // 인덱스(첫 사이트 접속 페이지)
//																			 fundingList 기존 주석 백업
//	 @RequestMapping(value="fundingList.do", method=RequestMethod.GET)
//	 public String fundingList(Model model) {
//		 ArrayList<Funding> fList = fService.printAllProject();   
//		 ArrayList<FundingFile> fListFile = fService.printAllProjectFile();		
//		 if((!fList.isEmpty())&&(!fListFile.isEmpty())) {				
//				model.addAttribute("fList", fList);
//				model.addAttribute("fListFile", fListFile);
//				return "funding/fundingList";
//			}else {
//				model.addAttribute("msg", "펀딩 목록조회 실패");
//				return "common/errorPage";
//			}
//		}//펀딩 리스트 불러오는 컨트롤러(펀딩 페이지) funding, fundingFile(사진이름값 저장) 2개다 불러옴.
//	 
	 @RequestMapping(value="fundingList.do", method=RequestMethod.GET)
	 public String fundingList(Model model) {
		 ArrayList<Funding> fListandFile = fService.printAllProject();   
		 ArrayList<Funding> fListandFileEnd = fService.printAllProjectEnd();   
		 if(!fListandFile.isEmpty()) {				
				model.addAttribute("fListandFile", fListandFile);
				model.addAttribute("fListandFileEnd", fListandFileEnd);
				return "funding/fundingList";
			}else {
				model.addAttribute("msg", "펀딩 목록조회 실패");
				return "common/errorPage";
			}
		}//2개 테이블 조인해서 불러옴. 캐어려움 ㅡㅜㅠ
	
	 @RequestMapping(value="suggestPage.do", method=RequestMethod.GET)
	 public String SuggestMain() {
		 return "common/suggestPage";
	 } //header 에 있는 제안하기 눌렀을때 '제안'페이지로 이동 하는 컨트롤러
	 						
	 @RequestMapping(value="fundingSuggest.do", method=RequestMethod.GET)
	 public String fundingSuggestMain() {
		 return "funding/fundingSuggest";
	 }	// 제안 페이지에서 펀딩을 눌렀을때 '펀딩-제안' 페이지로 이동 하는 컨트롤러
	 
		
	 @RequestMapping(value="fundingRegister.do", method = RequestMethod.POST)
	 public String fundingRegister(@ModelAttribute Funding funding, FundingFile fundingFile, 
			 					   @RequestParam(value="uploadFileMain", required=false) MultipartFile uploadFileMain,
			 					   @RequestParam(value="uploadFileSub1", required=false) MultipartFile uploadFileSub1,
			 					   @RequestParam(value="uploadFileSub2", required=false) MultipartFile uploadFileSub2,
			 					  HttpServletRequest request,
			 					  Model model) { 
		if(!uploadFileMain.getOriginalFilename().equals("")) {
				// eclipse 워크스페이스에 파일 저장하는 부분을 적는데
				// 너무 길어지니까 saveFile 메소드로 빼서 작성
				String filePath = saveFile(uploadFileMain, request);
				if(filePath != null) {
					fundingFile.setFileMainName(uploadFileMain.getOriginalFilename());
				}
			}
		if(!uploadFileSub1.getOriginalFilename().equals("")) {
			String filePath = saveFile(uploadFileSub1, request);
			if(filePath != null) {
				fundingFile.setFileSub1Name(uploadFileSub1.getOriginalFilename());
			}
		}
		if(!uploadFileSub2.getOriginalFilename().equals("")) {
			String filePath = saveFile(uploadFileSub2, request);
			if(filePath != null) {
				fundingFile.setFileSub2Name(uploadFileSub2.getOriginalFilename());
			}
		}
		 int result = fService.registerProject(funding, fundingFile);  //serviceImpl에서 store 메소드 2개 씀.
		 if(result > 0) {
			 return "redirect:fundingIndex.do";
		 }else {
			 model.addAttribute("msg", "제안 등록 실패!!");
			 return "common/errorPage";
		 }
	 }		//제안하기(펀딩)에서 마지막 '작성 완료' 버튼 눌렀을시 업로드한 파일 및 데이더틀 해당 테이블에 입력해주는 컨트롤러_ funding , fundingFile 2개 동시에 입력.
	 		//사진은 3개라서 3개의 uploadeFile 메소드를 만들었지만 다중파일업로드로 바꿔야 할지도?

	 public String saveFile(MultipartFile file, HttpServletRequest request) {
			// 파일 저장 경로 설정
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\upLoadFile";
			// 저장 폴더 선택
			File folder = new File(savePath);
			// 폴더가 없을 경우 자동 생성
			if(!folder.exists()) {
				folder.mkdir();
			}
			String filePath = folder + "\\" + file.getOriginalFilename();
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
			// 파일경로 리턴
			return filePath;
		}		//위의 펀딩 레지스터에 이어서 쓰는 이미지 파일 자체를 이클립스 경로 내에 저장하는 별도의 파일 저장 메소드.


	 
		@RequestMapping(value = "fundingUpdate.do", method = RequestMethod.POST)
		public ModelAndView fundingUpdate(ModelAndView mv, HttpServletRequest request, 
				@ModelAttribute Funding funding, @RequestParam(value = "reloadFile", required = false) MultipartFile reloadFile) {
		
			return mv;
		}

		// 게시글 삭제(실제로는 상태 업데이트?)
		@RequestMapping(value = "fundingDelete.do", method = RequestMethod.GET)
		public String fundingDelete(Model model, @RequestParam("projectNo") int projectNo, 
				@RequestParam("renameFilename") String renameFilename, HttpServletRequest request) {
		
			return "";
		}

		public void deleteFile(String fileName, HttpServletRequest request) {

		}   //펀딩 수정 삭제 파일 삭제 등등 해야하는거. 일단 후순위로 미뤄둠... 프론트 먼저..
		
	 
	 
		
	


	 
		
		@RequestMapping(value = "fundingJoin.do", method =  RequestMethod.POST )
		public ModelAndView fundingJoin(ModelAndView mv, @RequestParam("projectNo") int projectNo) {
			// 게시글 상세 조회
			Funding funding = fService.printOne(projectNo);
			if (funding != null) {
				// 메소드 체이닝 방식
				mv.addObject("funding", funding).setViewName("funding/fundingJoinPage");
			} else {
				mv.addObject("msg", "펀딩 참여 실패");
				mv.setViewName("common/errorPage");
			}
			return mv;
		}		//펀딩 참여 페이지로 이동
		
		 @RequestMapping(value="fundingJoinComplete.do", method = RequestMethod.POST )
		 public String fundingJoinComplete(@ModelAttribute FundingLog fundingLog, Funding funding) { 
			 int result = fService.registerFundingLog(fundingLog, funding); //serviceImpl에서 store 메소드 2개 씀. + 선미누나가 추가한 포인트 내역 업데이트 메소드도 있음.
			 if(result > 0) {
				 return "funding/fundingJoinCompleteView";
			 }else {
				 return "common/errorPage";
			 }
		 }		//펀딩 참여 페이지에서 '참여완료' 했을시 펀딩로그와 펀딩 프로젝트 테이블에 인서트

		 

	@RequestMapping(value = "fundingDetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView fundingDetail(ModelAndView mv, @RequestParam("projectNo") int projectNo) {
		fService.addreadCountHit(projectNo); 
		
		Funding funding = fService.printOne(projectNo);
		FundingFile fundingFile = fService.printOneFile(projectNo);
		
		if ((funding != null)&&(fundingFile != null)) {
			mv.addObject("fundingFile", fundingFile);
			mv.addObject("funding", funding).setViewName("funding/fundingDetail");
		} else {
			mv.addObject("msg", "펀딩 상세 조회 실패!");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}			//펀딩 상세 페이지

	
	 @RequestMapping(value="fundingAccusation.do", method=RequestMethod.POST)
		public ModelAndView fundingAccusation(ModelAndView mv, @RequestParam("projectNo") int projectNo) {
			// 게시글 상세 조회
			Funding funding = fService.printOne(projectNo);
			if (funding != null) {
				// 메소드 체이닝 방식
				mv.addObject("funding", funding).setViewName("funding/accusationPage");
			} else {
				mv.addObject("msg", "펀딩 참여 실패");
				mv.setViewName("common/errorPage");
			}
			return mv;
		}		//펀딩 신고하기 페이지로 이동.
	 
	 @RequestMapping(value="accusationRegister.do", method = RequestMethod.POST )
	 public String accusation_ReportRegister(@ModelAttribute FundingReport fundingReport) { 
		 int result = fService.accusationRegister(fundingReport);
		 if(result > 0) {
			 return "funding/fundingJoinCompleteView";
		 }else {
			 return "common/errorPage";
		 }
	 }		//펀딩 신고 완료 리턴되는 페이지는 아직 임시_아마 신고하고 바로 해당 프로젝트 상세 페이지로 돌아가야 할텐데 어떻게 할지 모르겠음 흐음.;. 

	
	
	@ResponseBody
	@RequestMapping(value = "addComment.do", method = RequestMethod.POST)
	public String addReply(@ModelAttribute Reply reply, HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		reply.setUserId(loginUser.getUserId());
		int result = fService.registerReply(reply);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}	//댓글 작성
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="modifyComment.do", method=RequestMethod.POST)
	public String modifyReply(@ModelAttribute Reply reply) {
		
		int result = fService.modifyReply(reply);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
		
	}	//댓글 수정

	@ResponseBody
	@RequestMapping(value = "deleteComment.do", method = RequestMethod.GET)
	public String removeReply(@ModelAttribute Reply reply) {
		int result = fService.removeReply(reply);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}	//댓글 삭제

	@RequestMapping(value = "commentList.do", method = RequestMethod.GET)
	public void getReplyList(HttpServletResponse response, @RequestParam("projectNo") int projectNo) throws Exception {
		ArrayList<Reply> rList = fService.printAllReply(projectNo);
		if (!rList.isEmpty()) {
			Gson gson = new GsonBuilder().setDateFormat("yy-MM-dd").create(); // 날짜 포맷 변경!
			gson.toJson(rList, response.getWriter());
		} else {
			System.out.println("데이터가 없습니다.");
		}
	}	//댓글 목록

	@RequestMapping(value="fundingLikeAdd.do", method = RequestMethod.POST)
	 public String fundingLikeAdd(@ModelAttribute Funding funding, FundingLike fundingLike, 
			 					  HttpServletRequest request,
			 					  Model model) { 
		 int result = fService.fundingLikeRegister(funding, fundingLike);
		 if(result > 0) {
			 return "funding/fundingJoinCompleteView";
		 }else {
			 model.addAttribute("msg", "좋아요 등록 실패!!");
			 return "common/errorPage";
		 }
	 } // 좋아요 해당 테이블 인서트 및 펀딩프로젝트 테이블에도 좋아요 숫자 업데이트 ↓ 아래거는 어떻게 할지 생각중.
	
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
	}										//이거 쓰는건가? ㅋㅋㅋ
	
	public String fundingPay() {
		return "";
	}
	
	
	
	@RequestMapping(value="fundingSearch_1.do", method=RequestMethod.GET)
	public String fundingSearchForProcessing(@ModelAttribute Search search, Model model) {
		 ArrayList<Funding> fListandFileEnd = fService.printAllProjectEnd();   
		ArrayList<Funding> searchList1 = fService.printSearchAll_1(search);
		if(!searchList1.isEmpty()) {
			model.addAttribute("fListandFileEnd", fListandFileEnd);
			model.addAttribute("fListandFile", searchList1);
			model.addAttribute("search", search);
			return "funding/fundingList";
		}else {
			model.addAttribute("msg", "공지사항 검색 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="fundingSearch_2.do", method=RequestMethod.GET)
	public String fundingSearchForEnd(@ModelAttribute Search search, Model model) {
		 ArrayList<Funding> fListandFile = fService.printAllProject();   
		ArrayList<Funding> searchList2 = fService.printSearchAll_2(search);
		if(!searchList2.isEmpty()) {
			model.addAttribute("fListandFile", fListandFile);
			model.addAttribute("fListandFileEnd", searchList2);
			model.addAttribute("search", search);
			return "funding/fundingList";
		}else {
			model.addAttribute("msg", "공지사항 검색 실패");
			return "common/errorPage";
		}
	}
	
	 @RequestMapping(value="fundingSelectMoney.do", method=RequestMethod.GET)
	 public String fundingSelectMoney(Model model) {
		 ArrayList<Funding> fListandFile = fService.printAllProjectForMoney();   
		 ArrayList<Funding> fListandFileEnd = fService.printAllProjectEnd();   
		 if(!fListandFile.isEmpty()) {				
				model.addAttribute("fListandFile", fListandFile);
				model.addAttribute("fListandFileEnd", fListandFileEnd);
				return "funding/fundingList";
			}else {
				model.addAttribute("msg", "펀딩 목록조회 실패");
				return "common/errorPage";
			}
	
	 }
	 
	 @RequestMapping(value="fundingSelectLike.do", method=RequestMethod.GET)
	 public String fundingSelectLike(Model model) {
		 ArrayList<Funding> fListandFile = fService.printAllProjectForLike();   
		 ArrayList<Funding> fListandFileEnd = fService.printAllProjectEnd();   
		 if(!fListandFile.isEmpty()) {				
				model.addAttribute("fListandFile", fListandFile);
				model.addAttribute("fListandFileEnd", fListandFileEnd);
				return "funding/fundingList";
			}else {
				model.addAttribute("msg", "펀딩 목록조회 실패");
				return "common/errorPage";
			}
	
	 }
	 
	 @RequestMapping(value="fundingSelectMoneyEnd.do", method=RequestMethod.GET)
	 public String fundingSelectMoneyEnd(Model model) {
		 ArrayList<Funding> fListandFile = fService.printAllProject();   
		 ArrayList<Funding> fListandFileEnd = fService.printAllProjectEndForMoeny();   
		 if(!fListandFile.isEmpty()) {				
				model.addAttribute("fListandFile", fListandFile);
				model.addAttribute("fListandFileEnd", fListandFileEnd);
				return "funding/fundingList";
			}else {
				model.addAttribute("msg", "펀딩 목록조회 실패");
				return "common/errorPage";
			}
	
	 }
	 
	 @RequestMapping(value="fundingSelectLikeEnd.do", method=RequestMethod.GET)
	 public String fundingSelectLikeEnd(Model model) {
		 ArrayList<Funding> fListandFile = fService.printAllProject();   
		 ArrayList<Funding> fListandFileEnd = fService.printAllProjectEndForLike();   
		 if(!fListandFile.isEmpty()) {				
				model.addAttribute("fListandFile", fListandFile);
				model.addAttribute("fListandFileEnd", fListandFileEnd);
				return "funding/fundingList";
			}else {
				model.addAttribute("msg", "펀딩 목록조회 실패");
				return "common/errorPage";
			}
	
	 }
	
}
//400, jsp-Controller / 404, Controller url->console / 500, 서버 내부 오류(console)
