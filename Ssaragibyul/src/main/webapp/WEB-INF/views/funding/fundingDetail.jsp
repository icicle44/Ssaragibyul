<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>펀딩 상세</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700,900|Oswald:400,700" rel="stylesheet">
<link rel="stylesheet" href="/resources/fonts/flaticon/font/flaticon.css">

<!-- <link rel="stylesheet" href="/resources/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="/resources/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/css/jquery-ui.css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
<!-- <link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css"> -->
<link rel="stylesheet" href="/resources/css/aos.css">
<link rel="stylesheet" href="/resources/css/fancybox.min.css">

<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/detailproject.css">


<script>
window.onload=function(){
   var year = Number(document.getElementById('year').value);
   var month = Number(document.getElementById('month').value);
   var day = Number(document.getElementById('day').value);
   toDay = new Date();
   var dDay = new Date(year, month - 1, day);

   var n = Math.floor((dDay.getTime() - toDay.getTime()) / 86400000) + 1;
   document.getElementById('input_dday').innerHTML = n + "일";
}
function goPjList(){	
	document.form2.action="projectlist";
	document.form2.submit();
}
</script>
<style>
#fundedlist{
	padding: 50px;
	border-collapse: collapse;
	margin:auto;
}
#fundedlist tr{
	border-bottom : 2px solid lightgray;
}
#fundedlist td{
	font-size: 14px;
	width: 200px;
	padding: 10px;
}
#golist{
cursor : pointer;
}
</style>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<body>
   <div id="con">
   <%-- <form name=form2 action="projectlist" id="test" method=post>
   <input type="hidden" name="hiddenid" id="hiddenid" value="${funding.userId}"> </form>
      <form name="form" id="detail" method="post">
         <input type="hidden" id="pnum" value="${funding.projectNo}">
         <input type="hidden" id="year" value="${funding.startDate}">
         <input type="hidden" id="month" value="${funding.startDate}">
         <input type="hidden" id="day" value="${funding.startDate}">
         <input type="hidden" id="min_price1" value="${funding.projectStory}">
         <input type="hidden" id="min_price2" value="${funding.projectStory}">
         <input type="hidden" id="min_price3" value="${funding.projectStory}">
         
         <c:if test="${loginUser.userId eq funding.userId}">
         	<a id=fb1>관리자로부터 받은 검토 피드백</a><br>
         		<div class="feedback">
         			<a id=fb2>${funding.warningIntro}</a><br>
         		</div>
         <br>
         </c:if> --%>
         <div id="fade" class="black_overlay"></div>         
         <a href="#" id="category">${funding.subjectName}</a><br><br>
         <div>
         <img src="resources/upLoadFile/${fundingFile.fileMainName}" width="620px" alt="project_img"><br>
		<%-- 	
        <c:choose>
			<c:when test="${{funding.leftDate < 1}">
				<input type="button" class="funding2" value="프로젝트가 마감되었습니다." disabled>
       			<input type="button" class="share" value="공유하기" onclick="share()">
       		</c:when>
		</c:choose>         
         <c:choose>
            <c:when test= "${funding.likeCount == 1 && userId == 0}"> 
            </c:when>
            <c:when test="${funding.likeCount == 1 && userId != 0 && fundingLike[0].like_yn == 0}"> 
               <img src="resources/img/images/likeHeart.png" id="heart" width="40px" onclick="like()"><b id=likecount>${funding.likeCount}</b>
             </c:when>
            <c:when test="${funding.likeCount == 1 && userId != 0  && fundingLike[0].like_yn == 1}">
               <img src="resources/img/images/likeHeart.png" id="heart"  width="40px" onclick="like()"><b id=likecount>${funding.likeCount}</b>
            </c:when>
            <c:when test="${funding.likeCount == 1 && userId != 0  && fundingLike[0].like_yn == null}">
               <img src="resources/img/images/likeHeart.png" id="heart"   width="40px" onclick="like()"><b id=likecount>${funding.likeCount}</b>
            </c:when>
            <c:when test="${funding.likeCount != 1}">
            </c:when>
            </c:choose> 
             --%>
         <br>
         <h1 id="subject">${funding.subjectName }</h1>
         </div>
                  
         <div id="share_content" class="share_content">
         <a onclick="exit()" style="float:right;">X</a><br><br><br>
         <a>프로젝트 공유하기</a><br><br>
         <div class="addthis_inline_share_toolbox"></div> 
         </div>
         
         <div id="planner">
            <img src="resources/upLoadFile/${fundingFile.fileMainName}" width="30px" alt="project_img" style="border-radius: 150px; height:40px; width:40px;">
            &nbsp;<a style="color:black; vertical-align:4.5px;" id="golist" onclick="goPjList()"><%-- href="<c:url value="projectlist${project.pj_id}"/>"> --%>${fundingFile.fileMainName}</a>
                </div>
         <div id="pl_info">${funding.projectStory}</div><br>
  <%--        <p>   
            <span id="label">목표 금액 
                  <label id="value1"><fmt:formatNumber value="${funding.goalMoney}" pattern="#,###"/>원</label>
            </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span id="label">후원자 
                  <label id="value2">${funding.count}명</label>
            </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span id="label">남은 기간 
            	  <c:choose>
					<c:when test="${project.c_status == 1}">
						<label id="input_dday" class="input_dday">0일</label><a id="fin_value"> (${project.pj_fin})</a>
					</c:when>
					<c:when test="${project.c_status == 2 or project.c_status == 4}">
						<label id="input_dday2" class="input_dday">0일</label><a id="fin_value"> (${project.pj_fin})</a>
       				</c:when>
					<c:when test="${project.c_status == 3}">
						<label id="input_dday2" class="input_dday">중단</label><a id="fin_value"> (${project.pj_fin})</a>
					</c:when>
				</c:choose>                  
            </span>
         </p> --%>
       <%--  	 모인 금액 <label id="sum"><fmt:formatNumber value="${funding.sum}" pattern="#,###"/>원</label>
         <span><a id="percent_value">(${dday.percent}%)</a></span>
         <div class="Graph">
            <p>
               <c:if test="${dday.percent > 99}">
					<svg id="svg">
						<rect x="0" y="0" fill="#e9e9e9" height="2" width="100%"></rect>
						<rect x="0" y="0" height="5" width="100%" fill="#430201"></rect>
					</svg>
				</c:if>
				<c:if test="${dday.percent < 100}">
					<svg id="svg">
						<rect x="0" y="0" fill="#e9e9e9" height="2" width="100%"></rect>
						<rect x="0" y="0" height="5" width="${dday.percent}%" fill="#430201"></rect>
					</svg>
				</c:if>
            </p>
         </div>
         <div class="plinfo">
         		<c:choose>
					<c:when test="${project.c_status == 1}"> 
							목표 금액이 달성되어야만 펀딩 성공입니다.<br> 목표금액이 모이지 않으면 마감일 다음날 자동 환불됩니다.
					</c:when>
					<c:when test="${project.c_status == 2}">
						펀딩이 성공했습니다!<br> 선물은 펀딩 마감일 한달 이내로 발송됩니다.
       				</c:when>
					<c:when test="${project.c_status == 3}">
						마감일 이전에 소정의 사유로 펀딩이 중단되었습니다.<br> 환불이 진행될 예정입니다.
					</c:when>
					<c:when test="${project.c_status == 4}">
						목표 금액을 달성하지 못했습니다.<br> 환불이 진행될 예정입니다.
					</c:when>
				</c:choose>           
           	
         </div><br><br>

         <div class="detailtab">
            <input type="radio" name="detailtab" id="story" checked> 
            <input type="radio" name="detailtab" id="gift" onclick="check_gift()"> 
            <input type="radio" name="detailtab" id="commu"> 
            <label for="story">스토리보드</label>
            <label for="gift">선물보기</label>
            <label for="commu">커뮤니티</label>
            
            <div id="story_content" class="story_content" style="text-align: left;">
            
            <div id="story1">
               <p>${project.story}</p>
               <c:if test="${userId eq project.pj_id}">
               <a id="go_modify" onclick="modify()">수정하기</a>
               </c:if>
            </div>
            <div id="story2">
               <textarea id="contents" name="storyboard">${project.story}</textarea>
               <script>
                  CKEDITOR.replace('contents', { filebrowserUploadUrl : '/upload', height : '500px'});
               </script><br>
               <a id="go_modify" onclick="modify_cancel()" style="background-color:gray;">취소하기</a>&nbsp;&nbsp;&nbsp;
               <a id="go_modify" onclick="modify_story()">저장하기</a>
               <input type="hidden" name="modify" id="modify" value="${storyreq.modify}"> <br />
            </div>
            </div>
            
            <div class="gift_content">
               <div id="gift1detail" style="visibility: visible;">
               <ul style="list-style-image: url(images/giftcount.png); line-height: 3px;">
                  <li id="gift_count">${gift.count1}명이 선택</li>
               </ul><br>
                  <p id="gift1_price"><fmt:formatNumber value="${project.min_price1}" pattern="#,###"/>원+</p>
                  <p id="gift1_name">${project.gift_name1} ( X 1 )</p>
                  <c:choose>
					<c:when test="${project.c_status == 1}"> 
						  <c:choose>
								<c:when test="${funder.status == 1}">
									<input type="button" class="selfunding2" value="이미 펀딩하셨습니다." onclick="go_mine()">
								</c:when>
								<c:otherwise>
									<input type="button" class="selfunding" value="펀딩하기" onclick="go_funding()">
								</c:otherwise>
						  </c:choose>
					</c:when>
					<c:when test="${project.c_status == 2}">
                		  <input type="button" class="selfunding2" value="펀딩하기" disabled>
       				</c:when>
					<c:when test="${project.c_status == 3}">
                 		 <input type="button" class="selfunding2" value="펀딩하기" disabled>
					</c:when>
					<c:when test="${project.c_status == 4}">
                 		 <input type="button" class="selfunding2" value="펀딩하기" disabled>
					</c:when>
				</c:choose>   
               </div>
               <br> <br> <br>
               <div id="gift2detail" style="visibility: visible;">
               <ul style="list-style-image: url(images/giftcount.png); line-height: 3px;">
                  <li id="gift_count">${gift.count2}명이 선택</li>
               </ul><br>
                  <p id="gift2_price"><fmt:formatNumber value="${project.min_price2}" pattern="#,###"/>원+</p>
                  <p id="gift2_name">${project.gift_name2} ( X 1 )</p>
                  <c:choose>
					<c:when test="${project.c_status == 1}"> 
						  <c:choose>
								<c:when test="${funder.status == 1}">
									<input type="button" class="selfunding2" value="이미 펀딩하셨습니다." onclick="go_mine()">
								</c:when>
								<c:otherwise>
									<input type="button" class="selfunding" value="펀딩하기" onclick="go_funding()">
								</c:otherwise>
						  </c:choose>
					</c:when>
					<c:when test="${project.c_status == 2}">
                		  <input type="button" class="selfunding2" value="펀딩하기" disabled>
       				</c:when>
					<c:when test="${project.c_status == 3}">
                 		 <input type="button" class="selfunding2" value="펀딩하기" disabled>
					</c:when>
					<c:when test="${project.c_status == 4}">
                 		 <input type="button" class="selfunding2" value="펀딩하기" disabled>
					</c:when>
				</c:choose>  
               </div>
               <br> <br> <br>
               <div id="gift3detail" style="visibility: visible;">
               <ul style="list-style-image: url(images/giftcount.png); line-height: 3px;">
                  <li id="gift_count" style="float:left;">${gift.count3}명이 선택</li>
               </ul><br>
                  <p id="gift3_price"><fmt:formatNumber value="${project.min_price3}" pattern="#,###"/>원+</p>
                  <p id="gift3_name">${project.gift_name3} ( X 1 )</p>
				<c:choose>
					<c:when test="${project.c_status == 1}"> 
						  <c:choose>
								<c:when test="${funder.status == 1}">
									<input type="button" class="selfunding2" value="이미 펀딩하셨습니다." onclick="go_mine()">
								</c:when>
								<c:otherwise>
									<input type="button" class="selfunding" value="펀딩하기" onclick="go_funding()">
								</c:otherwise>
						  </c:choose>
					</c:when>
					<c:when test="${project.c_status == 2}">
                		  <input type="button" class="selfunding2" value="펀딩하기" disabled>
       				</c:when>
					<c:when test="${project.c_status == 3}">
                 		 <input type="button" class="selfunding2" value="펀딩하기" disabled>
					</c:when>
					<c:when test="${project.c_status == 4}">
                 		 <input type="button" class="selfunding2" value="펀딩하기" disabled>
					</c:when>
				</c:choose>  
               </div> <br> <br>
               <p style="font-size:13px; color: dimgray;">예상 전달일은 프로젝트 마감일 30일 이내입니다. 30일이 넘을 경우 자동 환불됩니다.</p>
               
               <br><br>
		         <c:if test="${userId eq project.pj_id}">
               	 <c:if test="${project.c_status == 2}">
		         	<h2>펀딩해주신 분들 목록</h2><br>
		         			<table id="fundedlist" style="border: 2px solid lightgray;">
		         				<tr>
		         					<td style="width:250px; font-weight:bold; font-size:20px;">아이디</td>
		         					<td style="width:200px; font-weight:bold; font-size:20px;">연락처</td>
		         					<td style="width:100px; font-weight:bold; font-size:20px;">우편번호</td>
		         					<td style="width:300px; font-weight:bold; font-size:20px;">주소</td>
		         					<td style="width:350px; font-weight:bold; font-size:20px;">선물이름</td>
		         					<td style="width:150px; font-weight:bold; font-size:20px;">펀딩금액</td>
		         				</tr>
		         				<c:forEach var="f" items="${funderList}">
		         				<tr>
		         					<td style="width:250px;">${f.id}</td>
		         					<td style="width:200px;">${f.tel}</td>
		         					<td style="width:100px;">
		         						<c:choose>
		         						<c:when test="${f.number == 0}"></c:when>
		         						<c:otherwise>${f.zip}</c:otherwise>
		         						</c:choose>
		         					</td>
		         					<td style="width:300px;">
		         						<c:choose>
		         						<c:when test="${f.number == 0}"></c:when>
		         						<c:otherwise>${f.address}, ${f.address2}</c:otherwise>
		         						</c:choose>
		         					</td>
		         					<td style="width:350px;">
		         						<c:if test="${f.number == 0}">선물 없음</c:if>
		         						<c:if test="${f.number == 1}">${project.gift_name1}</c:if>
		         						<c:if test="${f.number == 2}">${project.gift_name2}</c:if>
		         						<c:if test="${f.number == 3}">${project.gift_name3}</c:if>
		         					</td>
		         					<td style="width:150px;"><fmt:formatNumber value="${f.funded}" pattern="#,###"/>원</td>
		         				</tr>
		         				</c:forEach>
		         			</table><br>
		         </c:if>
		         </c:if>
            </div>
            <div class="commu_content">
               <c:if test="${ empty articles }">
                  <div class="community" style="background-color:white;">
                     <a id="commu_null" style="font-size:14px; color:black;">작성된 글이 없습니다.</a>
                  </div>
               </c:if>
               <c:if test="${! empty articles }">
                  <c:forEach var="p" items="${articles}">
                     <div class="community">
                           <c:if test="${p.id == project.pj_id }"><span style="float:left;">
                                 <a id="commu_planner">창작자</a>&nbsp;<a style="font-size:14px; color:black;">${p.name}</a></span>
                                 <span style="float:right; font-size:14px; color:black;"><a id="go_comment" href="<c:url value="/read=${p.cseq}"/>">댓글 쓰러 가기</a></span></c:if>
                           <c:if test="${p.id != project.pj_id}"><span style="float:left;">
                                 <a style="font-size:14px; color:black;">${p.name}</a></span>
                                 <span style="float:right; font-size:14px; color:black;"><a id="go_comment" href="<c:url value="/read=${p.cseq}"/>">댓글 쓰러 가기</a></span></c:if>
                           <br><br><a style="font-weight:bold; color:black; font-size:20px; margin">${p.csub}</a><br><br>
                           <a style="font-size:14px; color:#404040;">${p.ccon}</a><br>
                     </div>
                  </c:forEach> 
               </c:if>
            </div>--%>
         </div>
</body>
</html>