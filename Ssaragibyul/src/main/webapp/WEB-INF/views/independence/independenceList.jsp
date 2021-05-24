<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>독립유공자 공훈록</title>
<%@include file="/header.jsp" %>
<link rel="stylesheet" href="/resources/css/independence/style_independence.css">
<link rel="stylesheet" href="/resources/js/independence/independence.js">

</head>
<body>
<div class="container-fluid col-md-12" >
	<section class="sideBar col-md-3">
		독립유공자 공훈록<hr>
		별들의 발자취<hr>
		별 보러 가자<hr>
		
	</section>

	<section class="contents col-md-9">
		<div class="intro">[독립유공자 공적조서]는</div>
		<div class="search">
		검색창
		</div>
 		<div class="table-users">
			<table  class="table" cellspacing="0">
				<tr>
					<th>번호</th>
					<th>성명</th>
					<th>한자명</th>
					<th>생존연도</th>
					<th>운동계열</th>
					<th>포상년도</th>
					<th>포상훈격</th>
					<th>본적</th>
					<th>상세보기</th>
				</tr>
				<c:forEach items="${iList }" var="independence">
				<%-- ${iList.get(0).toString() } --%>
				<tr>
					<td align="center">${independence.independenceNo }</td>
					<td align="center">${independence.nameKo }</td>
					<%-- <td align="center" id="modal_open" data-toggle="modal" data-target="#detailPopup${independence.independenceNo }">${independence.nameKo }</td> --%>
					<%-- <td align="center"><a id="modal_open" href="#detailPopup${independence.independenceNo }" data-toggle="modal">${independence.nameKo }</a></td> --%>
					<%-- <td align="center"><button id="modal_open" type="button" data-toggle="modal" data-target="#detailPopup${independence.independenceNo }">${independence.nameKo }</button></td> --%> 
					<td align="center">${independence.nameCh }</td>
					<td align="center">${independence.birthday } ~ ${independence.lastday }</td>
					<td align="center">${independence.activityLine }</td>
					<td align="center">${independence.prizedYear }</td>
					<td align="center">${independence.prizeClass }</td>
					<td align="center">${independence.registerLarge }&nbsp;${independence.registerMid }</td>
					<td align="center"><button class="button" id="open_modal">상세보기</button></td>
				</tr>
				</c:forEach>

				<!-- 페이징 -->
				<tr align="center" height="20">
					<td colspan="8">
					<!-- 이전 -->
					<c:url var="before" value="independenceList.do">
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
					<c:url var="pagination" value="independenceList.do">
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
				<c:url var="after" value="independenceList.do">
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
	</table>
</div> 
			<!-- <button class="btn btn-default" data-target="#detailPopup" data-toggle="modal">모달출력버튼</button><br/> -->
<%-- <c:forEach items="${iList }" var="modal"> --%>
<div class="modal fade" id="detailPopup${modal.independenceNo }" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">
					<strong>독립 운동가 정보</strong>
				</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				 <div class="container">
					<table class="table">

						<tr>
							<td class="colored">성명</td>
							<td colspan="3">${modal.nameKo }</td>
						</tr>
						<tr>
							<td class="colored">유공자 번호</td>
							<td>${modal.independenceNo }</td>
							<td class="colored">한자</td>
							<td>${modal.nameCh }</td>
						</tr>
						<tr>
							<td class="colored">운동계열</td>
							<td>${modal.activityLine }</td>
							<td class="colored">성별</td>
							<td>${modal.sex }</td>
						</tr>
						<tr>
							<td class="colored">생년월일</td>
							<td>${modal.birthday }</td>
							<td class="colored">사망년월일</td>
							<td>${modal.lastday }</td>
						</tr>
						<tr>
							<td class="colored">본적</td>
							<td colspan="3">${modal.registerLarge }&nbsp;${mList.registerMid }</td>
						</tr>
						<tr>
							<td class="colored">공적개요</td>
							<td colspan="3">${modal.achievement }
							</td>
						</tr>
					
					</table>
				</div> 
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<%-- 	</c:forEach> --%>
	<%@include file="/footer.jsp" %>
	</section>
</div>
<script>
    $(document).ready(function(){
        $("#open_modal").click(function(){
            $("#detailPopup${modal.independenceNo }").modal();
        });
    });

</script>
</body>
</html>