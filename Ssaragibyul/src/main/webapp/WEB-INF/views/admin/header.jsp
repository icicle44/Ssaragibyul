<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 헤더</title>
</head>
<body>
		<div class="main-header">
			<!-- Logo Header -->
			<div class="logo-header" style="background-color: #EB5C01" >
			<a href="/index.jsp" class="logo d-flex align-items-center" style="text-decoration: none;"> 
				<img src="/resources/img/logo.png" alt=""> <span id="starLogo">싸라기별</sapn>
			</a>
				<button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon">
						<i class="icon-menu"></i>
					</span>
				</button>
				<button class="topbar-toggler more"><i class="icon-options-vertical"></i></button>
				<div class="nav-toggle">
					<button class="btn btn-toggle toggle-sidebar">
						<i class="icon-menu"></i>
					</button>
				</div>
			</div>
			<!-- End Logo Header -->
			
			<!-- Navbar Header -->
			<nav class="navbar navbar-header navbar-expand-lg" style="background-color: #EB5C01">
				
				<div class="container-fluid">
					<div class="collapse" id="search-nav">
						<form class="navbar-left navbar-form nav-search mr-md-3">
							<div class="input-group">
								<div class="input-group-prepend">
									<button type="submit" class="btn btn-search pr-1">
										<i class="fa fa-search search-icon"></i>
									</button>
								</div>
								<input type="text" placeholder="Search ..." class="form-control">
							</div>
						</form>
					</div>
					<ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
						<li class="nav-item toggle-nav-search hidden-caret">
							<a class="nav-link" data-toggle="collapse" href="#" role="button" aria-expanded="false" aria-controls="search-nav">
								<i class="fa fa-search"></i>
							</a>
						</li>

						<li class="nav-item dropdown hidden-caret">
							<!-- <a class="nav-link dropdown-toggle" href="#" id="notifDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="fa fa-bell"></i>
								<span class="notification">4</span>
							</a> -->
							
						</li>
						<li class="nav-item dropdown hidden-caret">
							<a class="nav-link" href="logout.do">
								<i class="icon-logout"></i>
							</a>
<!-- 							<div class="dropdown-menu quick-actions quick-actions-info animated fadeIn">
								<div class="quick-actions-header">
									<span class="title mb-1">Quick Actions</span>
									<span class="subtitle op-8">Shortcuts</span>
								</div>
								<div class="quick-actions-scroll scrollbar-outer">
									<div class="quick-actions-items">
										<div class="row m-0">
											<a class="col-6 col-md-4 p-0" href="#">
												<div class="quick-actions-item">
													<i class="flaticon-file-1"></i>
													<span class="text">Generated Report</span>
												</div>
											</a>
											<a class="col-6 col-md-4 p-0" href="#">
												<div class="quick-actions-item">
													<i class="flaticon-database"></i>
													<span class="text">Create New Database</span>
												</div>
											</a>
											<a class="col-6 col-md-4 p-0" href="#">
												<div class="quick-actions-item">
													<i class="flaticon-pen"></i>
													<span class="text">Create New Post</span>
												</div>
											</a>
											<a class="col-6 col-md-4 p-0" href="#">
												<div class="quick-actions-item">
													<i class="flaticon-interface-1"></i>
													<span class="text">Create New Task</span>
												</div>
											</a>
											<a class="col-6 col-md-4 p-0" href="#">
												<div class="quick-actions-item">
													<i class="flaticon-list"></i>
													<span class="text">Completed Tasks</span>
												</div>
											</a>
											<a class="col-6 col-md-4 p-0" href="#">
												<div class="quick-actions-item">
													<i class="flaticon-file"></i>
													<span class="text">Create New Invoice</span>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div> -->
						</li>
						<li class="nav-item dropdown hidden-caret">
							<a class="dropdown-toggle profile-pic" href="adminMain.do" >
								<div class="avatar-sm">
									<img src="resources/img/admin/profile.jpg" alt="..." class="avatar-img rounded-circle">
								</div>
							</a>
						</li>
					</ul>
				</div>
			</nav>
			<!-- End Navbar -->
		</div>

		<!-- Sidebar -->
		<div class="sidebar sidebar-style-2">			
			<div class="sidebar-wrapper scrollbar scrollbar-inner">
				<div class="sidebar-content">
					<div class="user">
						<div class="avatar-sm float-left mr-2">
							<img src="resources/img/admin/profile.jpg" alt="..." class="avatar-img rounded-circle">
						</div>
						<div class="info">
							<a data-toggle="collapse" href="#collapseExample" aria-expanded="true">
								<span>
									관리자
									<span class="user-level">싸라기별</span>
								</span>
							</a>
							<div class="clearfix"></div>

