<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<title>별들의 발자취</title>
<%@include file="/header.jsp"%>
<style>
html, body, div, span, applet, object, iframes, h1, h2, h3, h4, h5, h6,
	p, blockquote, pre, a, abbr, acronym, address, big, quotes, code, del,
	dfn, em, img, ins, kbd, q, s, samp, small, strike, sub, sup, tt, var, u,
	i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table,
	caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
	output, ruby, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	do: inherit;
	vertical-align: baseline;
}
.sideBar{
	font-size: 15px;
	font-family: "Avenir Next", Avenir, 'Helvetica Neue', 'Lato', 'Segoe UI', Helvetica, Arial, sans-serif;
/* 	font-weight: 200; */
	float:left;
	padding-top:25em;
	color: #2b686e;
	text-align: center;
}
.contents{
	padding-top: 10em;
	margin-left: 5em;
}
article, aside, details, figcaption, figure, footer, header, hgroup,
	menu, nav, section {
	display: block;
}

blockquote, q {
	quotes: none;
}

blockquote : before, blockquote : after, q : before, q : after {
	content: '';
	content: none;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

/*css 초기화*/
.card {
	height: 400px;
	width: 450px;
	border-radius: 15px;
	display: inline-block;
	margin: 0.5em;
	position: relative;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	overflow: hidden;
}

.card-header {
	-webkit-transition: 0.5s; /*사파리 & 크롬*/
	-moz-transition: 0.5s; /*파이어폭스*/
	-ms-transition: 0.5s; /*인터넷 익스플로러*/
	-o-transition: 0.5s; /*오페라*/
	transition: 0.5s;
	width: 100%;
	height: 270px;
	border-radius: 15px 15px 0 0;
	/* background-image: url("/resources/img/visit/old-paper.png"); */
	background-size: 100% 280px;
	background-repeat: no-repeat;
}

.card:hover .card-header {
	opacity: 0.8;
	height: 100px;
}

.card-header-is_closed {
	background-color: #EF5A31;
	color: #FFF;
	font-weight: bold;
	text-align: center;
	float: right;
	margin: 15px 15px 0 0;
	border-radius: 50%;
	font-weight: bold;
	padding: 10px 10px;
	line-height: 20px;
}

h1 {
	color:#404040;
	font-size: 22px;
	font-weight: bold;
}

.card-body {
	padding: 0.15em;
	width: 30em;
}

.card-body-header {
	line-height: 25px;
	margin: 10px 20px 0px 20px;
}

.card-body-description {
	opacity: 0;
	color: #EB5C01;
	line-height: 25px;
	-webkit-transition: .2s ease-in-out; /*사파리&크롬*/
	-moz-transition: .2s ease-in-out; /*파이어폭스*/
	-ms-transition: .2s ease-in-out; /*익스플로러*/
	-o-transition: .2s ease-in-out; /*오페라*/
	transition: .2s ease-in-out;
	overflow: hidden;
	height: 180px;
	margin: 5px 20px;
}

.card:hover .card-body-description {
	opacity: 1;
	-webkit-transition: .5s ease-in-out;
	-moz-transition: .5s ease-in-out;
	-ms-transition: .5s ease-in-out;
	-o-transition: .5s ease-in-out;
	transition: .5s ease-in-out;
	overflow: scroll;
}

.card-body-hashtag {
	color: #2478FF;
	font-style: italic;
}

.card-body-footer {
	position: absolute;
	margin-top: 15px;
	margin-bottom: 6px;
	bottom: 0;
	width: 420px;
	font-size: 14px;
	color: #9FA5A8;
	padding: 0 15px;
}

.icon {
	display: inline-block;
	vertical-align: middle;
	margin-right: 2px;
}

.icon-view_count {
	width: 25px;
	height: 17px;
	background: url("images/eye.jpg") no-repeat;
}

.icon-comments_count {
	margin-left: 5px;
	width: 25px;
	height: 17px;
	background: url("images/comment.jpg") no-repeat;
}

.reg_date {
	float: right;
}
</style>

</head>

<body>
//변경
	<div class="container-fluid col-md-12">
		<section class="sideBar col-md-4">
			<b>독립유공자 공훈록</b>
			<hr>
			<a href="#"><b>별들의 발자취</b></a>
			<hr>
			<a href="visitList.do"><b>별 보러 가자</b></a>
<hr>
			<hr>
		</section>
		<section class="contents col-md-8">
			<c:forEach items="${hList }" var="hList">
			<div class="card">
				<!-- 카드 헤더 -->
				<div class="card-header" style="background-image: url('/resources/hupLoadFile/${hList.renameFilename }');">
					<div class="card-header-is_closed">
						<div class="card-header-text">방문</div>
						<div class="card-header-number">인증하기</div>
					</div>
				</div>
				<!--  카드 바디 -->
				<div class="card-body">
					<!--  카드 바디 헤더 -->
					<div class="card-body-header">
						<h1>${hList.siteName }</h1>
						<p class="card-body-hashtag">${hList.siteType }</p>
						<p class="card-body-nickname">${hList.siteAddr }</p>
					</div>
					<!--  카드 바디 본문 -->
					<p class="card-body-description">${hList.siteContents }
					</p>
					<!--  카드 바디 푸터 -->
					<div class="card-body-footer">
						<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
						<i class="icon icon-view_count"></i>조회 38회 <i
							class="icon icon-comments_count"></i>댓글 4개 <i class="reg_date">
							작성일 : ${hList.hCreateDate }</i>
					</div>
				</div>
			</div>
			</c:forEach>
		</section>
	</div>

</body>
</html>



