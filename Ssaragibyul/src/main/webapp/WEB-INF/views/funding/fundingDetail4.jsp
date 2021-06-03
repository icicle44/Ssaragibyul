<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>HTML5 Gallery Example</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<!-- Reference to html5gallery.js -->


</head>

<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resources/js/html5gallery.js"></script>

<style type="text/css">
div.guide {margin:12px 24px;}
div.guide span {color:#ff0000; font:italic 14px Arial, Helvetica, sans-serif;}
div.guide p {color:#000000; font:14px Arial, Helvetica, sans-serif;}
div.guide pre {color:#990000;}
div.guide p.title {color:#df501f; font:18px Arial, Helvetica, sans-serif;}
</style>



<body>

<!-- A wrapper DIV to center the Gallery -->
<div style="text-align:center;">

    <!-- Define the Div for Gallery -->
    <!-- 1. Add class html5gallery to the Div -->
    <!-- 2. Define parameters with HTML5 data tags -->
	<div style="display:none;" class="html5gallery" data-skin="gallery" data-width="500" data-height="50">
	    <!-- Add images to Gallery -->
		<a href="resources/images/Tulip_large.jpg"><img src="resources/images/Tulip_small.jpg" alt="Tulips"></a>
		<a href="resources/images/Colourful_Tulip_large.jpg"><img src="resources/images/Colourful_Tulip_small.jpg" alt="Colourful Tulips"></a>
		<a href="resources/images/Swan_large.jpg"><img src="resources/images/Swan_small.jpg" alt="Swan on Lake"></a>
		<a href="resources/images/Red_Tulip_large.jpg"><img src="resources/images/Red_Tulip_small.jpg" alt="Red Tulips"></a>
		<a href="resources/images/Sakura_Tree_large.jpg"><img src="resources/images/Sakura_Tree_small.jpg" alt="Sakura Trees"></a>
		
		<!-- Add videos to Gallery -->
		<!-- Big Buck Bunny Copyright 2008, Blender Foundation http://www.bigbuckbunny.org -->
		<a href="resources/images/Big_Buck_Bunny.mp4" data-webm="resources/images/Big_Buck_Bunny.webm"><img src="resources/images/Big_Buck_Bunny.jpg" alt="Big Buck Bunny, Copyright Blender Foundation"></a>
		
		<!-- Add Youtube video to Gallery -->
		<a href="http://www.youtube.com/embed/YE7VzlLtp-4"><img src="http://img.youtube.com/vi/YE7VzlLtp-4/2.jpg" alt="Youtube Video"></a>
		
		<!-- Add Vimeo video to Gallery -->
		<a href="http://player.vimeo.com/video/1084537?title=0&amp;byline=0&amp;portrait=0"><img src="images/Big_Buck_Bunny.jpg" alt="Vimeo Video"></a>
	
	</div>

</div>


</body>

</html>