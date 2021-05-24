package com.ssaragibyul.message.store;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.message.domain.Message;
import com.ssaragibyul.message.domain.MessageAndNick;

public interface MessageStore {
	
	public int insertMemMessage(Message message);
	public int insertNotiMessage(Message message);
	
	public int deleteReceivedMsg(List<Integer> msgNoArr);
	public int deleteSendMsg(List<Integer> msgNoArr);
	public int deleteMsgComp(List<Integer> msgNoArr);
	
	public ArrayList<Message> selectAllnMsg(PageInfo pi);
	public ArrayList<MessageAndNick> selectAllrMsg(PageInfo pi, String userId);
	public ArrayList<MessageAndNick> selectAllsMsg(PageInfo pi, String userId);
	
	public Message selectOne(int msgNo);
	public int updateRead(int msgNo);

	public int getRecMsgCount(String userId);
	public int getNoticeMsgCount();
	
	public ArrayList<MessageAndNick> selectSearchList(PageInfo pi, Search search);
	
	public int getNoticeListCnt();
	public int getMsgListCount(HashMap<String, String> cntMap);
	public int getSearchListCount(Search search);

}
