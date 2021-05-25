package com.ssaragibyul.independence.service;

import java.util.ArrayList;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.independence.domain.Independence;

public interface IndependenceService {
	public ArrayList<Independence> printAll(PageInfo pi);
	public ArrayList<Independence> printSearchAll(Search search);
	public Independence printOne(int independenceNo);
	public int getListCount();
}
