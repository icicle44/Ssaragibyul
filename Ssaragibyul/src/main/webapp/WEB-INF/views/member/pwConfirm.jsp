<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<link rel="stylesheet" type="text/css" href="/resources/css/member/pwConfirm.css">
</head>
<body>
    <jsp:include page="../../../header.jsp"/>
        <div class="background">
        <div class="contents">

            <!--오른쪽 내용 : 마이페이지 수정할 때 여기만 고치면 됨-->
            <div class="rightCon">
                <h2 align="center" id="h2">비밀번호 확인</h2>
                <form action="#" method="post">
                    <div id="text">
                        <input type="password" name="userPw" id="userPw" placeholder="비밀번호를 입력해주세요.">  
                    </div>
                    <div id="btns">
                        <input type="button" id="sudmit" value="확인" onclick="fnPwConfirm()">
                    </div>
                </form>
            </div>
        </div>
    </div>
>
    <footer>
    	<jsp:include page="../../../footer.jsp"/>
    </footer>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	    <script>
	 	function fnPwConfirm() {
    		var userPw = $("#userPw").val();
    		var sessionPw = '<c:out value="${sessionScope.loginUser.userPw}"/>';
    		
    		if(sessionPw == userPw) {
	    		location.href = "userUpdate.do";
	    		return;
    		}
    		alert("비밀번호가 일치하지 않습니다. \n다시 입력해 주세요.");
   		}
   	</script>
</body>
</html>