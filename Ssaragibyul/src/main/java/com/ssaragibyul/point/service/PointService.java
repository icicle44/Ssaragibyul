package com.ssaragibyul.point.service;

import java.util.ArrayList;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.point.domain.Point;
import com.ssaragibyul.point.domain.PointAndProject;

public interface PointService {

	//증가포인트 내역
	public int registerChargePoint(Point point);
	public int registerPosPoint(Point point);
	
	//감소포인트 내역
	public int registerNegPoint(Point point);


	//포인트내역 리스트 출력
	public ArrayList<PointAndProject> printAll(PageInfo pi, String userId);
	public int getListCount(String userId);

	//내포인트 조회
	public int getMyPoint(String userId);

















}
