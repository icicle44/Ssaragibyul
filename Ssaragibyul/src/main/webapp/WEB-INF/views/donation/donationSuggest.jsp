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
	<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700,900|Oswald:400,700" rel="stylesheet">
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
.main-content, .main-menu{
	font-family: 'Noto Serif KR', serif;
}

#postForm{
	margin-left: 150px;
	color: #505050
}


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
	width :  720px;
}
.format{
	width : 720px;
	height : 400px;
}

/*  */

#project-title{
	font-size: 18px; 
	font-weight: bold; 
	color: #1D1D1D
}

#title, #goal, #date, #video, #tel, #email{
	margin-top: 10px;
	width: 350px;
}

#editor{
	margin-top: 10px;
}

.input-file-button{
  padding: 6px 25px;
  border-radius: 4px;
  background-color: #DFDFDF;
  cursor: pointer;
}

.input-file-button:hover{
	background-color: #CACACA;
	border:none;
}

.input-file-button:active{
	background-color: #ADADAD;
	border:none;
}

#input-file{
	display: none;
}

#btn{
	margin-left: 200px;
}

#submit-btn:hover{
	background-color: #E35901;
	border:none;
}

#submit-btn:active{
	background-color: #D75909;
	border:none;
}
.guide{
	margin: 10px 0px;
	background-color: #FAFAFA;
	height: auto;
	width: 720px;
	font-size: 14px;
}

::placeholder{
	color: #BCBCBC;
}

