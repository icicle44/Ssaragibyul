<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/message/messageWriteForm.css?ver=1" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<title>싸라기별</title>
</head>
<c:if test="${!(message.msgType==0 || message.msgType==1 || message.msgType==3 || message.receiverId=='admin')}">
	<body onload="window.resizeTo(532,633)">	
</c:if>
<c:if test="${(message.msgType==0 || message.msgType==1 || message.msgType==3 || message.receiverId=='admin')}">
	<body onload="window.resizeTo(532,536)">
</c:if>
	<main id="main">
			<!-- msgType, 게시글 작성자 ID, 닉네임, 관리자 ID 넘겨받아서 if문으로 폼변경해주고, DB에 갈때도 넘기기 -->
		<section id="total">
			<section class="write-upper">
				<div id="title-area">
					<span id="table-title">쪽지 보내기</span>
				</div>
			</section>
			<section id="table-around">
			<c:if test="${!(message.msgType==0 || message.msgType==1 || message.msgType==3 || message.receiverId=='admin')}">
				<section class="write-middle">
					<div id="point-present">
						<div id="show-present">포인트 선물하기</div>
						<div id="present-window">
							<span>선물할 포인트</span>&nbsp;
							<input type="number" id="point-num" name="presentPoint" min="0" max=${myPoint.total } placeholder="숫자 입력">
							<br><span id="possible-text">선물 가능 포인트 ${myPoint.total }</span>
						</div>
					</div>
				</section>
			</c:if>
			<c:if test="${(message.msgType==0 || message.msgType==1 || message.msgType==3 || message.receiverId=='admin')}">
				<input id="point-num" type="hidden" name="presentPoint" value="0">
			</c:if>
			<section class="write-lower">
				<div id="message-Write-Form">
					<table align="center" width="490px">
						<tr>
							<th class="write-Form-th">받으시는 분</th>
							<td class="write-Form-td">${nickName} 님의 별</td>
						</tr>
						<tr>
							<th class="write-Form-th">제목</th>
							<td class="write-Form-td" width="300px"><input type="text" id="msgTitle" name="msgTitle" placeholder="제목을 입력해주세요." required></td>
						</tr>
						<tr height="15px">
							<th class="write-Form-th" colspan="2" style="border-bottom:hidden;">내&nbsp;&nbsp;&nbsp;용</th>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<textarea id="msgContents" name="msgContents" cols="60" rows="10" placeholder="내용을 입력해주세요." required></textarea>
							</td>
						</tr>
						<tr>
							<!-- 버튼 -->
							<td colspan="2" align="right" class="write-Form-td" style="border-top:hidden;">
								<input type="button" value="보내기" id="sendClose">
								&nbsp;&nbsp;&nbsp;<input type="button" value="창닫기" onclick="self.close();">
								<!-- &nbsp;&nbsp;&nbsp;<input type="button" value="공지전송" id="sendCloseNotice"> -->
							</td>
						</tr>
					</table>
				</div>
			</section>
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
					$("#show-present").css("color", "#327A81");					
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