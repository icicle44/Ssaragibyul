package com.ssaragibyul.history.store;

import java.util.ArrayList;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.history.domain.History;

public interface HistoryStore {
	public ArrayList<History> selectAllList(PageInfo pi);
	public History selectOne(int boardNo);
	
	public int insertHistory(History history);
	public int updateHistory(History history);
	public int deleteHistory(int siteNo);
	public ArrayList<History> selectAllSiteNames(String siteType);
	public ArrayList<History> selectAllSiteType();
	public ArrayList<History> selectSiteLocation(String siteName);
}
