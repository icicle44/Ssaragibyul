<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/member/pwSearch.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700,900|Oswald:400,700" rel="stylesheet">
	<link rel="stylesheet" href="/resources/fonts/flaticon/font/flaticon.css">	
</head>
    <body>
    <header>
    	<jsp:include page="../../../header.jsp"/>
    </header>
    <form action="newPassword.do" id="pwsearch" method="post">
        <div class="contents">
            <h2 align="center" id="h2">비밀번호 찾기</h2>
            <div class="coment">
                <p id="p">싸라기별에서는 가입하신 아이디와 이메일을 입력하시면 임시 비밀번호를 이메일로 발송해드립니다.
				임시 비밀번호를 받으신 후 마이페이지에서 수정해주세요. </p>
            </div>
            <div class="input">
            <div class="id">
                <input type="text" name="userId" id="userId" placeholder="아이디를 입력해주세요.">
            </div>
            <div class="email">
                <input type="email" name="userEmail" id="userEmail" placeholder="이메일을 입력해주세요.">
            </div>
            <div class="btn">
                <input type="submit" value="임시 비밀번호 받기" id="pwSearch" onclick="searchBtn()">
            </div>
            </div>
        </div>
    </form>
    <footer>
    	<jsp:include page="../../../footer.jsp"/>
    </footer>
    	<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    	<script type="text/javascript">
		function search(){
			if(($("#userId").val()=null)&&($("#userEmail").val()!=null)){
				$("#pwsearch").submit();
			}else if(pwsearch.userId.value==null) {
				alert("아이디를 입력하세요.")
			}else if(pwsearch.userEmail.value==null) {
				alert("이메일주소를 입력하세요.")
			}
		
		}
		
        function searchBtn(){
        	if(!alert("가입한 이메일로 임시 비밀번호가 발송되었습니다.")) {
           		return false;
       		}
       		history.back();
            }	
        </script>
    </body>
</html>