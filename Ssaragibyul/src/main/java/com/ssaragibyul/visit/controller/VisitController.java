 package com.ssaragibyul.visit.controller;

import java.io.File;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

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
	
	@RequestMapping(value="visitList.do", method= {RequestMethod.GET})
	public String vivisListView() {
		return "visit/visitList";
	}
//	@RequestMapping(value="visitList.do", method= {RequestMethod.GET})
//	public ModelAndView visitListView(ModelAndView mv,@RequestParam(value="page", required=false) Integer page) {
//		
//		return "visit/visitList";
//	}
	
	@RequestMapping(value="visitDetail.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView visitDetail(ModelAndView mv, @RequestParam("visitNo") int visitNo) {
		
		
		return mv;
	}
	// 게시글 등록화면
	@RequestMapping(value="visitWriteView.do", method=RequestMethod.GET)
	public String visitWriteView() {
		
		return "visit/visitWrite";
	}
	// 게시글 등록
	@RequestMapping(value="visitRegister.do", method=RequestMethod.POST)
	public ModelAndView visitRegister(ModelAndView mv,@ModelAttribute Visit visit, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile, HttpServletRequest request) {
		// 서버에 파일 저장
		if(!uploadFile.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(uploadFile,request);
			if(renameFileName != null) {
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
		if(result > 0) {
			path = "redirect:visitList.do";
		}else {
			mv.addObject("msg", "방문 인증글 등록 실패");
			path = "common/errorPage";
		}
		mv.setViewName(path);
		return mv;
	}
	
	// 게시글 수정화면
	@RequestMapping(value="visitModifyView.do")
	public ModelAndView visitModifyView(ModelAndView mv, @RequestParam("visitNo") int visitNo) {

		return mv;
	}
	// 게시글 수정
	@RequestMapping(value="visitUpdate.do", method=RequestMethod.POST)
	public ModelAndView visitUpdate(ModelAndView mv, HttpServletRequest request, @ModelAttribute Visit visit, @RequestParam(value="reloadFile", required=false) MultipartFile reloadFile) {

		return mv;
	}
	
	// 게시글 삭제
	@RequestMapping(value="visitDelete.do", method=RequestMethod.GET)
	public String visitDelete(Model model, @RequestParam("visitNo") int visitNo,@RequestParam("renameFilename") String renameFilename,HttpServletRequest request) {

		return "common/errorPage";
	}
	// 파일저장
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일 저장 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\vUploadFiles";
		// 저장 폴더 선택
		File folder = new File(savePath);
		// 폴더 없으면 자동 생성
		if(!folder.exists()) {
			folder.mkdir();
		}
		// 파일명 변경하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName =file.getOriginalFilename();
		String renameFileName =sdf.format(new Date(System.currentTimeMillis())) + "." + originalFileName.substring(originalFileName.lastIndexOf(".")+1);
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
		
	}
	// 댓글등록
	@ResponseBody
	@RequestMapping(value="addReply.do", method=RequestMethod.POST)
	public String addReply(@ModelAttribute Reply reply, HttpSession session) {

		return "fail";
	}
	// 댓글삭제
	@RequestMapping(value="replyList.do", method=RequestMethod.GET)
	public void getReplyList(HttpServletResponse response, @RequestParam("visitNo") int visitNo) throws Exception {
		
		
	}
	@RequestMapping(value="noticeSearch.do", method=RequestMethod.GET)
	public String visitSearch(@ModelAttribute Search search, Model model) {
		
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
