package com.ssaragibyul.independence.store;

import java.util.ArrayList;

import com.ssaragibyul.common.Search;
import com.ssaragibyul.independence.domain.Independence;

public interface IndependenceStore {
	public ArrayList<Independence> selectList();
	public ArrayList<Independence> selectSearchList(Search search);
	public Independence selectOne(int nId);
}
