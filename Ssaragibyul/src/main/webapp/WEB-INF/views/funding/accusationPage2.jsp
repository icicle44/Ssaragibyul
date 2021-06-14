<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>신고하자</title>
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

<link rel="stylesheet" href="/resources/css/style.css">

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
            <div class="col-md-8">
              <h2>Contact  ${funding.projectNo } ${loginUser.userId }</h2>

              <form action="accusationRegister.do" method="post" onSubmit="formChk();return true">
                    
                    

                    <div class="row form-group">
                      <div class="col-md-6 mb-3 mb-md-0">
                        <label for="fname">신고 유형을 골라주세요</label><br>
                        	<input type="radio" name="reportCode" value="0"/><font>지적 재산권 침해</font> <br>

							<input type="radio" name="reportCode" value="1"/><font>허위사실 유포</font> <br>

							<input type="radio" name="reportCode" value="2"/><font>동일 제품의 타 채널 유통</font> <br>

							<input type="radio" name="reportCode" value="3"/><font>싸라기별 커뮤니티 정책 위반</font> <br>

							<input type="radio" name="reportCode" value="4"/><font>기타</font> <br>
                      </div>
                    </div>


                    <div class="row form-group mb-5">
                      <div class="col-md-12">
                        <label  for="message">신고 내용을 상세히 적어주세요</label> <br>
                       <textarea name="reportContent" rows="6" cols="30" wrap="virtual" placeholder="신고사유를 적어주세여요"></textarea>		
                        <!-- <textarea name="message" id="message" cols="30" rows="7" class="form-control" placeholder="신고사유를 적어주세여요" name="reportContent"></textarea> -->
                      </div>
                    </div>
                    <input type="hidden" value="${funding.projectNo }" name="projectNo">
                    <input type="hidden" value="${loginUser.userId }" name="userId">

                    <div class="row form-group">
                      <div class="col-md-12">
                        <input type="submit" value="Send Message" class="btn btn-primary btn-md text-white">
                      </div>
                    </div>
						
        
                  </form>
            </div>
          </div>
        </div>
      </section>

 		<%@include file="../../../footer.jsp" %>
	</main>
	<script>
	function formChk(){
	    if(${!empty loginUser.userId }){
	      alert("신고가 완료되었습니다. 관리자의 추후 연락을 기다려주세요");
	    }else{
	       return false;
	    }
	   }
	</script>
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

</body>
</html>