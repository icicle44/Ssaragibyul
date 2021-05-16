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
import com.ssaragibyul.funding.service.FundingService;
import com.ssaragibyul.member.domain.Member;
import com.ssaragibyul.visit.domain.Visit;


@Controller
public class FundingController {

	@Autowired
	private FundingService fService;
	
	@RequestMapping(value = "fundingList", method = RequestMethod.GET)
	public ModelAndView fundingList(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page) {

		return mv;
	}

	@RequestMapping(value = "fundingDetail", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView fundingDetail(ModelAndView mv, @RequestParam("projectNo") int projectNo) {
		
		return mv;
	}


	@RequestMapping(value = "fundingOfferView", method = RequestMethod.GET)
	public String fundingOfferView() {
		return "";
	}


	@RequestMapping(value = "fundingRegister", method = RequestMethod.POST)
	public ModelAndView fundingRegister(ModelAndView mv, @ModelAttribute Funding funding, @RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile, HttpServletRequest request) {

		return mv;
	}

	public String saveFile(MultipartFile file, HttpServletRequest request) {
	
		return null;
	}

	@RequestMapping(value = "fundingModifyView")
	public ModelAndView fundingModifyView(ModelAndView mv, @RequestParam("projectNo") int projectNo) {

		return mv;
	}

	@RequestMapping(value = "fundingUpdate", method = RequestMethod.POST)
	public ModelAndView fundingUpdate(ModelAndView mv, HttpServletRequest request, @ModelAttribute Funding funding, @RequestParam(value = "reloadFile", required = false) MultipartFile reloadFile) {
	
		return mv;
	}

	// 게시글 삭제(실제로는 상태 업데이트)
	@RequestMapping(value = "fundingDelete", method = RequestMethod.GET)
	public String fundingDelete(Model model, @RequestParam("projectNo") int projectNo, @RequestParam("renameFilename") String renameFilename, HttpServletRequest request) {
	
		return "";
	}

	public void deleteFile(String fileName, HttpServletRequest request) {

	}
	
	@ResponseBody
	@RequestMapping(value="addReply", method=RequestMethod.POST)
	public String addReply(@ModelAttribute Reply reply, HttpSession session) {
			
	return "";
	}
	
	@RequestMapping(value="replyList", method=RequestMethod.GET)
	public void getReplyList(HttpServletResponse response, @RequestParam("projectNo") int boarprojectNodNo) throws Exception {

	}
	
	public void changeLikeStatus() {

	}
	
	public void changeFundingStatus() {

	}
	
}