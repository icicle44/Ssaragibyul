<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>펀딩 참여</title>
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
				<li><a class="nav-link" style="color: #000061"><strong>펀딩 참여하기</strong></a></li>
				<li><a href="#sectionSuggest1" class="nav-link">1. 펀딩 리워드 선택</a></li>
				<li><a href="#sectionSuggest2" class="nav-link">2. 리워드 선택 확인</a></li>
				<li><a href="#sectionSuggest3" class="nav-link">3. 카드/배송정보 입력</a></li>
			</ul>
		</div>
	</header>
	

	<main class="main-content">
		<br>
				<br>
				<br>
				<br> <br>
				<br>
				<br>
				<br>

			<section id="sectionSuggest1">
				<br><br><br><br>
					<div id="test"></div>
				  <input type="hidden" value="${funding.optionPrice }" id="price">
					${funding.optionPrice }원<br>
					${funding.productName }<br>
					${funding.productContent }<br>
					
					<input id="sendNumber" type="number" name="" max="${funding.optionLimit }"> 한계 : ${funding.optionLimit }<br>
				
				<br><br><br><br><br><br><br>
			<a id="sendBtn1" class="getstarted scrollto" href="#sectionSuggest2" style="text-decoration: none;">다음단계</a>
			</section>

			<br><br><br><br><br><br><br>

			<section id="sectionSuggest2">
							<br><br><br><br>

			<input class="getNumber" type="number" name="cal">
				${funding.finDate }<br>
				<input class="getResult1" type="number" name="cal"><br>
				추가로 후원하기
				<input type="number" id="addPrice" name="cal">
			
				<br><br><br><br><br><br><br>
			<a id="sendBtn2" class="getstarted scrollto" href="#sectionSuggest3" style="text-decoration: none;">펀딩하기</a>
			</section>

		<br><br><br><br><br><br><br><br><br>

			<section id="sectionSuggest3">
			<br><br><br><br>
				<form action="fundingJoinComplete.do" method="post">
					<input type="text" name="qunatity" class="getNumber"><br>
					<input type="text" name="" class="getResult1"><br>
					<input type="text" name="fundingPoint" class="getResult2"><br>
	    			<input type="text" name="projectNo" value="${funding.projectNo }"><br>
	   				<input type="text" name="userId" value="${loginUser.userId }"><br>
	   				<input type="text" name="sumMoney" class="getResult2"><br>
	   				<input type="text" name="receiverAddr">주소<br>
	   				<input type="text" name="receiverName">이름<br>
	   				<input type="text" name="receiverPhone">번호<br>
	    			<input type="submit" class="getstarted" value="예약완료">
    			</form>
			</section>
		<br><br><br><br><br><br>
<!-- 
		<a class="getstarted scrollto" href="fundingList.do"
			style="text-decoration: none;">뭘 쓰지</a>
			 -->
		<%@include file="../../../footer.jsp"%>
	</main>


	<!-- .site-wrap -->

	<!--  	<script src="/resources/js/jquery-3.3.1.min.js"></script> -->

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
	<script src="https://unpkg.com/aos@next/dist/aos.js"></script>

	<script src="/resources/js/jquery.fancybox.min.js"></script>

	<script src="/resources/js/main.js"></script>
	<script src="/resources/js/fundingJoin.js"></script>

</body>
</html>