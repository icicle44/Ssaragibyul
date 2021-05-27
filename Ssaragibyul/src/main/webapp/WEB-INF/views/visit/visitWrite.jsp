<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>방문인증글 작성하기</title>

<%@include file="/header.jsp"%>
<style>
.container{
padding: 5em;
}
.input{
	border:none;
	/* border-right:0px; 
	border-top:0px; 
	boder-left:0px; 
	boder-bottom:0px;" */
}
span{
float:right;
}

</style>
</head>
<body>
	<div class="container col-md-12">
		<div class="row">
			<section class="sideBar col-md-6">이미지 불러올 자리</section>
			<section class="sideBar col-md-6">
			<form action="visitRegister.do" method="post" enctype="multipart/form-data">
				<div class="register-header">
					<select name="siteNo">
						<option value="none">=== 선택 ===</option>
						<option value="1">공원</option>
						<option value="2">생가</option>
						<option value="3">기념관</option>
					</select>
					<span>방문인증되었습니다.</span>
				</div>
				<hr>
				<div class="register-contents">
					<input type="text" class="input" name="visitTitle" placeholder="제목">
					<input type="text" value="${loginUser.nickName }" readonly>
					<input type="hidden" name="userId" value="${loginUser.userId }">
					<div id="editor" >
						<p>입력값</p>
					</div>
					<input type="hidden" id="visitContents" name="visitContents">
				</div>
				<hr>
				<div class="register-footer">
					<input type="file" size="50" name="uploadFile">
					<button type="reset" class="button button-danger">취소</button>
					<button type="submit" onclick="regist()">등록</button>
					<!--  <button type="submit" class="button button-primary">등록</button> -->
				</div>
			</form>
			</section>

		</div>
	</div>
	<script>
	function regist() {
		var editor = document.getElementById('editor');
		console.log(editor.textContent);
		$("#visitContents").val(editor.textContent);
	}
/* 	$(".button").on("click",function(){
        var contents = $(#contents).html()
        var inLength = $(this).val().length;
        $("#contents").html("작성가능한 글자수 : "+ (150 - inLength));
        ${"visitContents"}.html(contents);
    }); */
     
    	BalloonEditor
		.create( document.querySelector( '#editor' ) )
		.then( editor => {
			window.editor = editor;
		})
		.catch( error => {
			console.error( 'There was a problem initializing the editor.', error );
		});    	
	</script>
	<%@include file="/footer.jsp"%>
</body>
</html>