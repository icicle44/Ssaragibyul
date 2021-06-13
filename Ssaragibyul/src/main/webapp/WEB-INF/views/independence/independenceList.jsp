<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>독립유공자 공훈록</title>
<%@include file="/header.jsp"%>
<link rel="stylesheet"
	href="/resources/css/independence/style_independence.css">
<!-- Font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class="container-fluid col-md-12">
		<section class="sideBar col-md-4">
			<b>독립유공자 공훈록</b>
			<hr>
			<a href="historyList.do"><b>별들의 발자취</b></a>
			<hr>
			<a href="visitList.do"><b>별 보러 가자</b></a>

			<hr>
		</section>
		<section class="contents col-md-8">
			<div class="search">
				<div class="wrapper">
					<div class="main_title">
						<b>독립유공자 정보 검색</b>
					</div>
					<div class="accordion_wrap">
					  <form action="independenceSearch.do" method="get">
						<input type="hidden" id="searchCondition" name="searchCondition">
						<input type="hidden" id="searchValue" name="searchValue">
						<ul>
							<li class="walk">
								<div class="accordion_item" id="nameKo" onclick="getSearchCondition(this.id)">
									<div class="menuInfo">
										<h2>성 명</h2>
									</div>
								</div>
								<div class="accordion_menu">
									<div class="inner_am">
										<div class="title">독립유공자란</div>
										<div class="content">이 사이트에서의 독립유공자란 일제 강점기 항일운동에 참여하셨던
											분들을 대상으로 합니다.</div>
										<div class="searchMenu">
											<div class="search-wrap">
												<div class="search-bar">
													<input type="text" class="searchTerm" placeholder="성함으로 검색">
													<input type="submit" class="searchButton" onclick="getSearchValue(this)" value="검색">
												</div>
											</div>
										</div>
										<div class="view_more" onclick='showHide(this)'>검색하기</div>
									</div>
								</div>
							</li>
							<li class="bicycle">
								<div class="accordion_item" id="birth" onclick="getSearchCondition(this.id)">
									<div class="menuInfo">
										<h2>출 생 년 도</h2>
									</div>
								</div>
								<div class="accordion_menu">
									<div class="inner_am">
										<div class="title">데이터의 출처</div>
										<div class="content">이하 독립유공자 분들의 데이터베이스는 1949년부터 시작된 정부포상 결정문을 기반으로
											합니다.</div>
										<div class="searchMenu">
											<div class="search-bar">
												<input type="text" class="searchTerm" placeholder="출생년도로 검색">
												<input type="submit" class="searchButton" onclick="getSearchValue(this)" value="검색">
											</div>
										</div>
										<div class="view_more" onclick='showHide(this)'>검색하기</div>
									</div>
								</div>
							</li>
							<li class="bike">
								<div class="accordion_item" id="activityLine" onclick="getSearchCondition(this.id)">
									<div class="menuInfo">
										<h2>운 동 계 열</h2>
									</div>
								</div>
								<div class="accordion_menu">
									<div class="inner_am">
										<div class="title">운동계열</div>
										<div class="content">운동계열은 항일운동의 형태 및 활동장소에 의해 분류로서 국내/일본 방면, 의병, 3.1/학생 운동 등으로 나뉩니다.</div>
										<div class="searchMenu">
											<div class="search-bar">
												<input type="text" class="searchTerm" placeholder="운동계열로 검색">
												<input type="submit" class="searchButton" onclick="getSearchValue(this)" value="검색">
											</div>
										</div>
										<div class="view_more" onclick='showHide(this)'>검색하기</div>
									</div>
								</div>
							</li>
							<li class="car">
								<div class="accordion_item" id="honoredYear" onclick="getSearchCondition(this.id)">
									<div class="menuInfo">
										<h2>포 상 년 도</h2>
									</div>
								</div>
								<div class="accordion_menu">
									<div class="inner_am">
										<div class="title">포상년도</div>
										<div class="content">1949년 대한민국정부수립 이후 2021년까지 
										독립유공자는 건국훈장 11400명, 건국포장 1392명 등 모두 1만6685명입니다.
										</div>
										<div class="searchMenu">
								  	  	    <div class="search-bar">
										      <input type="text" class="searchTerm" placeholder="포상년도로 검색">
										      <input type="submit" class="searchButton" onclick="getSearchValue(this)" value="검색">
										    </div>										
										</div>
										<div class="view_more" onclick='showHide(this)'>View
											More</div>
									</div>
								</div>
							</li>
							<li class="train">
								<div class="accordion_item" id="honoredClass" onclick="getSearchCondition(this.id)">
									<div class="menuInfo">
										<h2>포 상 훈 격</h2>
									</div>
								</div>
								<div class="accordion_menu">
									<div class="inner_am">
										<div class="title">포상훈격</div>
										<div class="content"><!-- 포상훈격이란 대한민국의 정부가 국가에 공로가 뚜렷한 분들께 수여하는 --> 건국훈장의 등급을 의미하며
										총 5등급으로 순서대로 1.대한민국장 2.대통령장 3.독립장 4.애국장 5.애족장으로 나뉩니다. 
										</div>
										<div class="searchMenu">
								  	  	    <div class="search-bar">
										      <input type="text" class="searchTerm" placeholder="포상훈격으로 검색">
										      <input type="submit" class="searchButton" onclick="getSearchValue(this)" value="검색">
										    </div>										
										</div>
										<div class="view_more" onclick='showHide(this)'>View
											More</div>
									</div>
								</div>
							</li>
							<li class="aeroplane">
								<div class="accordion_item" id="home" onclick="getSearchCondition(this.id)">
									<div class="menuInfo">
										<h2>본 적</h2>
									</div>
								</div>
								<div class="accordion_menu">
									<div class="inner_am">
										<div class="title">본 적</div>
										<div class="content">2007년 말까지 시행된 호적법 상의 호적 기재사항 중 하나로서, 현재는 고향이나 출신지라는 의미로 
										사용하기도 합니다.</div>
										<div class="searchMenu">
								  	  	    <div class="search-bar">
										      <input type="text" class="searchTerm" placeholder="본적으로 검색">
										      <input type="submit" class="searchButton" onclick="getSearchValue(this)" value="검색">
										    </div>										
										</div>
										<div class="view_more" onclick='showHide(this)'>View
											More</div>
									</div>
								</div>
							</li>
						</ul>
					  </form>
					</div>
				</div>
			</div>
			<div class="table-users">
				<table cellspacing="0">
					<tr>
						<th><b>번호</b></th>
						<th><b>성명</b></th>
						<th><b>한자명</b></th>
						<th><b>생존연도</b></th>
						<th><b>운동계열</b></th>
						<th><b>포상년도</b></th>
						<th><b>포상훈격</b></th>
						<th><b>본적</b></th>
					</tr>
					<c:forEach items="${iList }" var="list">
						<tr>
							<td align="center">${list.independenceNo }</td>
							<td align="center"><a
								href="#modal_open${list.independenceNo }" data-toggle="modal"><b>${list.nameKo }</b></a></td>
							<td align="center">${list.nameCh }</td>
							<td align="center">${list.birthday }~ ${list.lastday }</td>
							<td align="center">${list.activityLine }</td>
							<td align="center">${list.prizedYear }</td>
							<td align="center">${list.prizeClass }</td>
							<td align="center">${list.registerLarge }&nbsp;${list.registerMid }</td>
						</tr>


					</c:forEach>

					<!-- 페이징 -->
					<tr align="center" height="20">
						<td colspan="8">
							<!-- 이전 --> <c:url var="before" value="independenceList.do">
								<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
							</c:url> <c:if test="${pi.currentPage <= 1 }">
					[이전]&nbsp;
				</c:if> <c:if test="${pi.currentPage > 1 }">
								<a href="${before }">[이전]</a>&nbsp;
				</c:if> <!-- 페이지 --> <c:forEach var="p" begin="${pi.startPage }"
								end="${pi.endPage }">
								<c:url var="pagination" value="independenceList.do">
									<c:param name="page" value="${p }"></c:param>
								</c:url>
								<c:if test="${p eq pi.currentPage }">
									<font color="red" size="2">[${p }]</font>
								</c:if>
								<c:if test="${p ne pi.currentPage }">
									<a href="${pagination }">${p }</a>&nbsp;
					</c:if>
							</c:forEach> <!-- 다음 --> <c:url var="after" value="independenceList.do">
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
			<%@include file="/footer.jsp"%>
		</section>
		<!-- 모달창 -->
		<c:forEach items="${iList }" var="list">
			<div class="modal fade" id="modal_open${list.independenceNo }"
				role="dialog" aria-labelledby="exampleModalCenterTitle"
				aria-hidden="true" static>
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle">
								<strong>독립 운동가 정보</strong>
							</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<table class="table">
							<tr>
								<td class="colored"><b>성명</b></td>
								<td colspan="3"><b>${list.nameKo }</b></td>
							</tr>
							<tr>
								<td class="colored"><b>유공자 번호</b></td>
								<td>${list.independenceNo }</td>
								<td class="colored"><b>한자</b></td>
								<td>${list.nameCh }</td>
							</tr>
							<tr>
								<td class="colored"><b>운동계열</b></td>
								<td>${list.activityLine }</td>
								<td class="colored"><b>성별</b></td>
								<td>${list.sex }</td>
							</tr>
							<tr>
								<td class="colored"><b>생년월일</b></td>
								<td>${list.birthday }</td>
								<td class="colored"><b>사망년월일</b></td>
								<td>${list.lastday }</td>
							</tr>
							<tr>
								<td class="colored"><b>본적</b></td>
								<td colspan="3">${list.registerLarge }&nbsp;${list.registerMid }</td>
							</tr>
							<tr>
								<td class="colored"><b>공적개요</b></td>
								<td colspan="3">${list.achievement }</td>
							</tr>

						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
	</div>
	</c:forEach>


	</section>
	</div>
	<script>
		/* 		$('html, body').css({
		 'overflow' : 'hidden',
		 'height' : '100%'
		 });
		 */
		// searchCondition/ searchValue 가져오기
		function getSearchCondition(condition){
			 //alert(obj+","+searchCondition);
			  var searchCondition = condition;
			  $("#searchCondition").val(searchCondition);
		 };
		function getSearchValue(obj){
			console.log(obj);
			var searchValue = $(obj).prev().val();
				alert(searchValue);
			$("#searchValue").val(searchValue);
		}
		//검색창 보이기/숨기기
		function showHide(obj) {
			var state = $(obj).prev().css('display');
			if (state == 'none') { // state가 none 상태일경우 
				$(obj).prev().show(1000); // ID가 moreMenu인 요소를 show();
			} else { // 그 외에는
				$(obj).prev().hide(1000); // ID가 moreMenu인 요소를 hide();			
			}
		}

		// 아코디언 메뉴
		$('#element').on('scroll touchmove mousewheel', function(event) {
			event.preventDefault();
			event.stopPropagation();
			return false;
		});
		var li_items = document.querySelectorAll(".accordion_wrap ul li");
		var ul = document.querySelector(".accordion_wrap ul");

		li_items.forEach(function(item) {
			item.addEventListener("click", function() {
				li_items.forEach(function(item) {
					item.classList.remove("active");
				})
				item.classList.add("active");
			});
		});

		ul.addEventListener("mouseleave", function() {
			li_items.forEach(function(item) {
				item.classList.remove("active");
			})
		});
	</script>
</body>
</html>