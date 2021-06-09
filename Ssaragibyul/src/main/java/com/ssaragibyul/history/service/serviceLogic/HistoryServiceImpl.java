package com.ssaragibyul.history.service.serviceLogic;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.history.domain.History;
import com.ssaragibyul.history.service.HistoryService;
import com.ssaragibyul.history.store.HistoryStore;
@Service
public class HistoryServiceImpl implements HistoryService{

	@Autowired
	HistoryStore hStore; 
	@Override
	public ArrayList<History> printAll(PageInfo pi) {
		
		return null;
	}

	@Override
	public History printOne(int boardNo) {
		
		return null;
	}

	@Override
	public int registerHistory(History history) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyHistory(History history) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeHistory(int siteNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<History> printAllSiteNames(String siteType) {
		System.out.println(hStore.selectAllSiteNames(siteType));
		return hStore.selectAllSiteNames(siteType);
	}

	@Override
	public ArrayList<History> printAllSiteType() {
		System.out.println(hStore.selectAllSiteType());
		return hStore.selectAllSiteType();
	}

	@Override
	public ArrayList<History> printAllSiteLocation(String siteName) {
		
		return hStore.selectSiteLocation(siteName);
	}

}
