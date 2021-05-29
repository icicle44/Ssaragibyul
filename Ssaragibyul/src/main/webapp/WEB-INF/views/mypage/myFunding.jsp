<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>참여한 펀딩 프로젝트</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/mypage/myFunding.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
</head>
<body>
    <jsp:include page="../../../header.jsp"/>
    <div class="background">
        <div class="contents">
            <div class="kind">
                <div id="k1">펀딩</div>
                <div id="k2">기부</div>
            </div>
            <div class="leftMenu">
                   <jsp:include page="../../../myPageNav.jsp"/>
            </div>

            <!--오른쪽 내용 : 마이페이지 수정할 때 여기만 고치면 됨-->
            <div class="rightCon">
                <h2 align="center" id="h2">참여한 프로젝트</h2>
                <form action="myFunding.do" method="post">
                <div class="f-top">
                    <div class="count">
                        <div id="num">10</div>
                        <div id="p-count">개의 프로젝트가 있습니다.</div>
                    </div>
                    <div class="category">
                        <select id="divide" name="divide">
                            <option id="op">추가순</option>
                            <option value="01" id="op">좋아요순</option>
                            <option value="02" id="op">모금액순</option>
                        </select>
                    </div>
                </div>
                <div class="f-cont">
                    <table class="funding">
                        <tr>
                            <td id="img">
                                <img src="/resources/img/mypage/funding1.png"id="f-img">
                                <img src="/resources/img/mypage/hartCheck.png" id="hart-img" onclick="like(this)"> 
                            </td>
                            <td>
                                <div class="title">
                                    <p id="title-1">대한 여권 케이스</p>
                                    <p id="title-2">
                                        잊혀진 독립 운동가 알리기
                                    </p>
                                </div>
                                <div class="pay-status">
                                   <span>결제완료</span>
                                </div>
                                <div class="accrue">
                                    <div id="sum">
                                        <span>1,580,000 원</span>
                                    </div>                         <div id="achieve">
                                        <span>45</span>
                                        <span>%</span>
                                    </div>
                                    <div id="time">
                                        <img src="/resources/img/mypage/time-img.png" id="time-img">
                                        <span>60일 남음</span>
                                    </div>
                                </div>
                                <div class="graph">
                                    
                                </div>
                            </td>
                        </tr>
                    </table>
                 </div>
                    
                <!--반복-->

                 <div class="f-cont">
                    <table class="funding">
                        <tr>
                            <td id="img">
                                <img src="/resources/img/mypage/funding1.png"id="f-img">
                                <img src="/resources/img/mypage/hartCheck.png" id="hart-img" onclick="like(this)"> 
                            </td>
                            <td>
                                <div class="title">
                                    <p id="title-1">대한 여권 케이스</p>
                                    <p id="title-2">
                                        잊혀진 독립 운동가 알리기
                                    </p>
                                </div>
                                <div class="pay-status">
                                   <span>결제완료</span>
                                </div>
                                <div class="accrue">
                                    <div id="sum">
                                        <span>1,580,000 원</span>
                                    </div>                         <div id="achieve">
                                        <span>45</span>
                                        <span>%</span>
                                    </div>
                                    <div id="time">
                                        <img src="/resources/img/mypage/time-img.png" id="time-img">
                                        <span>60일 남음</span>
                                    </div>
                                </div>
                                <div class="graph">
                                    
                                </div>
                            </td>
                        </tr>
                    </table>
                 </div>
                </form>
            </div>
        </div>
    </div>
    <footer>
    	<jsp:include page="../../../footer.jsp"/>
    </footer>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</body>
</html>