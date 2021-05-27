package com.ssaragibyul.point.service.logic;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.funding.domain.FundingLog;
import com.ssaragibyul.message.domain.Message;
import com.ssaragibyul.point.domain.Point;
import com.ssaragibyul.point.domain.PointAndProject;
import com.ssaragibyul.point.service.PointService;
import com.ssaragibyul.point.store.PointStore;

@Service
public class PointServiceImpl implements PointService{

	@Autowired
	private PointStore pStore;
	
	@Autowired
	private Point point;
	
	//증가 포인트 등록 - 충전
	@Override
	public int registerChargePoint(Point point) {
		return pStore.insertChargePoint(point);
	}
	
	/////////////////////증가 포인트 등록 - 방문인증, 선물받음, 펀딩취소, 기부취소
	@Override
	public int registerPosPoint(Point point) {
		return pStore.insertPosPoint(point);
	}

	//포인트 감소내역 등록-펀딩 참여용
	@Override
	public int registerPosPoint(FundingLog fundLog) {
		
		//String userId = fundLog.getUserId();
		//int varAmount = fundLog.getFundingPoint();
		//Point point = new Point(userId, 1, 1, varAmount);
		point.setUserId(fundLog.getUserId());
		point.setEventCode(1);
		point.setVarType(1);
		point.setVarAmount(fundLog.getFundingPoint() * -1);
		
		int result = pStore.insertPoint(point);
		return 0;
	}
	//포인트 증가내역 등록-선물받음
	@Override
	public int registerPosPoint(Message message) {
		
		point.setUserId(message.getReceiverId());
		point.setOppUserId(message.getSenderId());
		point.setEventCode(4);
		point.setVarType(0);
		point.setVarAmount(message.getPresentPoint());
		
		int result = pStore.insertPoint(point);
		return result;
	}
	
	
	//////////////감소 포인트 등록 - 선물함, 펀딩참여, 기부참여
	@Override
	public int registerNegPoint(Point point) {
		// TODO Auto-generated method stub
		return pStore.insertNegPoint(point);
	}
	
	//포인트 감소내역 등록-선물함
	@Override
	public int registerNegPoint(Message message) {
		
		point.setUserId(message.getSenderId());
		point.setOppUserId(message.getReceiverId());
		point.setEventCode(4);
		point.setVarType(1);
		point.setVarAmount(message.getPresentPoint() * -1);
		
		int result = pStore.insertPoint(point);
		return result;
	}

	//포인트 내역 리스트 출력
	@Override
	public ArrayList<PointAndProject> printAll(PageInfo pi, String userId) {
		return pStore.selectAll(pi, userId);
	}
	//포인트 내역 갯수(페이징용)
	@Override
	public int getListCount(String userId) {
		return pStore.getListCount(userId);
	}

	//내포인트 출력
	@Override
	public int getMyPoint(String userId) {
		return pStore.getMyPoint(userId);
	}
	
}
