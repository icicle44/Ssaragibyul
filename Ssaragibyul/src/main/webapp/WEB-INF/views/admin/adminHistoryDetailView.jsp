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
								<a href="adminIndependenceList.do">기념관 관리</a>
							</li>
							<li class="separator">
								<i class="flaticon-right-arrow"></i>
							</li>
							<li class="nav-item">
								<a href="adminHistoryList.do">별들의 발자취</a>
							</li>
						</ul>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title text-center">${ histoy.siteNo }번 별들의 발자취 상세보기</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-hover" >
											<tbody>
												<tr>
													<td colspan="2" style="text-align: center;">
														<img alt="" src="resources/upLoadFile/${histoy.renameFilename }">
													</td>
												</tr>
                                               <tr>
									               <td>사적지 이름</td>
									               <td>${ histoy.siteName }</td>
									            </tr>
									            <tr>
					                                <td>사적지 유형</td>
					                                <td>${ histoy.siteType }</td>
					                            </tr>
					                            <tr>
					                            	<td>지도</td>
					                            	<td>					
					                            	<input type="hidden" id="lat" value="${histoy.latitude}" >	               
					                            	<input type="hidden" id="lng" value="${histoy.longitude}" >	               
					                            		<div id="map"></div>
					                            	</td>
					                            </tr>
						                        <tr>
						                            <td>주소</td>
						                            <td>${ histoy.siteAddr }</td>
						                        </tr>
									            <tr>
									               <td>설명</td>
									               <td>${ histoy.siteContents }</td>
									            </tr>
									            <tr>
									               <td>첨부파일</td>
									               <td>
														<c:if test="${!empty histoy.originarFilename }">
															${ histoy.originarFilename }
														</c:if>
													</td>
									            </tr>
											</tbody>
										</table>
										<div>
										 	<c:url var="hModify" value="adminModifyView.do">
												<c:param name="siteNo" value="${histoy.siteNo }"></c:param>
											</c:url>
											<c:url var="hDelete" value="adminHistoryDelete.do">
												<c:param name="siteNo" value="${histoy.siteNo }"></c:param>
												<c:param name="renameFilename" value="${histoy.originarFilename }"></c:param>
											</c:url>
											<button class="btn btn-outline-secondary float-right"><a href="${hModify}">수정 페이지로 이동</a></button>&nbsp;
											<button class="btn btn-outline-secondary float-right"><a href="${hDelete}">삭제하기</a></button>
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
	function initMap() {

		  // The location of Uluru
		  //var lat = document.getElementById("lat").value;
		  //var lng = document.getElementById("lng").value;
		  var latitude = Number($('#lat').val());
		  var longitude = Number($('#lng').val());
		  console.log(latitude + ", " + longitude);
		 
		  var uluru = {lat: latitude, lng: longitude};

		  // The map, centered at Uluru

		  var map = new google.maps.Map(

		      document.getElementById('map'), {zoom: 15, center: uluru});

		  // The marker, positioned at Uluru

		  var marker = new google.maps.Marker({position: uluru, map: map});

		}

		    </script>

		    <!--Load the API from the specified URL

		    * The async attribute allows the browser to render the page while the API loads

		    * The key parameter will contain your own API key (which is not needed for this tutorial)

		    * The callback parameter executes the initMap() function

		    -->

		    <script async defer

		    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCyTc2MMJwLr1q-4zJKrWn9gUx1OYmyIS8&callback=initMap">

	</script>
</body>
</html>