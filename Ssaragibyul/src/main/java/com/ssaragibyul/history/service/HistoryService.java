package com.ssaragibyul.history.service;

import java.util.ArrayList;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.history.domain.History;

public interface HistoryService {
	
	public ArrayList<History> printAll(PageInfo pi);
	
	public History printOne(int boardNo);
	
	public int registerHistory(History history);
	
	public int modifyHistory(History history);
	
	public int removeHistory(int siteNo);

	public ArrayList<History> printAllSiteNames(String siteType);

	public ArrayList<History> printAllSiteType();
}
