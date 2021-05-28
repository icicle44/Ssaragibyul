package com.ssaragibyul.visit.service.serviceLogic;

import java.util.ArrayList;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.visit.domain.Visit;
import com.ssaragibyul.visit.service.VisitService;
import com.ssaragibyul.visit.store.VisitStore;







@Service
public class VisitServiceImpl implements VisitService{

	
	@Autowired
	VisitStore vStore;
	@Override
	public int getListCount() {
		
		return 0;
	}

	@Override
	public ArrayList<Visit> printAll() {
		
		return vStore.selectAllList();
	}

	@Override
	public int addReadCount(int visitNo) {
		
		return 0;
	}

	@Override
	public Visit printOne(int visitNo) {
		
		return null;
	}

	@Override
	public int registerVisit(Visit visit) {
		return vStore.insertVisit(visit);
	}

	@Override
	public int modifyVisit(Visit visit) {
		
		return 0;
	}

	@Override
	public int removeVisit(int visitNo) {
		
		return 0;
	}

	@Override
	public ArrayList<Reply> printAllReply(int visitNo) {
		
		return null;
	}

	@Override
	public int registerReply(Reply reply) {
		
		return 0;
	}

	@Override
	public int modifyReply(Reply reply) {
		
		return 0;
	}

	@Override
	public int removeReply(Reply reply) {
		
		return 0;
	}
	// 조회수 증가
	public int addHitsCount(int visitNo) { 
		int result = 0;

		return result;
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

	@Override
	public int getListCnt(Map<String, String> param) {
		
		return 0;
	}
}
