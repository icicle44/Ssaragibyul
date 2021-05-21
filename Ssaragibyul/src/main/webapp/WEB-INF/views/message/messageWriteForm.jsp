<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/message/messageWriteView.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<title>싸라기별</title>
</head>
<body>
	<main id="main">
			<!-- msgType, 게시글 작성자 ID, 닉네임, 관리자 ID 넘겨받아서 if문으로 폼변경해주고, DB에 갈때도 넘기기 -->
		<section id="total">
			<section class="write-upper">
				<div id="title-area">
					<span id="table-title">쪽지 보내기</span>
				</div>
			</section>
			<section class="write-middle">
				<div id="point-present">
					<div id="show-present">포인트 선물하기</div>
					<div id="present-window">
						<img src="" width="">
						<span>선물할 포인트</span>&nbsp;&nbsp;&nbsp;
						<input id="point-num" type="number" name="presentPoint" min="0" max="" placeholder="">
						<br><span>선물 가능 포인트 </span>
					</div>
				</div>
			</section>
			<section class="write-lower">
				<div id="message-Write-Form">
					<table border="1" align="center" width="490px">
							<tr>
								<th>받으시는 분</th>
								<td><!-- 관리자/닉네임 --></td>
							</tr>
							<tr>
								<th>제목</th>
								<td><input type="text" id="" name="msgTitle"></td>
							</tr>
							<tr>
								<th>내용</th>
								<td></td>
							</tr>
							<tr><td colspan="2"><hr></tr>
							<tr>
								<td colspan="2" align="center">
									<textarea id="message-content" name="msgContents" cols="60" rows="10" placeholder="내용을 입력해주세요"></textarea>
								</td>
							</tr>
							<tr><td colspan="2"><hr></tr>
							<tr>
								<td colspan="2" align="right">
									<input type="button" value="보내기" id="sendClose">
									&nbsp;&nbsp;&nbsp;<input type="button" value="창닫기" onclick="self.close();">
								</td>
							</tr>
	<!-- 						<input type="hidden" name="senderId" value="">
							<input type="hidden" name="receiverId" value="">
							<input type="hidden" name="msgType" value=""> -->
					</table>
				</div>
			</section>
		</section>	
	</main>
	
	<script>
		$(function() {
			/* 포인트 선물하기 창 노출 */
			$("#show-present").on("click", function() {
				if($("#present-window").css("display") == "none"){
					$("#present-window").show();
					$("#show-present").css("color", "#EB5C01");
				}else {
					$("#present-window").hide();
					$("#show-present").css("color", "#464646");					
				}
			});
			/*$("#sendClose").on("click", function(){
				var senderId = ${loginUser.userId};
				var receiverId = ${receiverId}; 넘어온 멤버/관리자의 아이디로
				var msgType = ${msgType};
				
				$.ajax({
					url: "",
					type: "",
					data: {"":""},
					success: function(data){
						
					},
					error: function(){
						
					}
				});
			}); */
		});
	</script>
</body>
</html>