<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet" href="/resources/css/styleFundingList.css">
</head>
<style>

.display {
	margin:auto;
	width: 402px;
	margin-bottom: 30px;
	padding: 10px;
	font-size:12px;
}
#frame{
	width: 550px;
	height : 550px;
}
.gridmain > * {
  float: left;  
  width: 30%;
  height: 30%;
  font-size:12px;
}
.btn{
margin: auto;
}
.#name_css{
	text-align: left; 
	padding-right:10px; 
	font-weight:bold; 
	font-size:12px; 
	color:DimGray;
}
.nothing{
 color:white;
}
#bar_td{
	text-align: left; 
	margin:auto;
}
#svg{
	height:2px; 
	width: 350px;
}
#dday_css{
	float:left; 
	width : 50%;
	font-size:12px;
}
#sum_css{
	float:right;
	width : 50%;
	text-align: right; 
	font-size:12px;
}
.select{
	float:right;
}
/* #head{
	width : 1547px;
} */
#pj_search{
width : 1540px;
}
#frmpj{
}
.scan{
	float:right;
}
#headFont{
	font-size:30px;
}
/* #between-blank {
	height: 60px;
} */
.pro-title {
	padding-left: 80px;
	padding-bottom: 40px;
	/* padding-top: 30px; */
	font-family: 'Noto Serif KR';
}

/* .container-fluid {
	position: relative;
	top: -100px;
} */

</style>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="200">

