<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>메인</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
	border-radius: 4px;
	color: #fff;
}

.sug {
	margin: auto;
}

.main-menu {
	padding-left: 50px;
}
</style>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="200">

	<%-- <%@include file="introduce.jsp" %> --%>
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
				<li><a class="nav-link" style="color: #000061"><strong>프로젝트
							만들기</strong></a></li>
				<li><a href="#sectionSuggest1" class="nav-link">1. 기본정보</a></li>
				<li><a href="#sectionSuggest2" class="nav-link">2. 스토리</a></li>
				<li><a href="#sectionSuggest3" class="nav-link">3. 리워드</a></li>
				<li><a href="#sectionSuggest4" class="nav-link">4. 안내사항</a></li>
			</ul>
		</div>
	</header>

	<main class="main-content">
		<form action="fundingRegister.do" method="post">
		<br>
				<br>
				<br>
				<br> <br>
				<br>
				<br>
				<br>
			<section id="sectionSuggest1">
				
				<table width="550" cellspacing="10" class="sug">
					<tr>
						<td>프로젝트명</td>
					</tr>
					<tr></tr>
					<tr>
						<td><input type="text" name=""></td>
					</tr>
					<tr>
						<td>목표 금액</td>
					</tr>
					<tr>
						<td><input type="text" name=""></td>
					</tr>
					<tr>
						<td>진행 기간</td>
					</tr>
					<tr>
						<td><input type="text" name=""></td>
					</tr>
					<tr>
						<td>이미지</td>
					</tr>
					<tr>
						<td><input type="text" name=""></td>
					</tr>
				</table>
			<a class="getstarted scrollto" href="#sectionSuggest2"
			style="text-decoration: none;">다음단계</a>
			</section>

			<br>
			<br>
			<br>
			<br> <br>
			<br>
			<br>
			<br> <br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>

			<section id="sectionSuggest2">
				<table width="550" cellspacing="10" class="sug">
				<tr>
						<td>프로젝트명</td>
					</tr>
					<tr></tr>
					<tr>
						<td><input type="text" name=""></td>
					</tr>
					<tr>
						<td>목표 금액</td>
					</tr>
					<tr>
						<td><input type="text" name=""></td>
					</tr>
					<tr>
						<td>프로젝트 스토리</td>
					</tr>
					<tr>
						<td><input type="text" name=""></td>
					</tr>
				</table>
			<a class="getstarted scrollto" href="#sectionSuggest3"
			style="text-decoration: none;">다음단계</a>
			</section>

			<br>
			<br>
			<br>
			<br> <br>
			<br>
			<br>
			<br> <br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>

			<section id="sectionSuggest3">
				<table width="550" cellspacing="10" class="sug">
					<tr>
						<td>리워드 금액</td>
					</tr>
					<tr>
						<td><input type="text" name=""></td>
					</tr>
					<tr>
						<td>리워드 제공 가능 수</td>
					</tr>
					<tr>
						<td><input type="text" name=""></td>
					</tr>
					<tr>
						<td>리워드 제목</td>
					</tr>
					<tr>
						<td><input type="text" name=""></td>
					</tr>
										<tr>
						<td>리워드 내용</td>
					</tr>
					<tr>
						<td><input type="text" name=""></td>
					</tr>
									<tr>
						<td>예상 배송일</td>
					</tr>
					<tr>
						<td><input type="text" name=""></td>
					</tr>
									<tr>
						<td>배송지 필요여부</td>
					</tr>
					<tr>
						<td><input type="text" name=""></td>
					</tr>
					
				</table>
			<a class="getstarted scrollto" href="#sectionSuggest4"
			style="text-decoration: none;">다음단계</a>
			</section>

			<br>
			<br>
			<br>
			<br> <br>
			<br>
			<br>
			<br> <br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>

			<section id="sectionSuggest4">
				<table width="550" cellspacing="10" class="sug">
					<tr>
						<td>환불 정책 안내 사항</td>
					</tr>
					<tr></tr>
					<tr>
						<td><input type="text" name=""></td>
					</tr>
					<tr>
						<td>문의 가능한 번호</td>
					</tr>
					<tr>
						<td><input type="text" name=""></td>
					</tr>
					<tr>
						<td>문의 이메일</td>
					</tr>
				</table>
			</section>

			<br>
			<br>
			<br>
			<br> <br>
			<br>
			<br>
			<br> <br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
		<input type="submit" value="작성완료" class="getstarted scrollto" style="text-decoration: none;">


		</form>



		<a class="getstarted scrollto" href="fundingList.do"
			style="text-decoration: none;">작성완료</a>
		<%@include file="../../../footer.jsp"%>
	</main>

	<!-- .site-wrap -->

	<!--  	<script src="/resources/js/jquery-3.3.1.min.js"></script> -->
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
	<script src="https://unpkg.com/aos@next/dist/aos.js"></script>

	<script src="/resources/js/jquery.fancybox.min.js"></script>

	<script src="/resources/js/main.js"></script>

</body>
</html>