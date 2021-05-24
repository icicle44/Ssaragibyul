<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>펀딩 리스트</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicons -->
<link href="/resources/img/favicon.png" rel="icon">
  
<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700,900|Oswald:400,700" rel="stylesheet">
<link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
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

</head>
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

		<div class="main-menu">
			<ul class="js-clone-nav">
				<li><a href="#section-funding1" class="nav-link">진행중 프로젝트</a></li>
				<li><a href="#section-funding2" class="nav-link">종료된 프로젝트</a></li>
			</ul>
		</div>
	</header>
<%--       							<c:forEach items="${fList }" var="funding">
							<tr>
				<td align="center">${funding.subject }</td></tr>
				<tr>
					</c:forEach>
 --%>
 ${funding.subject }
      <!-- 프로젝트 사이즈 고정하고 가운데로 가게 하는법 알아오기... -->
	<main class="main-content">
		<div class="container-fluid">
			<!-- 펀딩 프로젝트 -->

			<div style="height: 1080px; padding-top: 200px;">
				<section class="row align-items-stretch photos " id="section-funding1">
					<h2>진행중 프로젝트</h2><!-- <!--  --><!-- //////////////////////////////////////////////////////////////////////////////////////////// --><!--  --> <!-- -->
				 <select name = "chose1" class="select">
					          <option value = "money_list" selected>모금액 순</option>
					          <option value = "news_list">최신글 순</option>
					          <option value = "like_list">좋아요 순</option>
				</select>
					<div class="col-12">
						<div class="row align-items-stretch">


							<!-- 펀딩 프로젝트-->
					
							<div class="col-6 col-md-6 col-lg-4" data-aos="fade-up">
								<a href="/resources/img/images/img_7.jpg"
									class="d-block photo-item" data-fancybox="gallery"> <img
									src="/resources/img/images/img_7.jpg" alt="Image"
									class="img-fluid">
									<div class="photo-text-more">
										<span class="icon icon-search"></span>
									</div>
								</a>
								<p>(funding.subject)</p>
							</div>
							<div class="col-6 col-md-6 col-lg-4" data-aos="fade-up"
								data-aos-delay="100">
								<a href="/resources/img/images/img_8.jpg"
									class="d-block photo-item" data-fancybox="gallery"> <img
									src="/resources/img/images/img_8.jpg" alt="Image"
									class="img-fluid">
									<div class="photo-text-more">
										<span class="icon icon-search"></span>
									</div>
								</a>
								<p>(funding.subject)</p>
							</div>
							<div class="col-6 col-md-6 col-lg-4" data-aos="fade-up"
								data-aos-delay="200">
								<a href="/resources/img/images/img_9.jpg"
									class="d-block photo-item" data-fancybox="gallery"> <img
									src="/resources/img/images/img_9.jpg" alt="Image"
									class="img-fluid">
									<div class="photo-text-more">
										<span class="icon icon-search"></span>
									</div>
								</a>
								<p>(funding.subject)</p>
							</div>

							<div class="col-6 col-md-6 col-lg-4" data-aos="fade-up">
								<a href="/resources/img/images/img_10.jpg"
									class="d-block photo-item" data-fancybox="gallery"> <img
									src="/resources/img/images/img_10.jpg" alt="Image"
									class="img-fluid">
									<div class="photo-text-more">
										<span class="icon icon-search"></span>
									</div>
								</a>
								<p>(funding.subject)</p>
							</div>
							<div class="col-6 col-md-6 col-lg-4" data-aos="fade-up"
								data-aos-delay="100">
								<a href="/resources/img/images/img_1.jpg"
									class="d-block photo-item" data-fancybox="gallery"> <img
									src="/resources/img/images/img_1.jpg" alt="Image"
									class="img-fluid">
									<div class="photo-text-more">
										<span class="icon icon-search"></span>
									</div>
								</a>
								<p>(funding.subject)</p>
							</div>
							<div class="col-6 col-md-6 col-lg-4" data-aos="fade-up"
								data-aos-delay="200" style="padding-bottom: 200px;">
								<a href="/resources/img/mages/img_2.jpg"
									class="d-block photo-item" data-fancybox="gallery"> <img
									src="/resources/img/images/img_2.jpg" alt="Image"
									class="img-fluid">
									<div class="photo-text-more">
										<span class="icon icon-search"></span>
									</div>
								</a>
								<p>(funding.subject)</p>
								
							</div>
				
						</div>
						
					</div>
			<button class="btn">프로젝트 더 보기</button> 
					
				</section>
				<!-- #section-funding -->
				
			</div>

			<br><br><br><br><br><br>
			<!-- 기부 프로젝트 -->
			<section class="row align-items-stretch photos" id="section-funding2">
			<h2>종료된 프로젝트</h2><!-- <!--  --><!-- //////////////////////////////////////////////////////////////////////////////////////////// --><!--  --> <!-- -->
						 <select name = "chose2" class="select">
					          <option value = "money_list" selected>모금액 순</option>
					          <option value = "news_list">최신글 순</option>
					          <option value = "like_list">좋아요 순</option>
				</select>
				<div class="col-12">
					<div class="row align-items-stretch">

						<div class="col-6 col-md-6 col-lg-4" data-aos="fade-up">
							<a href="/resources/img/images/img_4.jpg"
								class="d-block photo-item" data-fancybox="gallery"> <img
								src="/resources/img/images/img_4.jpg" alt="Image"
								class="img-fluid">
								<div class="photo-text-more">
									<span class="icon icon-search">프로젝트 이름</span>

								</div>
							</a>
							<p>기부 프로젝트 이름</p>
						</div>
						<div class="col-6 col-md-6 col-lg-4" data-aos="fade-up"
							data-aos-delay="100">
							<a href="/resources/img/images/img_5.jpg"
								class="d-block photo-item" data-fancybox="gallery"> <img
								src="/resources/img/images/img_5.jpg" alt="Image"
								class="img-fluid">
								<div class="photo-text-more">
									<span class="icon icon-search">프로젝트 이름</span>
								</div>
							</a>
							<p>기부 프로젝트 이름</p>
						</div>
						<div class="col-6 col-md-6 col-lg-4" data-aos="fade-up"
							data-aos-delay="200">
							<a href="/resources/img/images/img_1.jpg"
								class="d-block photo-item" data-fancybox="gallery"> <img
								src="/resources/img/images/img_1.jpg" alt="Image"
								class="img-fluid">
								<div class="photo-text-more">
									<span class="icon icon-search"></span>
								</div>
							</a>
							<p>기부 프로젝트 이름</p>
						</div>



						<div class="col-6 col-md-6 col-lg-4" data-aos="fade-up">
							<a href="/resources/img/images/img_2.jpg"
								class="d-block photo-item" data-fancybox="gallery"> <img
								src="/resources/img/images/img_2.jpg" alt="Image"
								class="img-fluid">
								<div class="photo-text-more">
									<span class="icon icon-search"></span>
								</div>
							</a>
							<p>기부 프로젝트 이름</p>
						</div>
						<div class="col-6 col-md-6 col-lg-4" data-aos="fade-up"
							data-aos-delay="100">
							<a href="/resources/img/images/img_3.jpg"
								class="d-block photo-item" data-fancybox="gallery"> <img
								src="/resources/img/images/img_3.jpg" alt="Image"
								class="img-fluid">
								<div class="photo-text-more">
									<span class="icon icon-search"></span>
								</div>
							</a>
							<p>기부 프로젝트 이름</p>
						</div>
						<div class="col-6 col-md-6 col-lg-4" data-aos="fade-up"
							data-aos-delay="200">
							<a href="/resources/img/images/img_6.jpg"
								class="d-block photo-item" data-fancybox="gallery"> <img
								src="/resources/img/images/img_6.jpg" alt="Image"
								class="img-fluid">
								<div class="photo-text-more">
									<span class="icon icon-search"></span>
								</div>
							</a>
							<p>기부 프로젝트 이름</p>
						</div>


					</div>

				</div>
				<button class="btn">프로젝트 더 보기</button> 
			</section>
			<!-- #section-donation -->


<br><br><br><br><br><br><br>
 		<%@include file="../../../footer.jsp" %>
	</main>

	<!-- .site-wrap -->
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

</body>
</html>