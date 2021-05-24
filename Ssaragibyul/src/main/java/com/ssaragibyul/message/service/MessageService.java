package com.ssaragibyul.message.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.message.domain.Message;
import com.ssaragibyul.message.domain.MessageAndNick;

public interface MessageService {
	
	//1:1 쪽지 등록(회원, 관리자 모두 보낼 수 있음)	
	public int registerMemMessage(Message message);
	//관리자의 공지 쪽지 등록	
	public int registerNotiMessage(Message message);
	//받은쪽지 삭제(update)
	public int deleteReceivedMsg(List<Integer> msgNoArr);
	//보낸쪽지 삭제(update)
	public int deleteSendMsg(List<Integer> msgNoArr);
	//쪽지 완전 삭제(내부 호출용) //삭제표시용 컬럼 둘다 Y & 선물포인트 NULL이면 DELETE
	public int removeMsgComplete(List<Integer> msgNoArr);
	//쪽지 상세보기 시, 읽음여부 Y로 업데이트
	public int updateRead(int msgNo);
	//공지쪽지리스트 출력
	public ArrayList<Message> printAllnMsg(PageInfo pi);
	//받은쪽지 리스트 출력
	public ArrayList<MessageAndNick> printAllrMsg(PageInfo pi, String userId);
	//보낸쪽지리스트 출력
	public ArrayList<MessageAndNick> printAllsMsg(PageInfo pi, String userId);
	//쪽지 상세보기
	public Message printOne(int msgNo);
	//읽지않은 받은쪽지 갯수 출력
	public int getRecMsgCount(String userId);
	//오늘의 공지쪽지 갯수 출력
	public int getNoticeMsgCount();
	//쪽지검색
	public ArrayList<MessageAndNick> printSearchList(PageInfo pi, Search search);
	//공지쪽지 페이징용 리스트 갯수 출력
	public int getNoticeListCount();
	//쪽지함 페이징용 리스트 갯수 출력
	public int getMsgListCount(HashMap<String, String> cntMap);
	//검색용 리스트 갯수 출력
	public int getSearchListCount(Search search);
	
}
