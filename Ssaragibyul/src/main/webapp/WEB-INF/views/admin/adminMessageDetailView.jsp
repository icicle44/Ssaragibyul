<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>관리자 쪽지 관리</title>
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
						<h4 class="page-title">쪽지 리스트</h4>
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
								<a href="adminMessageList.do">쪽지관리</a>
							</li>
							<li class="separator">
								<i class="flaticon-right-arrow"></i>
							</li>
							<li class="nav-item">
								<a href="adminMessageList.do">받은 쪽지함</a>
							</li>
						</ul>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">쪽지 리스트</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table id="basic-datatables" class="table table-hover" >
										<button type="button" class="btn btn-outline-warning" style="height: 31px; margin-bottom: 30px;" onclick="#">삭제
										</button>
											<thead>
												<tr style="border-bottom:hidden;">
													<th>번호</th>
													<th>닉네임</th>
													<th>쪽지 제목</th>
													<th>받은 날짜</th>
													<c:if test="${flag=='rec' }">
														<th width="100px"></th>
													</c:if>
													<c:if test="${flag=='send' }">
														<th width="100px">수신확인</th>
													</c:if>
													<th><input type="checkbox" class="msg-del-check" id="checkAll"></th>
												</tr>
											</thead>
											<tbody>
						   						<c:if test="${empty msgList}">
													<tr>
														<td>${tblMsg}</td>
													</tr>
												</c:if>
												<c:if test="${!empty msgList}">
													<c:forEach items="${msgList}" var="message" varStatus="index">
														<tr>
															<td>${index.count }</td>
															<c:if test="${message.msgType != 0}">
																<!-- MessageAndNick객체 사용 -->
																<c:if test="${flag=='rec'}">
																	<c:url var="msgWriteUrl4" value="msgWriterView.do">
																		<c:param name="receiverId" value="${message.senderId }"></c:param>
																		<c:param name="msgType" value="4"></c:param>
																		<c:param name="nickName" value="${message.nickName }"></c:param>
																	</c:url>
																</c:if>
																<c:if test="${flag=='send'}">
																	<c:url var="msgWriteUrl4" value="msgWriterView.do">
																		<c:param name="receiverId" value="${message.receiverId }"></c:param>
																		<c:param name="msgType" value="4"></c:param>
																		<c:param name="nickName" value="${message.nickName }"></c:param>
																	</c:url>											
																</c:if>
																
																<td><a href="#" onclick="msgPopup('${msgWriteUrl4}');">${message.nickName } 선생</a></td>
															</c:if>
															<c:if test="${message.msgType == 0}">
																<!-- Message 객체 사용 -->
																<td>관리자</td>
															</c:if>
															<c:if test="${message.msgType != 0}">
																<c:url var="msgDetail" value="msgDetail.do">
																	<c:param name="msgNo" value="${message.msgNo }"></c:param>
																	<c:param name="nickName" value="${message.nickName }"></c:param>
																	<c:param name="flag" value="${flag }"></c:param>
																</c:url>
															</c:if>
															<c:if test="${message.msgType == 0}">
																<c:url var="msgDetail" value="msgDetail.do">
																	<c:param name="msgNo" value="${message.msgNo }"></c:param>
																	<c:param name="nickName" value=""></c:param>
																	<c:param name="flag" value="${flag }"></c:param>
																</c:url>
															</c:if>					
															<td><a href="#" onclick="msgPopup('${msgDetail }');">${message.msgTitle }</a></td>
															<td><fmt:formatDate value="${message.regDate }" pattern="yyyy.MM.dd HH:mm"/></td>
															<c:if test= "${message.msgType != 0 }">
																<c:if test="${message.readYn == 1 }">
																	<td id=${message.msgNo }>읽음</td>
																</c:if>
																<c:if test="${message.readYn == 0 }">
																	<td id=${message.msgNo }>읽지 않음</td>
																</c:if>
															</c:if>
															<td><input type="checkbox" class="msg-del-check" name="chk" value="${message.msgNo }"></td>					
														</tr>
													</c:forEach>
												</c:if>
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

	<script>
		$(document).ready(function() {
			$('#basic-datatables').DataTable({
			});
	
			$('#multi-filter-select').DataTable( {
				"pageLength": 5,
				initComplete: function () {
					this.api().columns().every( function () {
						var column = this;
						var select = $('<select class="form-control"><option value=""></option></select>')
						.appendTo( $(column.footer()).empty() )
						.on( 'change', function () {
							var val = $.fn.dataTable.util.escapeRegex(
								$(this).val()
								);
	
							column
							.search( val ? '^'+val+'$' : '', true, false )
							.draw();
						} );
	
						column.data().unique().sort().each( function ( d, j ) {
							select.append( '<option value="'+d+'">'+d+'</option>' )
						} );
					} );
				}
			});
	
			// Add Row
			$('#add-row').DataTable({
				"pageLength": 5,
			});
	
			var action = '<td> <div class="form-button-action"> <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';
	
			$('#addRowButton').click(function() {
				$('#add-row').dataTable().fnAddData([
					$("#addName").val(),
					$("#addPosition").val(),
					$("#addOffice").val(),
					action
					]);
				$('#addRowModal').modal('hide');
	
			});
		});
		
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
		
		$(function(){
			/* 체크박스 전체 체크/해제 */
			$("#checkAll").on("click", function(){
				if($("#checkAll").prop("checked")) {
					$("input[name=chk]").prop("checked", true);
				}else {
					$("input[name=chk]").prop("checked", false);
				}
			});
			$("input[name=chk]").on("click", function(){
				$("#checkAll").prop("checked", false);
				var cnt = $("input[name=chk]:checked").length;
				if(cnt == $("input[name=chk]").length) {
					$("#checkAll").prop("checked", true);
				}
			});
		});
	</script>
</body>
</html>