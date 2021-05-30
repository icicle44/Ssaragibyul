package com.ssaragibyul.point.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.donation.domain.DonationLog;
import com.ssaragibyul.funding.domain.FundingLog;
import com.ssaragibyul.message.domain.Message;
import com.ssaragibyul.message.domain.SearchMsg;
import com.ssaragibyul.point.domain.MyPoint;
import com.ssaragibyul.point.domain.Point;
import com.ssaragibyul.point.domain.PointAndProject;
import com.ssaragibyul.visit.domain.Visit;

public interface PointService {

	//증가포인트 내역
	public int registerChargePoint(Point point);
	
	public int registerPosFundPoint(int doFundNo);
	public int registerPosDonatePoint(int donateNo);
	public int registerPosPoint(Visit visit);
	public int registerPosPoint(Message message);
	

	//감소포인트 내역
	public int registerNegPoint(FundingLog fundLog);
	public int registerNegPoint(DonationLog donateLog);
	public int registerNegPoint(Message message);

	//포인트내역 리스트 출력
	public ArrayList<PointAndProject> printAll(PageInfo pi, String userId);
	public int getListCount(String userId);

	//포인트내역 검색 리스트 출력
	public ArrayList<PointAndProject> printSearchList(PageInfo pi, SearchMsg search);
	public int getSearchListCount(SearchMsg search);
	
	//내포인트 조회
	public MyPoint getMyPoint(String userId);
	
	//안씀
	public int registerPosPoint(Point point);
	public int registerNegPoint(Point point);

	

	
















}
