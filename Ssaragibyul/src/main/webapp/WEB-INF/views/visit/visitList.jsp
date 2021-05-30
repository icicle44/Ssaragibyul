<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>별보러 가자</title>
<meta name="description"
	content="Effect inspiration for opening an image grid item." />
<meta name="keywords"
	content="image grid, effect, inspiration, css, javascript, animation, masonry" />
<meta name="author" content="Codrops" />

<%@include file="/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="/resources/fonts/visit/font-awesome-4.3.0/css/font-awesome.min.css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/resources/css/visit/normalize.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/visit/demo.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/visit/style_visit.css" />
<!-- Font -->
<link
	href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700,900|Oswald:400,700"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
</head>
<body>

	<div class="container">
		<div class="container-fluid col-md-12">
			<section class="sideBar col-md-3">
				<a href="independenceList.do">독립유공자 공훈록</a>
				<hr>
				<a href="#">별들의 발자취</a>
				<hr>
				별 보러 가자
				<hr>
			</section>

			<section class="contents col-md-9">
				<div class="button-container">
					<button class="btn-2" onclick="location.href='visitWriteView.do'">방문
						인증하기</button>
				</div>
				<div class="content">
					<div class="grid">
						<c:forEach items="${vList }" var="vList">
							<div class="grid__item" data-size="1280x857">
								<a id="grid" href="/resources/vUploadFiles/${vList.renameFilename }" class="img-wrap">
								<img id="${vList.visitNo }" src="/resources/vUploadFiles/${vList.renameFilename }" alt="${vList.originalFilename }" />
									<div class="description description--grid">
										<div class="rightCon">
											<div class="r-title col-md-12"">
												<div id="title">${vList.visitTitle }/ ${vList.visitNo }번글</div>
												<div id="nickname">${vList.nickName }</div>
												<table class="info">
													<tr>
														<td id="t"><a href="#"><i class="far fa-heart"></i></a></td>
														<!-- <i class="fas fa-heart"></i> -->
														<td>${vList.likes }</td>
														<td id="t">조회수</td>
														<td>${vList.visitCount }</td>
														<td id="t">작성일자</td>
														<td>${vList.vUpdateDate }</td>
													</tr>
												</table>
												<div class="content" >${vList.visitContents }</div>
											</div>
											<hr>
												<div class="reply-container">
													<div id="reply">
														<!-- 댓글 등록 -->
														<table align="center" width="500" cellspacing="0">
															<tr>
																<input type="hidden" name="visitNo" value="${vList.visitNo }">
																<td><textarea rows="3" cols="55" id="rContent" name="contents"></textarea></td>
																<td>
																	<button class="rSubmit" id="${vList.visitNo }" onclick="regist(this.id)">버튼</button>
																</td>
															</tr>
														</table>
														<!-- 댓글 목록 -->
														<table align="center" width="500" border="1" cellspacing="0" id="rtb">
															<thead>
																<tr>
																	<!-- 댓글 갯수 -->
																	<td colspan="2"><b id="rCount"></b></td>
																</tr>
															</thead>
															<tbody></tbody>
														</table>
													</div>
													<div id="inform-con"></div>
												</div>
										</div>

									</div> </a>
							</div>
						</c:forEach>
					</div>


					<!-- /grid -->
					<div class="preview">
						<button class="action action--close">
							<i class="fa fa-times"></i><span class="text-hidden">Close</span>
						</button>
						<div class="description description--preview"></div>
					</div>
					<!-- /preview -->
				</div>
				<!-- /content -->
			</section>

		</div>
		<!-- /container -->

		<%-- <%@include file="/footer.jsp" %> --%>
		<%@include file="/footer.jsp"%>
		<script src="/resources/js/visit/modernizr-custom.js"></script>
		<script src="/resources/js/visit/imagesloaded.pkgd.min.js"></script>
		<script src="/resources/js/visit/masonry.pkgd.min.js"></script>
		<script src="/resources/js/visit/classie.js"></script>
		<script src="/resources/js/visit/main.js"></script>
		<script>
			$(function() {
				var support = {
					transitions : Modernizr.csstransitions
				},
				// transition end event name
				transEndEventNames = {
					'WebkitTransition' : 'webkitTransitionEnd',
					'MozTransition' : 'transitionend',
					'OTransition' : 'oTransitionEnd',
					'msTransition' : 'MSTransitionEnd',
					'transition' : 'transitionend'
				}, transEndEventName = transEndEventNames[Modernizr
						.prefixed('transition')], onEndTransition = function(
						el, callback) {
					var onEndCallbackFn = function(ev) {
						if (support.transitions) {
							if (ev.target != this)
								return;
							this.removeEventListener(transEndEventName,
									onEndCallbackFn);
						}
						if (callback && typeof callback === 'function') {
							callback.call(this);
						}
					};
					if (support.transitions) {
						el.addEventListener(transEndEventName, onEndCallbackFn);
					} else {
						onEndCallbackFn();
					}
				};

				new GridFx(
						document.querySelector('.grid'),
						{
							imgPosition : {
								x : -0.5,
								y : 1
							},
							onOpenItem : function(instance, item) {
								instance.items
										.forEach(function(el) {
											if (item != el) {
												var delay = Math.floor(Math
														.random() * 50);
												el.style.WebkitTransition = 'opacity .5s '
														+ delay
														+ 'ms cubic-bezier(.7,0,.3,1), -webkit-transform .5s '
														+ delay
														+ 'ms cubic-bezier(.7,0,.3,1)';
												el.style.transition = 'opacity .5s '
														+ delay
														+ 'ms cubic-bezier(.7,0,.3,1), transform .5s '
														+ delay
														+ 'ms cubic-bezier(.7,0,.3,1)';
												el.style.WebkitTransform = 'scale3d(0.1,0.1,1)';
												el.style.transform = 'scale3d(0.1,0.1,1)';
												el.style.opacity = 0;
											}
										});
							},
							onCloseItem : function(instance, item) {
								instance.items
										.forEach(function(el) {
											if (item != el) {
												el.style.WebkitTransition = 'opacity .4s, -webkit-transform .4s';
												el.style.transition = 'opacity .4s, transform .4s';
												el.style.WebkitTransform = 'scale3d(1,1,1)';
												el.style.transform = 'scale3d(1,1,1)';
												el.style.opacity = 1;

												onEndTransition(
														el,
														function() {
															el.style.transition = 'none';
															el.style.WebkitTransform = 'none';
														});
											}
										});
							}
						});
			});
			
			$(function() {
				var visitNo = "";
				$("img").click(function() {
					$("#rtb tbody").html("");
					visitNo= $(this).attr("id");
					alert(visitNo);
					$.ajax({
						url : "replyList.do",
						type : "get",
						data : {
							"visitNo" : visitNo
						},
						dataType : "json",
						success : function(data) {

							var $tableBody = $("#rtb tbody");
							$tableBody.html("");// 비워주기를 해야 두번씩 안나옴
							var $tr;
							var $rWriter;
							var $rContent;
							var $rCreateDate;
							$("#rCount").text("댓글 (" + data.length + ")"); // 댓글 갯수 표시

							if (data.length > 0) { // 배열의 경우, "데이터가 있을 떄" 조건을 length로 표현함
								for ( var i in data) { 
									$tr = $("<tr>");
									$rWriter = $("<td width='100'>").text(
											data[i].nick);
									$rContent = $("<td>").text(data[i].contents);
									$rCreateDate = $("<td width='100'>").text(
											data[i].enrollDate);
									$tr.append($rWriter);
									$tr.append($rContent);
									$tr.append($rCreateDate);
									$tableBody.append($tr);
								}
							}		
						},
						error : function() {

						}
					});
				});
			});
			function regist(){
				var visitNo = "";
				$(".rSubmit").click(function() {
					visitNo= $(this).attr("id");
					alert(visitNo);
					});
				var rContent = $(".rContent").val();
				
				$.ajax({
					url : "addReply.do",
					type : "post",
					data : {
						"no" : visitNo,
						"contents" : rContent
					},
					success : function(data) {
						if (data == "success") {
							// 댓글 불러오기
							getReplyList();
							// 작성 후 내용 초기화
							$("#rContent").val(""); // 내가 쓴 댓글 내용이 등록 버튼을 누르면서 사라지게 함
						} else {
							alert("댓글 등록 실패");
						}
					},
					error : function() {

					}
				})
			}
		</script>
</body>

</body>
</html>