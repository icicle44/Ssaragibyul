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
		<a href="#"><img id="qna-msg" src="/resources/img/qna_message_text.png" width="130px"/></a>
	</main>
	<jsp:include page="../../../footer.jsp"/>
	
	<script>

	</script>
</body>
</html>