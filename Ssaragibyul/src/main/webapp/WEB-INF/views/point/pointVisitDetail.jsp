<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/point/pointVisitDetail.css?ver=1" type="text/css"/>
<title>싸라기별</title>
</head>
<body>
	<main id="main">
		<section id="total">
			<section class="write-upper">
				<div id="title-area">
					<span id="table-title">별 보러 가자</span>
				</div>
			</section>
			<section id="table-around" style="height: 300px;">
				<section class="write-lower">
					<div id="point-visit-form">
						<table align="center">
							<tr>
								<td rowspan="3"><img src="/resources/vUploadFiles/${visit.renameFilename }" width="150px"/></td>
								<td>${visit.visitTitle }</td>	
							</tr>
							<tr>
								<td>조회수 ${visit.visitCount }&nbsp;&nbsp;&nbsp;
								<img src="/resources/img/images/likeHeart.png" width="10px"/> ${visit.likes }</td>
							</tr>
							<tr>
								<td colspan="2"><textarea cols="68" rows="10" readonly onfocus="this.blur();">${visit.visitContents }</textarea></td>
							</tr>
<%-- 							<tr>
								<td colspan="2">조회수 ${visit.visitCount }&nbsp;&nbsp;&nbsp;
								<img src="/resources/img/images/likeHeart.png" width="10px"/> ${visit.likes }</td>
							</tr> --%>
						</table>
					</div>
				</section>
			</section>
		</section>	
	</main>
</body>
</html>