package com.ssaragibyul.point.service.logic;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.donation.domain.DonationLog;
import com.ssaragibyul.funding.domain.FundingLog;
import com.ssaragibyul.message.domain.Message;
import com.ssaragibyul.point.domain.Point;
import com.ssaragibyul.point.domain.PointAndProject;
import com.ssaragibyul.point.service.PointService;
import com.ssaragibyul.point.store.PointStore;
import com.ssaragibyul.visit.domain.Visit;

@Service
public class PointServiceImpl implements PointService{

	@Autowired
	private PointStore pntStore;
	
	@Autowired
	private Point point;
	
	//증가 포인트 등록 - 충전
	@Override
	public int registerChargePoint(Point point) {
		return pntStore.insertChargePoint(point);
	}
	
	/////////////////////증가 포인트 등록 - 방문인증, 선물받음, 펀딩취소, 기부취소
	@Override
	public int registerPosPoint(Point point) {
		return pntStore.insertPosPoint(point);
	}
	
	//포인트 증가내역 등록-방문인증용
	@Override
	public int registerPosPoint(Visit visit) {
		
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
		
		point.setUserId(message.getReceiverId());
		point.setOppUserId(message.getSenderId());
		point.setEventCode(4);
		point.setVarType(0);
		point.setVarAmount(message.getPresentPoint());
		
		int result = pntStore.insertPoint(point);
		return result;
	}
	
	
	//////////////감소 포인트 등록 - 선물함, 펀딩참여, 기부참여
	@Override
	public int registerNegPoint(Point point) {
		// TODO Auto-generated method stub
		return pntStore.insertNegPoint(point);
	}
	
	//포인트 감소내역 등록-펀딩 참여용
	@Override
	public int registerNegPoint(FundingLog fundLog) {
		
		point.setUserId(fundLog.getUserId());
		point.setEventCode(1);
		point.setVarType(1);
		point.setVarAmount(fundLog.getFundingPoint() * -1);
		
		int result = pntStore.insertPoint(point);
		return result;
	}
	
	//포인트 감소내역 등록-기부 참여용
	@Override
	public int registerNegPoint(DonationLog donateLog) {
		
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

	//내포인트 출력
	@Override
	public int getMyPoint(String userId) {
		return pntStore.getMyPoint(userId);
	}
	
}
