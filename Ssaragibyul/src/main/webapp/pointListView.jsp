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
	<%-- <jsp:include page="../../../header.jsp"/> --%>
	<main id=main>
		<section class="wrapper-left sideBar col-md-3" id="menubar">
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
							<th>번호</th>
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
									<td>${index.count }</td>
									<td><fmt:formatDate value="${point.varTime }" pattern="yyyy.MM.dd HH:mm" id="date"/>${point.}</td>
									
									<!-- 내용 -->
									<c:if test="${point.eventCode == 0}">
										<td>${point.varAmount } 원을 충전하셨습니다.</td>									
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
									<c:if test="${point.eventCode == 4 && point.varType == 1}">										
										<td>${point.nickName }님께 선물하셨습니다.</td>									
									</c:if>
									<c:if test="${point.eventCode == 4 && point.varType == 0}">										
										<td>${point.nickName }님께 선물받으셨습니다.</td>									
									</c:if>
									
									<!-- 포인트 -->
									<c:if test="${point.varType == 0 }">
										<span id="plus">${point.varAmount }</span>
									</c:if>
									<c:if test="${point.varType == 1 }">
										<span id="minus">${point.varAmount * -1 }</span>
									</c:if>
								</tr>
							</c:forEach>
						</c:if>
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

	<%-- <jsp:include page="../../../footer.jsp"/> --%>
	</main>	
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
		});
		
		/* 에러메시지 alert */
 		var errorMsg = '${msg}';
		if(errorMsg != "") {
			alert(errorMsg);
		}	 		
		
	</script>
</body>
</html>