<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>펀딩 상세페이지</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<!-- Reference to html5gallery.js -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">

<link rel="stylesheet" href="/resources/css/style_nav.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/detailproject.css">
</head>

<script type="text/javascript" src="resources/js/admin/core/jquery.3.2.1.min.js"></script>
<script type="text/javascript" src="resources/js/html5gallery.js"></script>

<style type="text/css">
body{
	font-family: 'Noto Serif KR', serif;
}

.navbar .getstarted {
  background: #EB5C01;
  padding: 8px 10px;
  margin: 10px;
  border-radius: 4px;
  color: #fff;
}	

.sug {
	margin: auto;
}

.main-menu {
	padding-left: 50px;
}


div.guide {margin:12px 24px;}
div.guide span {color:#ff0000; font:italic 14px Arial, Helvetica, sans-serif;}
div.guide p {color:#000000; font:14px Arial, Helvetica, sans-serif;}
div.guide pre {color:#990000;}
div.guide p.title {color:#df501f; font:18px Arial, Helvetica, sans-serif;}

.format{
	padding-left : 250px;
    padding-top: 70px;
    margin-left:130px;
	float : left;
	width : 1000px;
	height : 700px;
}

.detailView_right{
	float: left;
}
.noting{
	width: 300px;
    height: 80px;
}


.contents{
	padding-left : 50px;
	margin: 15px 0px 15px 0px;
	font-size: 17px;
}

#title{
	padding-top: 130px;
	text-align:center;
	color:#EB5C01;
	font-size: 35px;
}

#money{
	font-size: 20px;
	color: #3F3F3F;
}

#accrue{
	font-size: 20px;
	color: #3F3F3F;
}

#percent{
	font-size: 20px;
	margin-top: 18px;
	color: #3F3F3F;
}

#date{
	font-size: 20px;
	color: #3F3F3F;
   	margin-top: 20px;
}

	#sponser{
		float: left;
		margin-top: 20px;
		font-size: 17px;
		
	}
	#hitsCount{
		margin-top: -6px;
	    position: absolute;
	    font-size: 17px;
	}

.getstarteds {
    position: absolute;
    left: 50px;
    border:none;
    padding: 10px 100px;
	margin: 10px 10px 20px 0px;
	background: #EB5C01;
	border-radius: 4px;
	color: #fff;
}
.getstarteds:hover{
	background-color: #E35901;
	border:none;
}

.getstarteds:active{
	background-color: #D75909;
	border:none;
}

	
.getstarted_Liked{
	float:left;
	border:none;
	background: #EB5C01;
    padding: 10px 26px;
    margin: 20px;
    margin-left: 48px;
    margin-top: 45px;
	border-radius: 4px;
	color: #fff;
}
.getstarted_unLiked{
	float:left;
	border:none;
	background: #6E6E6E;
    padding: 10px 26px;
    margin: 20px;
    margin-left: 48px;
    margin-top: 45px;
	border-radius: 4px;
	color: #fff;
}
.getstarted_unLiked:hover{
	background-color: #535353;
	border:none;
}

.getstarted_unLiked:active{
	background-color: #404040;
	border:none;
}


.getstarted_report{
 	position: absolute;
 	border:none;
    left: 50px;
    padding: 5x 2px;
    font-size: 15px;
    margin-bottom; 15px;
	border-radius: 4px;
}
.getstarted_report:hover{
	background-color: #DFDFDF;
	border:none;
}

.getstarted_report:active{
	background-color: #C5C5C5;
	border:none;
}


#question{
	background: #6E6E6E;
	border:none;
	padding: 10px 27px;
    margin: 19px 3px;
	border-radius: 4px;
	color: #fff;
}
#question:hover{
	background-color: #535353;
	border:none;
}

#question:active{
	background-color: #404040;
	border:none;
}

label{
	font-size: 20px;
	font-weight: bold;
}

.state{
	margin-left:30px;
	float: left;
}

#img{
	border-radius: 50px;
	border:1px solid black;
	width: 55px;
	height: 55px;
	margin-left: 50px;
	margin-bottom: 10px;
}

#img img{
	margin: 12px;
}

#donation-date{
	margin-left:-15px;
	text-align: center;
}

