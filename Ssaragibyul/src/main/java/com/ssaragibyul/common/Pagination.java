package com.ssaragibyul.common;


public class Pagination {

	// PageInfo 객체를 리턴해주는 메소드
	// 한번만 생성하여 정보를 저장해서 가지고 있을수 있도록하기 위해 static메소드로 만듬
	public static PageInfo getPageInfo(int currentPage, int listCount) {
		PageInfo pi = null;
		int pageLimit = 10; // 한 페이지에서 보여줄 네비게이션 수
		int boardLimit = 10;	// 한 페이지에서 보여줄 게시글의 갯수
		int maxPage;		// 전체 페이지 중 가장 마지막 페이지
		int startPage;		// 현재 페이지에서 시작하는 첫번째 페이지
		int endPage;		// 현재 페이지에서 끝나는 마지막 페이지
		
		maxPage = (int)((double)listCount/boardLimit + 0.9);
		startPage = (((int)((double)currentPage/pageLimit + 0.9)) - 1) * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		// 오류방지용
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		pi = new PageInfo(currentPage, boardLimit, pageLimit, startPage, endPage, listCount, maxPage);
		return pi;
	}
}
