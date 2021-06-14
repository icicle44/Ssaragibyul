<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>관리자 독립유공자 공훈록 리스트</title>
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

	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
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
						<h4 class="page-title">독립유공자 공훈록 리스트</h4>
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
								<a href="adminIndependenceList.do">기념관 관리</a>
							</li>
							<li class="separator">
								<i class="flaticon-right-arrow"></i>
							</li>
							<li class="nav-item">
								<a href="adminIndependenceList.do">독립유공자 공훈록</a>
							</li>
						</ul>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title" style="margin:auto; text-align: center;">독립유공자 공훈록 리스트</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table id="basic-datatables" class="table table-hover" >
											<thead>
												<tr>
													<th>번호</th>
													<th>성명</th>
													<th>한자명</th>
													<th>생존연도</th>
													<th>운동계열</th>
													<th>포상년도</th>
													<th>포상훈격</th>
													<th>본적</th>
												</tr>
											</thead>
											<tbody>
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
											</tbody>
										</table>
										<!-- 페이징 -->
										<table style="height : 50px; margin:auto; text-align: center; font-size: 12px;">
											<tr align="center" height="20" >
												<td colspan="8">
													<!-- 이전 --> 
													<c:url var="before" value="adminIndependenceList.do">
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
														<c:url var="pagination" value="adminIndependenceList.do">
															<c:param name="page" value="${p }"></c:param>
														</c:url>
														<c:if test="${p eq pi.currentPage }">
															<font color="red" size="3">[${p }]</font>
														</c:if>
														<c:if test="${p ne pi.currentPage }">
															<a href="${pagination }">${p }</a>&nbsp;
														</c:if>
													</c:forEach> <!-- 다음 --> <c:url var="after" value="adminIndependenceList.do">
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
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					</div>
				</div> 
			</div>
		</div>		
</c:forEach>
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