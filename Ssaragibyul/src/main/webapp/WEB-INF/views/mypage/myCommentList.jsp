<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정 페이지</title>
<link rel="stylesheet" type="text/css" href="/resources/css/mypage/myCommentList.css?ver=1">
<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700,900|Oswald:400,700" rel="stylesheet">
<link rel="stylesheet" href="/resources/fonts/flaticon/font/flaticon.css">
</head>
<body>
    <jsp:include page="../../../header.jsp"/>
    <div style="height:50px;"></div>
    <div class="background">
        <div class="contents">
            <div class="kind">
                <div id="k1">게시물</div>
                <div id="k2">댓글</div>
            </div>
            <div class="leftMenu">
                    <jsp:include page="../../../myPageNav.jsp"/>
            </div>

            <!--오른쪽 내용 : 마이페이지 수정할 때 여기만 고치면 됨-->
            <div class="rightCon">
                <h2 align="center" id="h2">내가 작성한 댓글</h2>
                <form action="myCommentList.do" method="post">
                    
                <!--상단-->
                <div class="f-top">
                   <%--  <div id="btns">
						<select name="searchCondition" class="form-select form-select-sm" aria-label=".form-select-sm example" id="sort">
							<option value="all" <c:if test="${search.searchCondition eq 'all' }">selected</c:if>>전체</option>
							<option value="펀딩상세" <c:if test="${search.searchCondition eq '펀딩상세' }">selected</c:if>>펀딩</option>
							<option value="기부상세" <c:if test="${search.searchCondition eq '기부상세' }">selected</c:if>>기부</option>
							<option value="방문" <c:if test="${search.searchCondition eq '방문' }">selected</c:if>>별보러</option>				
						</select>
                    </div> --%>
                    <div class="sort-div" align="right">
						<div id="sort-box" align="right">
							<select name="searchCondition" class="form-select form-select-sm" aria-label=".form-select-sm example" id="sort">
								<option value="all" <c:if test="${search.searchCondition eq 'all' }">selected</c:if>>전체</option>
								<option value="펀딩상세" <c:if test="${search.searchCondition eq '펀딩상세' }">selected</c:if>>펀딩</option>
								<option value="기부상세" <c:if test="${search.searchCondition eq '기부상세' }">selected</c:if>>기부</option>				
								<option value="방문" <c:if test="${search.searchCondition eq '방문' }">selected</c:if>>별보러가자</option>				
							</select>			
						</div>
					</div>
                </div>
                
                <!--메인 내용-->
                <div class="f-cont">
                    <div>
                        <table id="comm-table">
                            <tr id="title">
                                <td width="8%">번호</td>
                                <td width="10%">구분</td>
                                <td>프로젝트명</td>
                                <td width="45%">댓글 내용</td>
                                <td>작성일</td>
                                <td></td>
                            </tr>
                            <tbody id="tbody">
								<c:if test="${empty cpList }">
									<tr>
										<td colspan="5">${tblMsg}</td>
									</tr>
								</c:if>
								<c:if test="${!empty cpList }">
									<c:forEach items="${cpList }" var="comment" varStatus="index">
			                            <tr>
			                                <!-- <td><input type="checkbox"></td> -->
			                                <td>${index.count }</td>
			                                <c:if test="${comment.boardType == '펀딩상세' }">
			                                	<td>펀딩</td>
			                                </c:if>
			                                <c:if test="${comment.boardType == '기부상세' }">
			                                	<td>기부</td>
			                                </c:if>
			                                <c:if test="${comment.boardType == '방문' }">
			                                	<td>방문</td>
			                                </c:if>
			                                
			                                <td id="subject"><font title="${comment.subject }">${comment.subject }</font></td>
			                                <td class="contents">${comment.commContents }</td>
			                                <td><fmt:formatDate value="${comment.regDate }" pattern="yyyy.MM.dd"/></td>
			                                <td id="info" width="150px">
			                                	<input type="hidden" name="boardType" value="${comment.boardType}">
			                                	<input type="hidden" name="commNo" value="${comment.commNo}">
												<input type="button" value="삭제" class="deleteBtn"> 
												<input type="button" value="수정" class="appendBtn">
											</td>
			                            </tr>
		                            </c:forEach>
	                            </c:if>
                            </tbody>
                            <!-- 페이징 -->
							<tr>
								<td colspan="6" id="page-td">
									<!-- 전체리스트 페이징-->
									<!-- 이전 -->
									<c:url var="before" value="myCommentList.do">
										<c:param name="page" value="${pi.currentPage - 1}"></c:param>
									</c:url>
									<c:if test="${pi.listCount ne 0 }">
										<c:if test="${pi.currentPage <= 1 }">
											<font>&laquo;</font>
										</c:if>
										<c:if test="${pi.currentPage > 1 }">
											<a href="${before }">&laquo;</a>
										</c:if>
									</c:if>
									<!-- 페이지 -->
									<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage }">
										<c:url var="pagination" value="myCommentList.do">
											<c:param name="page" value="${p}"></c:param>
										</c:url>
										<c:if test="${p eq pi.currentPage}">
											<font color="#EB5C01">${p}</font>
										</c:if>
										<c:if test="${p ne pi.currentPage}">
											<a href="${pagination }">${p}</a>
										</c:if>
									</c:forEach>
									<!-- 다음 -->
									<c:url var="after" value="myCommentList.do">
										<c:param name="page" value="${pi.currentPage + 1}"></c:param>
									</c:url>
									<c:if test="${pi.listCount ne 0 }">
										<c:if test="${pi.currentPage >= pi.maxPage}">
											<font>&raquo;</font>
										</c:if>
										<c:if test="${pi.currentPage < pi.maxPage}">
											<a href="${after}">&raquo;</a>
										</c:if>
									</c:if>
                            	</td>
                            </tr>
                        </table>
                    </div>
                </div>
                </form>
            </div>
                
        </div>
    </div>
    <footer>
    	<jsp:include page="../../../footer.jsp"/>
    </footer>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		var check = true;
		/* 수정 */
		function modifyComm() {
			var commContents = $("input[name=commContents]").val();
			var boardType = $("#boardTypeMod").val();
			var commNo = $("#commNoMod").val();
			var rowContents = $("#modifyBtn").parent("td").parent("tr").prev().find(".contents");
			var conf = confirm("정말 수정하시겠습니까?");
			if(conf == true) {
				$.ajax({
					url: "myCommentModify.do",
					type: "post",
					data:{"commNo" : commNo,
						"boardType" : boardType,
						"commContents" : commContents},
					success: function(data){
						if(data=="success") {
							rowContents.text(commContents);
							alert("수정하였습니다.");
							resetModifyWindow();
						}else {
							alert("수정에 실패하였습니다.");
						}
					},
					error: function(){
						alert("수정에 실패하였습니다.");
					},
				});
			}else {
				
			}
		}
		/* 수정창 닫기 */
		function resetModifyWindow() {
			$("#resetBtn").parent().parent().remove();
			check = true;
		}
		
		$(function() {
			/* 삭제 */
			$(".deleteBtn").each(function(i){
				$(this).on("click", function(){
					var boardType = $(this).parent().children("input[name=boardType]").val();
					var commNo = $(this).parent().children("input[name=commNo]").val();
					console.log(commNo);
	 				var conf = confirm("정말 삭제하시겠습니까?");
					if(conf == true) {
						$.ajax({
							url: "commentDelete.do",
							type: "post",
							data:{"commNo" : commNo,
								"boardType" : boardType},
							success: function(data){
								if(data=="success") {
									alert("삭제하였습니다.");
								}else {
									alert("삭제에 실패하였습니다.");
								}
							},
							error: function(){
								alert("삭제에 실패하였습니다.");
							},
							complete: function(){
								location.reload("myCommentList.do");
							}
						});
					}else {
						
					}	
				}); 
			})
			
			/* 수정창 생성 */
			$(".appendBtn").each(function(i){
				$(this).on("click", function(){
					if(check) {
						var boardType = $(this).parent("td").find("input[name=boardType]").val();
						var commNo = $(this).parent("td").find("input[name=commNo]").val();
						var $tr = $(this).parent("td").parent("tr");
						var str = "";
						str += "<tr>";
						str += "<td></td><td></td>";
						str += "<td id='modify-subject'>" + $(this).parent("td").parent("tr").find("#subject").text() +"</td>";
						str += "<td colspan='2'><input type='text' name='commContents' placeholder='수정내용을 입력해주세요.'></td>";
						str += "<td>";
						str += "<input type='hidden' name='boardType' id='boardTypeMod' value=" + boardType + ">";
						str += "<input type='hidden' name='commNo' id='commNoMod' value=" + commNo + ">";
						str += "<input type='button' onclick='modifyComm(); return false;' value='등록' id='modifyBtn'> <input type='button' onclick='resetModifyWindow(); return false;' value='취소' id='resetBtn'></td></tr>";
						$tr.after(str);
						check = false;
					}else {
						alert("하나씩 수정해주세요");
					}
				}); 
			});
			
		});
		
		$("#sort").on("change", function(){
			var searchCondition = $("#sort option:selected").val();
			location.href = 'mySearchComment.do?searchCondition='+searchCondition;
		});
	</script>


</body>
</html>