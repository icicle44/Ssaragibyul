<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>기부 제안 수정</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700,900|Oswald:400,700" rel="stylesheet">
	<link rel="stylesheet" href="fonts/icomoon/style.css">
	<link rel="stylesheet" href="/resources/fonts/flaticon/font/flaticon.css">

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
	
	<link href="https://cdn.quilljs.com/1.0.0/quill.snow.css" rel="stylesheet">
	
	<!-- Theme included stylesheets -->
	<link href="//cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">

</head>

<style>
.getstarted {
	background: #EB5C01;
	padding: 10px 100px;
	margin: 20px;
	margin-left: 140px;
	border-radius: 4px;
	color: #fff;
}

.sug {
	margin: auto;
}

.main-menu {
	padding-left: 50px;
} 
.div{
margin : auto;
}

.ql-toolbar{
	width : 500px;
}
.format{
	width : 500px;
	height : 400px;
}
</style>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="200"> 
	
	<%@include file="../../../header.jsp"%> 
	
	<header class="header-bar d-flex align-items-center site-navbar-target" data-aos="fade-right">

		<div class="d-inline-block d-lg-none ml-md-0 ml-auto py-3" style="position: relative; top: 3px;">
			<a href="#" class="site-menu-toggle js-menu-toggle text-white">
				<span class="icon-menu h3"></span>
			</a>
		</div>
		
		<!-- style="color: #EB5C01" -->
		<div class="main-menu">
			<ul class="js-clone-nav">
				<li><a class="nav-link" style="color: #000061"><strong>프로젝트 수정</strong></a></li>
				<li><a href="#sectionSuggest1" class="nav-link">1. 기본정보</a></li>
				<li><a href="#sectionSuggest2" class="nav-link">2. 스토리</a></li>
				<li><a href="#sectionSuggest3" class="nav-link">3. 안내사항</a></li>
			</ul>
		</div>
	</header>
	

	<main class="main-content">
		<form action="donationUpdate.do" method="post" enctype="multipart/form-data" id="postForm">
		<br><br><br><br> <br><br><br><br>

			<section id="sectionSuggest1">
			<br><br><br><br>
				<div>
					프로젝트명
				</div>
				<div>
					<input type="text" name="subjectName" value="${donation.subjectName }">
				</div>
				<div>
					목표 금액
				</div>
				<div>
					<input type="text" name="goalMoney" value="${donation.goalMoney }">
				</div>
				<div>
					진행 기간
				</div>
				<div> 
					<script>	 	
					let today = new Date();   

					let year = today.getFullYear(); // 년도
					let month = today.getMonth() + 1;  // 월
					let date = today.getDate();  // 날짜
					let day = today.getDay();  // 요일

					document.write(year + '/' + month + '/' + date)
					</script> ~ 	
					<input type="date" name="finDate" value="${donation.finDate}">
				</div>
				
				<div>
					대표 이미지
				</div>
				<div>
					<input type="file" name="reloadFileMain">
					<br>
					기존 파일 : ${donation.donationFile.fileName }
				</div>
				<br><br><br><br><br><br><br>
				<a class="getstarted scrollto" href="#sectionSuggest2" style="text-decoration: none;">다음단계</a>
			</section>

			<br><br><br><br><br><br><br>

			<section id="sectionSuggest2">
			<br><br><br><br>
				<div>
					동영상 주소
				</div>
				<div>
					<input type="text" name="videoUrl" value="${donation.donationFile.videoUrl }">
				</div>
				<div>
				 	이미지 등록
				</div>
				<div>
				 	<input type="file" name="uploadFileSub1">  <br>
				 		 기존 서브 파일1: ${donation.donationFile.fileSub1Name }<br>
				    <input type="file" name="uploadFileSub2">	<br>
				    	 기존 서브 파일1: ${donation.donationFile.fileSub2Name }
				</div>
				<div>
					프로젝트 스토리
				</div>
				<input type="hidden" name="projectStory">
				<input type="hidden" name="uploadImage">
				<div id="editor" class="format">${donation.projectStory}</div>
				
				<br><br><br><br><br><br><br>
				<a class="getstarted scrollto" href="#sectionSuggest3" style="text-decoration: none;">다음단계</a>
			</section>

			<br><br><br><br><br><br><br><br><br>

			
			<section id="sectionSuggest3">
				<br><br><br><br>
				<div>
					환불 정책 안내 사항
				</div>
				
				<div>
					<textarea name="warningIntro" rows="6" cols="30" wrap="virtual">${donation.warningIntro }</textarea>
				</div>
				<div>
					문의 가능한 번호
				</div>
				<div>
					<input type="text" name="">
				</div>
				<div>
					문의 이메일
				</div>
				<div>
					<input type="text" name="">
				</div>
				<input type = "hidden" name="projectNo" value="${donation.projectNo }">
			</section>
			<br><br><br><br><br><br>
			<input type="button" id="submit-btn" value="작성완료" class="getstarted scrollto" style="text-decoration: none;">

		</form>

		<%@include file="../../../footer.jsp"%>
		
	</main>


	<!-- .site-wrap -->

	<!-- Initialize Quill editor -->
	<script src="//cdn.quilljs.com/1.3.6/quill.min.js"></script>
	<script src="/resources/js/image-upload.min.js"></script>
	<script src="/resources/js/image-resize.min.js"></script>

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
	<script src="https://unpkg.com/aos@next/dist/aos.js"></script>

	<script src="/resources/js/jquery.fancybox.min.js"></script>

	<script src="/resources/js/main.js"></script>
	
	<script src="/resources/js/fundingSug.js"></script>
	
</body>
</html>