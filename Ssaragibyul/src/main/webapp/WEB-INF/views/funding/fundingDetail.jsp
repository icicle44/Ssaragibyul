<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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




</head>
<style>
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
</style>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="200">
	<%-- <%@include file="introduce.jsp" %> --%>
	<%@include file="../../../header.jsp" %>

	<header class="header-bar d-flex align-items-center site-navbar-target"
		data-aos="fade-right">

		<div class="d-inline-block d-lg-none ml-md-0 ml-auto py-3"
			style="position: relative; top: 3px;">
			<a href="#" class="site-menu-toggle js-menu-toggle text-white"><span
				class="icon-menu h3"></span></a>
		</div>
		
	</header>
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
	
<br><br><br><br><br><br><br><br><br><br><br><br>
	<main class="main-content">
	<form action="fundingLikeAdd.do" method="post">
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
			<td><img src="resources/upLoadFile/${fundingFile.fileMainName } "/></td>
		</tr>	
		<tr>
			<td>사진2</td>
			<td><img src="resources/upLoadFile/${fundingFile.fileSub1Name } "/></td>
		</tr>	
				<tr>
		<td>사진3</td>
			<td><img src="resources/upLoadFile/${fundingFile.fileSub2Name } "/></td>
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
</body>
</html>