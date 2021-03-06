<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>관리자 메인페이지</title>
	<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />

	<!-- Fonts and icons -->
	<script src="/resources/js/admin/plugin/webfont/webfont.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<link href='/resources/css/admin/main.css' rel='stylesheet' />
    <script src='/resources/js/admin/main.js'></script>
	<script src='/resources/js/admin/ko.js'></script>
	<script>
		WebFont.load({
			google: {"families":["Lato:300,400,700,900"]},
			custom: {"families":["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands", "simple-line-icons"], urls: ['resources/css/admin/fonts.min.css']},
			active: function() {
				sessionStorage.fonts = true;
			}
		});
		
		var fList = getfList();
		function getfList() {
			var result = "";
			$.ajax({
    			url : "FundingCalendar.do",
    			type : 'POST',
    			dataType : 'json',
    			async : false,
    			success : function(data) {
    				result = data;
					console.log(data);
				}
    		});
			return result;
		}
		console.log(fList);
		
		var dList = getdList();
		function getdList() {
			var result = "";
			$.ajax({
    			url : "DonationCalendar.do",
    			type : 'POST',
    			dataType : 'json',
    			async : false,
    			success : function(data) {
    				result = data;
					console.log(data);
				}
    		});
			return result;
		}
		
		 document.addEventListener('DOMContentLoaded', function() {
		        var calendarEl = document.getElementById("calendar");
		        var calendar = new FullCalendar.Calendar(calendarEl, {
		        	editable : true,
		            selectable : true,
		            businessHours : true,
		            locale : "ko",
		            height : "610px",
		            dayMaxEvents : true,
		            dayMaxEvents : 2,
		            eventSources: [ fList, dList ]
		             /* eventColor: 'rgba(255, 99, 132, 0.2)'  */
		        });
		        calendar.render();
		      });
	</script>

	<!-- CSS Files -->
	<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700,900|Oswald:400,700" rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/admin/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/css/admin/atlantis.min.css">

	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link rel="stylesheet" href="/resources/css/admin/demo.css">
