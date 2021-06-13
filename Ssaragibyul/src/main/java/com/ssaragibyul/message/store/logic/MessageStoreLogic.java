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
		return sqlSession.insert("messageMapper.insertNotiMessage", message);
	}

	@Override
	public int deleteReceivedMsg(List<Integer> msgNoArr) {
		return sqlSession.update("messageMapper.deleteReceiveMsg", msgNoArr);
	}

	@Override
	public int deleteSendMsg(List<Integer> msgNoArr) {
		return sqlSession.update("messageMapper.deleteSendMsg", msgNoArr);
	}

	@Override
	public int deleteMsgComp(List<Integer> msgNoArr) {
		return sqlSession.delete("messageMapper.deleteMsgComp", msgNoArr);
	}

	@Override
	public int updateRead(int msgNo) {
		return sqlSession.update("messageMapper.updateRead", msgNo);
	}

	@Override
	public ArrayList<Message> selectAllnMsg(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());		
		return (ArrayList)sqlSession.selectList("messageMapper.selectNMsgList", null, rowBounds);
	}

	@Override
	public ArrayList<MessageAndNick> selectAllrMsg(PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());		
		return (ArrayList)sqlSession.selectList("messageMapper.selectRMsgList", userId, rowBounds);
	}

	@Override
	public ArrayList<MessageAndNick> selectAllsMsg(PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());		
		return (ArrayList)sqlSession.selectList("messageMapper.selectSMsgList", userId, rowBounds);
	}

	@Override
	public Message selectOne(int msgNo) {
		return sqlSession.selectOne("messageMapper.selectOne", msgNo);
	}

	@Override
	public int getRecMsgCount(String userId) {
		return sqlSession.selectOne("messageMapper.selectRecCount", userId);
	}

	@Override
	public int getNoticeMsgCount() {
		return sqlSession.selectOne("messageMapper.selectNotiCount");
	}

	@Override
	public ArrayList<MessageAndNick> selectSearchList(PageInfo pi, Search search) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("messageMapper.selectSearchMsgList", search, rowBounds);
	}

	@Override
	public int getNoticeListCnt() {
		return sqlSession.selectOne("messageMapper.selectNoticeListCount");
	}

	@Override
	public int getMsgListCount(HashMap<String, String> cntMap) {
		return sqlSession.selectOne("messageMapper.selectMsgListCount", cntMap);
	}

	@Override
	public int getSearchListCount(Search search) {
		return sqlSession.selectOne("messageMapper.selectMsgSearchCount", search);
	}

}
