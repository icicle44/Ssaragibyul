<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>별 보러가자 상세보기</title>
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
		.btn-warning {
			margin: 5px;
		}
		
		#map {
        height: 400px;  /* The height is 400 pixels */
        width: 100%;  /* The width is the width of the web page */
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
						<h4 class="page-title">별 보러 가자 상세보기</h4>
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
									<h4 class="card-title text-center">${visit.visitNo }번째 별 보러 가자 상세보기</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table justify-content-md-center"  >
											<tbody>
												<tr>
													<td colspan="4" style="text-align: center;">
														<img alt="" src="/resources/vUploadFiles/${visit.renameFilename }" />
													</td>
												</tr>
					                            <tr>
					                            	<th>제목</th>
					                            	<td colspan="3">${visit.visitTitle }</td>
					                            </tr>
                                               <tr>
									               <th>아이디</th>
									               <td>${ visit.userId }</td>
					                               <th>닉네임</th>
					                               <td>${ visit.nickName }</td>
									            </tr>
									            <tr>
									               <th>사적지 번호</th>
									               <td>${ visit.siteNo }</td>
					                               <th>사적지 이름</th>
					                               <td>${ visit.siteName }</td>
									            </tr>
									            <tr>
									               <th>조회수</th>
									               <td>${ visit.visitCount }</td>
									               <th>좋아요수</th>
									               <td>${ visit.likes }</td>
									            </tr>
						                        <tr>
						                            <th>내용</th>
						                            <td colspan="3" rowspan="2">${ visit.visitContents }</td>
						                        </tr>
											</tbody>
										</table>
										<div>
											<c:url var="vDelete" value="adminVisitDelete.do">
												<c:param name="visitNo" value="${visit.visitNo }"></c:param>
											</c:url>
											<div id="delete">
						                       <input type="button" value="삭제하기" onclick="fnUserDelete()" id="delete-btn" class="btn btn btn-warning float-right">
						                    </div>
											<%-- <button class="btn btn btn-warning float-right"><a href="${vDelete}" style="text-decoration: none; color: ffffff;">삭제하기</a></button> --%>
											<button type="button" class="btn btn btn-warning float-right" onclick="location.href='adminVisitList.do';">목록보기</button>
<%-- 											<button type="button" class="btn btn-outline-secondary float-right" onclick="location.href='adminModifyView.do?siteNo=${history.siteNo}';">수정하기</button>
											<button type="button" class="btn btn-outline-secondary float-right" onclick="location.href='adminHistoryDelete.do?siteNo=${history.siteNo}';">삭제하기</button>  --%>
										</div>
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
    function fnUserDelete() {
    	if(!confirm('정말로 삭제하시겠습니까?')){
				return false;
			}
    	var visitNo = '${ visit.visitNo }';
    	location.href="adminVisitDelete.do?visitNo="+ visitNo;
    }
    </script>
</body>
</html>