<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>펀딩 취소</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicons -->
<link href="/resources/img/favicon.png" rel="icon">
<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700,900|Oswald:400,700" rel="stylesheet">
<link rel="stylesheet" href="/resources/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/css/jquery-ui.css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/resources/fonts/flaticon/font/flaticon.css">

<link rel="stylesheet" href="/resources/css/aos.css">
<link rel="stylesheet" href="/resources/css/fancybox.min.css">

<link rel="stylesheet" href="/resources/css/style.css">


<link rel="stylesheet" href="/resources/fonts/korea.ttf">
</head>
<style>
body, main{
	font-family: 'Noto Serif KR', serif;
}

.getstarted {
	background: #EB5C01;
	padding: 10px 100px;
	margin-left: 25px;
	border-radius: 4px;
	color: #fff;
}

#thank{
	font-size: 19px;
	font-weight:600;
	color: #676767;
	margin-bottom: 30px;
}
span{
	font-size: 16px;
}
.contents{
	text-align:center;
	margin:auto;
	height: 480px;
	width: 80%;
	border-radius: 20px;
	border: 1px solid gray;
	/* background-color: #F1F1F1; */
}

	
#btn1{
	float: left;
	background: #EB5C01;
	padding: 10px 10px;
	margin: 20px;
	margin-left: 360px;
	border-radius: 4px;
	color: #fff;
	border: none;
}

#btn2{
	float: left;
	background: #EB5C01;
	padding: 10px 80px;
	margin: 20px;
	margin-left: 0px;
	border-radius: 4px;
	color: #fff;
	border: none;
}

#btn1:hover{
	background-color: #E35901;
	border:none;
	outline: none;
}

#btn1:active{
	background-color: #D75909;
	border:none;
	outline: none;
}

#btn2:hover{
	background-color: #E35901;
	border:none;
	outline: none;
}

#btn2:active{
	background-color: #D75909;
	border:none;
	outline: none;
}
</style>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="200"  onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	
	<%-- <%@include file="introduce.jsp" %> --%>
<%@include file="../../../header.jsp" %>

	<header class="header-bar d-flex align-items-center site-navbar-target"
		data-aos="fade-right">

		<div class="d-inline-block d-lg-none ml-md-0 ml-auto py-3"
			style="position: relative; top: 3px;">
			<a href="#" class="site-menu-toggle js-menu-toggle text-white"><span
				class="icon-menu h3"></span></a>
		</div>

		<div class="main-menu">
			<ul class="js-clone-nav">
				<li><a class="nav-link" style="font-size:16px;"><strong>취소 내역 확인</strong></a></li>
			</ul>
		</div>
	</header>

	<main class="main-content">
	<br><br><br><br><br><br><br><br>
		<div class="contents">
		<br><br>
			<h3>펀딩 취소 페이지</h3>
			<img src = "resources/upLoadFile/${fundingLog.fundingProject.fundingFile.fileMainName}" alt="Image" style="width:300px;, height:200px;">
			<br>
			
			<p id="thank">후원자 ${loginUser.userName}님 '${fundingLog.fundingProject.subjectName }' 펀딩 취소는 제안자에게 큰 마음의 상처가 될 수 있습니다..<p>
			
			<span>정말 <fmt:formatNumber value="${fundingLog.fundingPoint }" pattern="#,###"/> 포인트를 취소하시겠습니까?</span><br>
			
			<span>신중한 고려 부탁드립니다.....ㅜㅠ</span><br><br>
			
			<br>
			<br>
		<form action="fundingCancelComplete.do" method="post" name="fundingGo" onSubmit="formChk();return true">
		<input type="hidden" name="doFundNo" value="${fundingLog.doFundNo }">
		<input type="hidden" name="sumMoney" value="${fundingLog.fundingPoint }">
		<input type="hidden" name="projectNo" value="${fundingLog.projectNo }">
		<input type="submit" class="getstarted" value="펀딩 취소하기">
		</form>
	 		<br><br><br>
		</div>	
		
	
	
	<br><br><br><br><br><br><br><br><br><br>
 		<%@include file="../../../footer.jsp" %>
	</main>

	<!-- .site-wrap -->
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  -->   <script src="/resources/js/jquery-3.3.1.min.js"></script>
 	<script src="/resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="/resources/js/jquery.easing.1.3.js"></script>
	<script src="/resources/js/jquery-ui.js"></script>
	<script src="/resources/js/popper.min.js"></script>
<!-- 	<script src="/resources/js/bootstrap.min.js"></script> -->
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/jquery.stellar.min.js"></script>
	<script src="/resources/js/jquery.countdown.min.js"></script>
	<script src="/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/js/bootstrap-datepicker.min.js"></script>
	<script src="/resources/js/aos.js"></script>

	<script src="/resources/js/jquery.fancybox.min.js"></script>

	<script src="/resources/js/main.js"></script>
	<script type="text/javascript">
	function formChk(){
	    if(${!empty loginUser.userId }){
	      alert("취소가 완료되었습니다.");
	    }else{
	       return false;
	    }
	   }
	</script>
</body>
</html>