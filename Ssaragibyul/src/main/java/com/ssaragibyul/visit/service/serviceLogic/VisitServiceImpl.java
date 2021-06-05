package com.ssaragibyul.visit.service.serviceLogic;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssaragibyul.common.Reply;
import com.ssaragibyul.point.service.PointService;
import com.ssaragibyul.visit.domain.Visit;
import com.ssaragibyul.visit.domain.VisitLike;
import com.ssaragibyul.visit.service.VisitService;
import com.ssaragibyul.visit.store.VisitStore;


@Service
public class VisitServiceImpl implements VisitService{

	
	@Autowired
	VisitStore vStore;
    @Autowired
    private PointService pntService;

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
      int vResult = vStore.insertVisit(visit);
      int pntResult = 0;
      if(vResult > 0) {
         pntResult = pntService.registerPosPoint(visit);
      }
      return pntResult;
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

	// 좋아요 plus
	@Override
	public int plusLikesCount(VisitLike likes) {
		System.out.println("좋아요 증가 Service");
		return vStore.plusLikesCount(likes);
	}
	// 좋아요 minus
	@Override
	public int minusLikesCount(VisitLike likes) {
		return vStore.minusLikesCount(likes);
	}
	// 좋아요 체크
	@Override
	public String checkLikes(VisitLike likes) {
		return vStore.checkLikes(likes);
	}
	// 좋아요 수
	@Override
	public int getLikes(int visitNo) {
		return vStore.getLikes(visitNo);
	}
	@Override
	public int getListCnt(Map<String, String> param) {
		
		return 0;
	}





}
