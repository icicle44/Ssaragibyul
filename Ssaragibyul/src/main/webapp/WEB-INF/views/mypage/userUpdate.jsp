<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        	<h2 align="center" id="h2">회원 정보 수정</h2>
            	<form action="memberModify.do" method="post">
                    <div class="t-con">
                        <table width="650" cellspacing="5" >		
           	               	<tr>
                                <td>아이디</td>
                            </tr>
           	                <tr>
								<td>
									<input type="text" name="userId" id="userId" value="${ loginUser.userId }" readonly >
								</td>
							</tr>
                        	<tr>
                                <td>비밀번호</td>
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
                                <td>이름</td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="userName" id="userName" value="${ loginUser.userName }" readonly>
                                </td>
                            </tr>
                            <tr>
                                <td>이메일</td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="email" name="userEmail" id="userEmail" value="${ loginUser.userEmail }">
                                </td>
                            </tr>
                            <tr>
                                <td>전화번호</td>
                            </tr>
                            <tr>
                                <td><input type="text" name="userPhone" id="userPhone" value="${ loginUser.userPhone }"></td>
                            </tr>
                            <c:forTokens items="${ loginUser.userAddr }" delims="," var="addr" varStatus="status">
               					<c:if test="${ status.index eq 0 }">
	                            <tr>
	                                <td>우편번호</td>
	                            </tr>
	                            <tr>
	                                <td>
	                                    <input type="text" name="post"  class="postcodify_postcode5" value="${addr }">
	                                    <button type="button" id="postcodify_search_button">검색</button>
	                                </td>
	                            </tr>
	                            </c:if>
          						<c:if test="${ status.index eq 1 }">
	                            <tr>
	                                <td>
	                                    <input type="text" name="address1" class="postcodify_address" value="${addr }">
	                                </td>
	                            </tr>
	                            </c:if>
	                            <c:if test="${status.index eq 2 }">
	                            <tr>
	                                <td>
	                                    <input type="text" name="address2" class="postcodify_extra_info" value="${addr }">
	                                </td>
	                            </tr>
	                            </c:if>
                            </c:forTokens>
                           <!--  <tr>
                                <td>* 닉네임</td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" min="10" max="100" name="nickName" id="nickName" placeholder="" >
                                    <button id="refresh"><img src="/resources/img/member/refresh_img.png" id="refresh-img"></button>
                                </td> 
                            </tr>-->
                           
                        <tr>
                            <td>
                                <div class="btns">
                                    <input type="submit" value="수정하기" id="update">
                                    <input type="button" value="취소" id="reset-btn" onclick="updateReset()">
                                </div>
                            </td>
                        </tr>
                    </table>
                    <div id="delete">
                       <input type="button" value="탈퇴하기" onclick="location.href='memberDelete.do?userId=${loginUser.userId}';" id="delete-btn">
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
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
    <script>
            function updateReset(){
        	if(!confirm("정보 수정을 취소하시겠습니까?")) {
           		return false;
       		}
       		history.back();
            }
      
			$(document).ready(function(){
		  		$('#delete-btn').click(function(){
		  			if(!confirm('정말로 탈퇴하시겠습니까?')){
		  				return false;
		  			}
	  				history.back();
				});
			});
	</script>
    </body>
</html>
</body>
</html>