<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>제안하기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700,900|Oswald:400,700"
	rel="stylesheet">
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet"
	href="/resources/fonts/flaticon/font/flaticon.css">

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
</style>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="200"> 
<div id="summernote">Hello Summernote</div><!-- header 지우면 보임 다른 위치로 가면 아예 안뜸;;; 이유 모름 ㅜㅠㅜㅠㅜㅜㅠ  -->
		 		<script>
					 $('#summernote').summernote({
					      		placeholder: 'Hello Bootstrap 4',
					      			 tabsize: 2,
					       		 height: 100
					      });
				</script>
<!-- 	<form method="post">
	       <textarea id="summernote" name="hostIntro">       </textarea>
	       </form> -->
	<%-- <%@include file="introduce.jsp" %> --%>
	<%@include file="../../../header.jsp"%> 
	
	<header class="header-bar d-flex align-items-center site-navbar-target"
		data-aos="fade-right">

		<div class="d-inline-block d-lg-none ml-md-0 ml-auto py-3"
			style="position: relative; top: 3px;">
			<a href="#" class="site-menu-toggle js-menu-toggle text-white"><span
				class="icon-menu h3"></span></a>
		</div>
		<!-- style="color: #EB5C01" -->
		<div class="main-menu">
			<ul class="js-clone-nav">
				<li><a class="nav-link" style="color: #000061"><strong>프로젝트 만들기</strong></a></li>
				<li><a href="#sectionSuggest1" class="nav-link">1. 기본정보</a></li>
				<li><a href="#sectionSuggest2" class="nav-link">2. 스토리</a></li>
				<li><a href="#sectionSuggest3" class="nav-link">3. 리워드</a></li>
				<li><a href="#sectionSuggest4" class="nav-link">4. 안내사항</a></li>
			</ul>
		</div>
	</header>
	

	<main class="main-content">
		<form action="fundingRegister.do" method="post" enctype="multipart/form-data">
		<br>
				<br>
				<br>
				<br> <br>
				<br>
				<br>
				<br>

			<section id="sectionSuggest1">
				<br><br><br><br>
				<table width="550" cellspacing="10" class="sug">
					<tr>
						<td>프로젝트명</td>
						<td></td>
					</tr>
					<tr></tr>
					<tr>
						<td><input type="text" name="subjectName"></td>
					</tr>
					<tr>
						<td>목표 금액</td>
					</tr>
					<tr>
						<td><input type="text" name="goalMoney"></td>
					</tr>
					<tr>
						<td>진행 기간</td>
					</tr>
					<tr>
						<td><script>let today = new Date();   

						let year = today.getFullYear(); // 년도
						let month = today.getMonth() + 1;  // 월
						let date = today.getDate();  // 날짜
						let day = today.getDay();  // 요일

						document.write(year + '/' + month + '/' + date)</script> ~
						<input type="date" name="finDate"></td>
					</tr>
					<tr>
						<td>대표 이미지</td>
					</tr>
					<tr>
						<td><input type="file" name="uploadFileMain"></td>
					</tr>
				</table>
				<br><br><br><br><br><br><br>
			<a class="getstarted scrollto" href="#sectionSuggest2" style="text-decoration: none;">다음단계</a>
			</section>

			<br><br><br><br><br><br><br>

			<section id="sectionSuggest2">
							<br><br><br><br>
				<table width="550" cellspacing="10" class="sug">
				<tr>
						<td>동영상 주소</td>
					</tr>
					<tr></tr>
					<tr>
						<td><input type="text" name="videoUrl"></td>
					</tr>
					<tr>
						<td> 이미지 등록</td>
					</tr>
					<tr>
						<td> <input type="file" name="uploadFileSub1">  
						    <input type="file" name="uploadFileSub2"></td>
					</tr>
					<tr>
						<td>프로젝트 스토리</td>
					</tr>
					<tr>
						<td><textarea name="projectStory" rows="6" cols="30" wrap="virtual"></textarea>							  </td>
					</tr>
					
				</table>
				

				
				<br><br><br><br><br><br><br>
			<a class="getstarted scrollto" href="#sectionSuggest3" style="text-decoration: none;">다음단계</a>
			</section>

		<br><br><br><br><br><br><br><br><br>

			<section id="sectionSuggest3">
			<br><br><br><br>
				<table width="550" cellspacing="10" class="sug">
					<tr>
						<td>리워드 금액</td>
					</tr>
					<tr>
						<td><input type="text" name="optionPrice"></td>
					</tr>
					<tr>
						<td>리워드 제공 가능 수</td>
					</tr>
					<tr>
						<td><input type="text" name="optionLimit"></td>
					</tr>
					<tr>
						<td>리워드 제목</td>
					</tr>
					<tr>
						<td><input type="text" name="productName"></td>
					</tr>
										<tr>
						<td>리워드 내용</td>
					</tr>
					<tr>
						<td><textarea name="productContent" rows="6" cols="30" wrap="virtual"></textarea></td>
					</tr>
						<tr>
						<td>배송지 필요여부</td>
					</tr>
					<tr>
						<td><input type="button" name="" value="예">
							<input type="button" name="" value="아니요">
						</td>
					</tr>
									<tr>
						<td>예상 배송일</td>
					</tr>
					<tr>
						<td><input type="date" name="deleiveryDate"></td>
					</tr>
				</table>
					<br><br><br><br><br>
			<a class="getstarted scrollto" href="#sectionSuggest4"
			style="text-decoration: none;">다음단계</a>
			</section>

		<br><br><br><br><br><br><br><br>

			<section id="sectionSuggest4">
				<br><br><br><br>
				<table width="550" cellspacing="10" class="sug">
					<tr>
						<td>환불 정책 안내 사항</td>
					</tr>
					<tr></tr>
					<tr>
						<td><textarea name="warningIntro" rows="6" cols="30" wrap="virtual"></textarea></td>
					</tr>
					<tr>
						<td>문의 가능한 번호</td>
					</tr>
					<tr>
						<td><input type="text" name=""></td>
					</tr>
					<tr>
						<td>문의 이메일</td>
					</tr>
					<tr>
						<td><input type="text" name=""></td>
					</tr>
					<tr>
					<td><input type="hidden" name="userId" value="${loginUser.userId }"></td>
					</tr>
				</table>
			</section>
		<br><br><br><br><br><br>
		<input type="submit" value="작성완료" class="getstarted scrollto" style="text-decoration: none;">


		</form>
<!-- 
		<a class="getstarted scrollto" href="fundingList.do"
			style="text-decoration: none;">뭘 쓰지</a>
			 -->
		
		<%@include file="../../../footer.jsp"%>
	</main>


	<!-- .site-wrap -->

	<!--  	<script src="/resources/js/jquery-3.3.1.min.js"></script> -->

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

</body>
</html>