<%@include file="../../../header.jsp" %>

	<!-- 상단 소개화면 -->
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

	<main class="main-content">
 		<div class="container-fluid">
				
			<div style="height: 1080px; padding-top: 0px;">
				
				<section class="row align-items-stretch photos " id="section-funding">
				<h3 class="pro-title"></h3>
					<div class="col-12 justify-content-center">
				
						<div class="row align-items-stretch" style="">
			
		 <c:forEach var="p" items="${fListandFile}" varStatus="status" begin="0" end="5"> 
		 
			<div class="col-6 col-md-6 col-lg-4" data-aos="fade-up" id = "frame">
			<table class="display" id="example">
				<tr>
					<td> 
					    <a href="resources/upLoadFile/${p.fundingFile.fileMainName}" class="d-block photo-item" data-fancybox="gallery"> 
						<img src="resources/upLoadFile/${p.fundingFile.fileMainName}" alt="Image" class="img-fluid" style="width:402px;, height:300px;">
						<div class="photo-text-more">
						<span class="icon icon-search">${p.subjectName}"</span>
						</div></a></td>
		 			</tr>
		 			<tr>
						<td align = "right"><img src="resources/img/images/likeHeart.png" style="width:18px;, height:18px;">
						<span style="color:DimGray; font-size:13px; vertical-align:1px;">${p.likeCount}</span></td>
					</tr>
					<tr>
						<td>
						<c:url var="fDetail" value="fundingDetail.do">
						<c:param name="projectNo" value="${p.projectNo }"></c:param>
						</c:url> 
						<a href="${fDetail }" style="font-size : 1.5em">${p.subjectName }</a>
						</td>
					</tr>
				 <tr>
				<td colspan="2" id="bar_td">
							<c:if test="${p.percent >99}">
								<svg id="svg">
									<rect x="0" y="0" fill="#efefef" height="2" width="100%"></rect>
									<rect x="0" y="0" height="2" width="100%" fill="#FF8000"></rect>
								</svg>
							</c:if>
			
							<c:if test="${p.percent < 100}">
								<svg id="svg">
									<rect x="0" y="0" fill="#efefef" height="2" width="100%"></rect>
									<rect x="0" y="0" height="2" width="${p.percent}%" fill="#FF8000"></rect>
								</svg>
							</c:if>
						</td>
					</tr>
				    <tr>
						<td id="dday_css">
						<img src="resources/img/images/calenderImage.jpg" style="width:18px;, height:18px;">
						<c:if test="${p.leftDate < 1}"><b>마감</b></c:if>
						<c:if test="${p.leftDate >= 1}"><b>${p.leftDate}</b>일 남음</c:if>
						</td>
						<td id="sum_css"><b><fmt:formatNumber value="${p.sumMoney}" pattern="#,###"/>원 , </b>
						<span id="percent_css" style="color:orange;, font-size:12px;"> 달성률 : ${p.percent}%</span>
					</td>
					</tr> 
				</table>
				</div>
			 </c:forEach> 							
						</div>
					</div>
				</section>
				<!-- #section-funding -->

			<!-- 기부 프로젝트 -->	
			
			<section class="row align-items-stretch photos" id="section-donation">
			<h3 class="pro-title">기부 프로젝트</h3>
				<div class="col-12">
					<div class="row align-items-stretch">

						<!-- <div class="col-6 col-md-6 col-lg-4" data-aos="fade-up">
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
						</div> -->
				 			<c:forEach var="d" items="${dListandFile}" varStatus="status"  begin="0" end="5"> 
								<div class="col-6 col-md-6 col-lg-4" data-aos="fade-up" id = "frame">
									<table class="display" id="example">
										<tr>
											<td> 
												<a href="resources/dUpLoadFiles/${d.donationFile.fileName}" class="d-block photo-item" data-fancybox="gallery"> 
													<img src="resources/dUpLoadFiles/${d.donationFile.fileName}" alt="Image" class="img-fluid" style="width:402px;, height:300px;">
													<div class="photo-text-more">
														<span class="icon icon-search">${d.subjectName}"</span>
													</div>
												</a>
											</td>
										</tr>
										<tr>
											<td align = "right">
												<img src="resources/img/images/likeHeart.png" style="width:18px;, height:18px;">
												<span style="color:DimGray; font-size:13px; vertical-align:1px;">${d.likeCount}</span>
											</td>
										</tr>
										<tr>
											<td>
												<c:url var="dDetail" value="donationDetail.do">
													<c:param name="projectNo" value="${d.projectNo }"></c:param>
												</c:url> 
												<a href="${dDetail }" style="font-size : 1.5em">${d.subjectName }</a>
											</td>
										</tr>
										<tr>
											<td colspan="2" id="bar_td">
												<c:if test="${d.percent >99}">
													<svg id="svg">
														<rect x="0" y="0" fill="#efefef" height="2" width="100%"></rect>
														<rect x="0" y="0" height="2" width="100%" fill="#FF8000"></rect>
													</svg>
												</c:if>
										
												<c:if test="${d.percent < 100}">
													<svg id="svg">
														<rect x="0" y="0" fill="#efefef" height="2" width="100%"></rect>
														<rect x="0" y="0" height="2" width="${d.percent}%" fill="#FF8000"></rect>
													</svg>
												</c:if>
											</td>
										</tr>
									    <tr>
											<td id="dday_css">
												<img src="resources/img/images/calenderImage.jpg" style="width:18px;, height:18px;">
												<c:if test="${d.leftDate < 1}"><b>마감</b></c:if>
												<c:if test="${d.leftDate > 1}"><b>${d.leftDate}</b>일 남음</c:if>
											</td>
											<td id="sum_css">
												<b>
													<fmt:formatNumber value="${d.sumMoney}" pattern="#,###"/>원 , 
												</b>
												<span id="percent_css" style="color:orange;, font-size:12px;"> 달성률 : ${d.percent}%</span>
											</td>
										</tr> 
									</table>
								</div>
			 				</c:forEach> 

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
							<a href="suggestPage.do"
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
								
								
								<c:forEach items="${vList }" var="vList" varStatus="status">
									<c:if test="${status.index<5}">
										<div class="col-md-12 mb-4" data-aos="fade-up">
											<div class="d-md-flex d-block blog-entry align-items-start">
												<div class="mr-0 mr-md-5 mb-3 img-wrap">
													<a href="http://localhost:8888/visitList.do"><img src="/resources/vUploadFiles/${vList.renameFilename }"
									alt="${vList.originalFilename }"
														class="img-fluid"></a>
												</div>
												<div>
													<div class="meta mb-3">
														 <a href="http://localhost:8888/visitList.do">${vList.visitTitle }</a>
													</div>
													<p>${vList.visitContents }</p>
												</div>
											</div>
										</div>
									</c:if>
								</c:forEach>

							

								<div class="col-12 text-center">
									<div class="custom-pagination">
					                    <div class="d-grid gap-2 col-6 mx-auto">
					                        <button class="btn btn-primary" type="button" style="width: 300px;" onclick="location.href='http://localhost:8888/visitList.do'">더보기</button>
					                    </div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			</div>
		</div>

	</main>
<%--  		<%@include file="../../../footer.jsp" %> --%>
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