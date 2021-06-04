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
							<div class="grid__item" data-size="1280x857" data-no="${vList.visitNo }">
								<a id="grid" href="/resources/vUploadFiles/${vList.renameFilename }"
									class="img-wrap"> 
									<img data-visitNo="${vList.visitNo }" src="/resources/vUploadFiles/${vList.renameFilename }"
									alt="${vList.originalFilename }" />
									<div class="description description--grid">
										<div class="rightCon">
											<div class="r-title col-md-12">
												<div id="title">${vList.visitTitle }/${vList.visitNo }번글</div>
												<c:url var="msgWriteUrl" value="msgWriterView.do">
												   <c:param name="receiverId" value="${vList.userId }"></c:param>												   
												   <c:param name="msgType" value="4"></c:param>
												   <c:param name="nickName" value="${vList.nickName }"></c:param>
												</c:url>
												<div id="nickname"><a href="#" onclick="msgPopup('${msgWriteUrl}'); return false;">${vList.nickName } 님의 별</a></div>
												<table class="info">
													<tr>
														<td class="t"><a href="plusLikes()"><i class="far fa-heart"></i></a></td>
														<!-- <i class="fas fa-heart"></i> -->
														<td>${vList.likes }</td>
														<td class="t count">조회수</td>
														<td class="t">작성일자</td>
														<td>${vList.vUpdateDate }</td>
													</tr>
												</table>
												<div class="content">${vList.visitContents }</div><hr>
												<div class="button-wrapper">
													<c:url var="vModify" value="visitModifyView.do">
														<c:param name="visitNo" value="${vList.visitNo }"></c:param>
													</c:url>
													<c:url var="vDelete" value="visitDelete.do">
														<c:param name="visitNo" value="${vList.visitNo }"></c:param>
														<c:param name="renameFilename"
															value="${visit.renameFilename }"></c:param>
													</c:url>
													<%-- <c:if test="${ loginUser.userId eq vList.userId }" --%>
													<a href="${vModify }">수정 페이지로 이동</a> &nbsp; <a
														href="${vDelete }">삭제하기</a>

												</div>
											</div>
											<br>
											<div class="reply-container">
												<div id="reply">
													<!-- 댓글 등록 -->
													<table align="center" width="500" cellspacing="0" >
														<tr>
															<td><b>댓글</b></td>
														</tr>
														
														<tr>
															<td id="replyContents">
																<textarea rows="2" cols="100" id="rContent" name="contents"></textarea>
																<div id="noti">(0 / 100)</div>		
																
															</td>
														</tr>
														<tr>
															<td><button class="btn-2" id="rSubmit" value="${vList.visitNo }">등록</button></td>
														</tr>
													</table>
													<!-- 댓글 목록 -->
													<table align="center" width="300" 
														cellspacing="0" id="rtb">
														<thead>
															<tr>
																<!-- 댓글 갯수 -->
																<td colspan="4"><b id="rCount${vList.visitNo }"></b></td>
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
		<script src="/resources/js/jquery-ui.min.js"></script>
		<script>
			$(function() {
				makeGrid();
				click();
	            $("#replyContents").on("keyup",function(){
	                // keypress는 한글입력이 인식 안되고 keyup, keydown은 된다.
	                //var inLength = $(this).val().length;
	                //$("#noti").html("작성가능한 글자수 : "+ (100 - inLength));
	                alert("keyup");
	                console.log("keyup");
	            });
			});

			/* ============ 스크롤 ================*/
				// 1. 스크롤 이벤트 최초 발생
				$(window).scroll(function(){
					var listLength = $(".grid__item").length;
					var currentScrollTop = Math.ceil($(window).scrollTop());
					/* var documentHeight = $(document).height(); */
					var visibleHeight = '600';
					var windowHeight = $(window).height()
					console.log("currentScrollTop:" + currentScrollTop);
					console.log("windowHeight" + windowHeight);
					//console.log(currentScrollTop);
					var lastScrollTop = 0;
					//var easeEffect = 'easeInQuint';
					console.log("게시글수:"+listLength);

					var scrollPosition = windowHeight + currentScrollTop;
					var docHeight = $(document).height();
					
					var remainingHeight = (docHeight - scrollPosition);
					
					
					/* ========= 다운 스크롤인 상태 ============ */
					if( currentScrollTop - lastScrollTop > 0 ){
						console.log('=========================================');
						console.log('visibleHeight : ' +visibleHeight);
						console.log('currentScrollTop : ' +currentScrollTop);
						console.log('scrollPosition : ' +scrollPosition);
						console.log('windowHeight : ' +windowHeight);
						console.log('lastScrollTop : ' +lastScrollTop);
						console.log('docHeight : ' + docHeight);
						console.log(' calc value : ' + (docHeight - scrollPosition));
						console.log(' calc value2 : ' + ((docHeight - scrollPosition)/docHeight));
						console.log('=========================================');


						// down-scroll : 현재 게시글 다음의 글을 불러온다.
						//console.log("down-scroll");
						// 2. 현재 스크롤의 top 좌표가  > (게시글을 불러온 화면 height - 윈도우창의 height) 되는 순간
//						if (currentScrollTop >= (visibleHeight - windowHeight) ){ //② 현재스크롤의 위치가 화면의 보이는 위치보다 크다면
						if (remainingHeight === 0){ //② 현재스크롤의 위치가 화면의 보이는 위치보다 크다면
							// 3. class가 scrolling인 것의 요소 중 마지막인 요소를 선택한 다음 그것의 data-no속성 값을 받아온다.
							//		즉, 현재 뿌려진 게시글의 마지막 bno값을 읽어오는 것이다.( 이 다음의 게시글들을 가져오기 위해 필요한 데이터이다.)
							var lastNo = $(".grid__item:last").attr("data-no");
							/* alert(lastNo);  */
							console.log(lastNo);
							// 4. ajax를 이용하여 현재 뿌려진 게시글의 마지막 no를 서버로 보내어 그 다음 20개의 게시물 데이터를 받아온다. 
							
							$.ajax({
								url : "visitScroll.do",// 요청할 서버의 url
								type : "GET",	// 요청 method 방식 
								data : { // 서버로 보낼 데이터 명시 
									"visitNo" : lastNo
								},
								dataType : "json",
								success : function(data){// ajax 가 성공했을시에 수행될 function이다. 이 function의 파라미터는 서버로 부터 return받은 데이터이다.
									var str = "";
									// 5. 받아온 데이터가 ""이거나 null이 아닌 경우에 DOM handling을 해준다.
									if(data.length === 0){// 6. 만약 서버로 부터 받아온 데이터가 없으면 그냥 아무것도 하지말까..??
										alert("더 불러올 데이터가 없습니다.");
									}//if : data != ""
									else{//6. 서버로부터 받아온 data가 list이므로 이 각각의 원소에 접근하려면 each문을 사용한다. 
										console.log(JSON.stringify(data));
										
										$.each(data, function (index, item){
										// 7. 새로운 데이터를 갖고 html코드형태의 문자열을 만들어준다.
										
												str +=  "<div class='grid__item' data-size='1280x857' data-no='"+item.visitNo+"'style='position: absolute;'>" 
												str	+=	 	"<a id='grid' href='/resources/vUploadFiles/"+ item.renameFilename +"' class='img-wrap'>" 
												str	+=			"<img data-visitNo='" + item.visitNo +"' src='/resources/vUploadFiles/"+ item.renameFilename +"'/>"
												str	+=			"<div class='description description--grid'>"
												str	+=				"<div class='rightCon'>"
												str	+=					"<div class='r-title col-md-12'>"
												str	+=						"<div id='title'>"+item.visitTitle +"</div>"
												str	+=						"<div id='nickname'>"+item.nickName + "</div>";
												str	+=						"<table class='info'>"
												str	+=							"<tr>"
												str	+=								"<td class='t'><a href='#'><i class='far fa-heart'></i></a></td>"
												str	+=								"<td>"+item.likes+"</td>"
												str	+=								"<td class='t count'>조회수</td>"
												str	+=								"<td class='t'>작성일자</td>"
												str	+=								"<td>"+item.vUpdateDate+"</td>"
												str	+=							"</tr>"
												str	+=						"</table>"
												str	+=						"<div class='content'>"+item.visitContents+"</div>"
												str	+=						"<div class='button-wrapper'>"
												str	+=							"<c:url var='vModify' value='visitModifyView.do'>"
												str	+=								"<c:param name='visitNo' value='"+item.visitNo+"'></c:param>"
												str	+=							"</c:url>"
												str	+=							"<c:url var='vDelete' value='visitDelete.do'>"
												str	+=								"<c:param name='visitNo' value='"+item.visitNo+"'></c:param>"
												str	+=								"<c:param name='renameFilename' value='"+item.renameFilename+"'></c:param>"
												str	+=							"</c:url>"
												str	+=							"<a href='${vModify }'>수정 페이지로 이동</a> &nbsp; "
												str	+=							"<a href='${vDelete }'>삭제하기</a>"
												str	+=						"</div>"
												str	+=					"</div> <hr>"
												str	+=				"<div class='reply-container'>"
												str	+=					"<div id='reply'>"
												str	+=						"<table align='center' width='500' cellspacing='0'>"
												str	+=							"<tr>"
												str	+=								"<td><textarea rows='3' cols='55' id='rContent' name='contents'></textarea></td>"
												str	+=								"<td><button id='rSubmit' value='"+item.visitNo+"'>버튼</button></td>"
												str	+=							"</tr>"
												str	+=						"</table>"
												str	+=						"<table align='center' width='300' cellspacing='0' id='rtb'>"
												str	+=							"<thead>"
												str	+=								"<tr>"
												str	+=									"<td colspan='2'><b id='rCount'></b></td>"
												str	+=								"</tr>"
												str	+=							"</thead>"
												str	+=							"<tbody></tbody>"
												str	+=						"</table>" 
												str	+=					"</div>"
												str	+=					"<div id='inform-con'></div>"
												str	+=				"</div></div></div>"
												str	+=			"</a></div>";
												});// each 
												
												// 8. 이전까지 뿌려졌던 데이터를 비워주고, <th>헤더 바로 밑에 위에서 만든 str을  뿌려준다.
												// $(".grid").empty();// 셀렉터 태그 안의 모든 텍스트를 지운다.
												str += "<!-- END OF $.each -->"
												$(".grid:last").append(str);
												console.log($("div[class^='a']"));
												makeGrid();
												location.reload();
												click();
										}
									}
								});// ajax
							// 여기서 class가 listToChange인 것중 가장 처음인 것을 찾아서 그 위치로 이동하자.
							var position = $(".grid__item").offset();// 위치 값
							// 이동  위로 부터 position.top px 위치로 스크롤 하는 것이다. 그걸 500ms 동안 애니메이션이 이루어짐.
				
				        };//if : 현재 스크롤의 top 좌표가  > (게시글을 불러온 화면 height - 윈도우창의 height) 되는 순간
						
						// lastScrollTop을 현재 currentScrollTop으로 갱신해준다.
 					};// 다운스크롤인 상태
				});
			// 클릭 이벤트
			function click(){
				/* ============ 이미지 클릭 시 동작 ================*/
				$("img").click(function() { // 이미지를 클릭했을 때 아래 코드가 실행되도록 함. img가 unique해서
					$("#rtb tbody").html(""); // tbody부분을 비워줌. 비워주지 않으면 댓글 목록을 조회한 것이 다른 글의 tbody에도 남아있음
					$(".count").next().remove();
					visitNo = $(this).attr("data-visitNo"); // 클릭한 img의 아이디값으로 visitNo을 가져옴
					addHitsCount(visitNo);
					registReply(visitNo);
					getReplyList(visitNo);// 댓글 목록 조회1
					console.log(visitNo);
					return visitNo;
				});
			};
			function refresh(){
		        // ajax option
		        var ajaxOption = {
		                url : url,
		                async : true,
		                type : "POST",
		                dataType : "html",
		                cache : false
		        };
		        
		        $.ajax(ajaxOption).done(function(data){
		            // Contents 영역 삭제
		            $('#bodyContents').children().remove();
		            // Contents 영역 교체
		            $('#bodyContents').html(data);
		        });

				
			}
			// 그리드 고정
			function makeGrid(){
				
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
						
			}
			// 댓글 목록 조회
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
								$rWriter = $("<td width='40'>").text(data[i].nick);
								$rContent = $("<td width='80'>").text(data[i].contents);
								$rCreateDate = $("<td width='50'>").text(data[i].enrollDate);
								$btnArea1 = $("<td width='10'>").append(
										"<a href='#' onclick='modifyReply(this,"
												+ visitNo + ","
												+ data[i].replyNo + ",\""
												+ data[i].contents
												+ "\");'>수정 </a>");
								$btnArea2 = $("<td width='10'>").append(
										"<a href='#' onclick='removeReply("
												+ visitNo + ","
												+ data[i].replyNo
												+ ");'> 삭제</a>");
								$tr.append($rWriter);
								$tr.append($rContent);
								$tr.append($rCreateDate);
								$tr.append($btnArea1);
								$tr.append($btnArea2);
								$tableBody.append($tr);
							}
						} else {
							$tr = $("<tr>");
							$td = $("<td>").text("댓글이 없습니다.")///////////////////
							$tr.append($td);
							$tableBody.append($tr);
						}
					},
					error : function() {
						/* alert("서버 통신 실패(댓글 목록 조회)!"); */
					}
				});
			}
			// 댓글 등록
			function registReply(visitNo){
				var rContent = "";
				$(document).on('click','#rSubmit', function() { // 등록버튼을 클릭하면 아래 코드 실행
							//alert(visitNo);
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
			};
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

			};
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
							alert("댓글이 없습니다");
						}
					},
					error : function() {
						alert("서버 통신 실패(댓글 삭제)!");
					}
				});
			};
/* 			// 좋아요 추가
			function plusLikes(){
				
			}
			// 좋아요 취소
			function minusLikes(){
				
			} */
			
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