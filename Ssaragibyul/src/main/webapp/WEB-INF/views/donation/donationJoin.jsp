<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>기부 참여</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700,900|Oswald:400,700"
	rel="stylesheet">
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet"
	href="/resources/fonts/flaticon/font/flaticon.css">

<!-- <link rel="stylesheet" href="/resources/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="/resources/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/css/jquery-ui.css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
<!-- <link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css"> -->
<link rel="stylesheet" href="/resources/css/aos.css">
<link rel="stylesheet" href="/resources/css/fancybox.min.css">

<link rel="stylesheet" href="/resources/css/suggest/suggest1.css">

<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />

</head>
<style>
.getstarted {
	background: #EB5C01;
	padding: 10px 100px;
	margin: 20px;
	margin-left: 140px;
	border-radius: 4px;
	color: #fff;
}

.sug {
	margin: auto;
}

.main-menu {
	padding-left: 40px;
}
</style>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="200"> 
	<%@include file="../../../header.jsp"%> 
	
	<header class="header-bar d-flex align-items-center site-navbar-target"
		data-aos="fade-right">

		<div class="d-inline-block d-lg-none ml-md-0 ml-auto py-3"
			style="position: relative; top: 3px;">
			<a href="#" class="site-menu-toggle js-menu-toggle text-white"><span
				class="icon-menu h3"></span></a>
		</div>
		<!-- style="color: #EB5C01" -->
		<div class="main-menu">
			<ul class="js-clone-nav">
				<li><a href="#sectionSuggest1" class="nav-link">1. 펀딩 리워드 선택</a></li>
				<li><a href="#sectionSuggest2" class="nav-link">2. 리워드 선택 확인</a></li>
			</ul>
		</div>
	</header>
	

	<main class="main-content">
		<br><br><br><br><br><br><br><br>


			<section id="sectionSuggest1">
			<br><br><br><br>
				<h2>기부하기</h2>
				<input type="number" id="price" name="cal">원<br>
				
				사용 가능한 포인트: <span id="myPoint-total1">${sessionScope.myPoint.total}</span>
				
				<br><br><br><br><br><br><br>
				
			<a id="sendBtn1" class="getstarted scrollto" href="#sectionSuggest2" style="text-decoration: none;">펀딩하기</a>
			</section>

		<br><br><br><br><br><br><br><br><br>

			<section id="sectionSuggest2">
			<br><br><br><br>
				<form action="donationJoinComplete.do" method="post">
	    			<input type="hidden" name="projectNo" value="${donation.projectNo }"><br>
	   				<input type="hidden" name="userId" value="${loginUser.userId }"><br>
	   				<input type="text" name="sumMoney" class="getResult2"> 최종금액 <br>
	   				<input type="text" name="receiverName">이름<br>
	   				<input type="text" name="receiverPhone">번호<br>
	   				<input type="text" name="fundingPoint" class="getResult3">포인트 사용 하시겠습니까?<br>
	   				
	    			<input type="submit" class="getstarted" value="기부하기">
	    			
    			</form>
			</section>
		<br><br><br><br><br><br>

		<%@include file="../../../footer.jsp"%>
	</main>

	<!-- .site-wrap -->

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
	<script src="https://unpkg.com/aos@next/dist/aos.js"></script>

	<script src="/resources/js/jquery.fancybox.min.js"></script>

	<script src="/resources/js/main.js"></script>
	<script src="/resources/js/donationJoin.js"></script>

</body>
</html>