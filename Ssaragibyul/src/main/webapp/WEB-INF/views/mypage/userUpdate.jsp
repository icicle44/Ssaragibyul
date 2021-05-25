<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정 페이지</title>
<link rel="stylesheet" type="text/css" href="/resources/css/mypage/userUpdate.css">
</head>
<body>
    <jsp:include page="../../../header.jsp"/>
    <div class="background">
    <div class="contents">
        <div class="leftMenu">
        	<jsp:include page="../../../myPageNav.jsp"/>
        </div>
        
        <!--오른쪽 내용 : 마이페이지 수정할 때 여기만 고치면 됨-->
        <div class="rightCon">
            <form action="memberRegister.do" method="post">
                <h2 align="center" id="h2">회원 정보 수정</h2>
                    <div class="contents">
                        <table width="650" cellspacing="5" >		<tr>
                                <td>* 비밀번호</td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="password" name="userPw" id="userPw" placeholder="비밀번호를 입력하세요" required>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="password" name="pwCheck" id="pwCheck" placeholder="비밀번호를 한 번 더 입력하세요">
                                </td>
                            </tr>
                            <tr>
                                <td>* 이름</td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="userName" id="userName">
                                </td>
                            </tr>
                            <tr>
                                <td>* 이메일</td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="email" name="userEmail" id="userEmail">
                                </td>
                            </tr>
                            <tr>
                                <td>* 전화번호</td>
                            </tr>
                            <tr>
                                <td><input type="text" name="userPhone" id="userPhone"></td>
                            </tr>
                            <tr>
                                <td>* 우편번호</td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="post"  class="postcodify_postcode5" >
                                    <button type="button" id="postcodify_search_button">검색</button>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="address1" class="postcodify_address">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="address2" class="postcodify_extra_info">
                                </td>
                            </tr>
                            <tr>
                                <td>* 닉네임</td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" min="10" max="100" name="nickName" id="nickName" placeholder="" >
                                    <button id="refresh"><img src="/resources/img/member/refresh_img.png" id="refresh-img"></button>
                                </td>
                            </tr>
                            <tr>
                                <td>생년월일</td>
                            </tr>
                            <tr>
                                <td>             
                                    <!-- BIRTH_YY -->
                                    <div id="bir_yy">
                                        <input type="number" min="1970" max="2021" name="yy" id="yy" >
                                    </div>

                                    <!-- BIRTH_MM -->
                                    <div id="bir_mm">
                                        <select id="mm" name="mm">
                                            <option>월</option>
                                            <option value="01">1</option>
                                            <option value="02">2</option>
                                            <option value="03">3</option>
                                            <option value="04">4</option>
                                            <option value="05">5</option>
                                            <option value="06">6</option>
                                            <option value="07">7</option>
                                            <option value="08">8</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                        </select>
                                    </div>

                                    <!-- BIRTH_DD -->
                                    <div id="bir_dd">
                                        <select id="dd" name="dd">
                                        <option>월</option>
                                        <option value="01">1</option>
                                        <option value="02">2</option>
                                        <option value="03">3</option>
                                        <option value="04">4</option>
                                        <option value="05">5</option>
                                        <option value="06">6</option>
                                        <option value="07">7</option>
                                        <option value="08">8</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                        <option value="13">13</option>
                                        <option value="14">14</option>
                                        <option value="15">15</option>
                                        <option value="16">16</option>
                                        <option value="17">17</option>
                                        <option value="18">18</option>
                                        <option value="19">19</option>
                                        <option value="20">20</option>
                                        <option value="21">21</option>
                                        <option value="22">22</option>
                                        <option value="23">23</option>
                                        <option value="24">24</option>
                                        <option value="25">25</option>
                                        <option value="26">26</option>
                                        <option value="27">27</option>
                                        <option value="28">28</option>
                                        <option value="29">29</option>
                                        <option value="30">30</option>
                                        <option value="31">31</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="btns">
                                    <input type="submit" value="수정하기" id="joinGo">
                                    <input type="button" value="취소" id="reset-btn" onclick="updateReset()">
                                </div>
                            </td>
                        </tr>
                    </table>
                    <div id="delete">
                       <button type="button" onclick="location.href='memberDelete.kh?userId=${loginUser.userId}';" id="delete-btn">탈퇴하기</button>   
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
    <script>
            function (){
        	if(!confirm("정보 수정을 취소하시겠습니까?")) {
           		return false;
       		}
       		history.back();
        }
    </script>
    </body>
</html>
</body>
</html>