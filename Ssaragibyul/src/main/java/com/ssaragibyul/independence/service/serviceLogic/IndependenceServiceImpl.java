package com.ssaragibyul.independence.service.serviceLogic;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.independence.domain.Independence;
import com.ssaragibyul.independence.service.IndependenceService;
import com.ssaragibyul.independence.store.IndependenceStore;
@Service
public class IndependenceServiceImpl implements IndependenceService{
	
	@Autowired
	private IndependenceStore iStore;
	
	@Override
	public int getListCount() {
		return iStore.selectListCount();
	}
	@Override
	public ArrayList<Independence> printAll(PageInfo pi) {
		return iStore.selectList(pi);
	}

	@Override
	public ArrayList<Independence> printSearchAll(Search search) {
		return null;
	}

	@Override
	public Independence printOne(int independenceNo) {
		return iStore.selectOne(independenceNo);
	}


}
