<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/message/messageWriteForm.css" type="text/css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<title>싸라기별</title>
</head>
<body onload="window.resizeTo(530,500)">
	<main id="main">
		<section id="total">
			<section class="write-upper">
				<div id="title-area">
					<span id="table-title">쪽지 보기</span>
				</div>
			</section>
			<c:if test="${!(message.msgType==0 || message.msgType==1 || message.msgType==3)}">
				<section class="write-middle">
					<div id="point-present">
						<c:if test="${message.presentPoint != 0 }">
							<c:if test="${flag=='send' }">
								<div>선물한 포인트 : ${message.presentPoint }</div>
							</c:if>
							<c:if test="${flag=='rec' }">
								<div>선물 받은 포인트 : ${message.presentPoint }</div>
							</c:if>
						</c:if>
					</div>
				</section>
			</c:if>
			<section class="write-lower">
				<div id="message-Write-Form">
					<table border="1" align="center" width="490px">
							<c:if test="${flag=='send' }">
								<tr>
									<th>받으신 분</th>
									<td>${nickName} 선생 ${message.receiverId }</td>
								</tr>
							</c:if>
							<c:if test="${flag=='rec' }">
								<tr>
									<th>보내신 분</th>
									<td>${nickName} 선생 ${message.senderId }</td>
								</tr>
							</c:if>
							<tr>
								<th>제목</th>
								<td>${message.msgTitle }</td>
							</tr>
							<tr>
								<th>내용</th>
								<td></td>
							</tr>
							<tr><td colspan="2"><hr></tr>
							<tr>
								<td colspan="2" align="center">${message.msgContents }</td>
							</tr>
							<tr><td colspan="2"><hr></tr>
							<tr>
								<!-- 버튼 -->
								<td colspan="2" align="right">
									<input type="button" value="삭제하기" id="deleteBtn">
									&nbsp;&nbsp;&nbsp;<input type="button" value="돌아가기" id="backBtn">
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
			/* detail View에서 삭제하기 */
			$("#deleteBtn").on("click", function(){
				var msgNoArr = new Array();
				msgNoArr[0] = ${message.msgNo};
				var url = "";
				if(${flag eq "rec"}) {
					url = "recMsgDelete.do";
				}else if(${flag eq "send"}) {
					url = "sendMsgDelete.do";
				}
				var conf = confirm("정말 삭제하시겠습니까?");
				if(conf == true) {
					$.ajax({
						url: url,
						type: "post",
						data:{"msgNoArr" : msgNoArr},
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
							if(${flag eq "rec"}){
								self.close();
								opener.location.reload("recMsgList.do");								
							}else if(${flag eq "send"}) {
								self.close();
								opener.location.reload("sendMsgList.do");	
							}
						}
					});
				}else {
					self.close();
				}
			});
			
			/* 돌아가기 */
			$("#backBtn").on("click", function(){
				var msgNo = '${message.msgNo }';
				var readYn = '${message.readYn}';
				var readText = "";
				if(readYn == 1) {
					readText = "읽음";
					$(opener.document).find("td[id="+msgNo+"]").text(readText);
				}
				self.close();			
			});
		});
	</script>
</body>
</html>