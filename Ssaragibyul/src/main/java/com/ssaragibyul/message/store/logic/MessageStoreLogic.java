package com.ssaragibyul.message.store.logic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.message.domain.Message;
import com.ssaragibyul.message.domain.MessageAndNick;
import com.ssaragibyul.message.store.MessageStore;

@Repository
public class MessageStoreLogic implements MessageStore{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertMemMessage(Message message) {
		return sqlSession.insert("messageMapper.insertMemMessage", message);
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
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());		
		return (ArrayList)sqlSession.selectList("messageMapper.selectNMsgList");
	}

	@Override
	public ArrayList<MessageAndNick> selectAllrMsg(PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());		
		return (ArrayList)sqlSession.selectList("messageMapper.selectRMsgList", userId);
	}

	@Override
	public ArrayList<MessageAndNick> selectAllsMsg(PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());		
		return (ArrayList)sqlSession.selectList("messageMapper.selectSMsgList", userId);
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
		return sqlSession.selectOne("messageMapper.selectMsgListCount", cntMap);
	}

	@Override
	public int getSearchListCount(Search search) {
		// TODO Auto-generated method stub
		return 0;
	}

}
