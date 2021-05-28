package com.ssaragibyul.point.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.donation.domain.DonationLog;
import com.ssaragibyul.funding.domain.FundingLog;
import com.ssaragibyul.member.domain.Member;
import com.ssaragibyul.message.domain.Message;
import com.ssaragibyul.message.domain.PaginationMsg;
import com.ssaragibyul.point.domain.Point;
import com.ssaragibyul.point.domain.PointAndProject;
import com.ssaragibyul.point.service.PointService;
import com.ssaragibyul.visit.domain.Visit;

@Controller
public class PointController {

	@Autowired
	private PointService pService;
	
	//<insert>
	//결제정보 insert / 포인트 충전 insert (내가)
	//펀딩사용 insert(펀딩참여 메소드 내부에서 호출) (다른사람 메소드에서)
	//기부사용 insert(기부참여 메소드 내부에서 호출) (다른사람 메소드에서)
	//펀딩취소(상쇄) insert(펀딩참여 취소 메소드 내부에서 호출) (다른사람 메소드에서)
	//기부취소(상쇄) insert(펀딩참여 취소 메소드 내부에서 호출) (다른사람 메소드에서)
	//방문인증적립 insert (다른사람 메소드에서)
	//선물함 insert(해당쪽지번호 같이 insert) (내가)
	//선물받음 insert(해당쪽지번호 같이 insert) (내가)
	
	//<select>
	//포인트 내역리스트 select
	// - 조인이랑 where 조건으로 프로젝트 제목, 예약인지 지불됐는지 가져와서 뿌려줌
	// - jsp에서 if문으로 문구변경
	//잔여 포인트 조회 select(sum)
	
	//<delete> 없음
	//<update> 없음
	
	//point insert문 안에서 selectkey, select last_number(동적쿼리로 시퀀스명 변경) 사용
	
	//포인트내역 등록-충전용
	@RequestMapping(value="chargePoint.do", method=RequestMethod.POST)
	public ModelAndView chargePointRegister(ModelAndView mv, int varAmount, HttpSession session) {
		//결제화면.jsp에서 ajax에 json(varAmount:결제금액)으로 넘겨옴
		Member loginUser = (Member)session.getAttribute("loginUser"); //login담당자에게 setAttribute 명칭 물어보기
		Point point = new Point(loginUser.getUserId(), varAmount);
		//나머지는 쿼리문에서 적기(이벤트번호는 충전용 seq만들어서 처리)
		int result = pService.registerChargePoint(point);
		return mv;
	}
	
	//항목 중 기존은 ModelAttribute로 담아온 값에서 꺼내쓰기
	//나머지는 RequestParam 매개변수 추가해달라고 하기
	//넘길때는 point 객체에 담아서 넘기면 공통
	//매퍼에서 selectkey, insert 쿼리문에 이벤트유형코드 조건으로 동적 쿼리 걸기
	
	//포인트내역 등록-증가용(방문인증, 선물받음, 펀딩/기부 참여취소)
	//방문인증: 아이디(기존), 이벤트유형코드(hidden)
	//펀딩 참여취소: 펀딩번호(name=eventNo으로), 아이디(기존), 이벤트유형코드, 펀딩했던포인트(name = varAmount로) <c:url사용>
	//기부 참여취소: 기부번호(name=eventNo으로), 아이디(기존), 이벤트유형코드, 펀딩했던포인트(name = varAmount로) <c:url사용>
	// - 참여취소는 selectkey안해도 됨
	//선물받음: 받은사람아이디(기존), 선물포인트(기존), 보낸사람아이디(기존), 이벤트유형코드

	////////////////selectkey에 if문쓰고 펀딩,기부는 selectkey 쿼리문 적용안되게 하기.
	////////////////안돼면 가장 최근 시퀀스값 알아오는 메소드 만들어서 내부에서 호출, point객체에 세팅하고 넘기기
	
	//포인트 증가내역 등록-방문인증용
	public int posPointRegister(Visit visit, int eventCode) {
		Point point = new Point();
		point.setVarAmount(500);
		int result = pService.registerPosPoint(point);
		return result;
	}
	
