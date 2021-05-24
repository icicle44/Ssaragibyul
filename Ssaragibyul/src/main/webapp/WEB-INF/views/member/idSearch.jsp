<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/member/idSearch.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
</head>
    <body>
    <header>
    	<jsp:include page="../../../header.jsp"/>
    </header>
    <form action="findId.do" method="post">
        <div class="contents">
            <h2 align="center" id="h2">아이디 찾기</h2>
            <div class="coment">
                <p id="p">싸라기별에서는 가입하신 이름과 이메일을 입력하시면 아이디를 확인하실 수 있습니다.</p>
            </div>
            <div class="input">
            <div class="id">
                <input type="text" name="userName" id="userName" placeholder="이름을 입력해주세요.">
            </div>
            <div class="email">
                <input type="email" name="userEmail" id="userEmail" placeholder="이메일을 입력해주세요.">
            </div>
            <div class="btn">
                <input type="submit" value="아이디 찾기" id="idSearch">
            </div>
            <div>
                <p id="pwSearch"><a href="pwSearch.do" id="pwSearch">비밀번호 찾기</a></p>    
            </div>
            </div>
        </div>
    </form>
    <footer>
    	<jsp:include page="../../../footer.jsp"/>
    </footer>
    	<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    </body>
</html>