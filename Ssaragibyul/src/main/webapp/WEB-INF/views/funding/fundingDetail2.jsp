<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>펀딩 상세</title>
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

</head>
<script type="text/javascript" src="/resources/js/html5gallery.js"></script>
<style type="text/css">
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
	float : left;
	width : 500px;
	height : 400px;
}
</style>



	
	
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="200">
	<%-- <%@include file="introduce.jsp" %> --%>
	<%@include file="../../../header.jsp" %>


	
<br><br><br><br><br><br><br><br><br><br><br><br>


	<h2>${funding.subjectName }</h2>
	
	<br>
	<div class="format">
	<!-- A wrapper DIV to center the Gallery -->
	<div style="text-align:center; padding: 8px 40px;">

    <!-- Define the Div for Gallery -->
    <!-- 1. Add class html5gallery to the Div -->
    <!-- 2. Define parameters with HTML5 data tags -->
	<div style="display:none;" class="html5gallery" data-skin="gallery" data-width="500" data-height="400">
		<a href="http://www.youtube.com/embed/YE7VzlLtp-4"><img src="http://img.youtube.com/vi/YE7VzlLtp-4/2.jpg" alt="Youtube Video"></a>
		<a href="resources/img/SuggestMain_01_Funding.png"><img src="resources/img/SuggestMain_01_Funding.png" alt="Tulips"></a>
		<a href="resources/img/SuggestMain_02_Donation.png"><img src="resources/img/SuggestMain_02_Donation.png" alt="Colourful Tulips"></a>

		
	
	</div>

</div>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br>



	<main class="main-content">
	${loginUser.userId }  , ${fundingLike[0].likeYn }   , ${fundingLike[1].likeYn }
	<form action="fundingLikeAdd.do" method="post">
	<input type="hidden" name="userId" value="${loginUser.userId }">
    <input type="hidden" name="projectNo" value="${funding.projectNo }">
    <input type="submit" class="getstarted" value="좋아요 ♥">
    </form>
	
	<form action="fundingAccusation.do" method="post">
    <input type="hidden" name="projectNo" value="${funding.projectNo }">
    <input type="submit" class="getstarted" value="신고하기">
    </form>
		
		
    <form action="fundingJoin.do" method="post">
    <input type="hidden" name="projectNo" value="${funding.projectNo }">
    <input type="submit" class="getstarted" value="펀딩하기">
    </form>

	<br><br><br>
			<table align="center" width="450" border="1">
			<tr>
			<td> 	<url var="fDetail" value="fundingDetail.do">
			                     </url>
			</td>
		
			</tr>
			
		<tr>
			<td width="80">번호</td>
			<td>${funding.projectNo } </td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${funding.userId }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${funding.subjectName }</td>
		</tr>
		<tr>
			<td>작성날짜</td>
			<td>${funding.productName }</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${funding.hitsCount }</td>
		</tr>
		<tr height="300">
			<td>내용</td>
			<td>${funding.goalMoney }</td>
		</tr>		
		<tr>
		<td>첨부파일</td>
			<td>${funding.sumMoney }</td>
		</tr>	
		<tr>
		<td>사진1</td>
			<td><img src="/resources/upLoadFile/${fundingFile.fileMainName } "/></td>
		</tr>	
		<tr>
			<td>사진2</td>
			<td><img src="/resources/upLoadFile/${fundingFile.fileSub1Name } "/></td>
		</tr>	
		<tr>
		<td>사진3</td>
			<td><img src="/resources/upLoadFile/${fundingFile.fileSub2Name } "/></td>
		</tr>
		<tr>
		<td>스토리끼야오!</td>
		<td>${funding.projectStory }</td>
		</tr>
	</table>
	<br>
	<br>
	<br>
	
		<!-- 댓글 등록 -->
	<table align="center" width="500" border="1" cellspacing="0">
		<tr>
			<td><textarea rows="3" cols="40" id="rContent"></textarea></td>
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
	
	
	
	
	<br>
		<%@include file="../../../footer.jsp" %>
	</main>





 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
 	<script src="/resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="/resources/js/jquery.easing.1.3.js"></script>
	<script src="/resources/js/jquery-ui.js"></script>
	<script src="/resources/js/popper.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
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
	$(function() {
			getReplyList();
			$("#rSubmit").on("click", function() {
				var projectNo = '${funding.projectNo }';
				var rContent = $("#rContent").val();
				debugger;
				$.ajax({
					url : "addComment.do",
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
			var projectNo = '${funding.projectNo }'
			$.ajax({
				url : "commentList.do",  
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
				error : function() {
					alert("죽어!");
				}
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
				url : "modifyComment.do",
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
				url : "deleteComment.do",
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