<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>메인</title>
<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700,900|Oswald:400,700" rel="stylesheet">
<!-- <link rel="stylesheet" href="/resources/fonts/icomoon/style.css"> -->
<!-- <link rel="stylesheet" href="/resources/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="/resources/css/style_intro.css"> -->
<!-- <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" /> -->

</head>
<style>
	@font-face {
	    font-family: 'independence';
	    src: url('../resources/fonts/independence.ttf') format('truetype');
	    unicode-range: U+AC00-D7A3;
	}
	
	.introduce-container {
		background-color: gray;
		width: 100%;
		height: 1850px;
		padding: 500px 0 0 56%;
		margin: 0px;
		left: 0px;
		position:relative;
		top: -300px;
		z-index: 99999;
		font-family: 'independence', 'Oswald';
	}
	
	@media (min-width: 1200px)
	.introduce-container {
    	max-width: 100%;
	}
	
	#muteYouTubeVideoPlayer {
		width: 1920px;
	}
	.video-background {
		background: #000;
		top: 0;
		right: 0;
		bottom: 0;
		left: 0;
		z-index: -99;
	}
	
	.video-foreground, .video-background iframe {
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		pointer-events: none;
	}

	@media ( min-aspect-ratio : 16/9) {
		.video-foreground {
			height: 300%;
			top: -100%;
		}
	}
	
	@media ( max-aspect-ratio : 16/9) {
		.video-foreground {
			width: 300%;
			left: -100%;
		}
	}
</style>
<!-- 화면전환 -->
<script>
 	$(document).ready(function() {
		document.getElementById('left-nav').style.left = '-300px';
	})
	document.addEventListener('scroll', function(){
		var currentScrollValue = document.documentElement.scrollTop;
		if(currentScrollValue < 950) {
			document.getElementById('left-nav').style.left='-300px';
		}else {
 			document.getElementById('left-nav').style.left = '0px';
 			document.getElementById('left-nav').style.transition = '2s ease';
		}
	})
	
	document.addEventListener('scroll', function(){
		var currentScrollValue = document.documentElement.scrollTop;
		document.getElementById('introduce-text').style.visibilty='none';
		if(currentScrollValue < 30) {
			document.getElementById('introduce-text').style.visibilty='none';
			document.getElementById('introduce-text').style.top='800px';
		}else {
			document.getElementById('introduce-text').style.visibilty='visible';
 			document.getElementById('introduce-text').style.top='80px';
 			document.getElementById('introduce-text').style.transition = '3s';
		}
	})
</script>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<!-- 영상 -->
			<div class="video-background">
				<div id="muteYouTubeVideoPlayer"></div>
			</div>
			<!-- 문구 -->
			<div class="col-md-8" id="introduce-text">
				<h2 class="heading text-uppercase text-white">Remeber</h2>
				<h5 class="heading text-uppercase text-white">현재 우리가 있을 수 있게
					해주신 분들을 기억하고,</h5>
				<br>
				<h2 class="heading text-uppercase text-white">Repay</h2>
				<h5 class="heading text-uppercase text-white">우리의 위치에서 그 분들을 위해
					할 수 있는 것을 실행함으로써,</h5>
				<br>
				<h2 class="heading text-uppercase text-white">Reunion</h2>
				<h5 class="heading text-uppercase text-white">다시 하나가 되어 어려움을
					극복하고자 합니다.</h5>
			</div>
		</div>
	</div>
<script async src="https://www.youtube.com/iframe_api"></script>
<!-- 영상 -->
	<script type="text/javascript">
		var player;
		
		function onYouTubePlayerAPIReady(){
			player = new YT.Player('muteYouTubeVideoPlayer', { /* json형태로 설정값 적어줌 */
				videoId : 'k3UevKvP9RU',
				playerVars : {
					autoplay : 1, 		// Auto-play the video on load
					controls : 0, 		// Show pause/play buttons in player
					rel : 0,
					start : 15,
					/* end : 60, */
					showinfo : 0,
					showinfo : 0, 		// Hide the video title
					modestbranding : 1, // Hide the Youtube Logo
					loop : 1, 			// Run the video in a loop
					playlist : '',
					fs : 0, 			// Hide the full screen button
					cc_load_policy : 0, // Hide closed captions
					iv_load_policy : 3, // Hide the Video Annotations
					autohide : 1		// Hide video controls when playing
				},
				events:{
					onReady:function(e){
						e.target.mute();
					}
				}
			});
		}
	</script>
</body>
</html>