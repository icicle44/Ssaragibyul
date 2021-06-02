package com.ssaragibyul.visit.store.storeLogic;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.visit.domain.Visit;
import com.ssaragibyul.visit.store.VisitStore;
@Repository
public class VisitStoreLogic implements VisitStore{

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

	@Override
	public ArrayList<Reply> selectAllReply(int visitNo) {
		return (ArrayList)session.selectList("visitMapper.selectReply", visitNo);
	}

	@Override
	public int insertReply(Reply reply) {
		return session.insert("visitMapper.insertReply", reply);
	}

	@Override
	public int updateReply(Reply reply) {
		return session.update("visitMapper.updateReply", reply);
	}

	@Override
	public int deleteReply(int replyNo) {
		return session.delete("visitMapper.deleteReply", replyNo);
	}
	// Review 좋아요 유무 체크
	public int checkLikes(int visitNo, String userId) {
		int result =0;

		return result;
	}
	// 좋아요 0일때 plus
	public int plusLikesReview(String userId, int visitNo) {
		int result = 0;

		return result;
	}
	// 좋아요 0보다 클때 plus
	public int updateLikesCountReview(int visitNo, String userId, String state) {
		int likes = 0;

		return likes;
	}
	// 좋아요 minus
	public int minusLikesReview(String userId, int visitNo, String state) {
		int likes = 0;

		return likes;
	}
	// 좋아요 수
	public int getLikes(String userId, int visitNo) {
		int likes = 0;

		return likes;
	}


}
