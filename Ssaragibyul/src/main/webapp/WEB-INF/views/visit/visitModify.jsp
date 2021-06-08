<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>방문인증글 수정하기</title>

<%@include file="/header.jsp"%>
<style>
body{
	text-align:left;
}
.container{
padding: 5em;
}
.form{
	margin-top: 5em;
}
.input{
	border:none;
	width:400px;
	/* border-right:0px; 
	border-top:0px; 
	boder-left:0px; 
	boder-bottom:0px;" */
}

span{
float:right;
}

/* 이미지 */
.product-title {
    text-align:center;
    display:table;
    width:30em;
    height:30em;
}

.product-img-div {
    display:table-cell;
    vertical-align:middle;
}

.product-img {
    max-width:35em;
    max-height:40em;
}
</style>
</head>
<body>
	<div class="container col-md-12">
		<div class="row">
			<section class="sideBar col-md-6">
				<div class="product-title">
			        <div class="product-img-div">
			            <img class="product-img" id="img" />
			            <img class="product-img" id="pre-img" src="/resources/vUploadFiles/${visit.renameFilename }">
			        </div>
		        </div>
			</section>
			<section class="sideBar col-md-6">
			<form class="form" action="visitUpdate.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="visitNo" value="${visit.visitNo}">
				<input type="hidden" name="originalFilename" value="${visit.originalFilename }">
				<input type="hidden" name="renameFilename" value="${visit.renameFilename }">
				
				<div class="register-header">
					<select name="siteNo">
						<option value="${visit.siteNo }"></option>
					</select>
					<span>방문인증되었습니다.</span>
				</div>
				<hr>
				<div class="register-contents">
					<input type="text" class="input" name="visitTitle" value="${visit.visitTitle }">
					<span>${loginUser.nickName }</span>
					<input type="hidden" name="userId" value="${visit.nickName }" readonly>
					<hr>
					<div id="editor" >
						<p>${visit.visitContents }</p>
					</div>
					<input type="hidden" id="visitContents" name="visitContents">
				</div>
				<hr>
				<div class="register-footer">
					<input type="file" id="input_img" size="50" name="reloadFile">
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
	  
    var sel_file;
    
    $(document).ready(function() {
        $("#input_img").on("change", handleImgFileSelect);
    }); 

    function handleImgFileSelect(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        filesArr.forEach(function(f) {
            if(!f.type.match("image.*")) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }

            sel_file = f;

            var reader = new FileReader();
            reader.onload = function(e) {
            	$("#pre-img").hide();
                $("#img").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }


/*  	$(".button").on("click",function(){
        var contents = $(#contents).html()
        var inLength = $(this).val().length;
        $("#contents").html("작성가능한 글자수 : "+ (150 - inLength));
        ${"visitContents"}.html(contents);
    });  */
     
    	BalloonEditor
		.create( document.querySelector( '#editor' ), {
			// 플러그인 제거
			
		} )
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