<!--							<div class="collapse in" id="collapseExample">
								<ul class="nav">
									<li>
										<a href="#profile">
											<span class="link-collapse">My Profile</span>
										</a>
									</li>
									<li>
										<a href="#edit">
											<span class="link-collapse">Edit Profile</span>
										</a>
									</li>
									<li>
										<a href="#settings">
											<span class="link-collapse">Settings</span>
										</a>
									</li>
								</ul>
							</div>-->
						</div>
					</div>
					<ul class="nav nav-primary">
<!--						<li class="nav-item active">
							<a data-toggle="collapse" href="#dashboard" class="collapsed" aria-expanded="false">
								<i class="fas fa-home"></i>
								<p>Dashboard</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="dashboard">
								<ul class="nav nav-collapse">
									<li>
										<a href="../demo1/index.html">
											<span class="sub-item">Dashboard 1</span>
										</a>
									</li>
									<li>
										<a href="../demo2/index.html">
											<span class="sub-item">Dashboard 2</span>
										</a>
									</li>
								</ul>
							</div>
						</li>-->
						<li class="nav-section">
							<span class="sidebar-mini-icon">
								<i class="fa fa-ellipsis-h"></i>
							</span>
							<h4 class="text-section">관리자페이지</h4>
						</li>
                        
                        <!-- 회원 정보 관리 -->
						<li class="nav-item">
							<a data-toggle="collapse" href="#member">
								<i class="fas fa-user-check"></i>
								<p>회원 정보 관리</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="member">
								<ul class="nav nav-collapse">
									<li>
										<a href="adminMemberListView.do">
											<span class="sub-item">회원 리스트</span>
										</a>
									</li>
								</ul>
							</div>
						</li>
                        
                        <!-- 프로젝트 관리 -->
						<li class="nav-item">
							<a data-toggle="collapse" href="#sidebarLayouts">
								<i class="fas fa-th-list"></i>
								<p>프로젝트 관리</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="sidebarLayouts">
								<ul class="nav nav-collapse">
									<li>
										<a href="adminFundingList.do">
											<span class="sub-item">펀딩 관리</span>
										</a>
									</li>
									<li>
										<a href="adminDonationList.do">
											<span class="sub-item">기부 관리</span>
										</a>
									</li>
									<li>
										<a href="adminFundingAccusationList.do">
											<span class="sub-item">펀딩 신고 관리</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="sub-item">기부 신고 관리</span>
										</a>
									</li>
								</ul>
							</div>
						</li>
                        
                        <!--기념관 게시판 관리-->
						<li class="nav-item">
							<a data-toggle="collapse" href="#forms">
								<i class="fas fa-university"></i>
								<p>기념관 게시판 관리</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="forms">
								<ul class="nav nav-collapse">
									<li>
										<a href="adminIndependenceList.do">
											<span class="sub-item">독립유공자 공훈록</span>
										</a>
									</li>
									<li>
										<a href="adminHistoryList.do">
											<span class="sub-item">별들의 발자취</span>
										</a>
									</li>
								</ul>
							</div>
						</li>
                        
                        <!--별 보러 가자 관리-->
						<li class="nav-item">
							<a data-toggle="collapse" href="#tables">
								<i class="far fa-star"></i>
								<p>별 보러 가자 관리</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="tables">
								<ul class="nav nav-collapse">
									<li>
										<a href="adminVisitList.do">
											<span class="sub-item">별 보러 가자 리스트</span>
										</a>
									</li>
								</ul>
							</div>
						</li>
                        
                        <!--쪽지 관리-->
						<li class="nav-item">
							<a data-toggle="collapse" href="#maps">
								<i class="fas fa-envelope"></i>
								<p>쪽지 관리</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="maps">
								<ul class="nav nav-collapse">
									<li>
										<a href="adminMessageList.do">
											<span class="sub-item">받은 쪽지함</span>
										</a>
									</li>
									<li>
										<a href="adminSendMessageList.do">
											<span class="sub-item">보낸 쪽지함</span>
										</a>
									</li>
								</ul>
							</div>
						</li>
				
<!--						<li class="mx-4 mt-2">
							<a href="http://themekita.com/atlantis-bootstrap-dashboard.html" class="btn btn-primary btn-block"><span class="btn-label mr-2"> <i class="fa fa-heart"></i> </span>Buy Pro</a> 
						</li>-->
					</ul>
				</div>
			</div>
		</div>
		<!-- End Sidebar -->
		<script>
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
		</script>
</body>
</html>