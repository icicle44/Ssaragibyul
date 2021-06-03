package com.ssaragibyul.point.store;

import java.util.ArrayList;
import java.util.HashMap;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.message.domain.SearchMsg;
import com.ssaragibyul.point.domain.MyPoint;
import com.ssaragibyul.point.domain.Point;
import com.ssaragibyul.point.domain.PointAndProject;
import com.ssaragibyul.point.domain.PointForChart;

public interface PointStore {

	public int insertChargePoint(Point point);
	
	public int insertPoint(Point point);
	public int insertFundCancelPoint(int doFundNo);
	public int insertDonateCancelPoint(int donateNo);

	public ArrayList<PointAndProject> selectAll(PageInfo pi, String userId);
	public int getListCount(String userId);
	
	public ArrayList<PointAndProject> selectSearchList(PageInfo pi, SearchMsg search);
	public int getSearchListCount(SearchMsg search);	
	
	public MyPoint getMyPoint(String userId);

	public PointForChart getPointForChart(String userId);
	
}
