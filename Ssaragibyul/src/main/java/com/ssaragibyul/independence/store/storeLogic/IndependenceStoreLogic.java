package com.ssaragibyul.independence.store.storeLogic;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssaragibyul.common.Search;
import com.ssaragibyul.independence.domain.Independence;
import com.ssaragibyul.independence.store.IndependenceStore;
@Repository
public class IndependenceStoreLogic implements IndependenceStore{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<Independence> selectList() {
		return (ArrayList)sqlSession.selectList("independenceMapper.selectAllList");
	}

	@Override
	public ArrayList<Independence> selectSearchList(Search search) {
		return null;
	}

	@Override
	public Independence selectOne(int nId) {
		
		return null;
	}

	@Override
	public int selectListCount() {
		
		return sqlSession.selectOne("independenceMapper.selectListCount");
	}
	
}
