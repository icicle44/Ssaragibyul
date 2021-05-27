package com.ssaragibyul.message.service.logic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.message.domain.Message;
import com.ssaragibyul.message.domain.MessageAndNick;
import com.ssaragibyul.message.service.MessageService;
import com.ssaragibyul.message.store.MessageStore;
import com.ssaragibyul.point.service.PointService;

@Service
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	private MessageStore msgStore;
	@Autowired
	private PointService pntService;
	
	@Override
	public int registerMemMessage(Message message) {
		int result = 0;
		int msgResult = msgStore.insertMemMessage(message);
		if(msgResult > 0) {
			if(message.getPresentPoint() > 0) {
				int pntNegResult = pntService.registerNegPoint(message);
				int pntPosResult = pntService.registerPosPoint(message);
				
				if (pntNegResult > 0 && pntPosResult > 0) {
					result = msgResult + pntNegResult + pntPosResult;
					return result;
				}else {
					return result;
				}
			}else {
				return msgResult;
			}
		}else {
			return msgResult;
		}
	}

	@Override
	public int registerNotiMessage(Message message) {
		return msgStore.insertNotiMessage(message);
	}

	@Override
	public int deleteReceivedMsg(List<Integer> msgNoArr) {
		return msgStore.deleteReceivedMsg(msgNoArr);
	}

	@Override
	public int deleteSendMsg(List<Integer> msgNoArr) {
		return msgStore.deleteSendMsg(msgNoArr);
	}

	@Override
	public int removeMsgComplete(List<Integer> msgNoArr) {
		return msgStore.deleteMsgComp(msgNoArr);
	}

	@Override
	public int updateRead(int msgNo) {
		return msgStore.updateRead(msgNo);
	}

	@Override
	public ArrayList<Message> printAllnMsg(PageInfo pi) {
		return msgStore.selectAllnMsg(pi);
	}

	@Override
	public ArrayList<MessageAndNick> printAllrMsg(PageInfo pi, String userId) {
		return msgStore.selectAllrMsg(pi, userId);
	}

	@Override
	public ArrayList<MessageAndNick> printAllsMsg(PageInfo pi, String userId) {
		return msgStore.selectAllsMsg(pi, userId);
	}

	@Override
	public Message printOne(int msgNo) {
		return msgStore.selectOne(msgNo);
	}

	@Override
	public int getRecMsgCount(String userId) {
		return msgStore.getRecMsgCount(userId);
	}
	
	@Override
	public int getNoticeMsgCount() {
		return msgStore.getNoticeMsgCount();
	}

	@Override
	public ArrayList<MessageAndNick> printSearchList(PageInfo pi, Search search) {
		return msgStore.selectSearchList(pi, search);
	}
	
	public int getNoticeListCount() {
		return msgStore.getNoticeListCnt();
	}

	public int getMsgListCount(HashMap<String, String> cntMap) {
		return msgStore.getMsgListCount(cntMap);
	}

	@Override
	public int getSearchListCount(Search search) {
		return msgStore.getSearchListCount(search);
	}

}
