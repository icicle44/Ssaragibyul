package com.ssaragibyul.history.store;

import java.util.ArrayList;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.history.domain.History;

public interface HistoryStore {
	public ArrayList<History> selectAllList(PageInfo pi);
	public History selectOne(int boardNo);
}
