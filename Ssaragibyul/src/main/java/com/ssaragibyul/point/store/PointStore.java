package com.ssaragibyul.point.store;

import java.util.ArrayList;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.point.domain.Point;
import com.ssaragibyul.point.domain.PointAndProject;

public interface PointStore {

	public int insertChargePoint(Point point);
	public int insertPoint(Point point);
	public int insertFundCancelPoint(int doFundNo);

	public ArrayList<PointAndProject> selectAll(PageInfo pi, String userId);
	public int getListCount(String userId);

	public int getMyPoint(String userId);
	
	//안씀
	public int insertPosPoint(Point point);
	public int insertNegPoint(Point point);

}
