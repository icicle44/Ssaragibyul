<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/member/memberJoin.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
</head>
    <body>
    <header>
    	<jsp:include page="../../../header.jsp"/>
    </header>
    <form action="memberRegister.do" method="post">
        <h2 align="center" id="h2">회원가입</h2>
        <div class="contents">
            <table width="650" cellspacing="5" >
				<tr>
					<td>
						* 아이디
						<span class="guide ok">사용 가능한 아이디입니다.</span>
						<span class="guide error">이미 사용중인 아이디입니다.</span>
					</td>
                </tr>
                <tr>
					<td>
						<input type="text" name="userId" id="userId" placeholder="영문소문자,숫자 4자 이상" size="30"  required >
					</td>
				</tr>				
                <tr>
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
                        <input type="text" min="10" max="100" name="nickName" id="nickName" placeholder="${member.mngNo }" >
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
	                 	<input type="submit" value="가입하기" id="joinGo">
	                	<button type="button" onclick="location.href='login.do';" id="home">홈으로</button>
	            </div>
            	</td>
            </tr>
            </table>
        </div>
    </form>
    <footer>
    	<jsp:include page="../../../footer.jsp"/>
    </footer>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>
		$(function() {
            $("#postcodify_search_button").postcodifyPopUp();
		});
		
		$("#userId").on("blur", function() {
			var userId = $("#userId").val();
			$.ajax({
				url : "checkId.do",
				data : {"userId" : userId}, //json형태로
				success : function(result) {
					console.log(result);
					if (result != 0) {
						$(".guide.ok").hide();
						$(".guide.error").show();
					} else {
						$(".guide.error").hide();
						$(".guide.ok").show();
					} 
				},
				error : function() {
					console.log("전송실패");
				}
			})
		});
		
		window.onload = function () {
			var id = $('#userId');
			var pwd = $('#userPw');
			var pwdch = $('#userPwCheck');
			var name = $('#userName');
			var email = $('#userEmail');
			var phone = $('#userPhone');
			var idreg = /^[a-z][a-z|A-Z|0-9]{4,12}$/;
			var pwdreg = /^[a-z|A-Z|0-9]{5,12}$/;
			var nicknamereg = /^[a-z|A-Z|0-9|가-핳]{2,8}/;
            var namereg = /^[a-z|A-Z|0-9|가-핳]{2,10}/
			var emailreg = /^[a-z|A-Z|0-9]{2,}@[a-z]+\.[a-z]+$/;
			var phonereg = /^[0-9]{8,}/;

			$('#userId').on("keyup", function () {
				if (!idreg.test(id.val())) {
					$("#message").text("아이디는 대소문자,숫자를 포함한 4~12자리 입니다.");
					return false;
				} 
			});
			pwd.on("keyup", function () {
				if (!pwdreg.test(pwd.val())) {
					$("#message").text("패스워드는 대소문자,숫자를 포함한 4~12자리 입니다.");
					return false;
				} else {
					$("#message").text("사용가능한 패스워드 입니다.");
				}

			});
			$(pwdch).on("keyup", function () {
				if (pwd.val() != pwdch.val()) {
					$("#message").text("패스워드가 일치하지 않습니다. 다시 확인해주세요.");
					return false;
				} else {
					$("#message").text("패스워드가 일치합니다.");
				}

			});

            $(name).on("keyup", function () {
				if (!namereg.test(name.val())) {
					$("#message").text("이름을 입력해주세요");
					return false;
				} else {
					$("#message").text(" ");
				}

			});
			$("#email").on("keyup", function () {
				if (!emailreg.test(email.val())) {
					$("#message").text("올바른 이메일 형식이 아닙니다. 다시 확인해주세요.");
					return false;
				} else {
					$("#message").text(" ");
				}

			});
			$("#phone").on("keyup", function () {
				if (!phonereg.test(phone.val())) {
					$("#message").text("번호는 8자이상 입력해주세요.");
					return false;
				} else {
					$("#message").text(" ");
				}

			});
		}

	</script>
    </body>
</html>