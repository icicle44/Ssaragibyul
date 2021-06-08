<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
@font-face {
    font-family: 'independence';
    src: url('../resources/fonts/independence.ttf') format('truetype');
    unicode-range: U+AC00-D7A3;
}

body {
	font-family: 'independence';
}
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

.pro-title {
	padding-left: 80px;
	padding-bottom: 40px;
	/* padding-top: 30px; */
	font-family: 'Noto Serif KR';
}

#section-testimonial {
	padding-top: 10px;
	padding-bottom: 280px;
}

</style>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="200">

<%@include file="../../../header.jsp" %>

	<!-- 상단 소개화면 -->
	<div class="introduce-container">
	 	<%@include file="../../../introduce.jsp" %>
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
				
			<div style="height: 3000x; padding-top: 0px;">
				
				<section class="row align-items-stretch photos " id="section-funding">
				<h3 class="pro-title">펀딩 프로젝트</h3>
					<div class="col-12 justify-content-center">
				
						<div class="row align-items-stretch" style="">


							<!-- 펀딩 프로젝트-->

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
<!-- 							<h2 class="heading text-uppercase text-white">Testimonial</h2> -->

							<div class="row justify-content-center">
								<div class="col-md-12">

									<div class="owl-carousel slide-one-item home-slider">

										<div class="testimony text-center px-md-4">
											<figure class="mx-auto d-inline-block">
												<img src="/resources/img/main/main_202106_1.jpg" alt="Image"
													class="mx-auto img-fluid w-25 rounded-circle">
											</figure>
											<p class="">
												<strong>의병 김 익 중</strong>
											</p>
											<blockquote>
												<p>
												1846-08-17 ~ 1916-10-28 &nbsp;전라남도 화순<br>
												
												&ldquo;1895~1908 전후기 의병장으로 활동. 위에서는 나라를 파는 대신들이 의병에게 군사를 멋대로 일으킨 반역자라는 이름을 씌우면서 왜놈의 털 한 오라기도 상할까 두려워하고, 아래에서는 행실이 좋지 않은 부호들이 의병에게 폭도의 괴수라는 이름을 씌워서 제 집 창고에 쌓아 둔 반 톨의 곡식이라도 손해볼까 겁을 낸다.&rdquo;</p>
											</blockquote>
										</div>
										
										<div class="testimony text-center px-md-4">
											<figure class="mx-auto d-inline-block">
												<img src="/resources/img/main/main_202106_2.jpg" alt="Image"
													class="mx-auto img-fluid w-25 rounded-circle">
											</figure>
											<p class="">
												<strong>학생운동 장경례</strong>
											</p>
											<blockquote>
												<p>
												1913-04-06 ~ 1997-12-01 &nbsp;전라남도 광주<br>
												&ldquo;1928.10부터 광주여자고등보통학교 학우 11명이 소녀회를 비밀히 조직하여 항일 독립운동 단체로서의 기틀을 마련하고, 1929. 11 광주 학생 독립운동 시위시에는 광주여고보생(光州女高普生)의 시위 가담을 주동하였다가 체포되어 학교에서 퇴학 당하고 장기간 구금 상태에서 심한 고문을 받음.&rdquo;</p>
											</blockquote>
										</div>

										<div class="testimony text-center px-md-4">
											<figure class="mx-auto d-inline-block">
												<img src="/resources/img/main/main_202106_3.jpg" alt="Image"
													class="mx-auto img-fluid w-25 rounded-circle">
											</figure>
											<p class="">
												<strong>독립운동지원 올리버 알 애비슨</strong>
											</p>
											<blockquote>
												<p>
												1860-06-30 ~ 1956-08-29 캐나다<br>
												&ldquo;1893년 제중원(濟衆院) 의사, 1904년 세브란스병원과 세브란스병원의학교 병원장, 1915-1916년 경신학교 대학부 부교장&#x2024;교장, 1917-1934년 연희전문학교 교장 등으로 의료교육에 공헌함. 1942-1943년 기독교인친한회(The Christian Friends of Korea) 재무로 대한민국임시정부의 승인과 독립운동을 지원할 것을 호소함.&rdquo;</p>
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
						<h1 class="text-white heading text-uppercase" data-aos="fade-up" style="font-family: 'independence';">프로젝트 제안</h1>
						<br><p class="lead text-white mb-5" data-aos="fade-up"
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
	<%@include file="../../../footer.jsp" %>
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