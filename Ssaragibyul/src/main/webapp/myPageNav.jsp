<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/mypage/myPageNav.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script>
		$(document).ready(function(){ 
            /*menu v1*/ 
            $(".menu-v1").mouseover(function(){ 
            	$(this).children(".submenu").stop().slideDown();
            }); 
            $(".menu-v1").mouseleave(function(){ 
            	$(this).children(".submenu").stop().slideUp(); 
           	}); 
            
			$('.submenu').click(function () {
	            $(this).toggleClass("active"); //addCss("active");
	        });
		});
		
		</script>
</head>
<body>
 	<c:if test="${!empty sessionScope.loginUser}">
     <div id="profile">
         <div id="img-pf"> 
             <img src="/resources/img/mypage/profile.png" id="userImg">
         </div>
         <div id="top-pf">
             <span id="name">${loginUser.userName }</span>
             <span id="nim">님</span>
         </div>
         <div id="bottom-pf">
             <span id="welcome">환영합니다.</span>
         </div>
     </div>
     <div id="rest-point">
         <span id="point">잔여포인트 : </span>
         <span id="point-num">100,000원</span>
     </div>
     </c:if>
     <div id="logout">
         <input type="button" value="로그아웃" id="logout-btn" onclick="location.href='logout.do';">
     </div>
     <div class="nav">
         <!--세로형 1--> 
         <ul id="nav-v1"> 
             <li class="menu-v1"><a href="pwConfirm.do">내 정보 수정</a>         
             </li> 
             <li class="menu-v1"><a href="myFunding.do">참여한 프로젝트  ▾</a> 
                 <ul class="submenu"> 
                     <li><a href="myFunding.do">펀딩</a></li> 
                     <li><a href="myDonation.do">기부</a></li> 
                 </ul> 
             </li> 
             <li class="menu-v1"><a href="proposeFunding.do">제안한 프로젝트  ▾</a> 
                 <ul class="submenu"> 
                     <li><a href="proposeFunding.do">펀딩</a></li> 
                     <li><a href="proposeDonaion.do">기부</a></li> 
                 </ul> 
             </li> 
             <li class="menu-v1"><a href="likeFunding.do">관심 프로젝트  ▾</a> 
                 <ul class="submenu"> 
                     <li><a href="likeFunding.do">펀딩</a></li> 
                     <li><a href="likeDonation.do">기부</a></li>
                 </ul> 
             </li>
             <li class="menu-v1"><a href="myPostList.do">내가 쓴 게시물 / 댓글   ▾</a> 
                 <ul class="submenu"> 
                     <li><a href="myPostList.do">게시물</a></li> 
                     <li><a href="myCommentList.do">댓글</a></li>
                 </ul> 
             </li> 
         </ul> 
         <div class="clear"></div> 
     </div>
</body>
</html>