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
                <div id="my-nick">나의 닉네임 : 독립운동가</div>
                <div id="nickname">${loginUser.nickName }</div>
            </div>
            <div class="inform1">
                <img src="/resources/img/mypage/table-icon.png" id="icon">
                <div id="peaple-inform">유공자 정보 </div>
                <table>
                    <tr>
                        <td id="t">한글 이름</td>
                        <td>한용운</td>
                        <td id="t">한자 이름</td>
                        <td>韓龍雲</td>
                    </tr>
                    <tr>
                        <td id="t">생년월일</td>
                        <td>1876-08-29</td>
                        <td id="t">사망월일</td>
                        <td>1944-05-09</td>
                    </tr>
                    <tr>
                        <td id="t">성별</td>
                        <td>남</td>
                        <td id="t">본적</td>
                        <td>충청남도 홍산</td>
                    </tr>
                </table>
            </div>
            <div class="inform2">
                <img src="/resources/img/mypage/table-icon.png" id="icon">
                <div id="peaple-inform">포상 정보</div>
                <table>
                    <tr>
                        <td id="t">운동계열</td>
                        <td>3·1 운동</td>
                        <td id="t">포상년도</td>
                        <td>1962</td>
                        <td id="t">훈격</td>
                        <td>대한민국장</td>
                    </tr>
                </table>
            </div>
            <div class="inform3">
                <img src="/resources/img/mypage/table-icon.png" id="icon">
                <div id="peaple-inform">공적개요</div>
                <div id="inform-con">
                    <span>
                    1. 기미독립운동 때 불교계대표로 33인 중 1인임
                    2. 3년 징역을 받았고 문학운동과 불교혁신운동에 진력하다가
                    3. 1944년 5월 9일 서울 성북동 심우장 자택에서 사망하였음
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