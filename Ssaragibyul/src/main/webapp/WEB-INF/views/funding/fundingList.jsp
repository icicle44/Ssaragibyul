<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	font-size:13px;
	font-family: 'Noto Serif KR', serif;
}
a{
	text-decoration: none;
}

.btn{
	margin: auto;
	font-family: 'Noto Serif KR', serif;
	text-align: center;
}
.#name_css{
	text-align: left; 
	padding-right:10px; 
	font-weight:bold; 
	font-size:13px; 
	color:DimGray;
}
.nothing{
 color:white;
}
#bar_td{
	width:100%;
	text-align: left; 
	margin:auto;
}
#svg{
	height:7px; 
	width: 350px;
}
#dday_css{
	float:left; 
	width : 50%;
	font-size:15px;
}
#sum_css{
	float:right;
	width : 50%;
	text-align: right; 
	font-size:15px;
}
.select{
	float:left;
	height: 40px;
	margin-right: 10px;
	border-radius: 5px;
    border: 1px solid rgb(104, 104, 104);
    color: rgb(104, 104, 104);
    font-weight:450;
    text-align: center;
    font-size:16px;
}
/* #head{
	width : 1547px;
} */
#pj_search{
    width : 100%;
    float:right;
   	padding-left: 72%;
    margin-bottom: 30px;
    font-family: 'Noto Serif KR', serif;
}
#frmpj{
}
.scan{
    float: left;   
    border: 1px solid rgb(104, 104, 104);
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
    width: 190px;
    height: 40px;
}
input::-webkit-input-placeholder {
	color:gray;
	font-size:16px;
}

.search{
    float: left;
    height: 40px;
    width: 60px;
   	font-size:16px;
    border: 1px solid rgb(104, 104, 104);
    border-left: none;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
    color: white;
    background-color: rgb(104, 104, 104);
}

.search:hover{
	background-color:  rgb(80, 80, 80);
}

.search:active{
	background-color:  rgb(70, 70, 70);
}
#headFont{
	font-size:30px;
	margin-left: -30px;
}
</style>


<body data-spy="scroll" data-target=".site-navbar-target" data-offset="200">
	
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
      <!-- 프로젝트 사이즈 고정하고 가운데로 가게 하는법 알아오기... -->
	<main class="main-content">
		<div class="container-fluid">
			<!-- 펀딩 프로젝트 -->
			<div style="height: 1080px; padding-top: 200px;">
				<section class="row align-items-stretch photos " id="section-funding1">
				<div id="head">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a id="headFont">진행중 프로젝트</a></div>	<!-- <!--  --><!-- //////////////////////////////////////////////////////////////////////////////////////////// --><!--  --> <!-- -->
		   	<div id="pj_search">
		   		   <select id = "chose1" class="select" onchange="location.href=this.value">
		   		   	 <option value = "" selected>선택</option>
				       <option value = "fundingList.do">최신글 순</option>
				       <option value = "fundingSelectMoney.do">모금액 순</option>
				       <option value = "fundingSelectLike.do">좋아요 순</option>
				</select>
				<form action="fundingSearch_1.do" method="get" >
					<input type="text" name="searchValue" class="scan" value="${search.searchValue }" placeholder="검색어를 입력해주세요." style="font-family: 'Noto Sans KR', sans-serif'">
					<input type="submit" class="search" value="검색" style="font-family: 'Noto Sans KR', sans-serif'">
					</form>
			<!--  JS, 리다이렉트 URL -->
					</div>
					<div class="col-12 justify-content-center">
						<div class="row align-items-stretch">
						
				<div class="gridmain">
		 <c:forEach var="p" items="${fListandFile}" varStatus="status"> 
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
	</div>
	<br>
	<!--  -->
	<br><br><br><br><br><br><br>
	<c:if test="${fn:length(fListandFile) > 6}">
 </c:if> 
  <c:if test="${fn:length(fListandFile) <= 6 }">
   <button class="btn" onclick="location.href ='fundingListFullEnd.do'">프로젝트 더 보기</button>
 	</c:if> 
				</section>
				<!--  -->
				<!-- #section-funding -->
				<section class="row align-items-stretch photos " id="section-funding2">
				<div id="head">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a id="headFont">종료된 프로젝트</a></div><!-- <!--  --><!-- //////////////////////////////////////////////////////////////////////////////////////////// --><!--  --> <!-- -->
		    	<div id="pj_search">
		   		   <select id = "chose2" class="select" onchange="location.href=this.value">
		   		       <option value = "" selected>선택</option>
				       <option value = "fundingList.do" >최신글 순</option>
				       <option value = "fundingSelectMoneyEnd.do">모금액 순</option>
				       <option value = "fundingSelectLikeEnd.do">좋아요 순</option>
				</select>
				<form action="fundingSearch_2.do" method="get" >
					<input type="text" name="searchValue" class="scan" value="${search.searchValue }" placeholder="검색어를 입력해주세요." style="font-family: 'Noto Sans KR', sans-serif'">
					<input type="submit" class="search" value="검색" style="font-family: 'Noto Sans KR', sans-serif'">
				</form>
			<!--  JS, 리다이렉트 URL -->
					</div>
					<div class="col-12 justify-content-center">
						<div class="row align-items-stretch">
				<div class="gridmain">
		 <c:forEach var="e" items="${fListandFileEnd}" varStatus="status"> 
			<div class="col-6 col-md-6 col-lg-4" data-aos="fade-up" data-no=${e.projectNo } id = "frame">
			<table class="display" id="example">
				<tr>
					<td> 
					    <a href="resources/upLoadFile/${e.fundingFile.fileMainName}" class="d-block photo-item" data-fancybox="gallery"> 
						<img src="resources/upLoadFile/${e.fundingFile.fileMainName}" alt="Image" class="img-fluid" style="width:400px;, height:300px;">
						<div class="photo-text-more">
						<span class="icon icon-search">${e.subjectName}"</span>
						</div></a></td>
		 			</tr>
		 			<tr>
		 			<td align = "right">
								<img src="resources/img/images/likeHeart.png" style="width:18px;, height:18px;">
								<span style="color:DimGray; font-size:14px; padding-top:20px; color: #EB5C01; font-weight: bold;">${e.likeCount}</span>
						</td>
						</tr>
					<tr>
						<td>
						<c:url var="fDetail" value="fundingDetail.do">
						<c:param name="projectNo" value="${e.projectNo }"></c:param>
						</c:url> 
						<a href="${fDetail }" style="font-size : 1.5em">${e.subjectName }</a>
						</td>
					</tr>
				 <tr>
				<td colspan="2" id="bar_td">
							<c:if test="${e.percent >99}">
								<svg id="svg">
									<rect x="0" y="0" fill="#efefef" height="4" width="100%"></rect>
									<rect x="0" y="0" height="4" width="100%" fill="#045FB4"></rect>
								</svg>
							</c:if>
			
							<c:if test="${e.percent < 100}">
								<svg id="svg">
									<rect x="0" y="0" fill="#efefef" height="4" width="100%"></rect>
									<rect x="0" y="0" height="4" width="${e.percent}%" fill="#045FB4"></rect>
								</svg>
							</c:if>
						</td>
					</tr>
				    <tr>
						<td id="dday_css">
						<img src="resources/img/images/calenderImage.jpg" style="width:18px;, height:18px;">
						<c:if test="${e.leftDate < 1}"><b>마감</b></c:if>
						<c:if test="${e.leftDate > 1}"><b>${p.leftDate}</b>일 남음</c:if>
						</td>
						<td id="sum_css"><b><fmt:formatNumber value="${e.sumMoney}" pattern="#,###"/>원 , </b>
						<span id="percent_css" style="color:orange;, font-size:12px;"> 달성률 : ${e.percent}%</span>
					</td>
					</tr> 
				</table>
				</div>
			 </c:forEach> 
			 </div>
		</div>
	</div>
	<br>
	<!--  -->
	<br><br><br><br><br><br><br>	
	
	
