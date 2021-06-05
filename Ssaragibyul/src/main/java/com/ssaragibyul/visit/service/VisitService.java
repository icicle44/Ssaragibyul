package com.ssaragibyul.visit.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ssaragibyul.common.Reply;
import com.ssaragibyul.visit.domain.Visit;
import com.ssaragibyul.visit.domain.VisitLike;

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
	public ArrayList<Visit> printAll();
	
	// 스크롤하여 게시글 추가조회
	public List<Visit> printScroll(Integer visitNoToStart);
	
	/**
	 * 게시물 상세 조회시 조회수 증가
	 * @param pi
	 * @return
	 */
	public Integer addHitsCount(int visitNo);
	
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
	public int removeReply(int replyNo);

	public int getListCnt(Map<String, String> param);

	public Integer printLastNo();

	public int plusLikesCount(VisitLike likes);
	
	public int minusLikesCount(VisitLike likes);

	public int getLikes(int visitNo);

	public String checkLikes(VisitLike likes);

	
}
