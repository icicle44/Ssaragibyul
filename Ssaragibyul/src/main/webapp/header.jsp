<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> -->
  <!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">
  <!-- Vendor CSS Files
  

  <!-- Template Main CSS File -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> -->

<link rel="stylesheet" href="/resources/css/style_nav.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<style>
.navbar .getstarted {
  background: #EB5C01;
  padding: 8px 20px;
  margin: 10px;
  border-radius: 4px;
  color: #fff;
}	

</style>
	   
<body>

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
		        <!-- <a class="nav-link" href="#">펀딩 <span class="sr-only">(current)</span></a> -->
		      </li>
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 기념관 </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown" style="text-align: center; width: 200px;">
							<a class="dropdown-item" href="/independenceList.do">독립유공자 공훈록</a> <a
								class="dropdown-item" href="/historyList.do">별들의 발자취</a> <a
								class="dropdown-item" href="visitList.do">별보러 가자</a>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="fundingList.do">펀딩</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="donationList.do">기부</a></li>
					<li class="nav-item"><a class="nav-link" href="guide.do">소개</a></li>
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
				<a class="" href="pointList.do" style="font-size:15px; font-weight:600; text-decoration:none;">포인트
				&nbsp;&nbsp;&nbsp;<span class="point-num" id="myPoint-total">${sessionScope.myPoint.total }</span>
				<br><sup><span class="point-num" id="myPoint-reserved">진행 중 ${sessionScope.myPoint.reserved*-1 }</span></sup></a>
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

 	<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
 	<script type="text/javascript" src="resources/js/admin/core/jquery.3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script>
	$(function(){
		/* 포인트 */
		if(${sessionScope.loginUser != null}) {
			$.ajax({
				url: "myPoint.do",
				type: "post",
				dataType: "json",
				success: function(data){
					if(data != null){
						$("#myPoint-total").text(data.total);
						$("#myPoint-reserved").text("예약 중 " + data.reserved*-1);
					}
				},
				error: function(){
					console.log("fail");
				}
			});
		}
		/* 쪽지 */
		if(${sessionScope.loginUser != null}) {
			$.ajax({
				url: "recMsgCnt.do",
				type: "post",
				dataType: "json",
				success: function(data){
					if(data != null){
						$("#msgCount").text(data);
					}
				},
				error: function(){
					console.log("fail");
				}
			});
		}
		/* 공지쪽지 */
		if(${sessionScope.loginUser != null}) {
			$.ajax({
				url: "notiMsgCnt.do",
				type: "post",
				dataType: "json",
				success: function(data){
					if(data > 0){
						$("#noticeCount").show();
					}else {
						$("#noticeCount").hide();
					}
				},
				error: function(){
					console.log("fail");
				}
			});
		}
		
	});

</script>
  </body>
</html>