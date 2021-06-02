<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/mypage/myPageMain.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
</head>
    <body>
    <jsp:include page="../../../header.jsp"/>
    <div class="background">
    <div class="title">
        <h1 align="center" id="title">마이페이지</h1>
        <h4 align="center" id="reeting">안녕하세요. 싸라기별입니다.</h4>
    </div>      
    <div class="contents">
        <div class="leftMenu">
        	<jsp:include page="../../../myPageNav.jsp"/>
        </div>
        
        <!--오른쪽 내용 : 마이페이지 수정할 때 여기만 고치면 됨-->
        <c:if test="${!empty sessionScope.loginUser}">
        <div class="rightCon">
            <div class="r-title">
                <div id="nickname">${independence.nameKo }</div>
                <div id="my-nick">님의 별</div>
                <div id="star-img">
                	<img src="/resources/img/mypage/star-img4.png" id="star">
                </div>
            </div>
            <div class="inform1">
                <img src="/resources/img/mypage/table-icon.png" id="icon">
                <div id="peaple-inform">유공자 정보 </div>
                <table>
                    <tr>
                        <td id="t">한글 이름</td>
                        <td>${independence.nameKo }</td>
                        <td id="t">한자 이름</td>
                        <td>${independence.nameCh }</td>
                    </tr>
                    <tr>
                        <td id="t">생년월일</td>
                        <td>${independence.birthday }</td>
                        <td id="t">사망월일</td>
                        <td>${independence.lastday }</td>
                    </tr>
                    <tr>
                        <td id="t">성별</td>
                        <td>${independence.sex }</td>
                        <td id="t">본적</td>
                        <td>${independence.registerLarge } ${independence.registerMid }</td>
                    </tr>
                </table>
            </div>
            <div class="inform2">
                <img src="/resources/img/mypage/table-icon.png" id="icon">
                <div id="peaple-inform">포상 정보</div>
                <table>
                    <tr>
                        <td id="t">운동계열</td>
                        <td>${independence.activityLine }</td>
                        <td id="t">포상년도</td>
                        <td>${independence.prizedYear }</td>
                        <td id="t">훈격</td>
                        <td>${independence.prizeClass }</td>
                    </tr>
                </table>
            </div>
            <div class="inform3">
                <img src="/resources/img/mypage/table-icon.png" id="icon">
                <div id="peaple-inform">공적개요</div>
                <div id="inform-con">
                    <span>
                    ${independence.achievement }
                    </span>
                </div>
            </div>
        </div>
        </c:if>
    </div>
    </div>
    <footer>
    <jsp:include page="../../../footer.jsp"/>
    </footer>
    </body>
</html>