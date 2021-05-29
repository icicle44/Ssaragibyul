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

	@Override
	public ArrayList<Visit> selectAllList() {
		return (ArrayList)session.selectList("visitMapper.selectAll");
	}

	@Override
	public int addReadCount(int visitNo) {
		
		return 0;
	}

	@Override
	public Visit selectOne(int visitNo) {
		
		return null;
	}

	@Override
	public int insertVisit(Visit visit) {
		
		return session.insert("visitMapper.insertVisit", visit);
	}

	@Override
	public int updateVisit(Visit visit) {
		
		return 0;
	}

	@Override
	public int deleteVisit(int VisitNo) {
		
		return 0;
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
		
		return 0;
	}

	@Override
	public int deleteReply(Reply reply) {
		
		return 0;
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
