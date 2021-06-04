<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>방문인증글 작성하기</title>

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
			        </div>
		        </div>
			</section>
			<section class="sideBar col-md-6">
			<form class="form" action="visitRegister.do" method="post" enctype="multipart/form-data">
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
					<span>${loginUser.nickName }</span>
					<input type="hidden" name="userId" value="${loginUser.userId }">
					<hr>
					<div id="editor" >
						<p>입력값</p>
					</div>
					<div id="noti">(0 / 150)</div>	
					<input type="hidden" id="visitContents" name="visitContents">
				</div>
				<hr>
				<div class="register-footer">
					<input type="file" id="input_img" size="50" name="uploadFile">
					<button type="reset" class="button button-danger"onclick="test()">취소</button>
					<button type="submit" onclick="regist()">등록</button>
					<!--  <button type="submit" class="button button-primary">등록</button> -->
				</div>
			</form>
			</section>

		</div>
	</div>
	<script>
    $(document).ready(function() {
    	
    	var sel_file;
        $("#input_img").on("change", handleImgFileSelect);
    }); 
    $("#editor").on("keyup",function(){
        // keypress는 한글입력이 인식 안되고 keyup, keydown은 된다.
        var inLength = $(this).text().length;
        $("#noti").html("작성가능한 글자수 : "+ (150 - inLength));
       
    });
    function test(){
    	console.log($("#editor").html());
    }
	function regist() {
		var editor = document.getElementById('editor');
		console.log(editor.textContent);
		$("#visitContents").val(editor.textContent);
	}
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
                $("#img").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }


/* 	$(".button").on("click",function(){
        var contents = $(#contents).html()
        var inLength = $(this).val().length;
        $("#contents").html("작성가능한 글자수 : "+ (150 - inLength));
        ${"visitContents"}.html(contents);
    }); */
     
    	BalloonEditor
		.create( document.querySelector( '#editor' ), {
			
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