#waring{
	margin-top: 10px;
	width: 590px;
	height: auto;
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
				<li><a class="nav-link" style="color: #000061"><strong>프로젝트 만들기</strong></a></li>
				<li><a href="#sectionSuggest1" class="nav-link">1. 기본정보</a></li>
				<li><a href="#sectionSuggest2" class="nav-link">2. 스토리</a></li>
				<li><a href="#sectionSuggest3" class="nav-link">3. 안내사항</a></li>
			</ul>
		</div>
	</header>
	

	<main class="main-content">
		<form action="donationRegister.do" method="post" enctype="multipart/form-data" id="postForm">
		<br><br><br><br><br><br><br><br>  
			<section id="sectionSuggest1">
				<br><br><br>
				<span id="project-title">프로젝트명</span><br>
				<span>프로젝트의 주제와 특징이 드러나는 제목을 붙여주세요.</span><br>
				<div>
					<input type="text" name="subjectName"  id="title" maxlength="50" placeholder="50자 이내로 작성해주세요." >
					<span id="counter">( 0 / 50 )</span>
				</div><br>
				<span id="project-title">목표 금액</span><br>
				<span>최소 100,000원 이상이어야 합니다.</span><br>
				<div>
					<input type="text" name="goalMoney" id="goal"> 원
				</div><br>
				<span id="project-title">진행 기간</span><br>
				<span>최소 7일부터 최대 60일까지 가능합니다. </span><br>
				<div id="date"> 
					<script>	 	
					let today = new Date();   

					let year = today.getFullYear(); // 년도
					let month = today.getMonth() + 1;  // 월
					let date = today.getDate();  // 날짜
					let day = today.getDay();  // 요일

					document.write(year + ' / ' + month + ' / ' + date)
					</script> ~ 	
					<input type="date" name="finDate">
				</div>
				<br>
				
				<span id="project-title">대표 사진</span><br>
				<span>홈페이지와 외부 공유를 했을 때 보여집니다. 프로젝트를 한 눈에 나타낼 수 있는 이미지를 등록해주세요.</span><br><br>
				<div>
					<input type="file" name="uploadFile" id="input-file" style="display:none">
					<label class="input-file-button" for="input-file">파일선택</label>
					<span id="fileName1" class="filname">선택된 파일없음</span><br>
				</div>
				<br><br>
				<a class="getstarted scrollto" href="#sectionSuggest2" style="text-decoration: none;" id="btn">다음단계</a>
			</section>

			<br><br><br><br><br><br><br>

			<section id="sectionSuggest2">
			<br><br><br><br>
				<span id="project-title">동영상 주소</span><br>
				<span>프로젝트를 소개할 수 있는 동영상의 주소를 적어주세요.</span><br>
				<div>
					<input type="text" name="videoUrl" id="video">
				</div><br>
				
				<span id="project-title">이미지 등록</span><br>
				<span>프로젝트를 한 눈에 나타낼 수 있는 이미지를 등록해주세요</span><br><br>
				<div>
					<!-- 	 	
					<input type="file" name="uploadFileSub1">  <br>
				    <input type="file" name="uploadFileSub2">
				     -->
				    
				    <input type="file" name="uploadFileSub1" id="input-file" style="display:none">
					<label class="input-file-button" for="input-file">파일선택</label>
					<span id="fileName1" class="filname">선택된 파일없음</span><br>
					
					<input type="file" name="uploadFileSub2"id="input-file" style="display:none">
					<label class="input-file-button" for="input-file">파일선택</label>
					<span id="fileName1" class="filname">선택된 파일없음</span><br>
				</div><br>
				
				<span id="project-title">프로젝트 스토리</span><br>
				<span>프로젝트를 소개하고, 준비하는 과정에서 후원자에게 들려주고 싶었던 이야기를 진솔하게 전달해주세요.</span><br>
				<div class="guide">
					- Enter(↵) : 문단 나눔, Shift + Enter : 줄바꿈입니다.<br>
					- ctrl+c/v를 이용해 선택한 이미지를 복사/붙여넣기 할 수 있습니다.<br>
					- 이미지와 영상은 꼭 버튼을 이용하여 첨부해주세요.
				</div>
				
				<input type="hidden" name="projectStory">
				<input type="hidden" name="uploadImage">
				<div id="editor" class="format"></div>
				
				<br><br><br><br><br><br><br>
				<a class="getstarted scrollto" href="#sectionSuggest3" style="text-decoration: none;" id="btn">다음단계</a>
			</section>

			<br><br><br><br><br><br><br><br><br>

			
			<section id="sectionSuggest3">
				<br><br><br><br>
				<span id="project-title">환불 정책 및 안내 사항</span><br>
				<span>프로젝트 진행 과정에서 발생할 수 있는 위험 요소를 고려하여 신중히 설정해주세요. <br>예기치 못한 분쟁이 발생할 경우 중요한 기준이 됩니다.</span><br>
				
				<div>
					<textarea name="warningIntro" rows="5" wrap="virtual" id="waring" maxlength="1500" style="resize: none;" placeholder="환불 및 교환 정책을 꼭 작성해주세요."></textarea>
					<span id="counter2">( 0 / 1500)</span>
				</div>
				
				<span id="project-title">문의 번호</span><br>
				<span>후원자의 문의를 받을 수 있는 번호를 입력해주세요.</span><br>
				<div>
					<input type="text" id="tel">
				</div>
				
				<span id="project-title">문의 이메일</span><br>
				<span>후원자의 문의를 받을 수 있는 번호를 입력해주세요.</span><br>
				<div>
					<input type="text" id="email">
				</div>
				<div>
					<input type="hidden" name="userId" value="${loginUser.userId }"></td>
				</div>
			</section>
			
			<input type="button" id="submit-btn" value="작성완료" class="getstarted scrollto" style="text-decoration: none;
			 margin-left: 200px; border: none; padding: 10px 100px; border-radius: 4px;">
		</form>
		<br><br>

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
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
	<script>
	/* 제목 글자수 체크 */
	 $(document).ready(function() {
         $('#title').keyup(function (e){
              var content = $(this).val();
              $('#counter').html("("+content.length+" / 50자)");    //글자수 실시간 카운팅
          });
         
      });
	 
	/* 환불 정책 및 안내 사항 글자수 체크  */
	 $(document).ready(function() {
         $('#waring').keyup(function (e){
              var content = $(this).val();
              $('#counter2').html("("+content.length+" / 1500자)");    //글자수 실시간 카운팅
          });
         
      });
	 
	 /* 파일을 선택했을 때 파일명이 옆에 뜨도록 하는 것 */
	 document.getElementById('input-file').addEventListener('change', function(){
			var filename = document.getElementById('fileName1');
			if(this.files[0] == undefined){
				filename.innerText = '선택된 파일없음';
				return;
			}else{
			filename.innerText = this.files[0].name;
				
			}
		});
	</script>
</body>
</html>