<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>별들의 발자취</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicons -->
<link href="/resources/img/favicon.svg" rel="icon">

<link
	href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700,900|Oswald:400,700"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/css/jquery-ui.css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="/resources/fonts/flaticon/font/flaticon.css">

<link rel="stylesheet" href="/resources/css/aos.css">
<link rel="stylesheet" href="/resources/css/fancybox.min.css">

<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/styleFundingList.css">
</head>
<style>
.contents{
/* margin-left:5em; */
}
.project-card {
	width: 495px;
	height: 350px;
	border-radius: 25px;
	border: 1px solid rgb(0, 0, 0);
	position: relative;
	box-shadow: 5px 5px 20px;
	transition: all 0.5s;
	transition-delay: 0.2s;
	margin-left: 15em;
	margin-top: 10em;
	text-align:center;
}

.project-card:hover {
	width: 580px;
	height: 400px;
}

.project-thumbnail {
	width: 100%;
	height: 60%;
	border-top-left-radius: 25px;
	border-top-right-radius: 25px;
	background-image:
		url("https://a-static.besthdwallpaper.com/spider-man-s-awesome-selfie-wallpaper-9842_L.jpg");
	background-size: cover;
}

.project-explain {
	width: 96%;
	height: 20%;
	margin: auto;
	display: absolute;
	z-index: 2;
}
.sideBar{
	font-size: 15px;
	font-weight: 200;
	float:left;
	padding-top:25em;
	color: #2b686e;
	text-align: center;
}
img{
	max-height: 10em;
	max-width: 25em;
	border-radius: 15px;
}
table th {
  background-color: #F5F5F5;
  font-weight: 300;
}
.colored{
  background-color: #F5F5F5;
  font-weight: 300;	
  width: 10em;
}
table th {
  background-color: #F5F5F5;
  font-weight: 300;
}
table tr:nth-child(2n) {
  background-color: white;
}
table tr:nth-child(2n+1) {
  background-color: white;
}

td{
	width: 80px;
	
}
  td:first-child {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    width: 100px;
  }
  td:not(:first-child) {
    clear: both;
    margin-left: 100px;
    padding: 4px 20px 4px 90px;
    position: relative;
    text-align: left;
  }
  td:not(:first-child):before {
    color: #91ced4;
    content: "";
    display: block;
    left: 0;
    position: absolute;
  }
  td:nth-child(2):before {
    content: "Name:";
  }
  td:nth-child(3):before {
    content: "Email:";
  }
  td:nth-child(4):before {
    content: "Phone:";
  }
  td:nth-child(5):before {
    content: "Comments:";
  }

  tr {
    padding: 10px 0;
    position: relative;
  }
  tr:first-child {
    display: none;
  }
}
  td:first-child {
    background-color: #FFE8D9;
    border-bottom: 1px solid #91ced4;
    border-radius: 10px 10px 0 0;
    position: relative;
    top: 0;
    transform: translateY(0);
    width: 100%;
  }
  td:not(:first-child) {
    margin: 0;
    padding: 5px 1em;
    width: 100%;
  }
  td:not(:first-child):before {
    font-size: 0.8em;
    padding-top: 0.3em;
    position: relative;
  }
  td:last-child {
    padding-bottom: 1rem !important;
  }

  tr {
    background-color: white !important;
    border: 1px solid #FFC8A5;
    border-radius: 10px;
    box-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
    margin: 0.5rem 0;
    padding: 0;
  }

</style>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="200">

	<%@include file="/header.jsp"%>
		<div class="container">
			<div class="container-fluid col-md-12">
				<section class="sideBar col-md-3">
					<a href="independenceList.do"><b>독립유공자 공훈록</b></a>
					<hr>
					<a href="#"><b>별들의 발자취</b></a>
					<hr>
					<b>별 보러 가자</b>
					<hr>
				</section>
				<section class="contents col-md-9">
					<c:forEach items="${hList }" var="hList">
					<section class="contents project-card">
						<img src="resources/hupLoadFile/${hList.renameFilename }">
						<section class="project-explain">
							<table class="table">
									<tr>
										<th></td>
										<th></td>
										<th>사적지 이름</td>
										<th>${hList.siteName }</td>
									</tr>
									<tr>
										<td class="colored"><b>사적지 타입</b></td>
										<td><b>${hList.siteType }</b></td>
										<td class="colored"><b>사적지 이름</b></td>
										<td>${hList.siteName }}</td>
									</tr>
									<tr>
										<td class="colored" colspan="2"><b>설명</b></td>
										<td colspan="2">${hList.siteContents }</td>
									</tr>
									<tr>
										<td class="colored" colspan="2"><b>주소</b></td>
										<td>${hList.siteAddr }</td>
									</tr>
							</table>
							
						</section>
					</section>
					</c:forEach>
					<section>
					<%@include file="/footer.jsp"%>
					</section>
					
				</section>

			</div>
		</div>


	


	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
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