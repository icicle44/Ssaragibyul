<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<title>별들의 발자취</title>
<%@include file="/header.jsp"%>
<style>
html, body, div, span, applet, object, iframes, h1, h2, h3, h4, h5, h6,
	p, blockquote, pre, a, abbr, acronym, address, big, quotes, code, del,
	dfn, em, img, ins, kbd, q, s, samp, small, strike, sub, sup, tt, var, u,
	i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table,
	caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
	output, ruby, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	do: inherit;
	vertical-align: baseline;
}
.sideBar{
	font-size: 15px;
	font-family: "Avenir Next", Avenir, 'Helvetica Neue', 'Lato', 'Segoe UI', Helvetica, Arial, sans-serif;
/* 	font-weight: 200; */
	float:left;
	padding-top:25em;
	color: #2b686e;
	text-align: center;
}
.contents{
	padding-top: 10em;
	margin-left: 5em;
}
article, aside, details, figcaption, figure, footer, header, hgroup,
	menu, nav, section {
	display: block;
}

blockquote, q {
	quotes: none;
}

blockquote : before, blockquote : after, q : before, q : after {
	content: '';
	content: none;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

/*css 초기화*/
.card {
	height: 400px;
	width: 450px;
	border-radius: 15px;
	display: inline-block;
	margin: 0.5em;
	position: relative;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	overflow: hidden;
}

.card-header {
	-webkit-transition: 0.5s; /*사파리 & 크롬*/
	-moz-transition: 0.5s; /*파이어폭스*/
	-ms-transition: 0.5s; /*인터넷 익스플로러*/
	-o-transition: 0.5s; /*오페라*/
	transition: 0.5s;
	width: 100%;
	height: 270px;
	border-radius: 15px 15px 0 0;
	/* background-image: url("/resources/img/visit/old-paper.png"); */
	background-size: 100% 280px;
	background-repeat: no-repeat;
}

.card:hover .card-header {
	opacity: 0.8;
	height: 100px;
}

.card-header-is_closed {
	background-color: #EF5A31;
	color: #FFF;
	font-weight: bold;
	text-align: center;
	float: right;
	margin: 15px 15px 0 0;
	border-radius: 50%;
	font-weight: bold;
	padding: 10px 10px;
	line-height: 20px;
}

h1 {
	color:#404040;
	font-size: 22px;
	font-weight: bold;
}

.card-body {
	padding: 0.15em;
	width: 30em;
}

.card-body-header {
	line-height: 25px;
	margin: 10px 20px 0px 20px;
}

.card-body-description {
	opacity: 0;
	color: #EB5C01;
	line-height: 25px;
	-webkit-transition: .2s ease-in-out; /*사파리&크롬*/
	-moz-transition: .2s ease-in-out; /*파이어폭스*/
	-ms-transition: .2s ease-in-out; /*익스플로러*/
	-o-transition: .2s ease-in-out; /*오페라*/
	transition: .2s ease-in-out;
	overflow: hidden;
	height: 180px;
	margin: 5px 20px;
}

.card:hover .card-body-description {
	opacity: 1;
	-webkit-transition: .5s ease-in-out;
	-moz-transition: .5s ease-in-out;
	-ms-transition: .5s ease-in-out;
	-o-transition: .5s ease-in-out;
	transition: .5s ease-in-out;
	overflow: scroll;
}

.card-body-hashtag {
	color: #2478FF;
	font-style: italic;
}

.card-body-footer {
	position: absolute;
	margin-top: 15px;
	margin-bottom: 6px;
	bottom: 0;
	width: 420px;
	font-size: 14px;
	color: #9FA5A8;
	padding: 0 15px;
}

.icon {
	display: inline-block;
	vertical-align: middle;
	margin-right: 2px;
}

.icon-view_count {
	width: 25px;
	height: 17px;
	background: url("images/eye.jpg") no-repeat;
}

.icon-comments_count {
	margin-left: 5px;
	width: 25px;
	height: 17px;
	background: url("images/comment.jpg") no-repeat;
}

.reg_date {
	float: right;
}
</style>

</head>

<body>
//변경
	<div class="container-fluid col-md-12">
		<section class="sideBar col-md-4">
			<b>독립유공자 공훈록</b>
			<hr>
			<a href="#"><b>별들의 발자취</b></a>
			<hr>
			<a href="visitList.do"><b>별 보러 가자</b></a>
			<hr>
		</section>
		<section class="contents col-md-8">
			<c:forEach items="${hList }" var="hList">
			<div class="card" data-no="${hList.siteNo }">
				<!-- 카드 헤더 -->
				<div class="card-header"  onClick="location.href='visitWriteView.do?siteName=${hList.siteName}'+'&siteType=${hList.siteType }'" onmouseover="setCursor(this,'pointer')" style="background-image: url('/resources/hupLoadFile/${hList.renameFilename }')">
					<div class="card-header-is_closed">
						<div class="card-header-text">방문</div>
						<div class="card-header-number">인증하기</div>
					</div>
				</div>
				<!--  카드 바디 -->
				<div class="card-body">
					<!--  카드 바디 헤더 -->
					<div class="card-body-header">
						<h1>${hList.siteName }</h1>
						<p class="card-body-hashtag">${hList.siteType }</p>
						<p class="card-body-nickname">${hList.siteAddr }</p>
					</div>
					<!--  카드 바디 본문 -->
					<p class="card-body-description">${hList.siteContents }
					</p>
					<!--  카드 바디 푸터 -->
					<div class="card-body-footer">
						<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
					<!-- 	<i class="icon icon-view_count"></i>조회 38회 <i
							class="icon icon-comments_count"></i>댓글 4개 --> 
							<i class="reg_date">작성일 : ${hList.hCreateDate }</i>
					</div>
				</div>
			</div>
			</c:forEach>
		</section>
	</div>
<script>
// 커서 바꿔주는 스크립트
function setCursor(str,str2){
    str.style.cursor = str2;
}
/* ============ 스크롤 ================*/
// 1. 스크롤 이벤트 최초 발생
$(window).scroll(function(){
	var listLength = $(".card").length;
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
//		if (currentScrollTop >= (visibleHeight - windowHeight) ){ //② 현재스크롤의 위치가 화면의 보이는 위치보다 크다면
		if (remainingHeight === 0){ //② 현재스크롤의 위치가 화면의 보이는 위치보다 크다면
			// 3. class가 scrolling인 것의 요소 중 마지막인 요소를 선택한 다음 그것의 data-no속성 값을 받아온다.
			//		즉, 현재 뿌려진 게시글의 마지막 bno값을 읽어오는 것이다.( 이 다음의 게시글들을 가져오기 위해 필요한 데이터이다.)
			var lastNo = $(".card:last").attr("data-no");
			//alert(lastNo);
			console.log(lastNo);
			// 4. ajax를 이용하여 현재 뿌려진 게시글의 마지막 no를 서버로 보내어 그 다음 20개의 게시물 데이터를 받아온다. 
			
			$.ajax({
				url : "historyScroll.do",// 요청할 서버의 url
				type : "GET",	// 요청 method 방식 
				data : { // 서버로 보낼 데이터 명시 
					"historyNo" : lastNo
				},
				dataType : "json",
				success : function(data){// ajax 가 성공했을시에 수행될 function이다. 이 function의 파라미터는 서버로 부터 return받은 데이터이다.
					var str = "";
					// 5. 받아온 데이터가 ""이거나 null이 아닌 경우에 DOM handling을 해준다.
					if(data.length === 0){// 6. 만약 서버로 부터 받아온 데이터가 없으면 그냥 아무것도 하지말까..??
						alert("더 불러올 데이터가 없습니다.");
						/* location.reload(); */
					}//if : data != ""
					else{//6. 서버로부터 받아온 data가 list이므로 이 각각의 원소에 접근하려면 each문을 사용한다. 
						console.log(JSON.stringify(data));
						
						$.each(data, function (index, item){
						// 7. 새로운 데이터를 갖고 html코드형태의 문자열을 만들어준다.
						
								str += 		"<div class='card' data-no='"+item.siteNo+"'>" 
								str += 			"<div class='card-header' style='background-image: url(\"/resources/hupLoadFile/"+item.renameFilename+"')>" 
								str += 				"<div class='card-header-is_closed'>"  
								str += 				 "<div class='card-header-text'>방문</div>"
								str += 				 "<div class='card-header-number'>인증하기</div></div></div>"
								str += 					"<div class='card-body'><div class='card-body-header'><h1>"+item.siteName+"</h1>"
								str +=						"<p class='card-body-hashtag'>"+item.siteType+"</p>"
								str +=						"<p class='card-body-nickname'>"+item.siteAddr+"</p></div>"
								str +=						 "<p class='card-body-description'>"+item.siteContents+"</p>"
								str += 							"<div class='card-body-footer'>"
								str += 							"<hr style='margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31'>"
								str +=								"<i class='reg_date'>작성일 : "+item.hCreateDate+"</i>"  
								str += 								"</div></div></div>";
								
								// 8. 이전까지 뿌려졌던 데이터를 비워주고, <th>헤더 바로 밑에 위에서 만든 str을  뿌려준다.
								// $(".grid").empty();// 셀렉터 태그 안의 모든 텍스트를 지운다.
								//location.reload();
							});
						$(".card:last").after(str);
						}; // else
					} //success 시 function
				});// ajax
			// 여기서 class가 listToChange인 것중 가장 처음인 것을 찾아서 그 위치로 이동하자.
			var position = $(".grid__item").offset();// 위치 값
			// 이동  위로 부터 position.top px 위치로 스크롤 하는 것이다. 그걸 500ms 동안 애니메이션이 이루어짐.

        };//if : 현재 스크롤의 top 좌표가  > (게시글을 불러온 화면 height - 윈도우창의 height) 되는 순간
		
		// lastScrollTop을 현재 currentScrollTop으로 갱신해준다.
		};// 다운스크롤인 상태
});	


</script>
</body>
</html>



