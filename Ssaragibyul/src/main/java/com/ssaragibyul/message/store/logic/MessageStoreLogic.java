package com.ssaragibyul.message.store.logic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.message.domain.Message;
import com.ssaragibyul.message.store.MessageStore;

@Repository
public class MessageStoreLogic implements MessageStore{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertMemMessage(Message message) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertNotiMessage(Message message) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReceivedMsg(List<Integer> msgNoArr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteSendMsg(List<Integer> msgNoArr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMsgComp(List<Integer> msgNoArr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateRead(int msgNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Message> selectAllnMsg(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Message> selectAllrMsg(PageInfo pi, String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Message> selectAllsMsg(PageInfo pi, String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Message selectOne(int msgNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getRecMsgCount(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getNoticeMsgCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Message> selectSearchList(PageInfo pi, Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getNoticeListCnt() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getMsgListCount(HashMap<String, String> cntMap) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getSearchListCount(Search search) {
		// TODO Auto-generated method stub
		return 0;
	}

}
