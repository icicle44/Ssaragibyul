<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좋아하는 프로젝트</title>
<link rel="stylesheet" type="text/css" href="/resources/css/mypage/likeDonation.css">
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

 			<div class="rightCon">
                <h2 align="center" id="h2">좋아하는 프로젝트</h2>
                <form action="myDonation.do" method="post">
                <div class="d-top">
                    <div class="count">
                        <div id="num">10</div>
                        <div id="d-count">개의 프로젝트가 있습니다.</div>
                    </div>
                    <div class="category">
                        <select id="divide" name="divide">
                            <option id="op">추가순</option>
                            <option value="01" id="op">좋아요순</option>
                            <option value="02" id="op">모금액순</option>
                        </select>
                    </div>
                </div>
                <div class="d-cont">
                    <table class="donation">
                        <tr>
                            <td id="img">
                                <img src="/resources/img/mypage/funding1.png"id="d-img">
                                <img src="/resources/img/mypage/hartCheck.png" id="hart-img" onclick="like(this)"> 
                            </td>
                            <td>
                                <div class="title">
                                    <p id="title-1">싸라기별 프로젝트</p>
                                    <p id="title-2">
                                        잊혀진 독립 운동가 알리기
                                    </p>
                                </div>
                                <div class="pay-status">
                                   <span>기부완료</span>
                                </div>
                                <div class="accrue">
                                    <div id="sum">
                                        <span>1,580,000 원</span>
                                    </div>                         
                                    <div id="achieve">
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

                 <div class="d-cont">
                    <table class="donation">
                        <tr>
                            <td id="img">
                                <img src="/resources/img/mypage/funding1.png"id="d-img">
                                <img src="/resources/img/mypage/hartCheck.png" id="hart-img" onclick="like(this)"> 
                            </td>
                            <td>
                                <div class="title">
                                    <p id="title-1">싸라기별 프로젝트</p>
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