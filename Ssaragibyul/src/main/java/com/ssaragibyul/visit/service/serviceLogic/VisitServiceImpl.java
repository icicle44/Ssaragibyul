package com.ssaragibyul.visit.service.serviceLogic;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public Integer printLastNo() {
		System.out.println("vStore.selectLastNo" + vStore.selectLastNo());
		return vStore.selectLastNo();
	}
	@Override
	public ArrayList<Visit> printAll() {
		return vStore.selectAllList();
	}

	@Override
	public List<Visit> printScroll(Integer visitNoToStart) {
		return vStore.selectScroll(visitNoToStart);
	}

	@Override
	public Visit printOne(int visitNo) {
		return vStore.selectOne(visitNo);
	}

	@Override
	public int registerVisit(Visit visit) {
		return vStore.insertVisit(visit);
	}

	@Override
	public int modifyVisit(Visit visit) {
		vStore.updateVisit(visit);
		return vStore.updateVisitFile(visit);
	}

	@Override
	public int removeVisit(int visitNo) {
		return vStore.deleteVisit(visitNo);
	}

	@Override
	public ArrayList<Reply> printAllReply(int visitNo) {
		return vStore.selectAllReply(visitNo);
	}

	@Override
	public int registerReply(Reply reply) {
		return vStore.insertReply(reply);
	}

	@Override
	public int modifyReply(Reply reply) {
		return vStore.updateReply(reply);
	}

	@Override
	public int removeReply(int replyNo) {
		return vStore.deleteReply(replyNo);
	}
	// 조회수 증가
	public Integer addHitsCount(int visitNo) { 
		System.out.println(" addHitsCount param: " + visitNo);
		int resAhc = vStore.addHitsCount(visitNo);
		System.out.println(" resAhc : " + resAhc);
		Integer r = vStore.getHitsCount(visitNo);
		System.out.println(" addHitsCount result: " + r);
		return r;
		//return vStore.addHitsCount(visitNo);
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
