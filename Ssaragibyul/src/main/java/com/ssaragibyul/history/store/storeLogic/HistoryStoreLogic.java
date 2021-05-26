package com.ssaragibyul.history.store.storeLogic;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.history.domain.History;
import com.ssaragibyul.history.store.HistoryStore;
@Repository
public class HistoryStoreLogic implements HistoryStore{

	@Override
	public ArrayList<History> selectAllList(PageInfo pi) {
		
		return null;
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

	
}
