<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>제안</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700,900|Oswald:400,700" rel="stylesheet">
<link rel="stylesheet" href="/resources/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="/resources/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/css/jquery-ui.css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/css/aos.css">
<link rel="stylesheet" href="/resources/css/fancybox.min.css">
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />

</head>

<style>
.main-content{
	font-family: 'Noto Serif KR', serif;
}
	
.back1{
	padding-left:25%;
}

.back2{
	padding-left:25%;
}
	
.guide{
	background-color: #FCFAF3;
	height: 600px;
	text-align:center;
	margin: 50px 0px;
}	

	#guide-title{
		font-weight: bold;
		font-size: 20px;
		color: #EB5C01;
	}
	
	.guide1-1{
		height: auto;
		width: 20%;
		float: left;
		margin-left: 150px;
		margin-top: 40px;
	}
	
	.guide1-2{
		height: auto;
		width: 20%;
		margin-left:170px;
		margin-top:10px;
		float: left;
	}
	
	.guide1-3{
		height: auto;
		width: 20%;
		float: right;
		margin-right: 150px;
		margin-top: 30px;
	}
	
	#reward{
		width: 80px;
		height: 80px;
	}
	#progress{
		width: 100px;
		height: 100px;
	}
	#upload{
		width: 70px;
		height: 70px;
	}
	
.funding{
	background-image:url("/resources/img/dantion_funding/background.png");
	background-size:cover;
	height: 400px;
	text-align:center;
	margin: 50px 0px;
}	

.donation{
	background-image:url("/resources/img/dantion_funding/background2.png");
	background-size:cover;
	height: 400px;
	text-align:center;
	margin: 50px 0px;
}	

.suggestBtn{
	float: left;
	background: #EB5C01;
	text-align:center;
	padding: 10px 90px;
	margin-left:500px;
	margin-top:30px;
	border-radius: 4px;
	color: #fff;
	border: none;
}

.suggestBtn:hover{
	background-color: #E35901;
	border:none;
	outline: none;
}

.suggestBtn:active{
	background-color: #D75909;
	border:none;
	outline: none;
}

.bottom-guide{
	
	height: 300px;
	text-align:center;
	margin: 50px 0px;
}



.suggestBtn2-1{
	float: left;
	background: #EB5C01;
	text-align:center;
	padding: 10px 40px;
	margin-left:630px;
	margin-top:30px;
	border-radius: 4px;
	color: #fff;
	border: none;
}

.suggestBtn2-1:hover{
	background-color: #E35901;
	border:none;
	outline: none;
}

.suggestBtn2-1:active{
	background-color: #D75909;
	border:none;
	outline: none;
}

.suggestBtn2-2{
	background: #EB5C01;
	text-align:center;
	padding: 10px 40px;
	margin-left:-550px;
	margin-top:30px;
	border-radius: 4px;
	color: #fff;
	border: none;
}

.suggestBtn2-2:hover{
	background-color: #E35901;
	border:none;
	outline: none;
}

.suggestBtn2-2:active{
	background-color: #D75909;
	border:none;
	outline: none;
}
</style>


<body data-spy="scroll" data-target=".site-navbar-target" data-offset="200">
	
	<header>
		<%@include file="../../../header.jsp" %>
	</header>

	<main class="main-content">
		<br>
		<div class="top-guide">
			
		</div>
		<div class="funding"><br><br><br><br><br>
			<div class="back1">
				<p id="guide-title">펀딩 프로젝트 만들기</p>
				<span style="color: white;">제품/서비스를 리워드로 제공하여 수익을 얻습니다.</span><br>
				<button class="suggestBtn" onclick="location.href='fundingSuggest.do'">펀딩 제안하기</button>
			</div>
		</div>
		
		<div class="donation"><br><br><br><br><br>
			<div class="back2">
				<p id="guide-title">기부 프로젝트 만들기</p>
				<span>직접 기획한 프로젝트에 기부금을 사용할 수 있습니다.</span><br>
				<button class="suggestBtn" onclick="location.href='donationSuggest.do'">기부 제안하기</button>
			</div>
		</div>
				
			
		
		<div class="guide"><br><br>
			<p id="guide-title"> 싸라기별은 누구나 쉽게 시작할 수 있습니다.</p>
			<span>
			수익을 내서 현금을 돌려주거나 소유권을 나누는 등의 복잡한 과정이 필요하지 않습니다. <br>
			펀딩과 기부로 모은 금액을 통해 제품 또는 특별한 경험 그 자체를 후원자들과 약속하고 공유하면 됩니다.<br><br><br>
			</span>
			
			<div class="guide1-1">
				<img src="/resources/img/dantion_funding/suggest1.png" id="upload"><br><br>
				<span style="font-weight: bold;">1. 프로젝트 올리기</span><br><br>
				<span>
					창작 아이디어 혹은 기부 아이디어를 소개하는 프로젝트 페이지를 작성합니다. <br>
					펀딩의 경우, 후원자들에게 금액대별 특별한 선물들을 약속합니다.<br>
					기부의 경우, 후원자들에게 투명한 기부 내역과 이야기를 약속합니다.
				</span>
			</div>
			
			<div class="guide1-2">
				<img src="/resources/img/dantion_funding/suggest3.png" id="progress"><br><br>
				<span style="font-weight: bold;">2. 프로젝트 진행하기</span><br><br>
				<span>
					정해진 기간 동안 후원자를 모으기 위해 열심히 홍보합니다.<br>
					목표 금액을 달성해야만 후원금이 전달됩니다.<br>
				</span>
			</div>
			
			<div class="guide1-3">
				<img src="/resources/img/dantion_funding/suggest2.png" id="reward"><br><br>
				<span style="font-weight: bold;">3. 프로젝트 진행하기</span><br><br>
				<span>
					펀딩의 경우, 전달받은 후원금으로 창작에 돌입합니다.<br>
					전달하면 프로젝트가 끝납니다.<br>
					기부의 경우, 전달받은 후원금으로 프로젝트를 실행합니다.<br>
					약속한 선물을 전달하면 프로젝트가 끝납니다.<br>
				</span>
			</div>
		</div>
		
		<div class="bottom-guide"><br><br>
			<p id="guide-title">지금 독립 유공자 및 후손들을 위한 프로젝트를 만들어보세요.</p>
			<span>
				직관적인 프로젝트 편집 도구로 곧바로 작성을 시작할 수 있습니다.<br>
				펀딩과 기부를 주선하고 후원을 통해 유공자 및 후손들을 도울 수 있습니다.<br> 
				궁금한 점이 있으면 언제든지 문의를 남겨주세요.
			</span><br>
			<button class="suggestBtn2-1" onclick="location.href='fundingSuggest.do'">펀딩 제안하기</button>
			<button class="suggestBtn2-2" onclick="location.href='donationSuggest.do'">기부 제안하기</button>
		</div>
	</main>
	
	<footer>
		<%@include file="../../../footer.jsp" %>
	</footer>

</body>
</html>