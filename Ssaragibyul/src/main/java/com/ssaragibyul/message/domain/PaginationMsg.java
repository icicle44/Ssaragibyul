package com.ssaragibyul.message.domain;

import com.ssaragibyul.common.PageInfo;

public class PaginationMsg {
	
	public static PageInfo getPageInfo(int currentPage, int listCount) {
		PageInfo pi = null;
		
		int pageLimit = 10; // 한 페이지에서 보여줄 네비게이션 수
		int boardLimit = 10; // 한 페이지에서 보여줄 게시글의 갯수
		int maxPage;        // 전체 페이지 중 가장 마지막 페이지
		int startPage;      // 현재 페이지에서 시작하는 첫번째 페이지
		int endPage;        // 현재 페이지에서 끝나는 마지막 페이지
		
		// 상단 2개의 상수값을 가지고 아래 3개 변수의 값을 계산하여 출력함.
		
		maxPage = (int)((double) listCount / boardLimit + 0.9); /* (int)0.1 = 0이 되므로 방지용으로 +0.9 */
		startPage = (((int)((double)currentPage/pageLimit + 0.9)) - 1) * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		// 오류 방지용
		if(maxPage < endPage) {
			endPage = maxPage;
		}

		// 계산 값으로 PageInfo 객체 생성
		pi = new PageInfo(currentPage, boardLimit, pageLimit, startPage, endPage, listCount, maxPage);
		return pi;
	}
}
