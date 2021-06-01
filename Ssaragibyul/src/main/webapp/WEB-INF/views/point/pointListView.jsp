<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/point/pointListView.css" type="text/css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

<title>싸라기별</title>
</head>
<body>
	<jsp:include page="../../../header.jsp"/>
	<main id=main>
		<section class="blank"></section>
		<section class="wrapper-all">
			<section class="wrapper-left sideBar col-md-3" id="menubar">				
				<a href="pointList.do">전체 포인트 내역</a><hr size="10px">
				<span id="showSubMenu"> + </span>
				<div id="subMenu">
					<a href="pointSearch.do?searchCondition=0" class="sub">충전 내역</a><br><br>
					<a href="pointSearch.do?searchCondition=1" class="sub">펀딩 내역</a><br><br>
					<a href="pointSearch.do?searchCondition=2" class="sub">기부 내역</a><br><br>
					<a href="pointSearch.do?searchCondition=3" class="sub">별 보러 가자</a><br><br>
					<a href="pointSearch.do?searchCondition=4" class="sub">선물 내역</a><br><br>
				</div>			
			</section>
	
			<section class="wrapper-right contents col-md-9" id="msg-table">
	
				<section class="" id="table-upper">
					<div id="title-area">
						<span id="table-title">포인트 내역</span>
					</div>
					<div class="charge-div" align="right">
						<div id="charge-box" align="right">
							<input type="button" value="충전하기" id="chargeBtn" onClick="window.open('chargePointView.do')"><br>
						</div>
					</div>
				</section>
				<section id="table-around">
					<table align="center">
						<thead>
							<tr style="border-bottom:hidden;">
								<th>내역번호</th>
								<th>일시</th>
								<th colspan="2">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</th>
								<th>포인트</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty pointList}">
								<tr>
									<td colspan="5" id="emptyMsg">${tblMsg}</td>
								</tr>
							</c:if>
							<c:if test="${!empty pointList}">
								<c:forEach items="${pointList}" var="point" varStatus="index">
									<tr>
										<td>${point.pntListNo }</td>
										<td><fmt:formatDate value="${point.varTime }" pattern="yyyy.MM.dd"/></td>
										
										<!-- 내용: 각 상세보기로 링크 -->
										<c:if test="${point.eventCode == 0}">
											<td>
												${point.varAmount } 원을 <span class="bold-text">충전</span>하셨습니다.<br>
												<span id="email">${point.buyerEmail }</span>
											</td>									
											<td><button id="receiptbtn" onclick="receiptPopup('${point.receiptUrl }'); return false;">영수증</button></td>										
										</c:if>
										<c:if test="${point.eventCode == 1 && point.varType == 1}">										
											<td>[ ${point.subject } ] <span class="bold-text">펀딩</span>하셨습니다.</td>
											<c:if test="${point.money >= 0 && point.fdate > 0 }">
												<td>프로젝트 종료(성공)</td>
											</c:if>
											<c:if test="${point.money < 0 && point.fdate > 0 }">
												<td>프로젝트 종료</td>
											</c:if>
											<c:if test="${point.fdate <= 0}">
												<td>프로젝트 진행 중</td>
											</c:if>					
										</c:if>
										<c:if test="${point.eventCode == 1 && point.varType == 0}">										
											<td>[ ${point.subject } ] <span class="bold-text">펀딩</span> 취소하셨습니다.</td>
											<c:if test="${point.money >= 0 && point.fdate > 0 }">
												<td>프로젝트 종료(성공)</td>
											</c:if>
											<c:if test="${point.money < 0 && point.fdate > 0 }">
												<td>프로젝트 종료</td>
											</c:if>
											<c:if test="${point.fdate <= 0}">
												<td>프로젝트 진행 중</td>
											</c:if>								
										</c:if>
										<c:if test="${point.eventCode == 2 && point.varType == 1}">										
											<td>[ ${point.subject } ] <span class="bold-text">기부</span>하셨습니다.</td>
											<c:if test="${point.fdate > 0 }">
												<td>프로젝트 종료</td>
											</c:if>
											<c:if test="${point.fdate <= 0}">
												<td>프로젝트 진행 중</td>
											</c:if>
										</c:if>
										<c:if test="${point.eventCode == 2 && point.varType == 0}">										
											<td>[ ${point.subject } ] <span class="bold-text">기부</span> 취소하셨습니다.</td>	
											<c:if test="${point.fdate > 0 }">
												<td>프로젝트 종료</td>
											</c:if>
											<c:if test="${point.fdate <= 0}">
												<td>프로젝트 진행 중</td>
											</c:if>						
										</c:if>
										<c:if test="${point.eventCode == 3}">										
											<td>[<span class="bold-text">별 보러 가자</span>] 게시 후 적립되었습니다.</td>
											<td></td>								
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
											<td><a href="#" onclick="msgModal('${PresentSend }'); return false;">[ ${point.nickName } ] 님께 <span class="bold-text">선물</span>하셨습니다.</a></td>								
											<td></td>
										<%-- <a href="#" onclick="msgPopup('${PresentSend }');  return false;"> --%>
										</c:if>
										<c:if test="${point.eventCode == 4 && point.varType == 0}">										
											<td><a href="#" onclick="msgModal('${PresentReceive }'); return false;">[ ${point.nickName } ] 님께 <span class="bold-text">선물</span>받으셨습니다.</a></td>									
											<td></td>
										</c:if>
										
										<!-- 포인트 -->
										<td>
											<c:if test="${point.varType == 0 }">
												<span id="plus">+${point.varAmount }</span>
												<div class="varTime">&nbsp;&nbsp;<fmt:formatDate value="${point.varTime }" pattern="HH:mm"/></div>
											</c:if>
											<c:if test="${point.varType == 1 }">
												<span id="minus">${point.varAmount }</span>
												<div class="varTime">&nbsp;&nbsp;<fmt:formatDate value="${point.varTime }" pattern="HH:mm"/></div>
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<tr>
								<td colspan="5"></td>
							</tr>
							<!-- 페이징 -->
							<tr id="paging">
								<td colspan="5" id="page-td">
									<!-- 이전 -->
									<c:url var="before" value="pointList.do">
										<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
									</c:url>
									<c:if test="${pi.currentPage <= 1 }">
										<font>&laquo;</font>
									</c:if>
									<c:if test="${pi.currentPage > 1 }">
										<a href="${before }">&laquo;</a>
									</c:if>
									<!-- 페이지 -->
									<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
										<c:url var="pagination" value="pointList.do">
											<c:param name="page" value="${p }"></c:param>
										</c:url>
										<c:if test="${p eq pi.currentPage }">
											<font color="#EB5C01">${p }</font>
										</c:if>
										<c:if test="${p ne pi.currentPage }">
											<a href="${pagination }">${p }</a>
										</c:if>
									</c:forEach>
									<!-- 다음 -->
									<c:url var="after" value="pointList.do">
										<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
									</c:url>				
									<c:if test="${pi.currentPage >= pi.maxPage }">
										<font>&raquo;</font>
									</c:if>
									<c:if test="${pi.currentPage < pi.maxPage }">
										<a href="${after }">&raquo;</a>
									</c:if>
								</td>
							</tr>
						</tbody>
					</table>
				</section>
				<!-- search -->
				<section id="search">
					<div align="center">
						<form action="pointSearch.do" method="post">
							<input type="hidden" name="flag" value="${flag }">
							<c:if test="${empty pointList}">
								<input class="form-control form-control-sm" aria-label=".form-control-sm example" id="search-window" type="text" size="3" name="searchValue" value="${search.searchValue }" placeholder="전체내역에서 검색됩니다.">											
							</c:if>
							<c:if test="${!empty pointList}">
								<input class="form-control form-control-sm" aria-label=".form-control-sm example" id="search-window" type="text" size="3" name="searchValue" value="${search.searchValue }">											
							</c:if>
							<button id="search-btn" type="submit">찾기</button>
						</form>
					</div>
					
				</section>
			</section>
		</section>
		
		<!-- 모달 -->
		<div id="modal">
			<div id="modal_content">
				
			</div>
		</div>

	<jsp:include page="../../../footer.jsp"/>
	</main>	
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>

		/* 영수증 팝업 */
		function receiptPopup(url) {
			if(${sessionScope.loginUser ne null}) {
				var popupX = (window.screen.width/2)-207.5;
				var popupY = (window.screen.height/2)-382.5;
				window.open(url, "receipt", "height=765, width=415, left="+popupX+", top="+popupY+", resizable=no");				
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
		
/* 		function searchList(eventCode) {
			$.ajax({
				url: "pointSearch.do",
				type: "post",
				data: {"searchCondition" : eventCode},
				dataType: "json",
				success: function(data) {
					var pointList = data['pointList'];
					//console.log(data['pointList'][0].pntListNo);
					//console.log(data['pointList'].length);
					//console.log(data['pi'].listCount);
					//${request.setAttribute(pointList)}
				
				}
			});
		} */
		
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