.detailtab{
	margin-left: 100px;
}


/* 댓글 */
#rCont{
	border-radius: 10px;
    border: 1px solid gray;
    margin: 10px -30px 10px 0px;;
}
::placeholder{
	padding: 25px 10px;
	color: #A4A4A4;
}
#rSubmit{
    height: 90px;
    border-radius: 10px;
    border: none;
    margin: 10px 55px 10px -40px;
    background-color: #EB5C01;
    color: #fff;
    outline: none;
}
#rSubmit:hover{
	background-color: #E35901;
	border:none;
}

#rSubmit:active{
	background-color: #D75909;
	border:none;
}
#update-btn{
	border-radius: 10px;
	border:none;
	background-color:#EB5C01;
    color: white;
    font-size: 15px;
    width: 80px;
    height: 40px;
    outline: none;
}
#update-btn:hover{
	background-color: #E35901;
	border:none;
}

#update-btn:active{
	background-color: #D75909;
	border:none;
	outline: none;
}
tr, td{
	border:none;
	margin: 10px;
}
td{
	margin: auto;
}
#tab{
	margin: 10px;
}

#trtr{
	height: 110px;
	width: 900px;
}

#rWiter{
	color: #FE9A2E;
	position: absolute;
    margin-left: -30px
}

#rCont{
	text-align: left;
    border: none;
    position: absolute;
    padding-top: 30px;
    width: 530px;
}

#rCreateDate{
    position: absolute;
    font-size: 13px;
    margin-top: 3px;
    margin-left: 80px;
}
#update{
	font-size: 15px;
}