	//포인트 증가내역 등록-펀딩 취소용
//	public int posPointRegister(FundingLog fundLog, int eventCode, int varAmount) {
//		//selectkey에도 if문 사용
//		Point point = new Point();
//		
//		int result = pService.registerPosPoint(point);
//		return result;
//	}
	
	//포인트 증가내역 등록-기부 취소용
	public int posPointRegister(DonationLog donateLog, int eventCode, int varAmount) {
		//selectkey에도 if문 사용
		Point point = new Point();
		
		int result = pService.registerPosPoint(point);
		return result;
	}
	
//	//포인트 증가내역 등록-선물받음
//	public int posPointRegister(Message message, int eventCode, int varAmount) {
//		Point point = new Point();
//		
//		int result = pService.registerPosPoint(point);
//		return result;
//	}
	
	//포인트내역 등록-감소용(펀딩참여, 기부참여, 선물함)
	//펀딩참여: 아이디(기존), 사용포인트(기존), 펀딩번호(기존), 이벤트유형코드
	//기부참여: 아이디(기존), 사용포인트(기존), 기부번호(기존), 이벤트유형코드
	//선물함: 보낸사람(기존), 선물포인트(기존), 받는사람아이디(기존), 이벤트유형코드
	
	//포인트 감소내역 등록-펀딩 참여용
//	public int negPointRegister(FundingLog fundLog, int eventCode, int varAmount) {
//		Point point = new Point();
//		
//		int result = pService.registerNegPoint(point);
//		return 0;
//	}
	
//	//포인트 감소내역 등록-기부 참여용
//	public int negPointRegister(DonationLog donateLog, int eventCode, int varAmount) {
//		Point point = new Point();
//		
//		int result = pService.registerNegPoint(point);
//		return 0;
//	}
	
	//포인트 감소내역 등록-선물함
//	public int negPointRegister(Message message, int eventCode, int varAmount) {
//		Point point = new Point();
//		
//		int result = pService.registerNegPoint(point);
//		return result;
//	}
	
	//포인트 사용내역 출력(전체, 펀딩, 기부, 선물, 방문인증, 충전) //펀딩-기부 UNIONALL
	//아직 차감안된 포인트내역도 나오게 해야함
	@RequestMapping(value="pointList.do", method=RequestMethod.GET)
	public ModelAndView PointList(ModelAndView mv,
								HttpSession session,
								@RequestParam(value="page", required=false) Integer page) {
		if(session != null && (Member)session.getAttribute("loginUser") != null) {		
			String userId = ((Member)session.getAttribute("loginUser")).getUserId();
			int currentPage = (page != null)? page : 1;
			int listCount = pService.getListCount(userId);
			PageInfo pi = PaginationMsg.getPageInfo(currentPage, listCount);
			ArrayList<PointAndProject> ppList = pService.printAll(pi, userId);
			System.out.println(ppList.get(0).toString());
			
			if(!ppList.isEmpty()) {
				mv.addObject("pointList", ppList);
			}else {
				mv.addObject("tblMsg", "포인트 사용내역이 없습니다.");
			}
			mv.addObject("pi", pi);
			mv.setViewName("point/pointListView");
		}else {
			mv.addObject("msg", "로그인이 필요합니다.");
			mv.setViewName("member/login");
		}
		return mv;
	}
	
	//로그인 시 상단표시: 로그인 메소드에서 호출하여 session에 같이 담기
	//펀딩/기부 참여하기 버튼 누를 때 최대금액 체크 기능
	//마이페이지 왼쪽, 포인트내역 페이지 왼쪽
	
	//잔여포인트 출력 //펀딩-기부 UNIONALL
	//조건 더 걸어서 정말 차감된것만 반영되게 해야함
	//펀딩은 목표금액<누적금액 조건 들어감/기부는 금액조건 안들어감!!! 주의!!!
	//@RequestMapping(value="myPoint", method= {RequestMethod.GET, RequestMethod.POST})
	public int getMyPoint(HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int myPoint = pService.getMyPoint(loginUser.getUserId());
		return myPoint;
	}
	
}
