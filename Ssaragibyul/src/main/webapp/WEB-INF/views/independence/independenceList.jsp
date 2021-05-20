<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>독립유공자 공훈록</title>
<%@include file="/header.jsp" %>
<link rel="stylesheet" href="/resources/css/independence/style_independence.css">
<style type="text/css">
.sideBar{
	float:left;
	padding-top:200px;
}
.contents{
	float:right;
}
</style>
</head>
<body>
<div class="container-fluid col-md-12" >
	<section class="sideBar col-md-3">
		독립유공자 공훈록<hr>
		별들의 발자취<hr>
		별 보러 가자<hr>
		
	</section>

	<section class="contents col-md-9">
		<div class="intro">[독립유공자 공적조서]는</div>
		<div class="search">
		검색창
		</div>
		<div class="table-users">
			<!--    <div class="header">Users</div> -->

			<table class="table" cellspacing="0">
				<tr>
					<th>순번</th>
					<th>성명</th>
					<th>한자명</th>
					<th>생물년</th>
					<th>운동계열</th>
					<th>포상년도</th>
					<th>포상훈격</th>
					<th>생존여부</th>
					<th>본적</th>
				</tr>

				<tr>
					<td>1</td>
					<td>Jane Doe</td>
					<td>jane.doe@foo.com</td>
					<td>01 800 2000</td>
					<td>Lorem</td>
					<td>Lorem</td>
					<td>Lorem</td>
					<td>Lorem</td>
					<td>Lorem</td>
				</tr>

				<tr>
					<td><img src="https://i.picsum.photos/id/1027/100/100.jpg"
						alt="" /></td>
					<td>John Doe</td>
					<td>john.doe@foo.com</td>
					<td>01 800 2000</td>
					<td>Blanditiis</td>
					<td>Lorem</td>
					<td>Lorem</td>
					<td>Lorem</td>
					<td>Lorem</td>
				</tr>

				<tr>
					<td><img src="https://i.picsum.photos/id/64/100/100.jpg"
						alt="" /></td>
					<td>Jane Smith</td>
					<td>jane.smith@foo.com</td>
					<td>01 800 2000</td>
					<td>Culpa</td>
					<td>Lorem</td>
					<td>Lorem</td>
					<td>Lorem</td>
					<td>Lorem</td>
				</tr>

				<tr>
					<td><img src="https://i.picsum.photos/id/1025/100/100.jpg"
						alt="" /></td>
					<td>John Smith</td>
					<td>john.smith@foo.com</td>
					<td>01 800 2000</td>
					<td>Aut .</td>
					<td>Lorem</td>
					<td>Lorem</td>
					<td>Lorem</td>
					<td>Lorem</td>
				</tr>
			</table>
		</div>
	</section>
</div>
</body>
</html>