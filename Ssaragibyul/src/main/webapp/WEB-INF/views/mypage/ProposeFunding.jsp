<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제안한 펀딩 프로젝트</title>
<link rel="stylesheet" type="text/css" href="/resources/css/mypage/ProposeFunding2.css">
<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700,900|Oswald:400,700" rel="stylesheet">
<link rel="stylesheet" href="/resources/fonts/flaticon/font/flaticon.css">
</head>
<style>
#svg{
	width: 340px;
}
.table-users{
margin : auto;
padding-left: 555px;
}
#end-btn{
    width: 330px;
    height: 35px;
    text-align: center;
    color: white;
    font-size: 15px;
    font-weight: 600;
    background: rgb(100, 100, 100);
    border: none;
    border-radius: 7px;
}
.like-stauts{
padding-left: 340px;
}
.f-progress{
float:left;
}
#time{
float:right;
margin-right: 121px;
}
.accrue #time img{
	width: 18px;
	height: 18px;
	margin-right: 5px;
		margin-bottom: 5px;
    }
   .accrue #time span{
   float:right;
    font-weight: bold;
    font-size: 15px;
    color: rgb(51, 51, 51);
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
                <h2 align="center" id="h2">제안한 펀딩 프로젝트</h2>
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
            
                <c:forEach var="p" items="${propFundingList}" varStatus="status"> 
                <div class="cont">
                    <div class="img">
                    	<img src="/resources/upLoadFile/${p.fundingFile.fileMainName}"id="f-img">
                    </div>
                    <div>
                    <div class="f-progress">
						<c:if test="${p.leftDate < 1}">
						<span>마감</span>
						</c:if>
						<c:if test="${p.leftDate >= 1}">
						 <span>펀딩중</span>
						</c:if>
						</div>
						<div class="like-stauts">
                                <img src="resources/img/images/likeHeart.png" style="width:24px;, height:24px;">
								<span style="color:DimGray; font-size:17px; vertical-align:1px;">${p.likeCount}</span>
						</div>
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
                        <div id="time">
                                    <c:if test="${p.leftDate < 1}">
                                        <img src="/resources/img/mypage/time-img.png" id="time-img" >
                                        <span>마감</span>
                                        </c:if>
                                      <c:if test="${p.leftDate >= 1}">
                                    	  <img src="/resources/img/mypage/time-img.png" id="time-img">
                                     	 <span>${p.leftDate } 일 남음</span>
                                      </c:if>
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
                        <c:if test="${p.leftDate >= 1}">
                        	<form action="fundingModifyView.do" method="post" name="fundingGo" id="postForm">
							 <input type="hidden" name="projectNo" value="${p.projectNo  }">
                            <input type="button" value="제안 수정" id="update-btn">
                            </form>
                            </c:if>
                              <c:if test="${p.leftDate < 1}">
                              <input type="button" value="수정 불가" id="end-btn">
                              </c:if>
                        </div>
                    </div> 
				</c:forEach>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<br>
          <div class="table-users">
			<table cellspacing="0">  
                    				<!-- 페이징 -->
				<tr align="center" height="20">
					<td colspan="8">
					<!-- 이전 -->
					<c:url var="before" value="proposeFunding.do">
						<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
					</c:url>
				<c:if test="${pi.currentPage <= 1 }">
					[이전]&nbsp;
				</c:if>
				<c:if test="${pi.currentPage > 1 }">
					<a href="${before }">[이전]</a>&nbsp;
				</c:if>
				<!-- 페이지 -->
				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
					<c:url var="pagination" value="proposeFunding.do">
						<c:param name="page" value="${p }"></c:param>
					</c:url>
					<c:if test="${p eq pi.currentPage }">
						<font color="red" size="2">[${p }]</font>
					</c:if>
					<c:if test="${p ne pi.currentPage }">
						<a href="${pagination }">${p }</a>&nbsp;
					</c:if>
				</c:forEach>
				<!-- 다음 -->
				<c:url var="after" value="proposeFunding.do">
					<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
				</c:url>
				<c:if test="${pi.currentPage >= pi.maxPage }">
					[다음]&nbsp;
				</c:if>
				<c:if test="${pi.currentPage < pi.maxPage }">
					<a href="${after }">[다음]</a>&nbsp;
				</c:if>
			</td>
		</tr></table></div>
            </div>
        </div>
    </div>
    <footer>
    	<jsp:include page="../../../footer.jsp"/>
    </footer>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script>
        $("#update-btn").on("click", function(){
    	
    	$("#postForm").submit();
    });
   </script>
</body>
</html>