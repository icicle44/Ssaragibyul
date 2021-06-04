package com.ssaragibyul.point.service.logic;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.donation.domain.DonationLog;
import com.ssaragibyul.funding.domain.FundingLog;
import com.ssaragibyul.message.domain.Message;
import com.ssaragibyul.message.domain.SearchMsg;
import com.ssaragibyul.point.domain.MyPoint;
import com.ssaragibyul.point.domain.Point;
import com.ssaragibyul.point.domain.PointAndProject;
import com.ssaragibyul.point.domain.PointForChart;
import com.ssaragibyul.point.service.PointService;
import com.ssaragibyul.point.store.PointStore;
import com.ssaragibyul.visit.domain.Visit;
import com.ssaragibyul.visit.service.VisitService;

@Service
public class PointServiceImpl implements PointService{

	@Autowired
	private PointStore pntStore;
	
	@Autowired
	private VisitService vService;
	
//	@Autowired
//	private Point point;
	
	//증가 포인트 등록 - 충전
	@Override
	public int registerChargePoint(Point point) {
		return pntStore.insertChargePoint(point);
	}
	
	//포인트 증가내역 등록-방문인증용
	@Override
	public int registerPosPoint(Visit visit) {
		
		Point point = new Point();
		point.setUserId(visit.getUserId());
		point.setEventCode(3);
		point.setVarType(0);
		point.setVarAmount(500);
		
		int result = pntStore.insertPoint(point);
		return result;
	}	
	
	//포인트 증가내역 등록-펀딩 취소용
	@Override
	public int registerPosFundPoint(int doFundNo) {
		
		int result = pntStore.insertFundCancelPoint(doFundNo);
		return result;
	}
	
	//포인트 증가내역 등록-기부 취소용
	@Override
	public int registerPosDonatePoint(int donateNo) {
		
		int result = pntStore.insertDonateCancelPoint(donateNo);
		return result;
	}

	//포인트 증가내역 등록-선물받음
	@Override
	public int registerPosPoint(Message message) {
		
		Point point = new Point();		
		point.setUserId(message.getReceiverId());
		point.setOppUserId(message.getSenderId());
		point.setEventCode(4);
		point.setVarType(0);
		point.setVarAmount(message.getPresentPoint());
		
		int result = pntStore.insertPoint(point);
		return result;
	}
	
	//포인트 감소내역 등록-펀딩 참여용
	@Override
	public int registerNegPoint(FundingLog fundLog) {
		
		Point point = new Point();
		point.setUserId(fundLog.getUserId());
		point.setEventCode(1);
		point.setVarType(1);
		point.setVarAmount(fundLog.getFundingPoint() * -1);
		System.out.println(point.getOppUserId());
		int result = pntStore.insertPoint(point);
		return result;
	}
	
	//포인트 감소내역 등록-기부 참여용
	@Override
	public int registerNegPoint(DonationLog donateLog) {
		
		Point point = new Point();
		point.setUserId(donateLog.getUserId());
		point.setEventCode(2);
		point.setVarType(1);
		point.setVarAmount(donateLog.getFundingPoint() * -1);
		
		int result = pntStore.insertPoint(point);
		return result;
	}
	
	//포인트 감소내역 등록-선물함
	@Override
	public int registerNegPoint(Message message) {
		
		Point point = new Point();
		point.setUserId(message.getSenderId());
		point.setOppUserId(message.getReceiverId());
		point.setEventCode(4);
		point.setVarType(1);
		point.setVarAmount(message.getPresentPoint() * -1);
		
		int result = pntStore.insertPoint(point);
		return result;
	}

	//포인트 내역 리스트 출력
	@Override
	public ArrayList<PointAndProject> printAll(PageInfo pi, String userId) {
		return pntStore.selectAll(pi, userId);
	}
	//포인트 내역 갯수(페이징용)
	@Override
	public int getListCount(String userId) {
		return pntStore.getListCount(userId);
	}

	//포인트 내역 검색 리스트 출력
	@Override
	public ArrayList<PointAndProject> printSearchList(PageInfo pi, SearchMsg search) {
		return pntStore.selectSearchList(pi, search);
	}

	//포인트 내역 검색 리스트 갯수(페이징용)
	@Override
	public int getSearchListCount(SearchMsg search) {
		return pntStore.getSearchListCount(search);
	}
	
	//내포인트 출력
	@Override
	public MyPoint getMyPoint(String userId) {
		return pntStore.getMyPoint(userId);
	}

	//차트용 포인트 조회
	@Override
	public PointForChart getPointForChart(String userId) {
		return pntStore.getPointForChart(userId);
	}

	//별보러가자 게시글 상세 조회
	@Override
	public Visit printVisitOne(int visitNo) {
		return vService.printOne(visitNo);
	}
	
}
