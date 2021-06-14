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

<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700,900|Oswald:400,700" rel="stylesheet">
<link rel="stylesheet" href="/resources/fonts/flaticon/font/flaticon.css">

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
	margin-left: -100px;
	border-radius: 4px;
	color: #fff;
	border: none;
}
.getstarted:hover{
	background-color: #E35901;
	border:none;
}

.getstarted:active{
	background-color: #D75909;
	border:none;
}
.sug {
	margin: auto;
}

.main-menu {
	padding-left: 40px;
}

/* 고침 */

#sectionSuggest1, #sectionSuggest2{
	margin-left: 200px;
	height: 40%;
}

.content1{
	text-align:left;
 	border: 1px solid #AFAFAF; 
 	border-radius: 15px;
	width: 80%;
	height: 500px;
	margin-top: -100px;
}

.content2{
	text-align:left;
	border: 1px solid #AFAFAF;
	border-radius: 15px;
	width: 80%;
	height: 350px;
	margin-top: -100px;
}
.content3{
	text-align:left;
	border: 1px solid #AFAFAF;
	border-radius: 15px;
	width: 80%;
	height: 350px;
	margin-top: -100px;
}

#sendBtn1{
	margin-top: -100px;
	margin-left: 350px;
}

#myPoint-total1{
	margin-bottom: 25px;
}
#price{
	text-align:center;
	border:1px solid gray;
	border-radius:5px;
	width: 200px;
	margin-bottom: 15px;
}
input:focus {
	outline:none;
}

#name{
	margin-left: -130px;
}

#phone{
	margin-left: -80px;
}

#input-name, #input-phone{
	width: 220px;
	margin-bottom: 10px;
	border:1px solid gray;
	border-radius:5px;
}

.getResult3{
	float:left;
	width: 50px;
	border: none;
	margin-bottom: 50px;
	font-size: 17px;
 	font-weight: bold;
    margin-left: 360px;
    margin-right: -290px;
}
.content2 span{
	 font-size: 17px;
	 font-weight: bold;
	 margin-left: -50px
}

#point{
	margin-bottom: 20px;
	margin-top: 20px;
}
</style>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="200" data-offset="200"  onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload=""> 
	<%@include file="../../../header.jsp"%> 
	
	<header class="header-bar d-flex align-items-center site-navbar-target"
		data-aos="fade-right" style="font-family: 'Noto Serif KR', serif;">

		<div class="d-inline-block d-lg-none ml-md-0 ml-auto py-3"
			style="position: relative; top: 3px;">
			<a href="#" class="site-menu-toggle js-menu-toggle text-white"><span
				class="icon-menu h3"></span></a>
		</div>
		<!-- style="color: #EB5C01" -->
		<div class="main-menu">
			<ul class="js-clone-nav">
				<li><a class="nav-link" style="font-size:16px;"><strong>펀딩 참여하기</strong></a></li>
				<li><a href="#sectionSuggest1" class="nav-link" style="font-size:15px;">1. 펀딩 리워드 선택</a></li>
				<li><a href="#sectionSuggest2" class="nav-link" style="font-size:15px;">2. 리워드 선택 확인</a></li>
				<li><a href="#sectionSuggest3" class="nav-link" style="font-size:15px;">3. 최종 결제 확인</a></li>
			</ul>
		</div>
	</header>
	

	<main class="main-content" style="font-family: 'Noto Serif KR', serif;">
		<br><br><br><br><br><br><br><br>


			<section id="sectionSuggest1">
			<br><br><br><br>
				<div class="content1">
				<h3 style="margin: 60px 0px 15px 0px; font-weight: bold;">펀딩 참여하기</h3><br><br>
				 <input type="hidden" value="${funding.optionPrice }" id="price">		
					<h4> 리워드 명 : ${funding.productName }</h4><br><br>
					
					<h5>${funding.productContent }</h5><br><br>
					<h6>개당 : ${funding.optionPrice }원</h6><br>
					<input id="sendNumber" type="number" name="cal" max="${funding.optionLimit }">
					 한계 : <span id="optionLimit">"${funding.optionLimit }</span><br>
					사용 가능한 포인트: <span id="myPoint-total1">${sessionScope.myPoint.total}</span>
					
		<%-- 		<input type="number" id="price" name="cal"> 원<br>
				사용 가능한 포인트: <span id="myPoint-total1">${sessionScope.myPoint.total}</span> --%>
				</div>
				<br><br><br><br><br><br><br>
				
			<a id="sendBtn1" class="getstarted scrollto" href="#sectionSuggest2" style="text-decoration: none;">다음 단계로</a>
			</section>

		<br><br><br><br><br><br><br><br><br>
			<section id="sectionSuggest2">
			<div class="content2">
			<input class="getNumber" type="number" name="cal">
				개 선택<br>
				<input class="getResult1" type="number" name="cal">원 리워드<br>
				추가로 후원하기
				<input type="number" id="addPrice" name="cal">원<br>
				
				사용 가능한 포인트: <span id="myPoint-total2">${sessionScope.myPoint.total}</span>
				
				<br><br><br><br><br><br><br>
				</div>
			<a id="sendBtn2" class="getstarted scrollto" href="#sectionSuggest3" style="text-decoration: none;">다음 단계로</a>
			</section>

		<br><br><br><br><br><br><br><br><br>
			<section id="sectionSuggest3">
			<br><br><br><br>
			<div class="content3">
				<form action="fundingJoinComplete.do" method="post">
	    			<input type="hidden" name="projectNo" value="${funding.projectNo }"><br>
	   				<input type="hidden" name="userId" value="${loginUser.userId }"><br>
	   				<!-- <input type="text" name="sumMoney" class="getResult2"> 최종금액 <br> -->
	   				<input type="text" name="qunatity" class="getNumber"> 선택  리워드 개수<br>
					<input type="text" name="" class="getResult1"> 리워드 금액<br>
					<input type="text" name="" class="addNumber"> 추가 후원 금액<br>
					<input type="text" name="sumMoney" class="getResult2"> 최종금액 <br>
	   				<span id="name">결제자 이름</span><br>
	   				<input type="text" name="receiverName" id="input-name"><br>
	   				<span id="phone">결제자 휴대폰 번호</span><br>
	   				<input type="input-text" name="receiverPhone" id="input-phone"><br>
	   				<span id="phone">결제자 주소</span><br>
	   				<input type="text" name="receiverAddr" id="input-phone"><br>
	   				<div id="point">
		   				<input type="text" name="fundingPoint" class="getResult3">
		   				<span>포인트를 사용하시겠습니까?</span>
	   				</div>
	   				
	    			<input type="submit" class="getstarted" value="펀딩하기">
	    			
    			</form>
   			</div>
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
	<script src="/resources/js/fundingJoin.js"></script>
	<script type="text/javascript">
		 window.history.forward();
		 function noBack(){window.history.forward();}
	</script>
</body>
</html>