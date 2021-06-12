<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>관리자 회원관리</title>
	<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
	<link rel="icon" href="resources/img/admin/icon.ico" type="image/x-icon"/>

	<!-- Fonts and icons -->
	<script src="resources/js/admin/plugin/webfont/webfont.min.js"></script>
	<script>
		WebFont.load({
			google: {"families":["Lato:300,400,700,900"]},
			custom: {"families":["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands", "simple-line-icons"], urls: ['resources/css/admin/fonts.min.css']},
			active: function() {
				sessionStorage.fonts = true;
			}
		});
	</script>

	<!-- CSS Files -->
	<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700,900|Oswald:400,700" rel="stylesheet">
	<link rel="stylesheet" href="resources/css/admin/bootstrap.min.css">
	<link rel="stylesheet" href="resources/css/admin/atlantis.min.css">

	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link rel="stylesheet" href="resources/css/admin/demo.css">
</head>
<body>
	<div class="wrapper">
		<%@include file="header.jsp" %>

        <!--메인-->
	<div class="main-panel">
			<div class="content">
				<div class="page-inner">
					<div class="page-header">
						<h4 class="page-title">회원 리스트</h4>
						<ul class="breadcrumbs">
							<li class="nav-home">
								<a href="adminMain.do">
									<i class="flaticon-home"></i>
								</a>
							</li>
							<li class="separator">
								<i class="flaticon-right-arrow"></i>
							</li>
							<li class="nav-item">
								<a href="adminMemberListView.do">회원 정보 관리</a>
							</li>
							<li class="separator">
								<i class="flaticon-right-arrow"></i>
							</li>
							<li class="nav-item">
								<a href="#">회원 리스트</a>
							</li>
						</ul>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title text-center">회원 리스트</h4>
									<!-- 검색 -->
									<div class="row-fluid" align="right">
										<form class="pull-right" action="memberSearch.do" method="get">
											<select name="searchCondition">
												<option value="all"
													<c:if test="${search.searchCondition == 'all' }">selected</c:if>>전체</option>
												<option value="id"
													<c:if test="${search.searchCondition == 'id' }">selected</c:if>>ID</option>
												<option value="nickName"
													<c:if test="${search.searchCondition == 'nickName' }">selected</c:if>>닉네임</option>
												<option value="name"
													<c:if test="${search.searchCondition == 'name' }">selected</c:if>>이름</option>
											</select> <input type="text" name="searchValue"
												value="${ search.searchValue }"> <input type="submit" value="검색">
										</form>
									</div>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-hover" >
											<thead>
												<tr>
													<th>번호</th>
													<th>회원ID</th>
													<th>별명</th>
													<th>이름</th>
													<th>회원가입일</th>
													<th>회원등급</th>
												</tr>
											</thead>
											
											<tbody>
                                               <c:forEach items="${mList }" var="member" varStatus="index">
                                                <tr>
													<td>${index.count }</td>
													<td>
 														<c:url var="mDetail" value="adminMemberDetail.do">
															<c:param name="userId" value="${member.userId }"></c:param>
														</c:url>
														<a href="${mDetail }"> ${ member.userId }</a>
													</td>
													<c:url var="msgWriteUrl4" value="msgWriterView.do">
				                                       <c:param name="receiverId" value="${member.userId }"></c:param>
				                                       <c:param name="msgType" value="4"></c:param>
				                                       <c:param name="nickName" value="${member.nickName }"></c:param>
				                                    </c:url>
													<td>
														<a href="#" onclick="msgPopup('${msgWriteUrl4}'); return false;">
														${member.nickName }</a>
													</td>
													<td>${member.userName }</td>
													<td>${member.enrollDate}</td>
													<td>${member.mCode }</td>
												</tr>
											</c:forEach>
											</tbody>
										</table>
										<!-- 페이징 -->
										<table style="height : 50px; margin:auto; text-align: center; font-size: 12px;">
											<tr align="center" height="20" >
												<td colspan="8">
													<!-- 이전 --> 
													<c:url var="before" value="adminMemberListView.do">
														<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
													</c:url> 
													<c:if test="${pi.currentPage <= 1 }">
														[이전]&nbsp;
													</c:if> 
													<c:if test="${pi.currentPage > 1 }">
														<a href="${before }">[이전]</a>&nbsp;
													</c:if>
													<!-- 페이지 --> <c:forEach var="p" begin="${pi.startPage }"
														end="${pi.endPage }">
														<c:url var="pagination" value="adminMemberListView.do">
															<c:param name="page" value="${p }"></c:param>
														</c:url>
														<c:if test="${p eq pi.currentPage }">
															<font color="red" size="3">[${p }]</font>
														</c:if>
														<c:if test="${p ne pi.currentPage }">
															<a href="${pagination }">${p }</a>&nbsp;
														</c:if>
													</c:forEach> <!-- 다음 --> <c:url var="after" value="adminMemberListView.do">
														<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
													</c:url> <c:if test="${pi.currentPage >= pi.maxPage }">
														[다음]&nbsp;
													</c:if> <c:if test="${pi.currentPage < pi.maxPage }">
														<a href="${after }">[다음]</a>&nbsp;
													</c:if>
												</td>
											</tr>
											</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Custom template -->
	</div>
	<!--   Core JS Files   -->
	<script src="resources/js/admin/core/jquery.3.2.1.min.js"></script>
	<script src="resources/js/admin/core/popper.min.js"></script>
	<script src="resources/js/admin/core/bootstrap.min.js"></script>
	
	<!-- jQuery UI -->
	<script src="resources/js/admin/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script src="resources/js/admin/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

	<!-- jQuery Scrollbar -->
	<script src="resources/js/admin/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

	<!-- Datatables -->
	<script src="resources/js/admin/plugin/datatables/datatables.min.js"></script>

	<!-- Atlantis JS -->
	<script src="resources/js/admin/atlantis.min.js"></script>

	<!-- Atlantis DEMO methods, don't include it in your project! -->
	<script src="resources/js/admin/setting-demo2.js"></script>

</body>
</html>