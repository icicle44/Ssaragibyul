<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/message/messageListView.css" type="text/css"/>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
 -->
<title>싸라기별</title>
</head>
<body>
	<jsp:include page="../../../header.jsp"/>
	<main id=main>
		<section class="wrapper-left sideBar col-md-3" id="menubar">
				<!-- ajax -->
			<a href="recMsgList.do">받은 쪽지함</a><hr>
			<a href="sendMsgList.do">보낸 쪽지함</a><hr>
			<a href="noticeMsgList.do">공지 쪽지함</a><hr>			
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
							<option value="allUpper">전체</option>
							<option value="present">선물</option>
							<option value="admin">관리자</option>						
						</select>
					</form>				
				</div>
			</section>
			<section id="table-around">
		<!-- <section class="" id="message-table"> -->
				<table align="center">
					<thead>
						<tr style="border-bottom:hidden;">
							<th>번호</th>
							<th>닉네임</th>
							<th>쪽지 제목</th>
							<th>받은 날짜</th>
							<c:if test="${flag=='rec' }">
								<th width="100px"></th>
							</c:if>
							<c:if test="${flag=='send' }">
								<th width="100px">수신확인</th>
							</c:if>
							<th><input type="checkbox" class="msg-del-check" id="checkAll"></th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty msgList}">
							<tr>
								<td>${tblMsg}</td>
							</tr>
						</c:if>
						<c:if test="${!empty msgList}">
							<c:forEach items="${msgList}" var="message" varStatus="index">
								<tr>
									<td>${index.count }</td>
									<c:if test="${message.msgType != 0}">
										<!-- MessageAndNick객체 사용 -->
										<c:if test="${flag=='rec'}">
											<c:url var="msgWriteUrl4" value="msgWriterView.do">
												<c:param name="receiverId" value="${message.senderId }"></c:param>
												<c:param name="msgType" value="4"></c:param>
												<c:param name="nickName" value="${message.nickName }"></c:param>
											</c:url>
										</c:if>
										<c:if test="${flag=='send'}">
											<c:url var="msgWriteUrl4" value="msgWriterView.do">
												<c:param name="receiverId" value="${message.receiverId }"></c:param>
												<c:param name="msgType" value="4"></c:param>
												<c:param name="nickName" value="${message.nickName }"></c:param>
											</c:url>											
										</c:if>
										
										<td><a href="#" onclick="msgPopup('${msgWriteUrl4}');">${message.nickName } 선생</a></td>
									</c:if>
									<c:if test="${message.msgType == 0}">
										<!-- Message 객체 사용 -->
										<td>관리자</td>
									</c:if>
									<c:if test="${message.msgType != 0}">
										<c:url var="msgDetail" value="msgDetail.do">
											<c:param name="msgNo" value="${message.msgNo }"></c:param>
											<c:param name="nickName" value="${message.nickName }"></c:param>
											<c:param name="flag" value="${flag }"></c:param>
										</c:url>
									</c:if>
									<c:if test="${message.msgType == 0}">
										<c:url var="msgDetail" value="msgDetail.do">
											<c:param name="msgNo" value="${message.msgNo }"></c:param>
											<c:param name="nickName" value=""></c:param>
											<c:param name="flag" value="${flag }"></c:param>
										</c:url>
									</c:if>					
									<td><a href="#" onclick="msgPopup('${msgDetail }');">${message.msgTitle }</a></td>
									<td><fmt:formatDate value="${message.regDate }" pattern="yyyy.MM.dd HH:mm"/></td>
									<c:if test= "${message.msgType != 0 }">
										<c:if test="${message.readYn == 1 }">
											<td id=${message.msgNo }>읽음</td>
										</c:if>
										<c:if test="${message.readYn == 0 }">
											<td id=${message.msgNo }>읽지 않음</td>
										</c:if>
									</c:if>
									<td><input type="checkbox" class="msg-del-check" name="chk" value="${message.msgNo }">${message.msgNo }</td>					
								</tr>
							</c:forEach>
						</c:if>
						<!-- 삭제하기 -->
						<tr>
							<td colspan="5"></td>
							<td>
								<button type="submit" id="deleteArrBtn">
									<img src="/resources/img/message/delIcon.png" alt="delIcon" width="25px">
								</button>
							</td>
						</tr>
						<!-- 페이징 -->
						<tr>
							<td colspan="6" style="border-top:hidden;">
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
							<option value="allLower">전체</option>
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
		<!-- 관리자 공지보내기 연습 -->
		<!-- <a href="#" onclick="msgPopup('msgWriterView.do');">공지 작성창으로 이동</a> -->
		
		<!-- 문의하기(모든페이지적용) -->
		<c:url var="qnaMsg" value="msgWriterView.do">
			<c:param name="receiverId" value="admin"></c:param>
			<c:param name="msgType" value="3"></c:param>
			<c:param name="nickName" value="관리자"></c:param>
		</c:url>
		<img id="qna-msg" src="/resources/img/qna_message_text.png" width="130px" onclick="msgPopup('${qnaMsg}');" style="cursor:pointer;"/>
	</main>
	<jsp:include page="../../../footer.jsp"/>
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		/* 쪽지작성창, 쪽지상세보기창 팝업 */
		function msgPopup(msgUrl) {
			if(${sessionScope.loginUser ne null}) {
				var popupX = (window.screen.width/2)-265;
				var popupY = (window.screen.height/2)-232.5;
				window.open(msgUrl, "msgWriteForm", "height=400, width=500, left="+popupX+", top="+popupY+", resizable=no");				
			}else {
				location.href="login.do";
			}
		}
		
		$(function(){
			/* 체크박스 전체 체크/해제 */
			$("#checkAll").on("click", function(){
				if($("#checkAll").prop("checked")) {
					$("input[name=chk]").prop("checked", true);
				}else {
					$("input[name=chk]").prop("checked", false);
				}
			});
			$("input[name=chk]").on("click", function(){
				$("#checkAll").prop("checked", false);
				var cnt = $("input[name=chk]:checked").length;
				if(cnt == $("input[name=chk]").length) {
					$("#checkAll").prop("checked", true);
				}
			});
			/* List View에서 삭제하기 */
			$("#deleteArrBtn").on("click", function(){
				var cnt = $("input[name=chk]:checked").length;
				var msgNoArr = new Array();
				$("input[name=chk]:checked").each(function(){
					msgNoArr.push($(this).val());
				});
				console.log(msgNoArr.toString());
				console.log(cnt);
				if(cnt == 0) {
					alert("선택된 쪽지가 없습니다.");
				}else {
					var url = "";
					if(${flag eq "rec"}) {
						url = "recMsgDelete.do";
					}else if(${flag eq "send"}) {
						url = "sendMsgDelete.do";
					}
					var conf = confirm("정말 삭제하시겠습니까?");
					console.log(url);
					if(conf == true) {
						$.ajax({
							url: url,
							type: "post",
							data:{"msgNoArr" : msgNoArr},
							success: function(data){
								if(data=="success") {
									alert("삭제하였습니다.");
									location.reload(true);
								}else {
									alert("삭제에 실패하였습니다.");
								}
							},
							error: function(){
								alert("삭제에 실패하였습니다.");
							}
						});
					}else {
						self.close();
					}
				}
			});
		});
		
		/* 에러메시지 alert */
 		var errorMsg = '${msg}';
		if(errorMsg != "") {
			alert(errorMsg);
		}	 		
		
	</script>
</body>
</html>