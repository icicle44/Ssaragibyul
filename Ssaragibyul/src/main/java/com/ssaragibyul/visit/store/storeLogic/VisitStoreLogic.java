package com.ssaragibyul.visit.store.storeLogic;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssaragibyul.common.Reply;
import com.ssaragibyul.visit.domain.Visit;
import com.ssaragibyul.visit.domain.VisitLike;
import com.ssaragibyul.visit.store.VisitStore;
@Repository
public class VisitStoreLogic implements VisitStore{
	private final Logger log = LoggerFactory.getLogger(VisitStoreLogic.class);

	@Autowired
	SqlSession session;
	
	@Override
	public int selectListCount() {
		
		return 0;
	}
	// 글 목록 가져오기
	@Override
	public ArrayList<Visit> selectAllList() {
		return (ArrayList)session.selectList("visitMapper.selectAll");
	}
	// 글 목록 추가 가져오기
	@Override
	public List<Visit> selectScroll(Integer visitNoToStart) {
		return session.selectList("visitMapper.selectScroll", visitNoToStart);
	}
	// 처음 쓴 글 번호 가져오기
	@Override
	public Integer selectLastNo() {
		Visit v = session.selectOne("visitMapper.selectLastNo");
		Integer vNo = v.getVisitNo();
		log.debug("selectlastNo: " + vNo);
		return vNo; 
	}
	// 조회수 증가
	@Override
	public int addHitsCount(int visitNo) {
		return session.update("visitMapper.updateHitCount", visitNo);
	}
	
	 // 조회수 가져오기
	 @Override public Integer getHitsCount(int visitNo) {
		 //System.out.println(" getHitsCount param : " + visitNo);
		 Visit result = session.selectOne("visitMapper.selectHitCount", visitNo);
		 //System.out.println(" getHitsCount result : " + result.toString());
		 return result.getVisitCount();
	 }
	 

	// 글 하나 가져오기
	@Override
	public Visit selectOne(int visitNo) {
		return session.selectOne("visitMapper.selectOne", visitNo);
	}

	@Override
	public int insertVisit(Visit visit) {
		return session.insert("visitMapper.insertVisit", visit);
	}

	@Override
	public int updateVisit(Visit visit) {
		return session.update("visitMapper.updateVisit", visit);
	}
	@Override
	public int updateVisitFile(Visit visit) {
		return session.update("visitMapper.updateVisitFile", visit);
	}
	@Override
	public int deleteVisit(int visitNo) {
		return session.delete("visitMapper.deleteVisit", visitNo);
	}
	// 댓글 목록 조회
	@Override
	public ArrayList<Reply> selectAllReply(int visitNo) {
		return (ArrayList)session.selectList("visitMapper.selectReply", visitNo);
	}
	// 댓글 등록
	@Override
	public int insertReply(Reply reply) {
		return session.insert("visitMapper.insertReply", reply);
	}
	// 댓글 수정
	@Override
	public int updateReply(Reply reply) {
		return session.update("visitMapper.updateReply", reply);
	}
	// 댓글 삭제
	@Override
	public int deleteReply(int replyNo) {
		return session.delete("visitMapper.deleteReply", replyNo);
	}
	// 좋아요 증가
	@Override
	public int plusLikesCount(VisitLike likes) {
		return session.insert("visitMapper.plusLikesCount", likes);
	}
	// 좋아요 감소
	@Override
	public int minusLikesCount(VisitLike likes) {
		return session.delete("visitMapper.minusLikesCount", likes);
	}
	// 좋아요 수 가져오기
	@Override
	public int getLikes(VisitLike likes) {
		return session.selectOne("visitMapper.getLikes", likes);
	}


}
