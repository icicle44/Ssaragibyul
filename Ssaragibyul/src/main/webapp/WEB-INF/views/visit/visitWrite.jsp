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
<textarea name="content" id="editor"></textarea>




<script>
// 3. CKEditor5를 생성할 textarea 지정
ClassicEditor
    .create( document.querySelector( '#editor' ) )
    .catch( error => {
        console.error( error );
    } );
</script>
	<%@include file="/footer.jsp" %>   
</body>
</html>