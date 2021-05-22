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
<style type="text/css">
.sideBar{
	float:left;
	padding-top:200px;
}
.contents{
	float:right;
}
</style>
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
			<!--    <div class="header">Users</div> -->
			<table class="table" cellspacing="0">
				<tr>
					<th>순번</th>
					<th>성명</th>
					<th>한자명</th>
					<th>생존연도</th>
					<th>운동계열</th>
					<th>포상년도</th>
					<th>포상훈격</th>
					<th>본적</th>
				</tr>
				<c:forEach items="${iList }" var="independence">
				<%-- ${iList.get(0).toString() } --%>
				<tr>
					<td align="center">${independence.independenceNo }</td>
					<td align="center">${independence.nameKo }</td>
					<td align="center">${independence.nameCh }</td>
					<td align="center">${independence.birthday } ~ ${independence.lastday }</td>
					<td align="center">${independence.activityLine }</td>
					<td align="center">${independence.prizedYear }</td>
					<td align="center">${independence.prizeClass }</td>
					<td align="center">${independence.registerLarge }&nbsp;${independence.registerMid }</td>
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
	</section>
</div>
<%-- <%@include file="/footer.jsp" %> --%>
</body>
</html>