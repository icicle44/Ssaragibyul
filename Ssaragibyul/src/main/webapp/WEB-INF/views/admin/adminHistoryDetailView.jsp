<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>별들의 발자취 상세보기</title>
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
<!-- 	<link rel="stylesheet" type="text/css" href="/resources/css/mypage/userUpdate.css"> -->

	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link rel="stylesheet" href="resources/css/admin/demo.css">
	
	<style>
		.btn-outline-secondary {
			margin: 5px;
		}
	</style>
	
</head>
<body>
	<div class="wrapper">
		<%@include file="header.jsp" %>

        <!--메인-->
	<div class="main-panel">
			<div class="content">
				<div class="page-inner">
					<div class="page-header">
						<h4 class="page-title">별들의 발자취 상세보기</h4>
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
								<a href="#">기념관 게시판 관리</a>
							</li>
							<li class="separator">
								<i class="flaticon-right-arrow"></i>
							</li>
							<li class="nav-item">
								<a href="#">별들의 발자취</a>
							</li>
						</ul>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title text-center">${ history.siteNo }번 별들의 발자취 상세보기</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-hover" >
											<tbody>
                                               <tr>
									               <td>사적지 이름</td>
									               <td>${ history.siteName }</td>
									            </tr>
									            <tr>
					                                <td>사적지 유형</td>
					                                <td>${ history.stieType }</td>
					                            </tr>
						                        <tr>
						                            <td>주소</td>
						                            <td>${ history.siteAddr }</td>
						                        </tr>
									            <tr>
									               <td>설명</td>
									               <td>${ history.siteContents }</td>
									            </tr>
									            <tr>
									               <td>첨부파일</td>
									               <td>
														<c:if test="${!empty history.originalFilename }">
															${ history.originalFilename }
														</c:if>
													</td>
									            </tr>
									            <tr>
													<td colspan="2" align="center">
										 				<c:url var="hModify" value="adminModifyView.do">
															<c:param name="siteNo" value="${history.siteNo }"></c:param>
														</c:url>
														<%-- 
														<c:url var="hDelete" value="adminHistoryDelete.do">
															<c:param name="siteNo" value="${history.siteNo }"></c:param>
															<c:param name="renameFilename" value="${history.originalFilename }"></c:param>
														</c:url>
														 --%>
														<a href="${hModify}">수정 페이지로 이동</a>&nbsp;
														<div id="delete">
															<input type="button" value="삭제하기" onclick="fnUserDelete()" id="delete-btn">
															<%-- <a href="${hDelete}">삭제하기</a> --%>
														</div>
													</td>
												</tr>
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
	
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
    
	<script>
	
		    $(function() {
		        $("#postcodify_search_button").postcodifyPopUp();
		     });
      
			$(document).ready(function(){
			  $('#delete-btn').click(function(){
			  	confirm('정말로 탈퇴하시겠습니까?');
			  		return false;
			  });
          	var siteNo = '${ history.siteNo }';
        	location.href="adminHistoryDelete.do?siteNo="+ siteNo;
			});
	</script>
</body>
</html>