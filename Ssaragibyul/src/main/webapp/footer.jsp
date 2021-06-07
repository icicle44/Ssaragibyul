<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="resources/css/style_footer.css" type="text/css"/>
<footer class="bd-footer pt-3 mt-5 bg-eg6 text-sm-start" >
   <div class="container">
	   <div class="row">
	   		<div class="col-4">
			<a href="/index.jsp" class="logo d-flex" style="text-decoration: none;"> <img src="/resources/img/favicon.png" alt="logo">
				<span id="starLogo"><h3>싸라기별</h3></span>
			</a>
				<p style="font-size: 11px;">
					서울 중구 남대문로 120 대일빌딩 2F, 3F<br>
					통신판매업신고 : 2021-서울중구-0615 |<br>
					사업자등록번호 : 100-10-1010100 | <br>
					벤처인증기업 : 제 202105081427 
				<p>
			</div>
			<div class="col-4" style="padding-top: 22px;">
			
		      <ul class="bd-footer-links" style="margin-bottom: 0">
		         <li class="d-inline-block" style="font-size: 11px;"><b>사이트 소개</b></li><br>
		         <li class="d-inline-block ms-3" style="font-size: 10px;">싸라기별이란?</li><br>
		         <li class="d-inline-block ms-3" style="font-size: 10px;">자주 묻는 질문</li><br>
		      </ul>
		     </div>
		     <div class="col-4" style="padding-top: 22px;">
		      <ul class="bd-footer-links" style="margin-bottom: 0">
		         <li class="d-inline-block" style="font-size: 11px;"><b>이용 약관</b></li><br>
		         <li class="d-inline-block ms-3" style="font-size: 11px;">회원가입 기본약관</li><br>
		         <li class="d-inline-block ms-3" style="font-size: 11px;">펀딩 이용약관</li><br>
		         <li class="d-inline-block ms-3" style="font-size: 11px;">기부 이용약관</li><br>
		      </ul>
		      </div>
		</div>
   </div>
   
   <!-- 문의하기(모든페이지적용) -->
	<c:url var="qnaMsg" value="msgWriterView.do">
		<c:param name="receiverId" value="admin"></c:param>
		<c:param name="msgType" value="3"></c:param>
		<c:param name="nickName" value="관리자"></c:param>
	</c:url>
	<img id="qna-msg" src="/resources/img/qna_message_text.png" width="130px" onclick="msgPopup('${qnaMsg}');" style="cursor:pointer;"/>
   
   <script>
	/* 쪽지작성창, 쪽지상세보기창 팝업 */
	function msgPopup(msgUrl) {
		if(${sessionScope.loginUser ne null}) {
			var popupX = (window.screen.width/2)-266;
			var popupY = (window.screen.height/2)-268;
			window.open(msgUrl, "msgWriteForm", "height=400, width=500, left="+popupX+", top="+popupY+", resizable=no");								
		}else {
			location.href="login.do";
		}
	}
   </script>
</footer>