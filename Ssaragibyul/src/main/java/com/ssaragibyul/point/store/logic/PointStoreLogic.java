package com.ssaragibyul.point.store.logic;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.message.domain.SearchMsg;
import com.ssaragibyul.point.domain.MyPoint;
import com.ssaragibyul.point.domain.Point;
import com.ssaragibyul.point.domain.PointAndProject;
import com.ssaragibyul.point.domain.PointForChart;
import com.ssaragibyul.point.store.PointStore;

@Repository
public class PointStoreLogic implements PointStore{

	@Autowired
	private SqlSession sqlSession;
	
	//증가 포인트 등록 - 충전
	@Override
	public int insertChargePoint(Point point) {
		return sqlSession.insert("pointMapper.insertCharge", point);
	}

	//포인트 등록 공통사용(충전제외)
	@Override
	public int insertPoint(Point point) {
		System.out.println(point.getOppUserId());
		return sqlSession.insert("pointMapper.insertPoint", point);
	}
	
	//펀딩 취소시 내역 등록
	@Override
	public int insertFundCancelPoint(int doFundNo) {
		return sqlSession.insert("pointMapper.insertFundCancelPoint", doFundNo);
	}
	
	//기부 취소시 내역 등록
	@Override
	public int insertDonateCancelPoint(int donateNo) {
		return sqlSession.insert("pointMapper.insertDonateCancelPoint", donateNo);
	}

	//포인트 내역 리스트 출력
	@Override
	public ArrayList<PointAndProject> selectAll(PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());		
		return (ArrayList)sqlSession.selectList("pointMapper.selectPointList", userId, rowBounds);
	}
	
	//포인트 내역 갯수(페이징용)
	@Override
	public int getListCount(String userId) {
		return sqlSession.selectOne("pointMapper.selectListCount", userId);
	}
	
	//포인트 내역 검색리스트 출력
	@Override
	public ArrayList<PointAndProject> selectSearchList(PageInfo pi, SearchMsg search) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("pointMapper.selectSearchList", search, rowBounds);
	}

	//포인트 내역 검색리스트 갯수(페이징용)
	@Override
	public int getSearchListCount(SearchMsg search) {
		return sqlSession.selectOne("pointMapper.selectSearchCount", search);
	}

	//내포인트 출력
	@Override
	public MyPoint getMyPoint(String userId) {
		return sqlSession.selectOne("pointMapper.selectMyPoint", userId);
	}

	//차트용 포인트 조회
	@Override
	public PointForChart getPointForChart(String userId) {
		return sqlSession.selectOne("pointMapper.selectPointChart", userId);
	}

}
