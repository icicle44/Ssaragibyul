<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정 페이지</title>
<link rel="stylesheet" type="text/css"
	href="/resources/css/mypage/myPostList.css">
<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700,900|Oswald:400,700" rel="stylesheet">
<link rel="stylesheet" href="/resources/fonts/flaticon/font/flaticon.css">
</head>
<body>
	<jsp:include page="../../../header.jsp" />
	<div class="background">
		<div class="contents">
			<div class="kind">
				<div id="k1">게시물</div>
				<div id="k2">댓글</div>
			</div>
			<div class="leftMenu">
				<jsp:include page="../../../myPageNav.jsp" />
			</div>

			<!--오른쪽 내용 : 마이페이지 수정할 때 여기만 고치면 됨-->
			<div class="rightCon">
				<h2 align="center" id="h2">내가 작성한 게시글</h2>

				<!--상단-->
				<div class="f-top">
					<div id="all-check">
						<input type="checkbox" id="checkAll"> <span style="margin-bottom: 10px;">전체 선택</span>
					</div>
					<div id="btns">
						<input type="button" value="삭제하기" id="delete-btn" style="opacity:0.3">
					</div>
				</div>

				<!--메인 내용-->
				<div class="f-cont">
					<div>
						<table>
							<tr id="title">
								<td></td>
								<td>사적지 이름</td>
								<td>게시물 제목</td>
								<td>작성일</td>
							</tr>
							<c:forEach items="${vList }" var="vList">
								<tr>
									<td><input type="checkbox" name="chk" value="${vList.visitNo }"></td>
									<td>${visit.siteName }</td>
									<td><a href="#modal_open${vList.visitNo }"
										data-toggle="modal">${vList.visitTitle }</a></td>
									<td>${vList.vCreateDate }</td>
								</tr>
							</c:forEach>
							<!--반복-->
							<!-- 페이징 -->
							<tr align="center" height="20" style="text-align: center; margin-left: 200px;">
								<td align="center" colspan="11" style="margin-left: 200px;" >
									<!-- 이전 --> <c:url var="before" value="myPostList.do">
										<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
									</c:url> <c:if test="${pi.currentPage <= 1 }">
											[이전]&nbsp;
										</c:if> <c:if test="${pi.currentPage > 1 }">
										<a href="${before }">[이전]</a>&nbsp;
										</c:if> <!-- 페이지 --> <c:forEach var="p" begin="${pi.startPage }"
										end="${pi.endPage }">
										<c:url var="pagination" value="myPostList.do">
											<c:param name="page" value="${p }"></c:param>
										</c:url>
										<c:if test="${p eq pi.currentPage }">
											<font color="orange" size="3">[${p }]</font>
										</c:if>
										<c:if test="${p ne pi.currentPage }">
											<a href="${pagination }">${p }</a>&nbsp;
										</c:if>
									</c:forEach> <!-- 다음 --> <c:url var="after" value="myPostList.do">
										<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
									</c:url> <c:if test="${pi.currentPage >= pi.maxPage }">
											[다음]&nbsp;
										</c:if> <c:if test="${pi.currentPage < pi.maxPage }">
										<a href="${after }">[다음]</a>&nbsp;
										</c:if>
								</td>
							</tr>
						</table>
					</div>
				</div>
								<footer>
					<jsp:include page="../../../footer.jsp" />
				</footer>
			</div>
			<!-- 모달창 -->
			<c:forEach items="${vList }" var="vList">
				<div class="modal fade" id="modal_open${vList.visitNo }"
					role="dialog" aria-labelledby="exampleModalCenterTitle"
					aria-hidden="true" static>
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
<!-- 								<h5 class="modal-title" id="exampleModalLongTitle"> -->
<!-- 									<strong>내가 쓴 글</strong> -->
								</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<table class="table">
								<tr>
									<td class="colored">제목</td>
									<td>${vList.visitTitle }</td>
									<td class="colored">조회수</td>
									<td>${vList.visitCount }</td>

								</tr>
								<tr>
									<td class="colored" colspan="2">내용</td>
									<td colspan="2">${vList.visitContents }</td>
								</tr>
								<tr>
									<td class="colored">작성일자</td>
									<td>${vList.vCreateDate }</td>
									<td class="colored">사적지 이름</td>
									<td>${vList.siteName }</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
					</div>
						<!-- 모달창  -->

				</div>
				</c:forEach>
<!-- 				</div> -->

				<!-- 메인내용 끝 -->


<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(function(){
	/* 체크박스 전체 체크/해제 */
	$("#checkAll").on("click", function(){
		if($("#checkAll").prop("checked")) {
			$("input[name=chk]").prop("checked", true);
			$("#delIcon").css("opacity", "1");
		}else {
			$("input[name=chk]").prop("checked", false);
			$("#delIcon").css("opacity", "0.3");
		}
	});
	$("input[name=chk]").on("click", function(){
		$("#checkAll").prop("checked", false);
		var cnt = $("input[name=chk]:checked").length;
		if(cnt == $("input[name=chk]").length) {
			$("#checkAll").prop("checked", true);
		}
	});
	
	$("#delete-btn").hover(function() {
		$(this).css("opacity", "1");					
	});
	$("#delete-btn").mouseleave(function() {
		$(this).css("opacity", "0.3");					
	});
	/* List View에서 삭제하기(다중) */
	$("#delete-btn").on("click", function(){
		var cnt = $("input[name=chk]:checked").length;
		var visitNoArr = new Array();
		$("input[name=chk]:checked").each(function(){
			visitNoArr.push($(this).val());
		});
		if(cnt == 0) {
			alert("선택된 쪽지가 없습니다.");
		}else {
			var conf = confirm("정말 삭제하시겠습니까?");
			if(conf == true) {
				$.ajax({
					url: "myVisitDelete.do",
					type: "get",
					data:{"visitNoArr" : visitNoArr},
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