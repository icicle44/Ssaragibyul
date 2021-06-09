<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정 페이지</title>
<link rel="stylesheet" type="text/css" href="/resources/css/mypage/ProposeFunding2.css">
</head>
<style>
#svg{
	width: 315px;
}
.table-users{
margin : auto;
padding-left: 555px;
}
.like-stauts{
padding-left: 20px;
}
</style>
<body>
    <jsp:include page="../../../header.jsp"/>
    <div class="background">
        <div class="contents">
            <div class="kind">
                <div id="k1">펀딩</div>
                <div id="k2">기부</div>
            </div>
            <div class="leftMenu">
            	<jsp:include page="../../../myPageNav.jsp"/>
            </div>

            <!--오른쪽 내용 : 마이페이지 수정할 때 여기만 고치면 됨-->
            <div class="rightCon">
                <h2 align="center" id="h2">제안한 프로젝트</h2>
                <form action="memberRegister.do" method="post">
                <div class="f-top">
                    <div class="count">
                        <div id="f-count">제안한 프로젝트</div>
                        <div id="num">${fundingCnt.count }</div>
                        <div id="f-count"> 개를 확인하세요.</div>
                    </div>
                  <div class="category">
                        <select id="divide" name="divide" onchange="location.href=this.value">
                            <option value="" selected>선택</option>
                            <option value="proposeFunding.do"   id="op">추가순</option>
                            <option value="proposeFundingLike.do" id="op">좋아요순</option>
                            <option value="proposeFundingMoney.do" id="op">모금액순</option>
                        </select></div>
                </div>
            
                <c:forEach var="p" items="${likeFundingList}" varStatus="status"> 
                <div class="cont">
                    <div class="img">
                    	<img src="/resources/upLoadFile/${p.fundingFile.fileMainName}"id="f-img">
                    </div>
                    <div class="f-progress">
						<c:if test="${p.leftDate < 1}">
						<span>마감</span>
						</c:if>
						<c:if test="${p.leftDate >= 1}">
						 <span>펀딩중</span>
						</c:if>
                    </div>
                    <div class="title">
                        <div class="title-1">
                        <c:url var="fDetail" value="fundingDetail.do">
						<c:param name="projectNo" value="${p.projectNo }"></c:param>
						</c:url> 
						 <span>
                           <a href="${fDetail }" id="title-1">${p.subjectName}</a><br>
                         </span>
                        </div>
                        <div class="title-2">
                            <span>${p.productName}</span>
                        </div>
                        </div>
                        <div class="accrue">
                            <div id="sum">
                                <span><fmt:formatNumber value="${p.sumMoney }" pattern="#,###"/>원 , </span>
                            </div>                         
                            <div id="achieve">
                                <span> ${p.percent}</span>
                                <span>%</span>
                            </div>
                        </div>
                        <div class="graph" id="bar_td">
                                 	<c:if test="${p.percent > 99}">
								<svg id="svg">
									<rect x="0" y="0" fill="#efefef" height="6" width="100%"></rect>
									<rect x="0" y="0" height="6" width="100%" fill="#FF8000"></rect>
								</svg>
								</c:if>
			
								<c:if test="${p.percent < 100}">
								<svg id="svg">
									<rect x="0" y="0" fill="#efefef" height="6" width="100%"></rect>
									<rect x="0" y="0" height="6" width="${p.percent}%" fill="#FF8000"></rect>
								</svg>
								</c:if>
                                </div>
                        <div class="btn">
                            <input type="button" value="수정" id="update-btn">
                        </div>
                    </div>
                    </c:forEach>

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <!--페이징 처리 div-->
            <div class="table-users">
			<table cellspacing="0">  
                    				<!-- 페이징 -->
				<tr align="center" height="20">
					<td colspan="8">
					<c:url var="before" value="proposeFunding.do">
						<c:param name="page" value="${pi1.currentPage - 1 }"></c:param>
					</c:url>
				<c:if test="${pi1.currentPage <= 1 }">
					[이전]&nbsp;
				</c:if>
				<c:if test="${pi1.currentPage > 1 }">
					<a href="${before }">[이전]</a>&nbsp;
				</c:if>
				<!-- 페이지 -->
				<c:forEach var="p" begin="${pi1.startPage }" end="${pi1.endPage }">
					<c:url var="pagination" value="proposeFunding.do">
						<c:param name="page" value="${p }"></c:param>
					</c:url>
					<c:if test="${p eq pi1.currentPage }">
						<font color="red" size="2">[${p }]</font>
					</c:if>
					<c:if test="${p ne pi1.currentPage }">
						<a href="${pagination }">${p }</a>&nbsp;
					</c:if>
				</c:forEach>
				<!-- 다음 -->
				<c:url var="after" value="proposeFunding.do">
					<c:param name="page" value="${pi1.currentPage + 1 }"></c:param>
				</c:url>
				<c:if test="${pi1.currentPage >= pi1.maxPage }">
					[다음]&nbsp;
				</c:if>
				<c:if test="${pi1.currentPage < pi1.maxPage }">
					<a href="${after }">[다음]</a>&nbsp;
				</c:if>
			</td>
		</tr></table></div>
                </form>
            </div>
        </div>
    </div>
    <footer>
    	<jsp:include page="../../../footer.jsp"/>
    </footer>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</body>
</html>