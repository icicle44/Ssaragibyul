<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">
  <!-- Vendor CSS Files
  

  <!-- Template Main CSS File -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/style_nav.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<style>
/* 아코디언 */
article.accordion
{
  position:relative;
  display: block;
  width: 43em;
  margin: 0 auto;
  background-color: #333;
  overflow: auto;
  border-radius: 5px;
  box-shadow: 0 3px 3px rgba(0,0,0,0.3);
}
article.accordion section
{
	z-index:100;
  display: block;
  float: left;
  width: 2em;
  height: 15em;
  margin: 0em 0 0.5em 0.5em;
  color: #333;
/*   overflow: hidden; */
  border-radius: 3px;
}
article.accordion section h2 input
{
  font-size: 1em;
  font-weight: bold;
  width: 12em;
  height: 2em;
  top: 12em;
  left: 0;
  text-indent: 1em;
  padding: 0;
  margin: 0;
  color: #ddd;
  -webkit-transform-origin: 0 0;
  -moz-transform-origin: 0 0;
  -ms-transform-origin: 0 0;
  -o-transform-origin: 0 0;
  transform-origin: 0 0;
  -webkit-transform: rotate(-90deg);
  -moz-transform: rotate(-90deg);
  -ms-transform: rotate(-90deg);
  -o-transform: rotate(-90deg);
  transform: rotate(-90deg);
}
article.accordion section{
}
article.accordion section h2 a input
{
  display: block;
  width: 100%;
  line-height: 1em;
  text-decoration: none;
  color: inherit;
  outline: 0 none;
}article.accordion section:target
{
  width: 30em;
  padding: 0 1em;
  color: #333;
  background-color: #fff;
}

article.accordion section:target h2 input
{
  position: static;
  font-size: 1.3em;
  text-indent: 0;
  color: #333;
  -webkit-transform: rotate(0deg);
  -moz-transform: rotate(0deg);
  -ms-transform: rotate(0deg);
  -o-transform: rotate(0deg);
  transform: rotate(0deg);
  margin-bottom: 10
}
article.accordion section,
article.accordion section h2
{
  -webkit-transition: all 1s ease;
  -moz-transition: all 1s ease;
  -ms-transition: all 1s ease;
  -o-transition: all 1s ease;
  transition: all 1s ease;
}
/* 검색창 */
/*--------------------------------------------------------------
1.0 - BASE SITE STYLES
--------------------------------------------------------------*/
*,*:after,*:before {
  box-sizing:border-box;
  -moz-box-sizing:border-box;
  -webkit-box-sizing:border-box;
}

.cf:before,
.cf:after {
    content:"";
    display:table;
}
.cf:after {
    clear:both;
}


/*--------------------------------------------------------------
2.0 - SEARCH FORM
--------------------------------------------------------------*/
.searchform input, .searchform button, form{
/* 	float: left; */
z-index:5;
}
.searchform input {
	margin-top: 8em;
	background:#fefefe;
	border: none;
	font:12px/12px 'HelveticaNeue', Helvetica, Arial, sans-serif;
	margin-right: 5px;
	padding: 10px;
	width: 216px;
	box-shadow: 0 0 4px rgba(0,0,0,.4) inset, 1px 1px 1px rgba(255,255,255,.75);
	-moz-box-shadow: 0 0 4px rgba(0,0,0,.4) inset, 1px 1px 1px rgba(255,255,255,.75);
	-webkit-box-shadow: 0 0 4px rgba(0,0,0,.4) inset, 1px 1px 1px rgba(255,255,255,.75);
  border-radius: 9px;
  -moz-border-radius: 9px;
  -webkit-border-radius: 9px
}
.searchform input:focus {
	outline: none;
	box-shadow:0 0 4px #0d76be inset;
	-moz-box-shadow:0 0 4px #0d76be inset;
	-webkit-box-shadow:0 0 4px #0d76be inset;
}
.searchform input::-webkit-input-placeholder {
 	font-style: italic;
 	line-height: 15px
}

.searchform input:-moz-placeholder {
  font-style: italic;
 	line-height: 15px
}

.searchform button {
	background: rgb(52,173,236);
	background: -moz-linear-gradient(top, rgba(52,173,236,1) 0%, rgba(38,145,220,1) 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(52,173,236,1)), color-stop(100%,rgba(38,145,220,1)));
	background: -webkit-linear-gradient(top, rgba(52,173,236,1) 0%,rgba(38,145,220,1) 100%);
	background: -o-linear-gradient(top, rgba(52,173,236,1) 0%,rgba(38,145,220,1) 100%);
	background: -ms-linear-gradient(top, rgba(52,173,236,1) 0%,rgba(38,145,220,1) 100%);
	background: linear-gradient(to bottom, rgba(52,173,236,1) 0%,rgba(38,145,220,1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#34adec', endColorstr='#2691dc',GradientType=0 );
	border: none;
	color:#fff;
	cursor: pointer;
	font: 13px/13px 'HelveticaNeue', Helvetica, Arial, sans-serif;
	padding: 10px;
	width:106px;
	box-shadow: 0 0 2px #2692dd inset;
	-moz-box-shadow: 0 0 2px #2692dd inset;
	-webkit-box-shadow: 0 0 2px #2692dd inset;
  border-radius: 9px;
  -moz-border-radius: 9px;
  -webkit-border-radius: 9px;
}
	.searchform button:hover {
		opacity:.9;
	}
</style>
	   
<article class="accordion">

  <section id="acc1">
    <h2><a href="#acc1" onclick="show1()">성명</a></h2>
    <form class="searchform cf" id="form1">
	  <input type="text" placeholder="Is it me you’re looking for?">
	  <button type="submit">Search</button>
	</form>
  </section>
  
  <section id="acc2">
    <h2><a href="#acc2">운동계열</a></h2>
    <form class="searchform cf" id="form2">
	  <input type="text" placeholder="Is it me you’re looking for?">
	  <button type="submit">Search</button>
	</form>
  </section>
  
  <section id="acc3">
    <h2><a href="#acc3">포상연도</a></h2>
    <form class="searchform cf">
	  <input type="text" placeholder="Is it me you’re looking for?">
	  <button type="submit">Search</button>
	</form>
  </section>
  
  <section id="acc4">
    <h2><a href="#acc4">포상훈격</a></h2>
    <form class="searchform cf">
	  <input type="text" placeholder="Is it me you’re looking for?">
	  <button type="submit">Search</button>
	</form>
  </section>
  
  <section id="acc5">
    <h2><a href="#acc5">본적</a></h2>
    <form class="searchform cf">
	  <input type="text" placeholder="Is it me you’re looking for?">
	  <button type="submit">Search</button>
	</form>
  </section>

</article>
<script type="text/javascript">
	function show1({
		$("#form2").hide();
		$("#form1").show();
	})
</script>
  </body>
</html>