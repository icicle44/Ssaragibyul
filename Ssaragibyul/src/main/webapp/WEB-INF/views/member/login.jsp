<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/member/login.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Anton&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
</head>
    <body>
        <header>
   			<%-- <jsp:include page="../../../header.jsp"/> --%>
        </header>
        <jsp:include page="../../../header.jsp"/>
        <form action="memberLogin.do" method="get">
        <div class="frame">
        <div class='preload login--container'>
            <div class='login--form'>
                <div class='login--username-container'>
                    <input placeholder='아이디를 입력해주세요.' type='text' name="userId">
                </div>
                <div class='login--password-container'>
                    <input placeholder='비밀번호를 입력해주세요.' type='password' name="userPw">
                    <button class='js-toggle-login login--login-submit'>로그인</button>
                </div>
            </div>
            <div class='login--toggle-container'>
                <div class='js-toggle-login'>로그인하기</div>
            </div>
        </div>
        <div class="content2">
            <div id="join">
                	<div id="coment">아직도 싸라기별 아이디가 없으신가요?</div>
                  <a href="enrollView.do" id="link">
                    <div id="joinGo">회원가입 </div>
                  </a>
            </div>
            <div class="search">
                <a href="#" id="link">
                    <div id="idSearch">아이디 찾기</div>
                </a>
                <div id="or">/</div>
                <a href="#" id="link">
                    <div id="pwSearch">비밀번호 찾기</div>
                </a>
            </div>
        </div>
        </div>
        </form>
 			<jsp:include page="../../../footer.jsp"/>
        <footer>
        </footer>
        <script>
        !function(d,s,id){
            var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');
        </script>
        <script>    
        (function() {
        	  $(function() {
        	    $(".login--container").removeClass("preload");
        	    this.timer = window.setTimeout(() => {
        	    return $(".login--container").toggleClass("login--active");
        	    }, 3000);
        	    return $(".js-toggle-login").click(() => {
        	      window.clearTimeout(this.timer);
        	      $(".login--container").toggleClass("login--active");
        	      return $(".login--username-container input").focus();
        	    });
        	  });

        	}).call(this);

    </script>
    </body>
</html>