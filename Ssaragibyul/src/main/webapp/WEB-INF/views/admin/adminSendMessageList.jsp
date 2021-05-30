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
								<a href="adminSendMessageList.do">보낸 쪽지함</a>
							</li>
						</ul>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">보낸 쪽지 리스트</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-hover" >
											<thead>
												<tr style="border-bottom:hidden;">
													<th>번호</th>
													<th>닉네임</th>
													<th>쪽지 제목</th>
													<th>받은 날짜</th>
													<c:if test="${flag=='rec' }">
														<th width="120px">수신확인</th>
													</c:if>
													<c:if test="${flag=='send' }">
														<th width="120px">수신확인</th>
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
															<c:if test="${message.msgType == 0 }">
									                            <td class="td-small"></td>
									                        </c:if>
															<td><input type="checkbox" class="msg-del-check" name="chk" value="${message.msgNo }"></td>					
														</tr>
													</c:forEach>
												</c:if>
												
											</tbody>
											
										</table>
											<button type="submit" class="btn btn-outline-warning float-right" id="deleteArrBtn" >삭제
											</button>
											<br><br>
										 <table style="margin: auto; text-align: center;">
												<!-- 페이징 -->
												<tr class="text-center">
													<td colspan="6" style="border-top:hidden;">
														<!-- 변수선언 -->
														<c:if test="${flag=='notice'}">
															<c:set var="pageUrl" value="noticeMsgList.do"/>
														</c:if>
														<c:if test="${flag=='rec' }">
															<c:set var="pageUrl" value="adminMessageList.do"/>
														</c:if>
														<c:if test="${flag=='send' }">
															<c:set var="pageUrl" value="adminSendMessageList.do"/>
														</c:if>
														<!-- 이전 -->
														<c:url var="before" value="${pageUrl}">
															<c:param name="page" value="${pi.currentPage - 1}"></c:param>
														</c:url>
														<c:if test="${pi.listCount ne 0 }">
															<c:if test="${pi.currentPage <= 1 }">
																[이전]&nbsp;
															</c:if>
															<c:if test="${pi.currentPage > 1 }">
																<a href="${before }">[이전]</a>&nbsp;
															</c:if>
														</c:if>
														<!-- 페이지 -->
														<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage }">
															<c:url var="pagination" value="${pageUrl}">
																<c:param name="page" value="${p}"></c:param>
															</c:url>
															<c:if test="${p eq pi.currentPage}">
																[${p}]
															</c:if>
															<c:if test="${p ne pi.currentPage}">
																<a href="${pagination }">${p}</a>&nbsp;
															</c:if>
														</c:forEach>
														<!-- 다음 -->
														<c:url var="after" value="${pageUrl}">
															<c:param name="page" value="${pi.currentPage + 1}"></c:param>
														</c:url>
														<c:if test="${pi.listCount ne 0 }">
															<c:if test="${pi.currentPage >= pi.maxPage}">
																[다음]&nbsp;
															</c:if>
															<c:if test="${pi.currentPage < pi.maxPage}">
																<a href="${after}">[다음]</a>&nbsp;
															</c:if>
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
		<!-- End Custom template -->
	</div>
	
	<!--   Core JS Files   -->
	<script src="resources/js/admin/core/jquery.3.2.1.min.js"></script>
	<script src="resources/js/admin/core/popper.min.js"></script>
	<script src="resources/js/admin/core/bootstrap.min.js"></script>
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

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
			/* List View에서 삭제하기 */
			$("#deleteArrBtn").on("click", function(){
				var cnt = $("input[name=chk]:checked").length;
				var msgNoArr = new Array();
				$("input[name=chk]:checked").each(function(){
					msgNoArr.push($(this).val());
				});
				console.log(msgNoArr.toString());
				console.log(cnt);
				if(cnt == 0) {
					alert("선택된 쪽지가 없습니다.");
				}else {
					var url = "";
					if(${flag eq "rec"}) {
						url = "recMsgDelete.do";
					}else if(${flag eq "send"}) {
						url = "sendMsgDelete.do";
					}
					var conf = confirm("정말 삭제하시겠습니까?");
					console.log(url);
					if(conf == true) {
						$.ajax({
							url: url,
							type: "post",
							data:{"msgNoArr" : msgNoArr},
							success: function(data){
								if(data=="success") {
									alert("삭제하였습니다.");
									location.reload(true);
								}else {
									alert("삭제에 실패하였습니다.");
								}
							},
							error: function(){
								alert("삭제에 실패하였습니다.");
							}
						});
					}else {
						self.close();
					}
				}
			});
		});
	</script>
</body>
</html>