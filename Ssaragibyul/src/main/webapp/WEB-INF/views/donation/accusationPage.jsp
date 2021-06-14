<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>신고하기</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700,900|Oswald:400,700" rel="stylesheet">
<link rel="stylesheet" href="/resources/fonts/flaticon/font/flaticon.css">

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
<style>
.header-bar ul li a {
	font-size: 17px;
}
.main-menu{
	font-family: 'Noto Serif KR', serif;
}
form{
	font-family: 'Noto Serif KR', serif;
}

.getstarted {
	background: #EB5C01;
	padding: 10px 100px;
	margin: 20px;
	margin-left: 140px;
	border-radius: 4px;
	color: #fff;
}

::placeholder{
	color: #9F9F9F;
}

.btn{
	background: #EB5C01;
	text-align:center;
	width:200px;
	height:40px;
	margin-left:250px;
	margin-top:60px;
	border-radius: 4px;
	color: #fff;
	border: none;
}

.btn:hover{
	background-color: #E35901;
	border:none;
	outline: none;
}

.btn:active{
	background-color: #D75909;
	border:none;
	outline: none;
}

#cont{
	width: 1000px;;
	height: 600px;
	border: 1px solid gray;
    border-radius: 20px;
    background-color: white;
    margin-bottom: 15px;
}

form {
	margin: 20px 40px;
}

font{
	margin: 3px;
}
</style>
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
				<li><a class="nav-link" style="color: #F1512F"><strong>신고하기</strong></a></li>
			</ul>
		</div>
	</header>

      <!-- 프로젝트 사이즈 고정하고 가운데로 가게 하는법 알아오기... -->
	<main class="main-content">
	<br><br><br>
	 <section class="site-section" id="section-contact">
     	<div class="container">
        	<div class="row justify-content-center">
          		<div class="col-md-8" id="cont">
					<form action="accusation.do"" method="post" >
                   			<div style="margin-top: 30px;">
                   				<span style="font-size: 19px; font-weight: bold;"> 신고 게시물 </span><br><hr>
                   				<span> ${donation.subjectName }</span>
                   			</div><br>

                   		<div class="row form-group">
                    		<div class="col-md-8 mb-4 mb-md-0">
                        		<label for="fname" style="font-size: 19px; font-weight: bold;">신고 유형을 골라주세요</label><hr>
                        			<div style="margin-bottom: 10px;">여러 사유에 해당될 경우, 대표적인 사유 1개를 선택해 주세요.</div>
                        			&nbsp;&nbsp;&nbsp;
                        			<input type="radio" name="reportCode" value="0"/><font> 지적 재산권 침해</font> <br>
									&nbsp;&nbsp;&nbsp;		
									<input type="radio" name="reportCode" value="1"/><font> 허위사실 유포</font> <br>
									&nbsp;&nbsp;&nbsp;
									<input type="radio" name="reportCode" value="2"/><font> 동일 제품의 타 채널 유통</font> <br>
									&nbsp;&nbsp;&nbsp;
									<input type="radio" name="reportCode" value="3"/><font> 싸라기별 커뮤니티 정책 위반</font> <br>
									&nbsp;&nbsp;&nbsp;
									<input type="radio" name="reportCode" value="4"/><font> 기타</font> <br><hr>
                      		</div>
						</div>

						<div class="row form-group mb-7">
                      		<div class="col-md-12">
                        		<label  for="message" style="font-weight: bold;">기타에 경우, 신고 내용을 상세히 적어주세요.</label><br>
                      				<textarea name="reportContent" rows="3" cols="45" wrap="virtual" placeholder="해당 신고는 싸라기별 운영자에게 전달됩니다." style="resize: none;"></textarea>		
                     		 </div>
                   		</div>
                   		<input type="hidden" value="${donation.projectNo }" name="projectNo">
                    	<input type="hidden" value="${loginUser.userId }" name="userId">

                   		<div class="row form-group">
                      		<div class="col-md-12">
                        		<input type="submit" value="신고하기" class="btn" >
							</div>
                   		</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<%@include file="../../../footer.jsp" %>
	</main>

	<!-- .site-wrap -->
 	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
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

	<script src="/resources/js/jquery.fancybox.min.js"></script>

	<script src="/resources/js/main.js"></script>
</body>
</html>