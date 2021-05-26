<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>방문인증글 작성하기</title>
	
<%@include file="/header.jsp" %> 
	
</head>
<body>
<br><br><br><br><br><br><br><br><br><br>
<div id="editor">
	<p>This is the editor content.</p>
</div>

<script src="./node_modules/@ckeditor/ckeditor5-build-balloon/build/ckeditor.js"></script>
<script>
	BalloonEditor
		.create( document.querySelector( '#editor' ) )
		.then( editor => {
			window.editor = editor;
		} )
		.catch( error => {
			console.error( 'There was a problem initializing the editor.', error );
		} );
</script>
</script>
	<%@include file="/footer.jsp" %>   
</body>
</html>