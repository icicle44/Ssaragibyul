<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정 페이지</title>
<link rel="stylesheet" type="text/css" href="/resources/css/mypage/myCommentList.css">
</head>
<body>
    <jsp:include page="../../../header.jsp"/>
    <div class="background">
        <div class="contents">
            <div class="kind">
                <div id="k1">게시물</div>
                <div id="k2">댓글</div>
            </div>
            <div class="leftMenu">
                    <jsp:include page="../../../myPageNav.jsp"/>
            </div>

            <!--오른쪽 내용 : 마이페이지 수정할 때 여기만 고치면 됨-->
            <div class="rightCon">
                <h2 align="center" id="h2">내가 작성한 댓글</h2>
                <form action="myCommentList.do" method="post">
                    
                <!--상단-->
                <div class="f-top">
                    <div id="all-check">
                        <input type="checkbox" id="ch-box"> 
                        <span>전체 선택</span>
                    </div>
                    <div id="btns">
                        <input type="button" value="삭제하기" id="delete-btn">
                    </div>
                </div>
                
                <!--메인 내용-->
                <div class="f-cont">
                    <div>
                        <table>
                            <tr id="title">
                                <td></td>
                                <td>프로젝트명</td>
                                <td>댓글 내용</td>
                                <td>작성일</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>싸라기별 프로젝트</td>
                                <td><a href="#">응원합니다. 조금이나마 보탬이 되었으면 합니다 :)</a> </td>
                                <td>2021-05-30</td>
                            </tr>
                            <!--반복-->
                            
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>싸라기별 프로젝트</td>
								<td><a href="#">응원합니다. 조금이나마 보탬이 되었으면 합니다 :)</a> </td>		
                                <td>2021-05-30</td>
                            </tr>
                            <tr>
                   				<td><input type="checkbox"></td>
                                <td>싸라기별 프로젝트</td>
								<td><a href="#">응원합니다. 조금이나마 보탬이 되었으면 합니다 :)</a> </td>
                                <td>2021-05-30</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>싸라기별 프로젝트</td>
								<td><a href="#">응원합니다. 조금이나마 보탬이 되었으면 합니다 :)</a> </td>
                                <td>2021-05-30</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>싸라기별 프로젝트</td>
								<td><a href="#">응원합니다. 조금이나마 보탬이 되었으면 합니다 :)</a> </td>
                                <td>2021-05-30</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>싸라기별 프로젝트</td>
     							<td><a href="#">응원합니다. 조금이나마 보탬이 되었으면 합니다 :)</a> </td>
                                <td>2021-05-30</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>싸라기별 프로젝트</td>
								<td><a href="#">응원합니다. 조금이나마 보탬이 되었으면 합니다 :)</a> </td>
                                <td>2021-05-30</td>
                            </tr>
                            
                        </table>
                    </div>
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