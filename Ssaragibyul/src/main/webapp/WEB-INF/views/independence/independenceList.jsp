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
<!-- Font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

</head>
<body>
<div class="container-fluid col-md-12" >
	<section class="sideBar col-md-4">
		독립유공자 공훈록<hr>
		<a href="#">별들의 발자취</a><hr>
		<a href="visitList.do">별 보러 가자</a><hr>
	</section>
	<section class="contents col-md-8">
	  <div class="search">
		<article class="accordion">
		  <section id="acc1">
		    <h2><a href="#acc1">성명</a></h2>
		    <form class="searchform cf" id="form1">
			  <input type="text" placeholder="성명을 입력해주세요">
			  <button type="submit">검색</button>
			</form>
		  </section>
		  
		  <section id="acc2">
		    <h2><a href="#acc2">운동계열</a></h2>
		    <form class="searchform cf" id="form2">
			  <input type="text" placeholder="운동계열을 입력해주세요">
			  <button type="submit">검색</button>
			</form>
		  </section>
		  
		  <section id="acc3">
		    <h2><a href="#acc3">포상연도</a></h2>
		    <form class="searchform cf">
			  <input type="text" placeholder="포상연도를 입력해주세요">
			  <button type="submit">검색</button>
			</form>
		  </section>
		  
		  <section id="acc4">
		    <h2><a href="#acc4">포상훈격</a></h2>
		    <form class="searchform cf">
			  <input type="text" placeholder="포상훈격을 입력해주세요">
			  <button type="submit">검색</button>
			</form>
		  </section>
		  
		  <section id="acc5">
		    <h2><a href="#acc5">본적</a></h2>
		    <form class="searchform cf">
			  <input type="text" placeholder="본적을 입력해주세요">
			  <button type="submit">검색</button>
			</form>
		  </section>
		</article>
		</div>
 		<div class="table-users">
			<table cellspacing="0">
				<tr>
					<th><b>번호</b></th>
					<th><b>성명</b></th>
					<th><b>한자명</b></th>
					<th><b>생존연도</b></th>
					<th><b>운동계열</b></th>
					<th><b>포상년도</b></th>
					<th><b>포상훈격</b></th>
					<th><b>본적</b></th>
				</tr>
				<c:forEach items="${iList }" var="list">
				<tr>
					<td align="center">${list.independenceNo }</td>
					<td align="center"><a href="#modal_open${list.independenceNo }" data-toggle="modal">${list.nameKo }</a></td>
					<td align="center">${list.nameCh }</td>
					<td align="center">${list.birthday } ~ ${independence.lastday }</td>
					<td align="center">${list.activityLine }</td>
					<td align="center">${list.prizedYear }</td>
					<td align="center">${list.prizeClass }</td>
					<td align="center">${list.registerLarge }&nbsp;${list.registerMid }</td>
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
						<font color="red" size="2">[${p }]</font>
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
	<%@include file="/footer.jsp" %>
</section>
<!-- 모달창 -->
<c:forEach items="${iList }" var="list">
	<div class="modal fade" id="modal_open${list.independenceNo }" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" static>
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
 					<table class="table">
						<tr>
							<td class="colored">성명</td>
							<td colspan="3">${list.nameKo }</td>
						</tr>
						<tr>
							<td class="colored">유공자 번호</td>
							<td>${list.independenceNo }</td>
							<td class="colored">한자</td>
							<td>${list.nameCh }</td>
						</tr>
						<tr>
							<td class="colored">운동계열</td>
							<td>${list.activityLine }</td>
							<td class="colored">성별</td>
							<td>${list.sex }</td>
						</tr>
						<tr>
							<td class="colored">생년월일</td>
							<td>${list.birthday }</td>
							<td class="colored">사망년월일</td>
							<td>${list.lastday }</td>
						</tr>
						<tr>
							<td class="colored">본적</td>
							<td colspan="3">${list.registerLarge }&nbsp;${list.registerMid }</td>
						</tr>
						<tr>
							<td class="colored">공적개요</td>
							<td colspan="3">${list.achievement }
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
</c:forEach>	


	</section>
</div>
<script>
$('html, body').css({'overflow': 'hidden', 'height': '100%'});
$('#element').on('scroll touchmove mousewheel', function(event) {
event.preventDefault();
event.stopPropagation();
return false;
}); 

	
</script>
</body>
</html>