#modifyReply{
	height: 45px;
	border:1px solid #b3b3b3;
}
</style>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="200">
	<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a href="/index.jsp" class="logo d-flex align-items-center" style="text-decoration: none;"> 
				<img src="/resources/img/logo.png" alt=""> <span id="starLogo">싸라기별</sapn></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					     <li class="nav-item active">
		      </li>
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 기념관 </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown" style="text-align: center; width: 200px;">
							<a class="dropdown-item" href="/independenceList.do">독립유공자 공훈록</a> <a
								class="dropdown-item" href="/historyList.do">별들의 발자취</a> <a
								class="dropdown-item" href="visitList.do">별보러 가자</a>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="donationList.do">펀딩</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="donationList.do">기부</a></li>
					<li class="nav-item"><a class="nav-link" href="guide.do">가이드</a></li>
					<a class="getstarted scrollto" href="suggestPage.do" style="text-decoration: none;">제안하기</a>
				</ul>
				<c:if test="${ empty sessionScope.loginUser }">
					<div>
						
						<a class="nav-link" href="login.do">로그인</a>
					</div>
				</c:if>
				
				<c:if test="${ !empty sessionScope.loginUser && sessionScope.loginUser.userId =='admin'}">
					<div>
						<a class="nav-link" href="adminMain.do">관리자페이지</a> 
						<a class="nav-link" href="logout.do">로그아웃</a>
					</div>
				</c:if>
				
				<c:if test="${ !empty sessionScope.loginUser && sessionScope.loginUser.userId !='admin'}">
					<div>
						<a class="nav-link" href="logout.do">로그아웃</a> 
						<a class="nav-link" href="myPage.do">마이페이지</a>
					</div>				
				</c:if>
				
			</div>
		</div>
	</nav>
	
	<!-- 포인트, 쪽지, 공지 -->
	<c:if test="${ !empty sessionScope.loginUser && sessionScope.loginUser.userId !='admin'}">

		<div id="btn">
			<input type="checkbox" id="toggleBtn">
			<label for="toggleBtn" class="toggleBtn" id="toggle-display"> 포인트&nbsp; &#124; &nbsp;쪽지 </label>
			
			<div id="myinfo">
				<!-- 포인트 -->
				<a class="" href="pointList.do" style="font-size:15px; font-weight:600; text-decoration:none;">포인트</a>&nbsp;&nbsp;&nbsp;
				<span class="point-num" id="myPoint-total">${sessionScope.myPoint.total }</span><br>
				<sup>
					<span class="point-num" id="myPoint-reserved">진행 중 ${sessionScope.myPoint.reserved*-1 }</span>
				</sup>
				<br>
				<!-- 쪽지 -->
				<div class=msg-area>		
					<a class="" href="recMsgList.do" style="font-size:15px; font-weight:600;">
						<img src="resources/img/message/myinfo-message.svg" width="30px">
					</a>
					<span class=" badge rounded-pill" id="msgCount" style="width:15px;height:15px;border-radius:50%;font-size:11px;padding:2px;color:white;background-color:#EB5C01;">
						${sessionScope.msgCount }
					</span>
				</div>
				<!-- 공지사항 -->
				<div class=notice-area>
					<a class="" href="noticeMsgList.do" style="font-size:15px; font-weight:600;">
						<img src="resources/img/message/myinfo-bell.svg" width="30px">
					</a>
					<span class="nav-link badge rounded-pill" id="noticeCount" style="width:11px;height:11px;border-radius:50%;color:#EB5C01;font-size:10px;background-color:#EB5C01;display:none;">
						<c:if test="${sessionScope.notiCount != 0}">
							${notiCount }
						</c:if>
					</span>
				</div>
			</div>
		</div>
	</c:if>
	
	<script src="https://cdn.ckeditor.com/ckeditor5/27.1.0/balloon/ckeditor.js"></script>
	
	<main> <!--  body 부분에서는 id값, div로 감싸는 거(모인 금액, 달성률 & 후원자, 조회수), 순서 교체 수정 -->
	<br>
		<h1 id="title" style="height: 50px;">${funding.subjectName }</h1><br>
	<div class="row">
		<div class="format col-6">
		<!-- A wrapper DIV to center the Gallery -->
			<div style="text-align:center;">
			    <!-- Define the Div for Gallery -->
			    <!-- 1. Add class html5gallery to the Div -->
			    <!-- 2. Define parameters with HTML5 data tags -->
				<div style="display:none;" class="html5gallery" data-skin="gallery" data-width="1000" data-height="700">
					<a href="${fundingFile.videoUrl } "><img src="resources/img/video_icon.png"></a>
					<a href="resources/upLoadFile/${fundingFile.fileMainName }"><img src="resources/upLoadFile/${fundingFile.fileMainName }"></a>
					<a href="resources/upLoadFile/${fundingFile.fileSub1Name }"><img src="resources/upLoadFile/${fundingFile.fileSub1Name }"></a>
					<a href="resources/upLoadFile/${fundingFile.fileSub2Name }"><img src="resources/upLoadFile/${fundingFile.fileSub2Name }"></a>
				</div>
			</div>
		</div>
		
		
		<div class="detailView_right col-4">
			<div class="noting"></div>
				<%-- <h1 id="title">${donation.subjectName }</h1><br> --%>
				<p class = "contents" id="accrue" style="font-weight: bold;"> <fmt:formatNumber value="${funding.sumMoney }" pattern="#,###"/>원 <span id="accrue-text"> 펀딩중</span> </p>
				<p class = "contents" id="money" style="font-weight: bold;"> <fmt:formatNumber value="${funding.goalMoney }" pattern="#,###"/>원 (목표금액)</p>
   				<p class = "contents" id="percent" style="font-weight: bold;"> <fmt:formatNumber value="${funding.percent }" pattern="#,###"/>%</p>
					
					   	<c:if test="${funding.leftDate < 1}">
							<div>
	   							<b class ="contents" id="date">0일</b>
			   				</div>
			       		</c:if>
							       		
			       		<c:if test="${funding.leftDate >= 1}">
				       		<div>
								<b class = "contents" id="date">남은 기간 : <fmt:formatNumber value="${funding.leftDate }" pattern="#,###"/>일</b>
				    		</div>
			       		</c:if>
						
						<div class="bottom">
							<b class = "contents" id="sponser">후원자 : <fmt:formatNumber value="${fundingLog.sponser }" pattern="#,###"/>명</b><br>
							<b class = "contents" id="hitsCount">조회수 : ${funding.hitsCount}</b>
						</div>
						
						<br>
						<c:if test="${funding.leftDate < 1}">
							<div>							
		   						<input type="submit" class="getstarteds" value="마감된 펀딩입니다." disabled>
			   				</div>
		       			</c:if>
			       				<c:if test="${(funding.leftDate >= 1) && (empty loginUser.userId) }">
							    					<form action="fundingJoin.do" method="post" name="fundingGo" onSubmit="formChk();return false">
							    					<input type="submit" class="getstarteds" value="펀딩하기">
							   						<input type="hidden" name="projectNo" value="${funding.projectNo }">
							   						<input type="hidden" name="loginCheck" value="${loginUser.userId }">
							    					</form>
							       		</c:if>
							       								<!-- 걔산식  -->
							       										 <c:set var="fund" value="false" />
																			<c:forEach var="sponser" items="${LogList}">
																			  <c:if test="${sponser.userId eq loginUser.userId}">
																			    <c:set var="fund" value="true" />
																			  </c:if>
																			</c:forEach>
																			
										<c:if test="${(funding.leftDate >= 1) && (fund == 'false') && (loginUser.userId != funding.userId) && (!empty loginUser.userId)}">
							    					<form action="fundingJoin.do" method="post" name="fundingGo">
							    					<input type="submit" class="getstarteds" value="펀딩하기">
							   						<input type="hidden" name="projectNo" value="${funding.projectNo }">
							   						<input type="hidden" name="loginCheck" value="${loginUser.userId }">
							    					</form>
							       		</c:if>
							       		
							       		<c:if test="${(funding.leftDate >= 1) && (fund == 'true') && (loginUser.userId != funding.userId) && (!empty loginUser.userId)}">
							    					<form action="fundingCancel.do" method="post" name="fundingGo">
							    					<input type="submit" class="getstarteds" value="펀딩 취소">
							   						<input type="hidden" name="projectNo" value="${funding.projectNo }">
							   						<input type="hidden" name="userId" value="${loginUser.userId }">
							    					</form>
							    		</c:if>   			
							    				
						   					<c:if test="${(funding.leftDate >= 1) && (fund == 'false') && (loginUser.userId == funding.userId) && (!empty loginUser.userId)}">
													<form action="fundingModifyView.do" method="post" name="fundingGo">
							    					<input type="submit" class="getstarteds" value="펀딩 수정">
							   						<input type="hidden" name="projectNo" value="${funding.projectNo }">
							    					</form>
						   					</c:if>
			       		
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
					
						<!-- 로그인 안 했을 시  -->
					<c:if test="${empty loginUser.userId}">
					<form action="fundingLikeAdd.do" method="post" onSubmit="formChk();return false">
					<input type="hidden" name="userId" value="${loginUser.userId }">
   					<input type="hidden" name="projectNo" value="${funding.projectNo }">
    				<input type="submit" class="getstarted_unLiked" value="좋아요 ♡">${funding.likeCount}
   					</form>
   					</c:if>	
					
					
					<!--로그인하고 좋아요 이미 했을때 -->
					 <c:set var="contains" value="false" />
					<c:forEach var="like" items="${fundingLikeUser}">
					  <c:if test="${like.userId eq loginUser.userId}">
					    <c:set var="contains" value="true" />
					  </c:if>
					</c:forEach>
					
					<c:if test="${contains == 'true'}">
					<form action="fundingLikeDelete.do" method="post">
					<input type="hidden" name="userId" value="${loginUser.userId }">
   					<input type="hidden" name="projectNo" value="${funding.projectNo }">
    				<input type="submit" class="getstarted_Liked" value="좋아요 ♥">${funding.likeCount}
    				</form>
					 </c:if>
					
					<!--로그인 했는데 아직 좋아요 안했을때  -->
					<c:if test="${!empty loginUser.userId && contains == 'false'}">
					<form action="fundingLikeAdd.do" method="post">
					<input type="hidden" name="userId" value="${loginUser.userId }">
   					<input type="hidden" name="projectNo" value="${funding.projectNo }">
    				<input type="submit" class="getstarted_unLiked" value="좋아요 ♡">${funding.likeCount}
   					</form>
   					</c:if>

       		  	<c:url var="msgWriteUrl" value="msgWriterView.do">
         		     <c:param name="receiverId" value="${funding.userId }"></c:param>                                       
          		     <c:param name="msgType" value="5"></c:param>
        	 	     <c:param name="nickName" value="${funding.member.nickName}"></c:param>
       		   </c:url>
       		   
						<button id="question" onclick="msgPopup('${msgWriteUrl}'); return false;">문의하기</button>  
						
						<c:if test="${empty loginUser.userId}">
							<form action="fundingAccusation.do" method="post" onSubmit="formChk();return false">
					    		<input type="hidden" name="projectNo" value="${funding.projectNo }">
					    		<input type="submit" class="getstarted_report" value="프로젝트에 문제가 있나요?   신고하기"><br>
					    	</form>
					  	</c:if>
					  	
					   	<c:if test="${!empty loginUser.userId}">
					    	<form action="fundingAccusation.do" method="post">
					    		<input type="hidden" name="projectNo" value="${funding.projectNo }">
					    		<input type="submit" class="getstarted_report" value="프로젝트에 문제가 있나요?   신고하기"><br>
					   	 	</form>
					    </c:if>
		
					 	<br>
						<div class="state" >
							<div id="img">
								<img src="resources/img/dantion_funding/date.png" style="width: 30px" height="30px" >
							</div>
							<b class = "contents" id="donation-date">기부 시작일</b><br>
							<b class = "contents" id="donation-date">${donation.startDate}</b>
						</div>
						<div class="state">
							<div id="img">
								<img src="resources/img/dantion_funding/money.png" style="width: 30px" height="30px" >
							</div>
							<b class = "contents" id="donation-date">기부 종료일</b><br>
							<b class = "contents" id="donation-date">${donation.finDate }</b>
						</div>

				
						</div>
						
