<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>기부 상세페이지</title>
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
.getstarted {
	background: #EB5C01;
	padding: 10px 100px;
	margin: 20px;
	margin-left: 140px;
	border-radius: 4px;
	color: #fff;
}

div.guide {margin:12px 24px;}
div.guide span {color:#ff0000; font:italic 14px Arial, Helvetica, sans-serif;}
div.guide p {color:#000000; font:14px Arial, Helvetica, sans-serif;}
div.guide pre {color:#990000;}
div.guide p.title {color:#df501f; font:18px Arial, Helvetica, sans-serif;}

.format{
padding-left : 260px;
padding-top : 160px;
	float : left;
	width : 1000px;
	height : 700px;
}

.detailView_right{
float: left;
}
.noting{
width : 300px;
height: 170px;
}
.contents{
padding-left : 50px;
}
.getstarteds{
	background: #6E6E6E;
	padding: 10px 100px;
	margin: 20px;
	margin-left: 140px;
	border-radius: 4px;
	color: #fff;
}
.getstarted_Liked{
	background: #EB5C01;
	padding: 10px 10px;
	margin: 20px;
	margin-left: 100px;
	border-radius: 4px;
	color: #fff;
}
.getstarted_unLiked{
	background: #6E6E6E;
	padding: 10px 10px;
	margin: 20px;
	margin-left: 100px;
	border-radius: 4px;
	color: #fff;
}
.detailtab{
margin-left: 100px;
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
	
	<main>
	<br>
	<div class="row">
		<div class="format col-6">
		<!-- A wrapper DIV to center the Gallery -->
			<div style="text-align:center;">
			
			    <!-- Define the Div for Gallery -->
			    <!-- 1. Add class html5gallery to the Div -->
			    <!-- 2. Define parameters with HTML5 data tags -->
				<div style="display:none;" class="html5gallery" data-skin="gallery" data-width="1000" data-height="700">
					<a href="${donationFile.videoUrl } "><img src="resources/img/video_icon.png"></a>
					<a href="resources/dUpLoadFiles/${donationFile.fileName }"><img src="resources/dUpLoadFiles/${donationFile.fileName }"></a>
					<a href="resources/dUpLoadFiles/${donationFile.fileSub1Name }"><img src="resources/dUpLoadFiles/${donationFile.fileSub1Name }"></a>
					<a href="resources/dUpLoadFiles/${donationFile.fileSub2Name }"><img src="resources/dUpLoadFiles/${donationFile.fileSub2Name }"></a>
				</div>
			</div>
		</div>
		
		
		<div class="detailView_right col-6">
			<div class="noting"></div>
				<h1 class = "contents">${donation.subjectName }</h1><br>
					<b class = "contents">기부 금액 : <fmt:formatNumber value="${donation.sumMoney }" pattern="#,###"/>원</b>
	   									<script>console.log('${donation.leftDate}');</script>
	   									<c:if test="${donation.leftDate < 1}">
											<div>
						   						<input type="submit" class="getstarteds" value="마감된 기부입니다." disabled>
							   				</div>
							       		</c:if>
							       		
							       		<c:if test="${(donation.leftDate >= 1) && (!empty loginUser.userId)  }">
							       		<div>
							    					<form action="donationJoin.do" method="post" name="donationGo">
							   						<input type="hidden" name="projectNo" value="${donation.projectNo }">
							   						<input type="hidden" name="loginCheck" value="${loginUser.userId }">
							    					<input type="submit" class="getstarted" value="기부하기">
							    					</form>
							    		</div>
							    		</c:if>
							     		<c:if test="${(donation.leftDate >= 1) && (empty loginUser.userId) }">
							       		<div>
							    					<form action="donationJoin.do" method="post" name="donationGo" onSubmit="formChk();return false">
							   						<input type="hidden" name="projectNo" value="${donation.projectNo }">
							   						<input type="hidden" name="loginCheck" value="${loginUser.userId }">
							    					<input type="submit" class="getstarted" value="기부하기">
							    					</form>
							    		</div>
							       		</c:if>
			       		
    					<b class = "contents">달성률 : <fmt:formatNumber value="${donation.percent }" pattern="#,###"/>%</b>
						<b class = "contents">목표 금액 : <fmt:formatNumber value="${donation.goalMoney }" pattern="#,###"/>원</b><br>
					
					   	<c:if test="${donation.leftDate < 1}">
							<div>
	   							<b class ="contents">0일</b>
			   				</div>
			       		</c:if>
							       		
			       		<c:if test="${donation.leftDate >= 1}">
				       		<div>
								<b class = "contents">남은 기간 : <fmt:formatNumber value="${donation.leftDate }" pattern="#,###"/>일</b><br>
				    		</div>
			       		</c:if>
					
						<b class = "contents">후원자 : <fmt:formatNumber value="${donationLog.sponser }" pattern="#,###"/>명</b><br>
						<b class = "contents">조회수 : ${donation.hitsCount}</b>
						<br>
						<div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
					
						<!-- 로그인 안 했을 시  -->
						<c:if test="${empty loginUser.userId}">
							<form action="donationLikeAdd.do" method="post" onSubmit="formChk();return false">
								<input type="hidden" name="userId" value="${loginUser.userId }">
	   							<input type="hidden" name="projectNo" value="${donation.projectNo }">
	    						<input type="submit" class="getstarted_unLiked" value="좋아요 ♡">${donation.likeCount}
	   						</form>
	   					</c:if>	
					
					
						<!--로그인하고 좋아요 이미 했을때 -->
					 	<c:set var="contains" value="false" />
						<c:forEach var="like" items="${donationLikeUser}">
					 		<c:if test="${like.userId eq loginUser.userId}">
					    		<c:set var="contains" value="true" />
					  		</c:if>
						</c:forEach>
					
						<c:if test="${contains == 'true'}">
							<form action="donationLikeDelete.do" method="post">
								<input type="hidden" name="userId" value="${loginUser.userId }">
	   							<input type="hidden" name="projectNo" value="${donation.projectNo }">
	    						<input type="submit" class="getstarted_Liked" value="좋아요 ♥">${donation.likeCount}
	    					</form>
					 	</c:if>
					
						<!--로그인 했는데 아직 좋아요 안했을때  -->
						<c:if test="${!empty loginUser.userId && contains == 'false'}">
							<form action="donationLikeAdd.do" method="post">
								<input type="hidden" name="userId" value="${loginUser.userId }">
	   							<input type="hidden" name="projectNo" value="${donation.projectNo }">
	    						<input type="submit" class="getstarted_unLiked" value="좋아요 ♡">${donation.likeCount}
	   						</form>
	   					</c:if>
					
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
						<button>문의하기</button>  
						
						<c:if test="${empty loginUser.userId}">
							<form action="donationAccusation.do" method="post" onSubmit="formChk();return false">
					    		<input type="hidden" name="projectNo" value="${donation.projectNo }">
					    		<input type="submit" class="getstarted_unLiked" value="신고하기">
					    	</form>
					  	</c:if>
					  	
					   	<c:if test="${!empty loginUser.userId}">
					    	<form action="donationAccusation.do" method="post">
					    		<input type="hidden" name="projectNo" value="${donation.projectNo }">
					    		<input type="submit" class="getstarted_Liked" value="신고하기">
					   	 	</form>
					    </c:if>
		
					 	<br>
					
						<b class = "contents">기부 시작일 : ${donation.startDate }</b>
						<b class = "contents">기부 종료일 : ${donation.finDate }</b>
				
						</div>
					</div>
				</div><br><br><hr>
				
				
				<div class="detailtab">
	            	<input type="radio" name="detailtab" id="story" checked> 
		            <input type="radio" name="detailtab" id="commu"> 
		            <input type="radio" name="detailtab" id="info"> 
		            <label for="story">스토리</label>
		            <label for="commu">커뮤니티</label>
		            <label for="info">안내사항</label>
			            
		            	<div id="story_content" class="story_content" style="text-align: left;">
			               <p>${donation.projectStory }<</p>
			            </div>
			            
			        	<div class="commu_content">
			              	<table align="center" width="500" border="1" cellspacing="0">
								<tr>
									<td>
										<textarea rows="3" cols="40" id="rContent"></textarea>
									</td>
									<td>
										<button id="rSubmit">댓글 등록</button>
									</td>
								</tr>
							</table>
		
			
							<!-- 댓글 목록 -->
							<table align="center" width="500" border="1" cellspacing="0" id="rtb">
								<thead>
									<tr>
									<!-- 댓글 갯수 -->
										<td colspan="2"><b id="rCount"></b></td>
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
				var rContent = $("#rContent").val();
				debugger;
				$.ajax({
					url : "addWriteComment.do",
					type : "post",
					data : { "no" : projectNo , "contents" : rContent },
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
					// db에 있는 데이터를 json형태로 가져와서
					// 댓글 목록 테이블의 tbody에 넣어주어야 함.
					//console.log(data);
					// tbody에 필요한 tr, td 태그를 만들면서
					// 데이터를 tbody에 꽂아줄 것임.
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
							$tr = $("<tr>");
							$rWriter = $("<td width='100'>").text(data[i].userId);
							$rContent = $("<td>").text(data[i].contents);
							$rCreateDate = $("<td width='100'>").text(data[i].enrollDate);
							$btnArea = $("<td>")
							.append("<a href='#' onclick='modifyReply(this,"+projectNo+","+data[i].replyNo+",\""+data[i].contents+"\");'>수정 </a>")							
							.append("<a href='#' onclick='removeReply("+projectNo+","+data[i].replyNo+");'> 삭제</a>");
							$tr.append($rWriter);
							$tr.append($rContent);
							$tr.append($rCreateDate);
							$tr.append($btnArea);
							$tableBody.append($tr);
						}
					}
				},
			
				
			});
		}

		
		function modifyReply(obj, projectNo, replyNo, contents) {
			$trModify = $("<tr>");
			$trModify.append("<td colspan='3'><input type='text' id='modifyReply' size='50' value='"+contents+"'></td>");
			$trModify.append("<td><button onclick='modifyReplyCommit("+projectNo+","+replyNo+")'>수정완료</button></td>");
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