<c:if test="${fn:length(fListandFileEnd) > 6 }">

 	</c:if> 
 <c:if test="${fn:length(fListandFileEnd) <= 6 }">
  <button class="btn" onclick="location.href ='fundingListFullEnd.do'">프로젝트 더 보기</button>
 	</c:if> 
<!-- <button class="btn" onclick="getMoreFundingList()">프로젝트 더 보기</button> -->
				</section>
	<br>
	<br>
	<br>	<br>
	<br>
	<br>

 		<%@include file="../../../footer.jsp" %>
	
	</main>
<!-- 	  											내가 해야 하는 AJAX ! 
	$("div:last").attr("data-no")
	var lastNo
	<script>
	function getMoreFundingList() {
		var projectNo = '${funding.projectNo }'
		$.ajax({
			url : "fundingListMore.do",  
			type : "post",
			data : { "projectNo(Cont)" : projectNo },
			dataType : "json",
			success : function(data) {
				var $tableBody = $("#rtb tbody");
				$tableBody.html(""); // 비워주기
				var $tr;
				var $rWriter;
				var $rContent;
				var $rCreateDate;
				var $btnArea;
				$("#rCount").text("댓글 (" + data.length + ")"); // 댓글 갯수 표시
				if(data.length > 0) {
					for(var i in data) {
						$tr = $("<tr>");
						$rWriter = $("<td width='100'>").text(data[i].userId);
						$rContent = $("<td>").text(data[i].contents);
						$rCreateDate = $("<td width='100'>").text(data[i].enrollDate);
						$btnArea = $("<td>")
						.append("<a href='#' onclick='modifyReply(this,"+projectNo+","+data[i].replyNo+",\""+data[i].contents+"\");'>수정 </a>")							
						.append("<a href='#' onclick='removeReply("+projectNo+","+data[i].replyNo+");'> 삭제</a>");
						$tr.append($rWriter);
						$tr.append($rContent);
						$tr.append($rCreateDate);
						$tr.append($btnArea);
						$tableBody.append($tr);
					}
				}
			},
			error : function() {
				alert("죽어!");
			}
		});
	}
	</script>
 -->  
	<!-- .site-wrap -->
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  -->   <script src="/resources/js/jquery-3.3.1.min.js"></script>
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

	<script src="/resources/js/jquery.fancybox.min.js"></script>

	<script src="/resources/js/main.js"></script>
		<script src="/resources/js/fundingList.js"></script>

</body>
</html>