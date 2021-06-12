package com.ssaragibyul.history.store.storeLogic;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.history.domain.History;
import com.ssaragibyul.history.store.HistoryStore;
@Repository
public class HistoryStoreLogic implements HistoryStore{
	
	@Autowired
	SqlSession sqlSession;
	@Override
	public ArrayList<History> selectAllList(PageInfo pi) {
		return (ArrayList)sqlSession.selectList("historyMapper.selectAllList", pi);
	}

	@Override
	public History selectOne(int boardNo) {
		
		return null;
	}

	@Override
	public int insertHistory(History history) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateHistory(History history) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteHistory(int siteNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<History> selectAllSiteNames(String siteType) {
		System.out.println(sqlSession.selectList("historyMapper.selectAllSiteNames", siteType));
		return (ArrayList)sqlSession.selectList("historyMapper.selectAllSiteNames", siteType);
	}

	@Override
	public ArrayList<History> selectAllSiteType() {
		System.out.println(sqlSession.selectList("historyMapper.selectAllSiteTypes"));
		return (ArrayList)sqlSession.selectList("historyMapper.selectAllSiteTypes");
	}

	@Override
	public ArrayList<History> selectSiteLocation(String siteName) {
		
		return (ArrayList)sqlSession.selectList("historyMapper.selectSiteLocation", siteName);
	}

	@Override
	public int getListCount() {
		return sqlSession.selectOne("historyMapper.selectHistoryListCount");
	}

	
}
