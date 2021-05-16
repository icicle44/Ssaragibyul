package com.ssaragibyul.point.service.logic;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.point.domain.Point;
import com.ssaragibyul.point.domain.PointAndProject;
import com.ssaragibyul.point.service.PointService;
import com.ssaragibyul.point.store.PointStore;

@Service
public class PointServiceImpl implements PointService{

	@Autowired
	private PointStore pStore;

	//증가 포인트 등록 - 충전
	@Override
	public int registerChargePoint(Point point) {
		return pStore.insertChargePoint(point);
	}
	
	//증가 포인트 등록 - 방문인증, 선물받음, 펀딩취소, 기부취소
	@Override
	public int registerPosPoint(Point point) {
		return pStore.insertPosPoint(point);
	}

	//감소 포인트 등록 - 선물함, 펀딩참여, 기부참여
	@Override
	public int registerNegPoint(Point point) {
		// TODO Auto-generated method stub
		return pStore.insertNegPoint(point);
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
