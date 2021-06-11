package com.ssaragibyul.independence.store;

import java.util.ArrayList;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.independence.domain.Independence;

public interface IndependenceStore {
	public ArrayList<Independence> selectList(PageInfo pi);
	public ArrayList<Independence> selectSearchList(Search search, PageInfo pi);
	public Independence selectOne(int independenceNo);
	public int selectListCount();
}