<%-- 						<c:if test="${ loginUser.userId == donation.userId }">
                        	<a href="${vModify }"><b>[수정 페이지로 이동]</b></a> &nbsp; 
                        </c:if> --%>
						
					</div>
				</div><br><br><hr>
				
				
				<div class="detailtab">
	            	<input type="radio" name="detailtab" id="story" checked> 
		            <input type="radio" name="detailtab" id="commu"> 
		            <input type="radio" name="detailtab" id="info"> 
		            <label for="story">스토리</label>
		            <label for="commu">커뮤니티</label>
		            <label for="info">안내사항</label>
			            
		            	<div id="story_content" class="story_content" style="text-align: center; margin-left: 180px">
			               <p>${donation.projectStory }<</p>
			            </div>
			            
			        	<div class="commu_content" style="text-align: center; margin-left: -5px; border: none" >
			        		<div>
				        		<h4 style="margin-top: 50px">"여러분의 한마디가 진행자에게 큰 힘이 됩니다."</h4><br><br>
								<h5 style="margin-bottom: 10px">댓글 작성시 유의사항</h5>
								<span>
									프로젝트와 관계없는 글, 광고성, 욕설, 비방, 도배 등의 글은 내부 검토 후 삭제됩니다.<br>
									프로젝트 관련 문의는 진행자에게 문의하시면 정확한 답변을 받을 수 있습니다.<br>
								</span><br><br>
							</div>
			              	<table align="center" width="800" border="1" cellspacing="0" style="border: none;">
								<tr>
									<td>
										<textarea rows="3" cols="60" id="rContent" style="resize: none;" placeholder="댓글을 작성해주세요 :)"></textarea>
									</td>
									<td>
										<button id="rSubmit">댓글 등록</button>
									</td>
								</tr>
							</table>
		
			
							<!-- 댓글 목록 -->
							<table align="center" width="650" border="1" cellspacing="0" id="rtb"  style="border: none;">
								<thead>
									<tr>
									<!-- 댓글 갯수 -->
										<td colspan="2" style="text-align: left; padding: 15px 0px 20px 0px;"><b id="rCount"></b></td>
									</tr>
								</thead>
								<tbody></tbody>
							</table>
						</div>
        
            			<div class="info_content">
            				해당 프로젝트 안내 사항
             				<p>${donation.warningIntro }</p>
         				</div>
         			</div>
        
					<%@include file="../../../footer.jsp" %>
			</main>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/27.1.0/balloon/ckeditor.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	
 	<script src="/resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="/resources/js/jquery.easing.1.3.js"></script>
	<script src="/resources/js/jquery-ui.js"></script>
	<script src="/resources/js/popper.min.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/jquery.stellar.min.js"></script>
	<script src="/resources/js/jquery.countdown.min.js"></script>
	<script src="/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/js/bootstrap-datepicker.min.js"></script>
	<script src="/resources/js/aos.js"></script>

	<script src="/resources/js/jquery.fancybox.min.js"></script>

	<script src="/resources/js/main.js"></script>
	<script src="/resources/js/fundingList.js"></script>	
	
	<script>
	function formChk(){
	    if(${empty loginUser.userId }){
	      alert("로그인이 필요한 서비스입니다.");
	    }else{
	       return true;
	    }
	   }
	
	$(function() {
			getReplyList();
			$("#rSubmit").on("click", function() {
				var projectNo = '${donation.projectNo }';
				var nickName = '${memberlist.nickName }'
				var rContent = $("#rContent").val();
				$.ajax({
					url : "addWriteComment.do",
					type : "post",
					data : { "no" : projectNo , "contents" : rContent, "nick" : nickName },
					success : function(data) {
						if(data == "success") {
							// 댓글 불러오기
							getReplyList();
							// 작성 후 내용 초기화
							$("#rContent").val("");
						}else {
							alert("댓글 등록 실패..");
						}
					},
					error : function() {
						alert("바보");
					}
				});
			});
		});
		
	
		function getReplyList() {
			var projectNo = '${donation.projectNo }'
			$.ajax({
				url : "commentAllList.do",
				type : "get",
				data : { "projectNo" : projectNo },
				dataType : "json",
				success : function(data) {
					var $tableBody = $("#rtb tbody");
					$tableBody.html(""); // 비워주기
					var $tr;
					var $rWriter;
					var $rContent;
					var $rCreateDate;
					var $btnArea;
					$("#rCount").text("댓글 (" + data.length + ")"); // 댓글 갯수 표시
					if(data.length > 0) {
						for(var i in data) {
							$tr = $("<tr id='trtr'>");
							$rWriter = $("<td colspan='4' width='150';' id='rWiter' colspan=4>").text(data[i].nick + "님의 별");
							$rCreateDate = $("<td width='100' id='rCreateDate'>").text(data[i].enrollDate);
							$rContent = $("<td id='rCont'>").text(data[i].contents);
							$btnArea = $("<td width='130'>")
							.append("<a id='update' href='#' onclick='modifyReply(this,"+projectNo+","+data[i].replyNo+",\""+data[i].contents+"\");return false;'>수정 </a>")							
							.append("<a id='update' href='#' onclick='removeReply("+projectNo+","+data[i].replyNo+");return false;'> 삭제</a>");
							$tr.append($rWriter);
							$tr.append($rCreateDate);
							$tr.append($rContent);
							if('${loginUser.userId}'===data[i].userId){
								$tr.append($btnArea);
								}
							$tableBody.append($tr);
						}
					}
				},
			
				
			});
		}

		
		function modifyReply(obj, projectNo, replyNo, contents) {
			$trModify = $("<tr>");
			$trModify.append("<td><input type='text' id='modifyReply' size='55' value='"+contents+"'></td>");
			$trModify.append("<td><button onclick='modifyReplyCommit("+projectNo+","+replyNo+")' id='update-btn'>수정 완료</button></td>");
			$(obj).parent().parent().after($trModify);
		}
		
		function modifyReplyCommit(projectNo, replyNo) {
			var modifiedContent = $("#modifyReply").val();
			$.ajax({
				url : "updateComment.do",
				type : "post",
				data : { 
					"no" : projectNo , 
					"replyNo" : replyNo, 
					"contents" : modifiedContent 
				},
				success : function(data) {
					if(data == "success") {
						getReplyList();
					}else{
						alert("댓글 수정 실패!");
					}
				},
				error : function() {
					alert("서버 통신 실패!");
				}
			});
			
		}
		
		
		function removeReply(projectNo, replyNo) {
			$.ajax({
				url : "removeComment.do",
				type : "get",
				data : { "no" : projectNo, "replyNo" : replyNo },
				success : function(data) {
					if(data == "success"){
						getReplyList();
					}else {
						alert("댓글 조회 실패!");
					}
				},
				error : function() {
					
				}
			});
		} 
	</script>
</body>
</html>