</head>
<body>
	<div class="wrapper">
	<%@include file="header.jsp" %>

        <!--메인-->
		<div class="main-panel">
			<div class="content">
				<div class="panel-header bg-primary-gradient">
					<div class="page-inner py-5" style="background-color: #EB5C01">
						<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
							<div>
								<h2 class="text-white pb-2 fw-bold">관리자 페이지</h2>
								<h5 class="text-white op-7 mb-2">싸라기별 프로젝트</h5>
							</div>
							<div class="ml-md-auto py-2 py-md-0">
								<a href="#" class="btn btn-white btn-border btn-round mr-2" onclick="msgPopup('msgWriterView.do')">공지하기</a>
								<a href="adminHistoryWriteView.do" class="btn btn-secondary btn-round">기념관 등록하기</a>
							</div>
						</div>
					</div>
				</div>
                
                <!--메인 내용-->
				<div class="page-inner mt--5">
					<div class="row mt--2">
						<div class="col-md-6">
                            <!--회원관리-->
							<div class="card full-height">
								<div class="card-body">
									<div class="card-title">회원관리</div>
									<div class="d-flex flex-wrap justify-content-around pb-2 pt-4">
										<div class="px-2 pb-2 pb-md-0 text-center">
											<div id="circles-1"></div>
											<h6 class="fw-bold mt-3 mb-0">신규회원</h6>
										</div>
										<div class="px-2 pb-2 pb-md-0 text-center">
											<div id="circles-2"></div>
											<h6 class="fw-bold mt-3 mb-0">전체회원</h6>
										</div>
										<div class="px-2 pb-2 pb-md-0 text-center">
											<div id="circles-3"></div>
											<h6 class="fw-bold mt-3 mb-0">탈퇴회원</h6>
										</div>
									</div>
								</div>
							</div>
						</div>
                        <!--신고관리-->       
						<div class="col-md-6">
							<div class="card full-height">
								<div class="card-body">
									<div class="card-title">펀딩신고관리</div>
									<div class="row py-3">
										<div class="col-md-4 d-flex flex-column justify-content-around">
											<div>
												<h6 class="fw-bold text-uppercase text-success op-8">오늘 신고건</h6>
												<h3 class="fw-bold">${todayRepor }</h3>
											</div>
											<div>
												<h6 class="fw-bold text-uppercase text-danger op-8">전체 신고건</h6>
												<h3 class="fw-bold">${ allRepor}</h3>
											</div>
										</div>
										<div class="col-md-8">
											<div id="chart-container">
												<canvas id="totalIncomeChart"></canvas>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
                    <!--게시판 현황-->
					<div class="row">
						<div class="col-md-8">
							<div class="card">
								<div class="card-header">
									<div class="card-head-row">
										<div class="card-title">별 보러가자 게시글 현황</div>
										<div class="card-tools">
											<a href="#" class="btn btn-info btn-border btn-round btn-sm mr-2">
												<span class="btn-label">
													<i class="fa fa-pencil"></i>
												</span>
												별보러가자 바로가기
											</a>
										</div>
									</div>
								</div>
								<div class="card-body">
									<div class="chart-container" style="min-height: 375px">
										<canvas id="myChart"></canvas>
									</div>
									<div id="myChartLegend"></div>
								</div>
							</div>
						</div>
                        
 						<div class="col-md-4">
							<div class="card" id="calendar"></div>
						</div> 
					</div>
                    
                    <!--쪽지확인-->
					<div class="row row-card-no-pd">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="card-head-row card-tools-still-right">
										<h4 class="card-title">쪽지 현황</h4>
										<div class="card-tools">
											<button class="btn btn-icon btn-link btn-primary btn-xs btn-refresh-card"><span class="fa fa-sync-alt"></span></button>
										</div>
									</div>
								</div>

					<div class="row">
						<div class="col-md-6">
							<div class="card full-height">
								<div class="card-header">
									<div class="card-title">최근 보낸 쪽지</div>
								</div>
								<div class="card-body">
									<ol class="activity-feed">
									<c:forEach items="${newSendMessage }" var="nsmList" >
										<li class="feed-item feed-item-warning">
											<time class="date" datetime="9-25">${nsmList.msgNo}</time>
											<span class="text">${nsmList.receiverId }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"${nsmList.msgTitle }"</span>
										</li>
									</c:forEach>
										<!-- <li class="feed-item feed-item-success">
											<time class="date" datetime="9-24">Sep 24</time>
											<span class="text">전체 <a href="#">"공지사항"</a></span>
										</li>
										<li class="feed-item feed-item-info">
											<time class="date" datetime="9-23">Sep 23</time>
											<span class="text">회원ID <a href="#">"쪽지제목"</a></span>
										</li>
										<li class="feed-item feed-item-warning">
											<time class="date" datetime="9-21">Sep 21</time>
											<span class="text">회원ID <a href="#">"쪽지제목"</a></span>
										</li>
										<li class="feed-item feed-item-danger">
											<time class="date" datetime="9-18">Sep 18</time>
											<span class="text">회원ID <a href="#">"쪽지제목"</a></span>
										</li>
										<li class="feed-item">
											<time class="date" datetime="9-17">Sep 17</time>
											<span class="text">회원ID <a href="#">"쪽지제목"</a></span>
										</li> -->
									</ol>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card full-height">
								<div class="card-header">
									<div class="card-head-row">
										<div class="card-title">받은 쪽지</div>
										<div class="card-tools">
										</div>
									</div>
								</div>
								<div class="card-body">
								<c:forEach items="${newrecMessage }" var="nrmList" varStatus="index">
									<div class="d-flex">
										<div class="avatar avatar-online">
											<span class="avatar-title rounded-circle border border-white bg-info">${index.count }</span>
										</div>
										<div class="flex-1 ml-3 pt-1">
											<h6 class="text-uppercase fw-bold mb-1">${nrmList.senderId } <span class="text-warning pl-3">${nrmList.msgTitle }</span></h6>
											<span class="text-muted">${nrmList.msgContents }</span>
										</div>
										<div class="float-right pt-1">
											<small class="text-muted"><fmt:formatDate value="${nrmList.regDate }" pattern="MM.dd HH:mm"/></small>
										</div>
									</div>
									<div class="separator-dashed"></div>
									</c:forEach>
