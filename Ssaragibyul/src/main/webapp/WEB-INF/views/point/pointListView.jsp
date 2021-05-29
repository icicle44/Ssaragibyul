<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/point/pointListView.css" type="text/css"/>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
 -->
<title>싸라기별</title>
</head>
<body>
	<jsp:include page="../../../header.jsp"/>
	<main id=main>

		<section class="wrapper-left sideBar col-md-3" id="menubar">
			<input type="button" value="충전하기" id="chargeBtn" onClick="window.open('chargePointView.do')"><br>
			<a href="recMsgList.do">전체 내역</a><hr>
			<span id="showSubMenu"> + </span>
			<div id="subMenu">
				<a href="sendMsgList.do">충전 내역</a><hr>
				<a href="sendMsgList.do">펀딩 내역</a><hr>
				<a href="noticeMsgList.do">기부 내역</a><hr>
				<a href="noticeMsgList.do">별 보러 가자</a><hr>
				<a href="noticeMsgList.do">선물한 내역</a><hr>
				<a href="noticeMsgList.do">선물 받은 내역</a><hr>
			</div>			
		</section>

		<section class="wrapper-right contents col-md-9" id="msg-table">

			<section class="" id="table-upper">
				<div id="title-area">
					<span id="table-title">포인트 내역</span>
				</div>
			</section>
			<section id="table-around">
				<table align="center">
					<thead>
						<tr style="border-bottom:hidden;">
							<th>내역번호</th>
							<th>일시</th>
							<th>내용</th>
							<th>포인트</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty pointList}">
							<tr>
								<td id="emptyMsg">${tblMsg}</td>
							</tr>
						</c:if>
						<c:if test="${!empty pointList}">
							<c:forEach items="${pointList}" var="point" varStatus="index">
								<tr>
									<td>${point.pntListNo }</td>
									<td><fmt:formatDate value="${point.varTime }" pattern="yyyy.MM.dd"/></td>
									
									<!-- 내용: 각 상세보기로 링크 -->
									<c:if test="${point.eventCode == 0}">
										<td><a href=${point.receiptUrl } target="_blank">${point.varAmount } 원을 충전하셨습니다.</a></td>									
									</c:if>
									<c:if test="${point.eventCode == 1 && point.varType == 1}">										
										<td>[${point.subject }]에 펀딩하셨습니다.</td>									
									</c:if>
									<c:if test="${point.eventCode == 1 && point.varType == 0}">										
										<td>[${point.subject }] 펀딩 취소하셨습니다.</td>									
									</c:if>
									<c:if test="${point.eventCode == 2 && point.varType == 1}">										
										<td>[${point.subject }]에 기부하셨습니다.</td>									
									</c:if>
									<c:if test="${point.eventCode == 2 && point.varType == 0}">										
										<td>[${point.subject }] 기부 취소하셨습니다.</td>									
									</c:if>
									<c:if test="${point.eventCode == 3}">										
										<td>[별 보러 가자] 게시 후 적립되었습니다.</td>									
									</c:if>
									<c:url var="PresentSend" value="msgDetail.do">
										<c:param name="msgNo" value="${point.eventNo }"></c:param>
										<c:param name="nickName" value="${point.nickName }"></c:param>
										<c:param name="flag" value="send"></c:param>
									</c:url>
									<c:url var="PresentReceive" value="msgDetail.do">
										<c:param name="msgNo" value="${point.eventNo }"></c:param>
										<c:param name="nickName" value="${point.nickName }"></c:param>
										<c:param name="flag" value="rec"></c:param>
									</c:url>
									<c:if test="${point.eventCode == 4 && point.varType == 1}">										
										<td><a href="#" onclick="msgModal('${PresentSend }');">${point.nickName }님께 선물하셨습니다.</a></td>								
									
									<%-- <a href="#" onclick="msgPopup('${PresentSend }');"> --%>
									</c:if>
									<c:if test="${point.eventCode == 4 && point.varType == 0}">										
										<td><a href="#" onclick="msgModal('${PresentReceive }');">${point.nickName }님께 선물받으셨습니다.</a></td>									
									</c:if>
									
									<!-- 포인트 -->
									<td>
										<c:if test="${point.varType == 0 }">
											<span id="plus">${point.varAmount }</span>
											<div><fmt:formatDate value="${point.varTime }" pattern="HH:mm"/></div>
										</c:if>
										<c:if test="${point.varType == 1 }">
											<span id="minus">${point.varAmount * -1 }</span>
											<div><fmt:formatDate value="${point.varTime }" pattern="HH:mm"/></div>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<!-- search -->
						<tr><td colspan="4">
							<section id="search">
								<div align="center">
									<form action="msgSearch.do" method="post">
										<input type="hidden" name="flag" value="${flag }">
										<select name="searchCondition">
											<option value="allLower" <c:if test="${search.searchCondition eq 'allLower' }">selected</c:if>>전체</option>
											<c:if test="${flag != 'notice'}">
												<option value="nickName" <c:if test="${search.searchCondition eq 'nickName' }">selected</c:if>>닉네임</option>
											</c:if>
											<option value="msgTitle" <c:if test="${search.searchCondition eq 'msgTitle' }">selected</c:if>>제목</option>
											<option value="msgContents" <c:if test="${search.searchCondition eq 'msgContents' }">selected</c:if>>내용</option>							
										</select>
										<input id="search-window" type="text" size="3" name="searchValue" value="${search.searchValue }">
										<button id="search-btn" type="submit"><img src="resources/img/searchimg.svg" alt="search"></button>
									</form>
								</div>
							</section>
						</td></tr>
						<!-- 페이징 -->
						<tr id="paging">
							<td colspan="4" style="border-top:hidden;">
								<!-- 이전 -->
								<c:url var="before" value="pointList.do">
									<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
								</c:url>
								<c:if test="${pi.currentPage <= 1 }">
									[이전]&nbsp;
								</c:if>
								<c:if test="${pi.currentPage > 1 }">
									<a href="${before }">[이전]</a>&nbsp;
								</c:if>
								<!-- 페이지 -->
								<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
									<c:url var="pagination" value="pointList.do">
										<c:param name="page" value="${p }"></c:param>
									</c:url>
									<c:if test="${p eq pi.currentPage }">
										<font color="red" size="4">[${p }]</font>
									</c:if>
									<c:if test="${p ne pi.currentPage }">
										<a href="${pagination }">${p }</a>&nbsp;
									</c:if>
								</c:forEach>
								<!-- 다음 -->
								<c:url var="after" value="pointList.do">
									<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
								</c:url>				
								<c:if test="${pi.currentPage >= pi.maxPage }">
									[다음]&nbsp;
								</c:if>
								<c:if test="${pi.currentPage < pi.maxPage }">
									<a href="${after }">[다음]</a>&nbsp;
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>
			</section>
		</section>
		<div id="modal">
			<div id="modal_content">
				
			</div>
		</div>

	<jsp:include page="../../../footer.jsp"/>
	</main>	
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>

		/* 선물 쪽지창 팝업 */
		function msgPopup(msgUrl) {
			if(${sessionScope.loginUser ne null}) {
				var popupX = (window.screen.width/2)-265;
				var popupY = (window.screen.height/2)-232.5;
				window.open(msgUrl, "msgWriteForm", "height=400, width=500, left="+popupX+", top="+popupY+", resizable=no");				
			}else {
				location.href="login.do";
			}
		}
		
		/* 모달창 */
		function msgModal(msgUrl) {
			$("#modal #modal_content").load(msgUrl);
			setTimeout(function(){
			$("#modal").fadeIn();
			}, 500)
		}
		
		$(function() {
			/* submenu 노출 */
			$("#showSubMenu").on("click", function() {
				if($("#subMenu").css("display") == "none"){
					$("#subMenu").show();
					$("#showSubMenu").text(" - ");
				}else {
					$("#subMenu").hide();
					$("#showSubMenu").text(" + ");				
				}
			});
			
			/* 모달창 닫기 */
			$("#modal_content").on("click", function() {
				$("#modal").fadeOut();
				$("#modal #modal_content").empty();
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