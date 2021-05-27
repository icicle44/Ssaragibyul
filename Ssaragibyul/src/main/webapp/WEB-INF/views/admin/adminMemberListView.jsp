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
<!-- 로고들이 다 안나와요 ㅠㅠ -->
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
										<form class="pull-right" action="#" method="get">
											<select name="searchCondition">
												<option value="all"
													<c:if test="${search.searchCondition == 'all' }">selected</c:if>>전체</option>
												<option value="writer"
													<c:if test="${search.searchCondition == 'writer' }">selected</c:if>>작성자</option>
												<option value="title"
													<c:if test="${search.searchCondition == 'title' }">selected</c:if>>제목</option>
												<option value="content"
													<c:if test="${search.searchCondition == 'content' }">selected</c:if>>내용</option>
											</select> <input type="text" name="searchValue"
												value="${ search.searchValue }"> <input
												type="submit" value="검색">
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
													<td>${member.nickName }</td>
													<td>${member.userName }</td>
													<td>${member.enrollDate}</td>
													<td>${member.mCode }</td>
												</tr>
											</c:forEach>
											</tbody>
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