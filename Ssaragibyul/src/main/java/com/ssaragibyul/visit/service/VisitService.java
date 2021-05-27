package com.ssaragibyul.visit.service;

import java.util.ArrayList;
import java.util.Map;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.visit.domain.Visit;

public interface VisitService {
	/**
	 * 게시물 전체 수 조회수
	 * @return
	 */
	public int getListCount();
	
	/** javadoc 주석
	 * 게시판 전체 조회
	 * @param pi
	 * @return
	 */
	// 이런 주석과는 다른
	public ArrayList<Visit> printAll();
	
	/**
	 * 게시물 상세 조회시 조회수 증가
	 * @param pi
	 * @return
	 */
	public int addReadCount(int visitNo);
	
	/**
	 * 게시물 상세 조회
	 * @param visitNo
	 * @return
	 */
	public Visit printOne(int visitNo);
	
	/**
	 * 게시물 등록
	 * @param visit
	 * @return
	 */
	public int registerVisit(Visit visit);
	/**
	 * 게시물 수정
	 * @param visit
	 * @return
	 */
	public int modifyVisit(Visit visit);
	/**
	 * 게시글 삭제
	 * @param visitNo
	 * @return
	 */
	public int removeVisit(int visitNo);
	
	/**
	 * 댓글 전체 조회
	 * @param visitNo
	 * @return
	 */
	public ArrayList<Reply> printAllReply(int visitNo);
	
	/**
	 * 댓글 등록
	 * @param reply
	 * @return
	 */
	public int registerReply(Reply reply);
	
	/**
	 * 댓글 수정
	 * @param reply
	 * @return
	 */
	public int modifyReply(Reply reply);
	
	/**
	 * 댓글 삭제
	 * @param reply
	 * @return
	 */
	public int removeReply(Reply reply);

	public int getListCnt(Map<String, String> param);
}
