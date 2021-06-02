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
								<a id="grid"
									href="/resources/vUploadFiles/${vList.renameFilename }"
									class="img-wrap"> <img data-visitNo="${vList.visitNo }"
									src="/resources/vUploadFiles/${vList.renameFilename }"
									alt="${vList.originalFilename }" />
									<div class="description description--grid">
										<div class="rightCon">
											<div class="r-title col-md-12"">
												<div id="title">${vList.visitTitle }/${vList.visitNo }번글</div>
												<div id="nickname">${vList.nickName }</div>
												<table class="info">
													<tr>
														<td class="t"><a href="#"><i class="far fa-heart"></i></a></td>
														<!-- <i class="fas fa-heart"></i> -->
														<td>${vList.likes }</td>
														<td class="t count">조회수</td>
														<td class="t">작성일자</td>
														<td>${vList.vUpdateDate }</td>
													</tr>
												</table>
												<div class="content">${vList.visitContents }</div>
												<div class="button-wrapper">
													<c:url var="vModify" value="visitModifyView.do">
														<c:param name="visitNo" value="${vList.visitNo }"></c:param>
													</c:url>
													<c:url var="vDelete" value="visitDelete.do">
														<c:param name="visitNo" value="${vList.visitNo }"></c:param>
														<c:param name="renameFilename"
															value="${board.renameFilename }"></c:param>
													</c:url>
													<%-- <c:if test="${ loginUser.userId eq vList.userId }" --%>
													<a href="${vModify }">수정 페이지로 이동</a> &nbsp; <a
														href="${vDelete }">삭제하기</a>

												</div>
											</div>
											<hr>
											<div class="reply-container">
												<div id="reply">
													<!-- 댓글 등록 -->
													<table align="center" width="500" cellspacing="0">
														<tr>
															<td><textarea rows="3" cols="55" id="rContent"
																	name="contents"></textarea></td>
															<td>
																<button id="rSubmit" value="${vList.visitNo }">버튼</button>
															</td>
														</tr>
													</table>
													<!-- 댓글 목록 -->
													<table align="center" width="500" border="1"
														cellspacing="0" id="rtb">
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

									</div>
								</a>
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
			/* 그리드 끝 */
			/* 이미지 클릭 시 동작 */
			$(function() {
				var visitNo = "";
				$("img").click(function() { // 이미지를 클릭했을 때 아래 코드가 실행되도록 함. img가 unique해서
					$("#rtb tbody").html(""); // tbody부분을 비워줌. 비워주지 않으면 댓글 목록을 조회한 것이 다른 글의 tbody에도 남아있음
					$(".count").next().remove();
					visitNo = $(this).attr("data-visitNo"); // 클릭한 img의 아이디값으로 visitNo을 가져옴
					addHitsCount(visitNo);
					getReplyList(visitNo);// 댓글 목록 조회1
					console.log(visitNo);
				});

				// 댓글 등록
				var visitNo = "";
				var rContent = "";
				$(document).on(
						'click',
						'#rSubmit',
						function() { // 등록버튼을 클릭하면 아래 코드 실행
							visitNo = $(this).attr("value"); // 클릭한 버튼의 value값을 가져옴
							/* alert(visitNo); */
							rContent = $(this).closest("td").prev().children(
									"textarea").val(); // 클릭한 버튼 근처의 textarea를 가져옴

							$.ajax({
								url : "addReply.do",
								type : "post",
								data : {
									"no" : visitNo,
									"contents" : rContent
								},
								success : function(data) {
									if (data == "success") {
										// 댓글 목록 조회2
										// 등록 버튼 누를 때 visitNo을 가져가서 댓글 목록 다시 불러옴
										// visitNo를 특정할 수 없기 때문에 이를 자동으로 보내고 받을 수 없어서 목록 조회 2번하는 것
										getReplyList(visitNo);
									} else {
										alert("댓글 등록 실패");
									}
								},
								error : function() {
									alert("서버 통신 실패!(댓글등록)");
								}
							});
							// 작성 후 내용 초기화
							rContent = $(this).closest("td").prev().children(
									"textarea").val("");// 내가 쓴 댓글 내용이 등록 버튼을 누르면서 사라지게 함
						});
			});

			function getReplyList(visitNo) {
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
						var $btnArea;
						$('#' + 'rCount' + visitNo).text(
								"댓글 (" + data.length + ")"); // 아직 안됨//////////////

						if (data.length > 0) { // 배열의 경우, "데이터가 있을 떄" 조건을 length로 표현함
							for ( var i in data) {
								$tr = $("<tr>");
								$rWriter = $("<td width='100'>").text(
										data[i].nick);
								$rContent = $("<td>").text(data[i].contents);
								$rCreateDate = $("<td width='100'>").text(
										data[i].enrollDate);
								$btnArea = $("<td>").append(
										"<a href='#' onclick='modifyReply(this,"
												+ visitNo + ","
												+ data[i].replyNo + ",\""
												+ data[i].contents
												+ "\");'>수정 </a>").append(
										"<a href='#' onclick='removeReply("
												+ visitNo + ","
												+ data[i].replyNo
												+ ");'> 삭제</a>");
								$tr.append($rWriter);
								$tr.append($rContent);
								$tr.append($rCreateDate);
								$tr.append($btnArea);
								$tableBody.append($tr);
							}
						} else {
							$tr = $("<tr>");
							$td = $("<td>").text("댓글이 없습니다.")///////////////////
							$tr.append($rWriter);
							$tableBody.append($tr);
						}
					},
					error : function() {
						/* alert("서버 통신 실패(댓글 목록 조회)!"); */
					}
				});
			}
			// 댓글 수정
			function modifyReply(obj, visitNo, replyNo, contents) {
				$trModify = $("<tr>");
				$trModify
						.append("<td colspan='3'><input type='text' id='modifyReply' size='50' value='"+contents+"'></td>");
				$trModify.append("<td><button onclick='modifyReplyCommit("
						+ visitNo + "," + replyNo + ",\"" + contents
						+ "\")'>수정완료</button></td>");
				$(obj).parent().parent().after($trModify);
			}
			function modifyReplyCommit(visitNo, replyNo, contents) {
				var modifiedContent = $("#modifyReply").val();
				$.ajax({
					url : "modifyReply.do",
					type : "post",
					data : {
						"replyNo" : replyNo,
						"contents" : modifiedContent
					},
					success : function(data) {
						if (data == "success") {
							getReplyList(visitNo);
						} else {
							alert("댓글 수정 실패!");
						}
					},
					error : function() {
						alert("서버 통신 실패(댓글 수정)!");
					}
				});

			}
			// 댓글 삭제
			function removeReply(visitNo, replyNo) {
				// /deleteReply.kh?refBoardNo="+boardNo+"&replyNo="+data[i].replyNo+"
				$.ajax({
					url : "deleteReply.do",
					type : "get",
					data : {
						"replyNo" : replyNo
					},
					success : function(data) {
						if (data == "success") {
							getReplyList(visitNo); // 목록조회3
						} else {
							alert("댓글 조회 실패!");
						}
					},
					error : function() {
						alert("서버 통신 실패(댓글 삭제)!");
					}
				});
			};
			// 조회수 증가
			function addHitsCount(visitNo) {
				$.ajax({
					url : "addHitsCount.do",
					type : "get",
					data : {
						"visitNo" : visitNo
					},
					success : function(data) {
						if (data === "fail") {
							console.log("Unexpected result : null");
						} else {
							$(".count").after($("<td>").text(data));
						}
					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
					}

				});
			};
		</script>
</body>

</body>
</html>