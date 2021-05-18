package com.ssaragibyul.independence.store.storeLogic;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.ssaragibyul.common.Search;
import com.ssaragibyul.independence.domain.Independence;
import com.ssaragibyul.independence.store.IndependenceStore;
@Repository
public class IndependenceStoreLogic implements IndependenceStore{

	@Override
	public ArrayList<Independence> selectList() {
		
		return null;
	}

	@Override
	public ArrayList<Independence> selectSearchList(Search search) {
		
		return null;
	}

	@Override
	public Independence selectOne(int nId) {
		
		return null;
	}
	
}