<!-- 									<div class="d-flex">
										<div class="avatar avatar-offline">
											<span class="avatar-title rounded-circle border border-white bg-secondary">P</span>
										</div>
										<div class="flex-1 ml-3 pt-1">
											<h6 class="text-uppercase fw-bold mb-1">회원 ID <span class="text-success pl-3">제목</span></h6>
											<span class="text-muted">본문내용</span>
										</div>
										<div class="float-right pt-1">
											<small class="text-muted">1 Day Ago</small>
										</div>
									</div>
									<div class="separator-dashed"></div>
									<div class="d-flex">
										<div class="avatar avatar-away">
											<span class="avatar-title rounded-circle border border-white bg-danger">L</span>
										</div>
										<div class="flex-1 ml-3 pt-1">
											<h6 class="text-uppercase fw-bold mb-1">회원 ID <span class="text-muted pl-3">제목</span></h6>
											<span class="text-muted">Is there any update plan for RTL version near future?</span>
										</div>
										<div class="float-right pt-1">
											<small class="text-muted">2 Days Ago</small>
										</div>
									</div>
									<div class="separator-dashed"></div>
									<div class="d-flex">
										<div class="avatar avatar-offline">
											<span class="avatar-title rounded-circle border border-white bg-secondary">P</span>
										</div>
										<div class="flex-1 ml-3 pt-1">
											<h6 class="text-uppercase fw-bold mb-1">회원 ID <span class="text-success pl-3">제목</span></h6>
											<span class="text-muted">I have some query regarding the license issue.</span>
										</div>
										<div class="float-right pt-1">
											<small class="text-muted">2 Day Ago</small>
										</div>
									</div>
									<div class="separator-dashed"></div>
									<div class="d-flex">
										<div class="avatar avatar-away">
											<span class="avatar-title rounded-circle border border-white bg-danger">L</span>
										</div>
										<div class="flex-1 ml-3 pt-1">
											<h6 class="text-uppercase fw-bold mb-1">회원 ID <span class="text-muted pl-3">제목</span></h6>
											<span class="text-muted">Is there any update plan for RTL version near future?</span>
										</div>
										<div class="float-right pt-1">
											<small class="text-muted">2 Days Ago</small>
										</div>
									</div> -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Custom template -->
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


	<!-- Chart JS -->
	<script src="resources/js/admin/plugin/chart.js/chart.min.js"></script>

	<!-- jQuery Sparkline -->
	<script src="resources/js/admin/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

	<!-- Chart Circle -->
	<script src="resources/js/admin/plugin/chart-circle/circles.min.js"></script>

	<!-- Datatables -->
	<script src="resources/js/admin/plugin/datatables/datatables.min.js"></script>

	<!-- Bootstrap Notify -->
	<script src="resources/js/admin/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

	<!-- jQuery Vector Maps -->
	<script src="resources/js/admin/plugin/jqvmap/jquery.vmap.min.js"></script>
	<script src="resources/js/admin/plugin/jqvmap/maps/jquery.vmap.world.js"></script>

	<!-- Sweet Alert -->
	<script src="resources/js/admin/plugin/sweetalert/sweetalert.min.js"></script>

	<!-- Atlantis JS -->
	<script src="resources/js/admin/atlantis.min.js"></script>

	<!-- Atlantis DEMO methods, don't include it in your project! -->
	<script src="resources/js/admin/setting-demo.js"></script>
	<script src="resources/js/admin/demo.js"></script>
	
	<!-- 회원관리 차트 -->
	<script>
		
		Circles.create({
			id:'circles-1',
			radius:45,
			value:60,
			maxValue:100,
			width:7,
			text: '${ newMember }',
			colors:['#f1f1f1', '#FF9E27'],
			duration:400,
			wrpClass:'circles-wrp',
			textClass:'circles-text',
			styleWrapper:true,
			styleText:true
		})

		Circles.create({
			id:'circles-2',
			radius:45,
			value:70,
			maxValue:100,
			width:7,
			text: '${allMember }',
			colors:['#f1f1f1', '#2BB930'],
			duration:400,
			wrpClass:'circles-wrp',
			textClass:'circles-text',
			styleWrapper:true,
			styleText:true
		})

		Circles.create({
			id:'circles-3',
			radius:45,
			value:40,
			maxValue:100,
			width:7,
			text: '${deleteMember }',
			colors:['#f1f1f1', '#F25961'],
			duration:400,
			wrpClass:'circles-wrp',
			textClass:'circles-text',
			styleWrapper:true,
			styleText:true
		})

		/* 신고관리 차트 */
		var totalIncomeChart = document.getElementById('totalIncomeChart').getContext('2d');

		var reporArr = [];
		<c:forEach items="${report }" var="report" varStatus="stat">
			reporArr[${stat.index}] = ${report.reportStatCount };
		</c:forEach>
		console.log(reporArr);
		var mytotalIncomeChart = new Chart(totalIncomeChart, {
			type: 'bar',
			data: {
				 labels: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
			        datasets: [{
			            label: '펀딩 신고 현황',
			            data: reporArr,
			            backgroundColor: [
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)',
			                'rgba(255, 159, 64, 0.2)',
			                'rgba(155, 99, 102, 0.2)'
			            ],
			            borderColor: [
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)',
			                'rgba(255, 159, 64, 1)',
			                'rgba(155, 99, 102, 1)'
			            ],
			            borderWidth: 1
			        }]
			},
			options: {
				responsive: true,
				maintainAspectRatio: false,
				legend: {
					display: false,
				},
				scales: {
					yAxes: [{
						ticks: {
							display: false //this will remove only the label
						},
						gridLines : {
							drawBorder: false,
							display : false
						}
					}],
					xAxes : [ {
						gridLines : {
							drawBorder: false,
							display : false
						}
					}]
				},
			}
		});
		
		/* 별 보러가자 게시글 현황 */
		var starArr = [];
		<c:forEach items="${visitStat }" var="star" varStatus="status">
			starArr[${status.index}] = ${star.visitStatCount };
		</c:forEach>
		var ctx = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(ctx, {
		    type: 'line',
		    data: {
		        labels: [ '월', '화', '수', '목', '금', '토', '일'],
		        datasets: [{
		            label: '별 보러가자 게시글 현황',
		            data: starArr,
		            backgroundColor: [
		                'rgba(255, 206, 86, 0.2)',
		            ],
		            borderColor: [
		                'rgba(255, 206, 86, 1)',
		            ],
		            borderWidth: 1
		        }]
		    },
		    options: {
		        scales: {
		            y: {
		                beginAtZero: true
		            }
		        }
		    }
		});

		/* 펀딩제안현황 차트 */
		$('#lineChart').sparkline([105,103,123,100,95,105,115], {
			type: 'line',
			height: '70',
			width: '100%',
			lineWidth: '2',
			lineColor: '#ffa534',
			fillColor: 'rgba(255, 165, 52, .14)'
		});
		
		function msgPopup(msgUrl) {
	         if(${sessionScope.loginUser ne null}) {
	            var popupX = (window.screen.width/2)-265;
	            var popupY = (window.screen.height/2)-232.5;
	            window.open(msgUrl, "msgWriteForm", "height=400, width=500, left="+popupX+", top="+popupY+", resizable=no");            
	         }else {
	            location.href="login.do";
	         }
	      }
	</script>
</body>
</html>