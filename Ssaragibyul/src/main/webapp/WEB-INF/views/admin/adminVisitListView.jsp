<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>별 보러 가자 리스트</title>
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
						<h4 class="page-title">별 보러 가자  리스트</h4>
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
								<a href="adminVisitList.do">별 보러 가자 관리</a>
							</li>
							<li class="separator">
								<i class="flaticon-right-arrow"></i>
							</li>
							<li class="nav-item">
								<a href="adminVisitList.do">별 보러 가자 리스트</a>
							</li>
						</ul>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title" style="margin: auto; text-align: center;">별 보러 가자 리스트</h4>
											<!-- 검색 -->
												<div id="pj_search">
													<form class="pull-right" action="adminVisitSearch.do" method="get">
														<input type="text" name="searchValue" class="scan"
															value="${search.searchValue }">&nbsp; <input
															type="submit" class="scan" value="검색">
													</form>
												</div>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table id="basic-datatables" class="table table-hover" >
											<thead style="margin: auto; text-align: center;">
												<tr>
													<th>번호</th>
													<th>아이디</th>
													<th>닉네임</th>
													<th>글제목</th>
													<th>사적지 번호</th>
												</tr>
											</thead>
											<tbody>
                                               <c:forEach items="${vList }" var="list">
												<tr>
													<td align="center">${list.visitNo }</td>
													<td align="center">${list.userId }</td>
													<c:url var="msgWriteUrl4" value="msgWriterView.do">
				                                       <c:param name="receiverId" value="${list.userId }"></c:param>
				                                       <c:param name="msgType" value="4"></c:param>
				                                       <c:param name="nickName" value="${list.nickName }"></c:param>
				                                    </c:url>
													<td align="center">
													<a href="#" onclick="msgPopup('${msgWriteUrl4}'); return false;">
														${list.nickName }</a>
													</td>
													<td align="center">
														<c:url var="vDetail" value="adminVisitDetail.do">
															<c:param name = "visitNo" value=" ${list.visitNo } "></c:param>
														</c:url>
														<a href="${vDetail }">${list.visitTitle }</a>
													</td>
													<td align="center">${list.siteNo }</td>
												</tr>
												</c:forEach>
											</tbody>
										</table>
										<button type="button" class="btn btn-warning float-right" onclick="location.href='adminVisitDelete.do?visitNo=${list.visitNo}';">삭제하기</button>
										<!-- 페이징 -->
										<table style="height : 50px; margin: auto; text-align: center; font-size: 12px;">
											<tr align="center" height="20" >
												<td colspan="8">
													<!-- 이전 --> 
													<c:url var="before" value="adminVisitList.do">
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
														<c:url var="pagination" value="adminVisitList.do">
															<c:param name="page" value="${p }"></c:param>
														</c:url>
														<c:if test="${p eq pi.currentPage }">
															<font color="red" size="3">[${p }]</font>
														</c:if>
														<c:if test="${p ne pi.currentPage }">
															<a href="${pagination }">${p }</a>&nbsp;
														</c:if>
													</c:forEach> <!-- 다음 --> <c:url var="after" value="adminVisitList.do">
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