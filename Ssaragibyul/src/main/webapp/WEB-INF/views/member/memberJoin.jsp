<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 페이지</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/member/memberJoin.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
</head>
    <body>
    <header>
    	<jsp:include page="../../../header.jsp"/>
    </header>
    <form action="memberRegister.do" method="post"  onsubmit="return validate()">
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
                        <input type="text" name="address1" class="postcodify_address" id="addr" >
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
                        <input type="text" min="10" max="100" name="nickName" id="nickName" placeholder="버튼을 눌러주세요"  readonly>
                        <button type="button" id="refresh"><img src="/resources/img/member/refresh_img.png" id="refresh-img"></button>
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
	                 	<input type="submit" value="가입하기" id="joinGo" onclick="joinGo()">
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
    	<script>
		$(function() {
            $("#postcodify_search_button").postcodifyPopUp();
			
		});
		 // 닉네임 새로 고침
       	$("#refresh").on("click", function (){
       		$.ajax({
       			url: "nickRefresh.do",
       			dataType: "json",
       			success: function(data){
       		/* 		if(data != null) {
       					$("#nickName").val(data.nickName);
       				}else {
       					alert("버튼을 다시 눌러주세요");
       				} */
       				console("test");
       			},
       			error: function(){
       			
       			}	
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
		
		/* 유효성 검사 */
		
		
		function validate() {
			var id = document.getElementById("userId");
			console.log(id);
			var pw = document.getElementById("userPw"); 
			var pwch = document.getElementById("userPwCheck"); 
			var name = document.getElementById("userName");  
			var email = document.getElementById("userEmail");
			var phone = document.getElementById("userPhone");
			var addr = document.getElementById("addr");
			var idreg = /^[a-z][a-z|A-Z|0-9]{4,12}$/;
			var pwdreg = /^[a-z|A-Z|0-9]{6,12}$/;
			var emailreg = /^[a-z|A-Z|0-9]{2,}@[a-z]+\.[a-z]+$/;
			var phonereg = /^[0-9]{8,}/;
		
			// 아이디 유효성검사
			if(!idreg.test(id.value)){ 
	            alert("ID는 4~12자의 영문 대소문자와 숫자로만 입력하여 주세요.");        
	            return false;
	        }
			
			// 비밀번호 유효성검사
			if(!pwdreg.test(pw.value)){ 
			 alert("패스워드는 6~12자의 영문 대소문자와 숫자로만 입력");
			    return false;
			}
			
/* 			if(pw.val() != pwdch.val()) {
				alert("패스워드가 일치하지 않습니다. 다시 확인해주세요.");
				return false;
			}  */
			
			if(name.value=="") {
			    alert("이름을 입력해 주세요");
			    name.focus();
			    return false;
			}

			if(phone.value=="") {
			    alert("전화번호를 입력해 주세요");
			    phone.focus();
			    return false;
			}

			if (!phonereg.test(phone.value)) {
			  alert("전화번호는 숫자만 입력할 수 있습니다.");
			  phone.focus();
			  return false;
			}
		
			if(email.value=="") {
			    alert("이메일을 입력해 주세요");
			    email.focus();
			    return false;
			}
			
			
			if(email.value=="") {
			    alert("이메일을 입력해 주세요");
			    email.focus();
			    return false;
			}
			
			if(addr.value=="") {
			    alert("주소를 입력해 주세요");
			    addr.focus();
			    return false;
			}
		}  
	</script>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

    </body>
</html>