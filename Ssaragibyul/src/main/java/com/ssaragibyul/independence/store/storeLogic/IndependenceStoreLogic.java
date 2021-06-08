package com.ssaragibyul.independence.store.storeLogic;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.independence.domain.Independence;
import com.ssaragibyul.independence.store.IndependenceStore;
@Repository
public class IndependenceStoreLogic implements IndependenceStore{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int selectListCount() {
		return sqlSession.selectOne("independenceMapper.selectListCount");
	}
	@Override
	public ArrayList<Independence> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("independenceMapper.selectAllList",null,rowBounds);
	}

	@Override
	public ArrayList<Independence> selectSearchList(Search search) {
		return (ArrayList)sqlSession.selectList("independenceMapper.selectSearchList", search);
	}

	@Override
	public Independence selectOne(int independenceNo) {
		return sqlSession.selectOne("independenceMapper.selectOne", independenceNo);
	}

	
}
