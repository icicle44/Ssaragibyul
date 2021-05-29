<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 확인</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/member/idCheck.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
    <body>
    <header>
    	<jsp:include page="../../../header.jsp"/>
    </header>
    <form action="login.do" method="post">
        <div class="contents">
            <h2 align="center" id="h2">아이디 확인</h2>
            <div class="findId">
                <div id="coment1">
                    <p id="start">회원님의 아이디는</p>
                    <p id="userId">${userId}</p>
                    <p id="end">입니다.</p>
                </div>
                <div class="btn">
                    <input type="submit" value="로그인하기" id="loginBtn">
                </div>
            </div>
        </div>
    </form>
    <footer>
    	<jsp:include page="../../../footer.jsp"/>
    </footer>
    </body>
</html>