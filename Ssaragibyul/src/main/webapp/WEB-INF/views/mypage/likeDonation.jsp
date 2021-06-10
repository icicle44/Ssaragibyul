<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심 기부 프로젝트</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/mypage/myFunding2.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
</head>
<style>
#svg{
	width: 500px;
}
.table-users{
margin : auto;
padding-left: 555px;
}
.like-stauts{
padding-left: 20px;
float:left;
}
.btn-stauts{
float:left;
}
.blcok{
padding-top : 30px;
}
.getstarted{
	background: #EB5C01;
	padding: 2px 4px;
	margin: 2px;
	margin-left: 17px;
	border-radius: 3px;
	color: #fff;
}
.btn{
    width: 110px;
    height: 35px;
    text-align: left;
    color: white;
    font-size: 11px;
    font-weight: 1000;
    background: rgb(174, 174, 174);
    border: none;
    border-radius: 7px;
    float : right;
    font-style : 
}

.btn:hover{
    background-color: rgb(150, 150, 150);
    border: none;
}

.btn:active{
    background-color: rgb(100, 100, 100);
    border: none;
}
.btn1{
    width: 110px;
    height: 35px;
    text-align: center;
    color: white;
    font-size: 11px;
    font-weight: 1000;
    background: rgb(100, 100, 100);
    border: none;
    border-radius: 7px;
    float : right;
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
                <h2 align="center" id="h2">관심 기부 프로젝트</h2>
                <div class="f-top">
                    <div class="count">
                        <div id="num">${listCount}</div>
                        <div id="p-count">개의 프로젝트가 있습니다.</div>
                    </div>
                    <div class="category">
                        <select id="divide" name="divide" onchange="location.href=this.value">
                            <option value="" selected>선택</option>
                            <option value="likeDonation.do"   id="op">추가순</option>
                            <option value="likeDonationLike.do" id="op">좋아요순</option>
                            <option value="likeDonationMoney.do" id="op">모금액순</option>
                        </select>
                    </div>
                </div>
                
                
                
                
               <c:forEach var="m" items="${likeDonationList}" varStatus="status"> 
    	  <div class="f-cont">
                    <table class="funding">
                        <tr>
                            <td id="img">
                                <img src="/resources/dUpLoadFiles/${m.donation.donationFile.fileName}"id="f-img">
                                <img src="/resources/img/mypage/hartCheck.png" id="hart-img" onclick="like(this)"> 
                           <td>
                                <div class="title">
                                <c:url var="dDetail" value="donationDetail.do">
								<c:param name="projectNo" value="${m.donation.projectNo }"></c:param>
								</c:url> 
                                    <a href="${dDetail }" id="title-1">${m.donation.subjectName }</a><br>
                                      <a id="title-2"></a>
                                </div>
                                <div class="pay-status">
                                	<span>조회수 : ${m.donation.hitsCount}</span>
                                </div>
                                <div class="heartAndBtn">			
                                <div class="like-stauts">
                                <img src="resources/img/images/likeHeart.png" style="width:30px;, height:30px;">
								<span style="color:DimGray; font-size:18px; vertical-align:1px;">${m.donation.likeCount}</span>
						     </div><div class="btn_status">
						    			 <c:if test="${m.donation.leftDate < 1}">
                                        		<input type="submit" class="btn1" value="취소 불가">
                                        </c:if>
                                      <c:if test="${m.donation.leftDate >= 1}">
                                      	<form action="donationLikeDelete.do" method="post" name="fundingGo">
							   						<input type="hidden" name="projectNo" value="${m.projectNo }">
							   						<input type="hidden" name="userId" value="${m.userId }">
							    					<input type="submit" class="btn" value="좋아요 취소">
							    					</form>
                                      </c:if>
					 </div>
                           </div>
                           <div class="blcok"></div>
                                <div class="accrue">
                                    <div id="sum">
                                        <span><fmt:formatNumber value="${m.donation.sumMoney }" pattern="#,###"/>원</span>
                                    </div>                         <div id="achieve">
                                        <span>, ${m.donation.percent}</span>
                                        <span>%</span>
                                    </div>
                                    <div id="time">
                                    <c:if test="${m.donation.leftDate < 1}">
                                        <img src="/resources/img/mypage/time-img.png" id="time-img">
                                        <span>마감</span>
                                        </c:if>
                                      <c:if test="${m.donation.leftDate >= 1}">
                                    	  <img src="/resources/img/mypage/time-img.png" id="time-img">
                                     	 <span>${m.donation.leftDate } 일 남음</span>
                                      </c:if>
                                    </div>
              				   </div>
                                <div class="graph" id="bar_td">
                                 	<c:if test="${m.donation.percent > 99}">
								<svg id="svg">
									<rect x="0" y="0" fill="#efefef" height="5" width="100%"></rect>
									<rect x="0" y="0" height="5" width="100%" fill="#FF8000"></rect>
								</svg>
								</c:if>
			
								<c:if test="${m.donation.percent < 100}">
								<svg id="svg">
									<rect x="0" y="0" fill="#efefef" height="5" width="100%"></rect>
									<rect x="0" y="0" height="5" width="${m.donation.percent}%" fill="#FF8000"></rect>
								</svg>
								</c:if>
                                </div>
                            </td>
                        </tr>
                    </table>
                 </div> 
                    </c:forEach>
                    
                    
                    
                    
                    
            <div class="table-users">
			<table cellspacing="0">  
                    				<!-- 페이징 -->
				<tr align="center" height="20">
					<td colspan="8">
					<!-- 이전 -->
					<c:url var="before" value="likeDonation.do">
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
					<c:url var="pagination" value="likeDonation.do">
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
				<c:url var="after" value="likeDonation.do">
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
</body>
</html>