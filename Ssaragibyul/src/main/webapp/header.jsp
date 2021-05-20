<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">

  <!-- Favicons -->
  <link href="/resources/img/favicon.png" rel="icon">
  

  <!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">
  <!-- Vendor CSS Files -->
  

  <!-- Template Main CSS File -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
   <link rel="stylesheet" href="/resources/css/style_nav.css">
<link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
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
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 기념관 </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown" style="text-align: center; width: 200px;">
							<a class="dropdown-item" href="/independenceList">독립유공자 공훈록</a> <a
								class="dropdown-item" href="#">별들의 발자취</a> <a
								class="dropdown-item" href="#">별보러 가자</a>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="/fundingMain">펀딩</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">기부</a></li>
					<li class="nav-item"><a class="nav-link" href="#">가이드</a></li>

				</ul>
				<c:if test="${ empty sessionScope.loginUser }">
					<div>
						<a class="getstarted scrollto" href="/SuggestMain" style="text-decoration: none;">제안하기</a> 
						<a class="nav-link" href="#">로그인</a>
					</div>
				</c:if>
				
				<c:if test="${ !empty sessionScope.loginUser && sessionScope.loginUser.userId =='admin'}">
					<div>
						<a class="nav-link" href="#">관리자페이지</a> 
						<a class="nav-link" href="#">로그아웃</a>
					</div>
				</c:if>
				
				<c:if test="${ !empty sessionScope.loginUser && sessionScope.loginUser.userId !='admin'}">
					<div>
						<a class="getstarted scrollto" href="/SuggestMain" style="text-decoration: none;">제안하기</a> 
						<a class="nav-link" href="#">마이페이지</a>
						<a class="nav-link" href="#">로그아웃</a> 
					</div>
				</c:if>
				
			</div>
		</div>
	</nav> 

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script> -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<!--  
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
     --> 
  </body>
</html>