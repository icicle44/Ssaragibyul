<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/message/messageWriteForm.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<title>싸라기별</title>
</head>
<body onload="window.resizeTo(530,500)">
	<main id="main">
			<!-- msgType, 게시글 작성자 ID, 닉네임, 관리자 ID 넘겨받아서 if문으로 폼변경해주고, DB에 갈때도 넘기기 -->
		<section id="total">
			<section class="write-upper">
				<div id="title-area">
					<span id="table-title">쪽지 보내기</span>
				</div>
			</section>
			<c:if test="${!(message.msgType==0 || message.msgType==1 || message.msgType==3 || message.receiverId=='admin')}">
				<section class="write-middle">
					<div id="point-present">
						<div id="show-present">포인트 선물하기</div>
						<div id="present-window">
							<img src="" width="">
							<span>선물할 포인트</span>&nbsp;&nbsp;&nbsp;
							<input id="point-num" type="number" name="presentPoint" min="0" max=${myPoint.total } placeholder="숫자만 입력(1000)">
							<br><span>선물 가능 포인트 ${myPoint.total }</span>
						</div>
					</div>
				</section>
			</c:if>
			<section class="write-lower">
				<div id="message-Write-Form">
					<table border="1" align="center" width="490px">
							<tr>
								<th>받으시는 분</th>
								<td>${nickName} 선생 ${message.receiverId }</td>
							</tr>
							<tr>
								<th>제목</th>
								<td><input type="text" id="msgTitle" name="msgTitle" required></td>
							</tr>
							<tr>
								<th>내용</th>
								<td></td>
							</tr>
							<tr><td colspan="2"><hr></tr>
							<tr>
								<td colspan="2" align="center">
									<textarea id="msgContents" name="msgContents" cols="60" rows="10" placeholder="내용을 입력해주세요" required></textarea>
								</td>
							</tr>
							<tr><td colspan="2"><hr></tr>
							<tr>
								<!-- 버튼 -->
								<td colspan="2" align="right">
									<input type="button" value="보내기" id="sendClose">
									&nbsp;&nbsp;&nbsp;<input type="button" value="창닫기" onclick="self.close();">
									<!-- &nbsp;&nbsp;&nbsp;<input type="button" value="공지전송" id="sendCloseNotice"> -->
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
			
			/* 쪽지 보내기 누르면 insert 후 닫기 */
			$("#sendClose").on("click", function(){
				var senderId = '${loginUser.userId}';
				var receiverId = '${message.receiverId}'; /* 넘어온 멤버/관리자의 아이디로 */
				var presentPoint;
				var msgTitle = $("#msgTitle").val();
				var msgContents = $("#msgContents").val();
				var msgType = '${message.msgType}';
				var myPoint = parseInt('${myPoint.total}');
				
				if(msgTitle == "") {
					alert("제목을 입력하세요");
				}else if(msgContents == "") {
					alert("내용을 입력하세요");
				}else if($("#point-num").val() != "") {
					if(parseInt($("#point-num").val()) > myPoint || parseInt($("#point-num").val()) < 0) {
						alert("선물 가능한 포인트를 확인해주세요")
					}else {
						presentPoint = $("#point-num").val();
					}
				}else {
					presentPoint = 0;
				}
				
				if(msgTitle != "" && msgContents != "" && presentPoint >= 0) {
					$.ajax({
						url: "registerMemMsg.do",
						type: "post",
						data: {"senderId":senderId,
								"receiverId":receiverId,
								"msgTitle": msgTitle,
								"msgContents": msgContents,
								"presentPoint": presentPoint,
								"msgType": msgType
								},
						success: function(data){
							if(data == "success") {
								alert("쪽지가 전달되었습니다.");							
								self.close();
								if(senderId != "admin") {
									opener.location.href="sendMsgList.do";								
								} else {
									opener.location.href="adminSendMessageList.do";
								}
							}else {
								alert("죄송합니다. 쪽지 전달을 실패하였습니다.");
							}
						},
						error: function(){
							alert("죄송합니다. 쪽지 전달을 실패하였습니다.");
						}
					});
				}
			});
			
			/* 공지-전체에게 보내기 누르면 insert 후 닫기 */
			$("#sendCloseNotice").on("click", function(){
				var senderId = '${loginUser.userId}';
				var receiverId = ""; /* 넘어온 멤버/관리자의 아이디로 */
				var msgTitle = $("#msgTitle").val();
				var msgContents = $("#msgContents").val();
				var presentPoint = 0;
				var msgType = 0;
				
				$.ajax({
					url: "registerNotiMsg.do",
					type: "post",
					data: {"senderId":senderId,
							"receiverId":receiverId,
							"msgTitle": msgTitle,
							"msgContents": msgContents,
							"presentPoint": presentPoint,
							"msgType": msgType
							},
					success: function(data){
						if(data == "success") {
							alert("공지가 전달되었습니다.");							
							self.close();
							
							opener.location.href="sendMsgList.do";
						}else {
							alert("죄송합니다. 공지 전달을 실패하였습니다.");
						}
					},
					error: function(){
						alert("error");
					}
				});
			});
		});
	</script>
</body>
</html>