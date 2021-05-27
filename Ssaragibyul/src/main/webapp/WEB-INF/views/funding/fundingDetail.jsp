<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>펀딩</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700,900|Oswald:400,700" rel="stylesheet">
<link rel="stylesheet" href="fonts/icomoon/style.css">
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

<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />

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
<br><br><br><br><br><br><br><br><br><br><br><br>
	<main class="main-content">
    <form action="fundingJoin.do" method="post">
    <input type="hidden" name="projectNo" value="${funding.projectNo }">
    <input type="submit" class="getstarted" value="펀딩하기">
    </form>
	<a class="getstarted scrollto" href="fundingAccusation.do" style="text-decoration: none;">신고하기</a>
	<br><br><br>
			<table align="center" width="450" border="1">
			<tr>
			<td> 	<url var="fDetail" value="fundingDetail.do">
			                     </url>
			</td>
			</tr>
		<tr>
			<td width="80">번호</td>
			<td>${funding.projectNo } ${funding.projectNo } ${funding.projectNo }</td>
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
	<br>
		<%@include file="../../../footer.jsp" %>
	</main>
</body>
</html>