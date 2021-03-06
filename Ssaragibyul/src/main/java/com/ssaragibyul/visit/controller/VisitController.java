package com.ssaragibyul.visit.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

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
import com.google.gson.JsonIOException;
import com.ssaragibyul.common.DistanceInfo;
import com.ssaragibyul.common.DistanceLocation;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.history.domain.History;
import com.ssaragibyul.history.service.HistoryService;
import com.ssaragibyul.member.domain.Member;
import com.ssaragibyul.visit.domain.Visit;
import com.ssaragibyul.visit.domain.VisitLike;
import com.ssaragibyul.visit.service.VisitService;

@Controller
public class VisitController {

	@Autowired
	private VisitService vService;
	@Autowired
	private HistoryService hService;

	@RequestMapping(value = "visitList.do", method = { RequestMethod.GET })
	public ModelAndView visitListView(ModelAndView mv, Visit visit) {
		ArrayList<Visit> vList = vService.printAll();
		if (!vList.isEmpty()) {
			mv.addObject("vList", vList).setViewName("visit/visitList");
		} else {
			mv.addObject("msg", "게시글 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}

	// 글목록 스크롤
	@RequestMapping(value = "visitScroll.do", method = RequestMethod.GET)
	public void visitListScroll(HttpServletResponse response, @RequestParam("visitNo") int visitNo) throws Exception {
		System.out.println("==================scroll 컨트롤러 들어옴");
		System.out.println("Scroll, visitNo : " + visitNo);
		Integer visitNoToStart = visitNo;
		int lastNo = checkLastNo();
		System.out.println("checkLastNo : " + lastNo);
		List<Visit> addList = vService.printScroll(visitNoToStart);
		Gson gson = new GsonBuilder().create();
		gson.toJson(addList, response.getWriter());

	}
	// 게시글 수정화면에 작성내용 띄우기
	@RequestMapping(value = "visitDetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView visitDetail(ModelAndView mv, @RequestParam("visitNo") int visitNo) {
		Visit visit = vService.printOne(visitNo);
		if (visit != null) {
			mv.addObject("visit", visit).setViewName("visit/visitList");
		} else {
			mv.addObject("msg", "다시 시도해주세요").setViewName("common/errorPage");
		}
		return mv;
	}

	// 게시글 등록화면/ type목록가져오기
	@RequestMapping(value = "visitWriteView.do", method = RequestMethod.GET)
	public ModelAndView visitWriteView(ModelAndView mv) {
		ArrayList<History> hList = hService.printAllSiteType();
		
		if (!hList.isEmpty()) {
			mv.addObject("hList", hList).setViewName("visit/visitWrite");
		} else {
			mv.addObject("msg", "게시글 등록화면 이동실패").setViewName("common/errorPage");
		}
		return mv;
	}

	// 게시글 등록화면 SiteName 가져오기
	@RequestMapping(value = "getSiteName.do", method = RequestMethod.POST)
	public void getSiteName(HttpServletResponse response, @RequestParam("siteType") String siteType) throws Exception {
		System.out.println("siteType : " + siteType);
		ArrayList<History> hList = hService.printAllSiteNames(siteType);
		System.out.println("controller, siteName, hList : " + hList);
		if (!hList.isEmpty()) {
			Gson gson = new GsonBuilder().create();
			gson.toJson(hList, response.getWriter());
		}
	}

	// 게시글 등록화면 Site 위치 가져오기
	@RequestMapping(value = "getSiteLocation.do", method = RequestMethod.POST)
	public void getSiteLocation(HttpServletResponse response, @RequestParam("siteName") String siteName) throws Exception {
		System.out.println("컨트롤러 위치가져오기 siteName : " + siteName);
		ArrayList<History> hList = hService.printAllSiteLocation(siteName);
		if (!hList.isEmpty()) {
			Gson gson = new GsonBuilder().create();
			gson.toJson(hList, response.getWriter());
		}
	}
	// 내 위치와 사적지 위치 간 거리 계산
	@RequestMapping(value="calDistance.do", method = RequestMethod.GET)
	public void calDistance(HttpServletResponse response, DistanceInfo distInfo) throws Exception {
		distInfo.setUnit("kilometer");
		System.out.println("distInfo : " + distInfo);
		final double dist = distInfo.getDistance();
		System.out.println("dist(결과) :" + dist);
		if (dist != 0) {
			Gson gson = new GsonBuilder().create();
			gson.toJson(dist, response.getWriter());
		}
	}
	
	// 거리 계산 api
	public double calDist(DistanceInfo distInfo) {
		distInfo.setUnit("meter");
		final double dist = distInfo.getDistance();
		System.out.println("distance : " + dist);
		return dist;
	}
	
	// 게시글 등록
	@RequestMapping(value = "visitRegister.do", method = RequestMethod.POST)
	public ModelAndView visitRegister(ModelAndView mv, @ModelAttribute Visit visit,
			@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile,
			HttpServletRequest request) {
		// 서버에 파일 저장
		if (!uploadFile.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(uploadFile, request);
			if (renameFileName != null) {
				visit.setOriginalFilename(uploadFile.getOriginalFilename());
				visit.setRenameFilename(renameFileName);
			}
		}
		// 디비에 데이터 저장
		int result = 0;
		String path = "";

		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		visit.setUploadTime(sdf.format(timestamp));

		result = vService.registerVisit(visit);
		if (result > 0) {
			path = "redirect:visitList.do";
		} else {
			mv.addObject("msg", "방문 인증글 등록 실패");
			path = "common/errorPage";
		}
		mv.setViewName(path);
		return mv;
	}

	// 게시글 수정화면
	@RequestMapping(value = "visitModifyView.do")
	public ModelAndView visitModifyView(ModelAndView mv, @RequestParam("visitNo") int visitNo) {
		Visit visit = vService.printOne(visitNo);
		if (visit != null) {
			mv.addObject("visit", visit).setViewName("visit/visitModify");
		} else {
			mv.addObject("msg", "게시글 상세 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}

	// 게시글 수정
	@RequestMapping(value = "visitUpdate.do", method = RequestMethod.POST)
	public ModelAndView visitUpdate(ModelAndView mv, HttpServletRequest request, @ModelAttribute Visit visit,
			@RequestParam(value = "reloadFile", required = false) MultipartFile reloadFile) {
		System.out.println("=============================게시글 수정 controller 들어옴");
		System.out.println("RenameFilename : " + visit.getRenameFilename());
		// 파일 삭제 후 업로드
		if (reloadFile != null && !reloadFile.isEmpty()) {
			// 기존 파일 삭제
			if (visit.getRenameFilename() != "") {
				deleteFile(visit.getRenameFilename(), request);
			}
			// 새 파일 업로드
			String renameFilename = saveFile(reloadFile, request);
			if (renameFilename != null) {
				visit.setOriginalFilename(reloadFile.getOriginalFilename());
				visit.setRenameFilename(renameFilename);
			}
		}
		// DB 수정
		int result = vService.modifyVisit(visit);
		if (result > 0) {
			mv.setViewName("redirect:visitList.do");
		} else {
			mv.addObject("msg", "게시글 수정 실패").setViewName("common/errorPage");
		}
		return mv;
	}

	// 게시글 삭제
	@RequestMapping(value = "visitDelete.do", method = RequestMethod.GET)
	public String visitDelete(Model model, @RequestParam("visitNo") int visitNo,
			@RequestParam("renameFilename") String renameFilename, HttpServletRequest request) {
		// 업로드된 파일 삭제
		if (renameFilename != "") {
			deleteFile(renameFilename, request);
		}

		// 디비에 데이터 업데이트
		int result = vService.removeVisit(visitNo);
		if (result > 0) {
			return "redirect:visitList.do";
		} else {
			model.addAttribute("msg", "게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	// 게시글 삭제 (myPage, 다중선택)
	@ResponseBody
	@RequestMapping(value="myVisitDelete.do", method=RequestMethod.GET)
	public String receivedMsgDelete(@RequestParam(value = "visitNoArr[]") List<Integer> visitNoArr, ModelAndView mv) {
		//배열에 해당하는 쪽지의 삭제표시컬럼 update
		int result = vService.deleteMyVisitDelete(visitNoArr);
		System.out.println(result);
		if(result > 0) {
			return "success";
		} else {
			return "fail";			
		}
	}
	
	// 파일저장
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일 저장 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\vUploadFiles";
		// 저장 폴더 선택
		File folder = new File(savePath);
		// 폴더 없으면 자동 생성
		if (!folder.exists()) {
			folder.mkdir();
		}
		// 파일명 변경하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "."
				+ originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		String filePath = folder + "\\" + renameFileName;
		// 파일저장
		try {
			file.transferTo(new File(filePath));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return renameFileName;
	}

	// 파일 삭제
	public void deleteFile(String fileName, HttpServletRequest request) {
		System.out.println("deleteFile, filename : " + fileName);
		String root = request.getSession().getServletContext().getRealPath("resources");
		System.out.println("deleteFile, root : " + root);
		String savePath = root + "\\vUploadFiles";
		File file = new File(savePath + "\\" + fileName);
		if (file.exists()) {
			file.delete();
		}
	}

	// 댓글등록
	@ResponseBody
	@RequestMapping(value = "addReply.do", method = RequestMethod.POST)
	public String addReply(@ModelAttribute Reply reply, HttpSession session) {
		System.out.println("컨트롤러 들어옴=============================");
		Member loginUser = (Member) session.getAttribute("loginUser");
		reply.setUserId(loginUser.getUserId());
		System.out.println("reply : " + reply);
		int result = vService.registerReply(reply);
		System.out.println("result : " + result);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 댓글목록
	@RequestMapping(value = "replyList.do", method = RequestMethod.GET)
	public void getReplyList(HttpServletResponse response, @RequestParam("visitNo") int visitNo) throws Exception {
		ArrayList<Reply> rList = vService.printAllReply(visitNo);
		System.out.println("controller, rList(댓글목록) : " + rList);
		if (!rList.isEmpty()) {
			Gson gson = new GsonBuilder().create();
			gson.toJson(rList, response.getWriter());
		} else {

		}
	}

	// 댓글수정
	@ResponseBody
	@RequestMapping(value = "modifyReply.do", method = RequestMethod.POST)
	public String modifyReply(@ModelAttribute Reply reply) {
		int result = vService.modifyReply(reply);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 댓글삭제
	@ResponseBody
	@RequestMapping(value = "deleteReply.do", method = RequestMethod.GET)
	public String removeReply(@RequestParam("replyNo") int replyNo) {
		int result = vService.removeReply(replyNo);
		System.out.println("replyNo : " + replyNo + "result : " + result);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 조회수 증가요
	@ResponseBody
	@RequestMapping(value = "addHitsCount.do", method = RequestMethod.GET)
	public String addHitsCount(@RequestParam("visitNo") int visitNo) {
		System.out.println("========================조회수 controller");
		Integer hitCount = vService.addHitsCount(visitNo);
		System.out.println("조회수 hitCount : " + hitCount);
		if (hitCount != null) {
			return hitCount.toString();
		} else {
			return "fail";
		}
	}

	// 마지막 목록의 visitNo 가져오기
	public Integer checkLastNo() {
		Integer result = 0;
		result = vService.printLastNo();
		System.out.println("result : " + result);
		return result;
	}

// ==============좋아요
	// 좋아요 추가
	@ResponseBody
	@RequestMapping(value = "plusLikesCount.do", method = RequestMethod.GET)
	public String plusLikesCount(VisitLike likes) {
		System.out.println("=========좋아요 controller");
		String result = vService.plusLikesCount(likes) + "";
		if (result != "0") {
			return "success";
		} else {
			return "fail";
		}
	}

	// 좋아요 취소
	@ResponseBody
	@RequestMapping(value = "minusLikesCount.do", method = RequestMethod.GET)
	public String minusLikesCount(VisitLike likes) {
		System.out.println("좋아요 취소 visitNo, userId : " + likes.getVisitNo() + likes.getUserId());
		String result = vService.minusLikesCount(likes) + "";
		if (result != "0") {
			return "success";
		} else {
			return "fail";
		}
	}

	// 좋아요 체크
	@ResponseBody
	@RequestMapping(value = "checkLikes.do", method = RequestMethod.GET)
	public String checkLikes(VisitLike likes) {
		String likesYn = vService.checkLikes(likes);
		System.out.println("좋아요 체크 :" + likesYn);
		if (likesYn.equals("Y")) {
			return "Y";
		} else {
			return "N";
		}
	}

	// 좋아요 수 가져오기
	@ResponseBody
	@RequestMapping(value = "getLikes.do", method = RequestMethod.GET)
	public String getLikes(@RequestParam("visitNo") int visitNo) throws Exception {
		System.out.println("==============좋아요 가져오기");
		int result = vService.getLikes(visitNo);
		System.out.println("좋아요 수 result" + result);
		return result + "";
	}

//======================== 검색
	@RequestMapping(value = "visitSearch.do", method = RequestMethod.POST)
	public String visitSearch(@RequestParam("searchValue") String searchValue, Model model) {
		ArrayList<Visit> searchList = vService.printSearchAll(searchValue);
		System.out.println("searchList" + searchList);
		if (!searchList.isEmpty()) {
			model.addAttribute("vList", searchList);
			return "visit/visitSearchList";
		} else {
			model.addAttribute("msg", "검색결과가 없습니다");
			return "common/errorPage";
		}

	}
}
