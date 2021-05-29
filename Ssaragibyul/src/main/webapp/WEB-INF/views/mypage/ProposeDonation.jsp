<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정 페이지</title>
<link rel="stylesheet" type="text/css" href="/resources/css/mypage/ProposeDonation.css">
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
                <h2 align="center" id="h2">제안한 프로젝트</h2>
                <form action="memberRegister.do" method="post">
                <div class="f-top">
                    <div class="count">
                        <div id="f-count">제안한 프로젝트</div>
                        <div id="num">4</div>
                        <div id="f-count"> 개를 확인하세요.</div>
                    </div>
                    <div class="category">
                        <select id="divide" name="divide">
                            <option id="op">추가순</option>
                            <option value="01" id="op">좋아요순</option>
                            <option value="02" id="op">모금액순</option>
                        </select>
                    </div>
                </div>
                <div class="cont">
                    <div class="img">
                        <img src="/resources/img/mypage/funding2.png" id="f-img">
                    </div>
                    <div class="f-progress">
                        <span>펀딩중</span>
                        <!--
                        <span>제작중</span>
                        -->
                    </div>
                    <div class="title">
                        <div class="title-1">
                            <span>지금의 우리를 있게 한 선조들의 외침
                            </span>
                        </div>
                        <div class="title-2">
                            <span><코레아 우라!></span>
                        </div>
                        </div>
                        <div class="accrue">
                            <div id="sum">
                                <span>1,580,000 원</span>
                            </div>                         
                            <div id="achieve">
                                <span>45</span>
                                <span>%</span>
                            </div>
                        </div>
                        <div class="graph">
                        </div>
                        <div class="btn">
                            <input type="button" value="수정" id="update-btn">
                            <input type="button" value="삭제" id="delete-btn">
                        </div>
                    </div>
                    
                    
                    <div class="cont">
                        <div class="img">
                            <img src="/resources/img/mypage/funding2.png" id="f-img">
                        </div>
                        <div class="f-progress">
                            <span>펀딩중</span>
                            <!--
                            <span>제작중</span>
                            -->
                        </div>
                        <div class="title">
                            <div class="title-1">
                                <span>지금의 우리를 있게 한 선조들의 외침
                                </span>
                            </div>
                            <div class="title-2">
                                <span><코레아 우라!></span>
                            </div>
                            </div>
                            <div class="accrue">
                                <div id="sum">
                                    <span>1,580,000 원</span>
                                </div>                         
                                <div id="achieve">
                                    <span>45</span>
                                    <span>%</span>
                                </div>
                            </div>
                            <div class="graph">
                            </div>
                            <div class="btn">
                                <input type="button" value="수정" id="update-btn">
                                <input type="button" value="삭제" id="delete-btn">
                            </div>
                        </div>
                        
                        <div class="cont">
                    <div class="img">
                        <img src="/resources/img/mypage/funding2.png" id="f-img">
                    </div>
                    <div class="f-progress">
                        <span>펀딩중</span>
                        <!--
                        <span>제작중</span>
                        -->
                    </div>
                    <div class="title">
                        <div class="title-1">
                            <span>지금의 우리를 있게 한 선조들의 외침
                            </span>
                        </div>
                        <div class="title-2">
                            <span><코레아 우라!></span>
                        </div>
                        </div>
                        <div class="accrue">
                            <div id="sum">
                                <span>1,580,000 원</span>
                            </div>                         
                            <div id="achieve">
                                <span>45</span>
                                <span>%</span>
                            </div>
                        </div>
                        <div class="graph">
                        </div>
                        <div class="btn">
                            <input type="button" value="수정" id="update-btn">
                            <input type="button" value="삭제" id="delete-btn">
                        </div>
                    </div>
                    <!--페이징 처리 div-->
                    <div>
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