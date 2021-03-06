<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>메인</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicons -->
<link href="/resources/img/favicon.svg" rel="icon">
  
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

<%@include file="header.jsp" %>

	<!-- 상단 소개화면 -->
	<div class="introduce-container">
	 	<%@include file="introduce.jsp" %>
	</div>

	<header class="header-bar d-flex align-items-center site-navbar-target"
		data-aos="fade-right" id="left-nav">

		<div class="d-inline-block d-lg-none ml-md-0 ml-auto py-3"
			style="position: relative; top: 3px;">
			<a href="#" class="site-menu-toggle js-menu-toggle text-white"><span
				class="icon-menu h3"></span></a>
		</div>

		<div class="main-menu">
			<ul class="js-clone-nav">
				<li><a href="#section-home" class="nav-link">사이트 소개</a></li>
				<li><a href="#section-funding" class="nav-link">펀딩 프로젝트</a></li>
				<li><a href="#section-donation" class="nav-link">기부 프로젝트</a></li>
				<li><a href="#section-bio" class="nav-link">제안하기</a></li>
				<li><a href="#section-blog" class="nav-link">별보러 가자</a></li>
				<!-- <li><a href="#section-contact" class="nav-link">검색</a></li> -->
			</ul>
		</div>
	</header>

      <!-- 프로젝트 사이즈 고정하고 가운데로 가게 하는법 알아오기... -->
	<main class="main-content">
 		<div class="container-fluid">
			<!-- 펀딩 프로젝트 -->
			<div style="height: 1080px; padding-top: 0px;">
				<section class="row align-items-stretch photos " id="section-funding">
					<div class="col-12 justify-content-center">
						<div class="row align-items-stretch" style="">


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
								<p>펀딩 프로젝트 이름</p>
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
								<p>펀딩 프로젝트 이름</p>
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
								<p>펀딩 프로젝트 이름</p>
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
								<p>펀딩 프로젝트 이름</p>
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
								<p>펀딩 프로젝트 이름</p>
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
								<p>펀딩 프로젝트 이름</p>
							</div>
						</div>
					</div>
				</section>
				<!-- #section-funding -->
			</div>
			<!-- 기부 프로젝트 -->
			<section class="row align-items-stretch photos" id="section-donation">
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
			</section>
			<!-- #section-donation -->


			<section class="site-section" id="section-testimonial">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-md-8 text-center">
							<h2 class="heading text-uppercase text-white">Testimonial</h2>

							<div class="row justify-content-center">
								<div class="col-md-12">

									<div class="owl-carousel slide-one-item home-slider">

										<div class="testimony text-center px-md-4">
											<figure class="mx-auto d-inline-block">
												<img src="/resources/img/images/person_2.jpg" alt="Image"
													class="mx-auto img-fluid w-25 rounded-circle">
											</figure>
											<p class="text-white">
												<strong>Jean Smith</strong>
											</p>
											<blockquote>
												<p>&ldquo;Lorem ipsum dolor sit amet, consectetur
													adipisicing elit. Unde tenetur quis facilis quam optio
													voluptate totam placeat, doloremque. Sit repellat ipsum
													dolor fugit similique itaque maxime saepe ipsam. Velit,
													harum!&rdquo;</p>
											</blockquote>
										</div>

										<div class="testimony text-center px-md-4">
											<figure class="mx-auto d-inline-block">
												<img src="/resources/img/images/person_3.jpg" alt="Image"
													class="mx-auto img-fluid w-25 rounded-circle">
											</figure>
											<p class="text-white">
												<strong>Jean Smith</strong>
											</p>
											<blockquote>
												<p>&ldquo;Lorem ipsum dolor sit amet, consectetur
													adipisicing elit. Unde tenetur quis facilis quam optio
													voluptate totam placeat, doloremque. Sit repellat ipsum
													dolor fugit similique itaque maxime saepe ipsam. Velit,
													harum!&rdquo;</p>
											</blockquote>
										</div>

									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</section>

			<section class="site-section-hero bg-image"
				style="background-image: url('/resources/img/images/img_9.jpg');"
				data-stellar-background-ratio="0.5" id="section-bio">
				<div class="row justify-content-center align-items-center">
					<div class="col-md-7 text-center">
						<h1 class="text-white heading text-uppercase" data-aos="fade-up" style="font-family: 'Noto Sans KR', sans-serif;">프로젝트 제안하기</h1>
						<p class="lead text-white mb-5" data-aos="fade-up"
							data-aos-delay="100">당신의 마음을 함께 해주세요.</p>
						<p data-aos="fade-up" data-aos-delay="100">
							<a href="#section-contact"
								class="btn btn-primary btn-md smoothscroll">제안하기</a>
						</p>
					</div>
				</div>
			</section>

			<section class="site-section" id="section-blog">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-md-8">
							<div class="row">
								<h2 class="heading text-uppercase text-white" data-aos="fade-up">Blog</h2>
								<div class="col-md-12 mb-4" data-aos="fade-up">
									<div class="d-md-flex d-block blog-entry align-items-start">
										<div class="mr-0 mr-md-5 mb-3 img-wrap">
											<a href="single.html"><img
												src="/resources/img/images/blog_1.jpg" alt="Image"
												class="img-fluid"></a>
										</div>
										<div>
											<h2 class="mt-0 mb-2">
												<a href="single.html">My New Photography Has Been
													Featured in Forbes</a>
											</h2>
											<div class="meta mb-3">
												Posted by Ben Jones on <a href="#">별보러 가자 게시물</a>
											</div>
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit. Officiis aliquid doloremque qui, saepe alias eum?</p>
										</div>
									</div>
								</div>

								<div class="col-md-12 mb-4" data-aos="fade-up">
									<div class="d-md-flex d-block blog-entry align-items-start">
										<div class="mr-0 mr-md-5 mb-3 img-wrap">
											<a href="single.html"><img
												src="/resources/img/images/blog_2.jpg" alt="Image"
												class="img-fluid"></a>
										</div>
										<div>
											<h2 class="mt-0 mb-2">
												<a href="single.html">My New Photography Has Been
													Featured in Forbes</a>
											</h2>
											<div class="meta mb-3">
												Posted by Ben Jones on <a href="#">별보러 가자 게시물</a>
											</div>
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit. Officiis aliquid doloremque qui, saepe alias eum?</p>
										</div>
									</div>
								</div>

								<div class="col-md-12 mb-4" data-aos="fade-up">
									<div class="d-md-flex d-block blog-entry align-items-start">
										<div class="mr-0 mr-md-5 mb-3 img-wrap">
											<a href="single.html"><img
												src="/resources/img/images/blog_3.jpg" alt="Image"
												class="img-fluid"></a>
										</div>
										<div>
											<h2 class="mt-0 mb-2">
												<a href="single.html">My New Photography Has Been
													Featured in Forbes</a>
											</h2>
											<div class="meta mb-3">
												Posted by Ben Jones on <a href="#">별보러 가자 게시물</a>
											</div>
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit. Officiis aliquid doloremque qui, saepe alias eum?</p>
										</div>
									</div>
								</div>

								<div class="col-md-12 mb-4" data-aos="fade-up">
									<div class="d-md-flex d-block blog-entry align-items-start">
										<div class="mr-0 mr-md-5 mb-3 img-wrap">
											<a href="single.html"><img
												src="/resources/img/images/blog_4.jpg" alt="Image"
												class="img-fluid"></a>
										</div>
										<div>
											<h2 class="mt-0 mb-2">
												<a href="single.html">My New Photography Has Been
													Featured in Forbes</a>
											</h2>
											<div class="meta mb-3">
												Posted by Ben Jones on <a href="#">별보러 가자 게시물</a>
											</div>
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit. Officiis aliquid doloremque qui, saepe alias eum?</p>
										</div>
									</div>
								</div>

								<div class="col-12 text-center">
									<div class="custom-pagination">
					                    <div class="d-grid gap-2 col-6 mx-auto">
					                        <button class="btn btn-primary" type="button" style="width: 300px;" onclick="">더보기</button>
					                    </div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>

 		<%@include file="footer.jsp" %>
	</main>

 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> -->
    <script src="/resources/js/jquery-3.3.1.min.js"></script>
 	<script src="/resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="/resources/js/jquery.easing.1.3.js"></script>
	<script src="/resources/js/jquery-ui.js"></script>
	<script src="/resources/js/popper.min.js"></script>
	<!-- <script src="/resources/js/bootstrap.min.js"></script> -->
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