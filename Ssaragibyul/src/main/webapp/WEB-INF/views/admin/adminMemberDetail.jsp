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
						<h4 class="page-title">회원 상세보기</h4>
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
								<a href="adminMemberListView.do">회원 리스트</a>
							</li>
						</ul>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title text-center">${member.userName }님 정보 상세보기</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
									<form action="daminMemberModify.do" method="post">
										<table class="table table-hover" >
											<tbody>
                                               <tr>
									               <td>* 아이디</td>
									               <td>
									                  <input type="text" name="userId" id="userId" value="${ member.userId }" readonly>
									               </td>
									            </tr>
									            <tr>
									               <td>* 이름</td>
									               <td><input type="text" name="userName" value="${ member.userName }" ></td>
									            </tr>
									            <tr>
									               <td>* 닉네임</td>
									               <td><input type="text" name="nickName" value="${ member.nickName }"></td>
									            </tr>
									            <tr>
									               <td>* 이메일</td>
									               <td><input type="email" name="userEmail" value="${ member.userEmail }"></td>
									            </tr>
									            <tr>
									               <td>* 전화번호</td>
									               <td><input type="text" name="userPhone" value="${ member.userPhone }"></td>
									            </tr>
									           <tr>
									               <td>* 주소</td>
									               <td><input type="text" name="userAddr" value="${ member.userAddr }"></td>
									            </tr>
											</tbody>
										</table>
										</form>
											<div>
												<input type="submit" class="btn btn-outline-secondary float-right" value="수정하기"> 
												<button type="button" class="btn btn-outline-secondary float-right" onclick="location.href='adminMemberDelete.do?userId=${member.userId}';">삭제하기</button>
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

</body>
</html>