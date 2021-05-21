<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/message/messageListView.css" type="text/css">
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>싸라기별</title>
</head>
<body>
	<jsp:include page="../../../header.jsp"/>
	<main id=main>
		<section class="wrapper-left sideBar col-md-3" id="menubar">
				<!-- ajax -->
			<a href="#">받은 쪽지함</a><hr>
			<a href="#">보낸 쪽지함</a><hr>
			<a href="#">공지 쪽지함</a><hr>			
		</section>

		<section class="wrapper-right contents col-md-9" id="msg-table">

			<section class="" id="table-upper">
				<div id="title-area">
					<c:if test="${flag=='notice'}">
						<span id="table-title">공지사항</span>
					</c:if>
					<c:if test="${flag=='rec'}">
						<span id="table-title">받은 쪽지함</span>
					</c:if>
					<c:if test="${flag=='send'}">
						<span id="table-title">보낸 쪽지함</span>
					</c:if>
				</div>
				<div id="sort-box">
					<form action=""	method="get">		
						<select name="searchCondition">
							<option value="">전체</option>
							<option value="">선물</option>
							<option value="">관리자</option>						
						</select>
					</form>				
				</div>
			</section>
			<section id="table-around">
		<!-- <section class="" id="message-table"> -->
				<table align="center">
					<thead>
						<tr>
							<th>번호</th>
							<th>닉네임</th>
							<th>쪽지 제목</th>
							<th>받은 날짜</th>
							<th><input type="checkbox" class="msg-del-check" id="checkAll"></th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty msgList}">
							<tr>
								<td>${msg}</td>
							</tr>
						</c:if>
						<c:if test="${!empty msgList}">
							<c:forEach items="${msgList}" var="message" varStatus="index">
								<tr>
									<td>${index.count }</td>
									<c:if test="${message.msgType != 0}">
										<td>${message.nickName }</td>
									</c:if>
									<c:if test="${message.msgType == 0}">
										<td>관리자</td>
									</c:if>									
									<td><a href="#">${message.msgTitle }</a></td>
									<td><fmt:formatDate value="${message.regDate }" pattern="yyyy.MM.dd HH:mm"/></td>
									<td><input type="checkbox" class="msg-del-check" id="checkAll"></td>					
								</tr>
							</c:forEach>
						</c:if>
						<!-- 페이징 -->
						<tr>
							<td colspan="5">
								<!-- 변수선언 -->
								<c:if test="${flag=='notice'}">
									<c:set var="pageUrl" value="noticeMsgList.do"/>
								</c:if>
								<c:if test="${flag=='rec' }">
									<c:set var="pageUrl" value="recMsgList.do"/>
								</c:if>
								<c:if test="${flag=='send' }">
									<c:set var="pageUrl" value="sendMsgList.do"/>
								</c:if>
								<!-- 이전 -->
								<c:url var="before" value="${pageUrl}">
									<c:param name="page" value="${pi.currentPage - 1}"></c:param>
								</c:url>
								<c:if test="${pi.listCount ne 0 }">
									<c:if test="${pi.currentPage <= 1 }">
										[이전]&nbsp;
									</c:if>
									<c:if test="${pi.currentPage > 1 }">
										<a href="${before }">[이전]</a>&nbsp;
									</c:if>
								</c:if>
								<!-- 페이지 -->
								<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage }">
									<c:url var="pagination" value="${pageUrl}">
										<c:param name="page" value="${p}"></c:param>
									</c:url>
									<c:if test="${p eq pi.currentPage}">
										[${p}]
									</c:if>
									<c:if test="${p ne pi.currentPage}">
										<a href="${pagination }">${p}</a>&nbsp;
									</c:if>
								</c:forEach>
								<!-- 다음 -->
								<c:url var="after" value="${pageUrl}">
									<c:param name="page" value="${pi.currentPage + 1}"></c:param>
								</c:url>
								<c:if test="${pi.listCount ne 0 }">
									<c:if test="${pi.currentPage >= pi.maxPage}">
										[다음]&nbsp;
									</c:if>
									<c:if test="${pi.currentPage < pi.maxPage}">
										<a href="${after}">[다음]</a>&nbsp;
									</c:if>
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>
			</section>
			<section id="search">
				<div align="center">
					<form action="" method="get">
						<select name="searchCondition">
							<option value="all">전체</option>
							<c:if test="${message.msgType != 0}">
								<option value="nickName">닉네임</option>
							</c:if>
							<option value="msgTitle">제목</option>
							<option value="regDate">등록일</option>							
						</select>
						<input id="search-window" type="text" size="3" name="searchValue" value="">
						<button id="search-btn" type="submit"><img src="/resources/img/searchimg.svg" alt="search"></button>
					</form>
				</div>
				<!-- </section> -->
			</section>
		</section>
		<c:url var="qnaMsg" value="msgWriterView.do">
			<c:param name="receiverId" value="admin"></c:param>
			<c:param name="msgType" value="3"></c:param>
			<c:param name="nickName" value="관리자"></c:param>
		</c:url>
		<img id="qna-msg" src="/resources/img/qna_message_text.png" width="130px" onclick="qnaPopup();"/>
	</main>
	<jsp:include page="../../../footer.jsp"/>
	
	<script>
		function qnaPopup() {
			var popupX = (window.screen.width/2)-265;
			var popupY = (window.screen.height/2)-(465/2);
			window.open("${qnaMsg}", "qnaMsg", "height=400, width=500, left="+popupX+", top="+popupY+", resizable=no");
		}
	</script>
</body>
</html>