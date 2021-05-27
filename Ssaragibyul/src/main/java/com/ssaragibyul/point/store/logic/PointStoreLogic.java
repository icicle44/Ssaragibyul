package com.ssaragibyul.point.store.logic;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.point.domain.Point;
import com.ssaragibyul.point.domain.PointAndProject;
import com.ssaragibyul.point.store.PointStore;

@Repository
public class PointStoreLogic implements PointStore{

	@Autowired
	private SqlSession sqlSession;
	
	//증가 포인트 등록 - 충전
	@Override
	public int insertChargePoint(Point point) {
		// TODO Auto-generated method stub
		return 0;
	}

	//증가 포인트 등록 - 방문인증, 선물받음, 펀딩취소, 기부취소
	@Override
	public int insertPosPoint(Point point) {
		// TODO Auto-generated method stub
		return 0;
	}

	//감소 포인트 등록 - 선물함, 펀딩참여, 기부참여
	@Override
	public int insertNegPoint(Point point) {
		// TODO Auto-generated method stub
		return 0;
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
		// TODO Auto-generated method stub
		return 0;
	}

	//내포인트 출력
	@Override
	public int getMyPoint(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
