package com.ssaragibyul.history.service.serviceLogic;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.history.domain.History;
import com.ssaragibyul.history.service.HistoryService;
@Service
public class HistoryServiceImpl implements HistoryService{

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

}
