package com.ssaragibyul.independence.service.serviceLogic;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssaragibyul.common.Search;
import com.ssaragibyul.independence.domain.Independence;
import com.ssaragibyul.independence.service.IndependenceService;
import com.ssaragibyul.independence.store.IndependenceStore;
@Service
public class IndependenceServiceImpl implements IndependenceService{
	
	@Autowired
	private IndependenceStore iStore;
	
	@Override
	public ArrayList<Independence> printAll() {
		System.out.println("service iList" + iStore.selectList());
		return iStore.selectList();
	}

	@Override
	public ArrayList<Independence> printSearchAll(Search search) {
		return iStore.selectList();
	}

	@Override
	public Independence printOne(int nId) {
		
		return null;
	}

	@Override
	public int getListCount() {
		
		return 0;
	}

}
