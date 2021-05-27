<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Image Grid Effects | Demo 2 | Codrops</title>
	<meta name="description" content="Effect inspiration for opening an image grid item." />
	<meta name="keywords" content="image grid, effect, inspiration, css, javascript, animation, masonry" />
	<meta name="author" content="Codrops" />
	<title>별보러 가자</title>
	<%@include file="/header.jsp" %> 
	<link rel="stylesheet" type="text/css" href="/resources/fonts/visit/font-awesome-4.3.0/css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/visit/normalize.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/visit/demo.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/visit/style_visit.css" />
	<!-- Font -->
	<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700,900|Oswald:400,700" rel="stylesheet">
	
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
</head>
<body>

	<div class="container">
	<div class="container-fluid col-md-12" >
	<section class="sideBar col-md-3">
		<a href="independenceList.do">독립유공자 공훈록</a><hr>
		<a href="#">별들의 발자취</a><hr>
		별 보러 가자<hr>
	</section>

	<section class="contents col-md-9">
<div class="button-container">
  <button class="btn-2" onclick="location.href='visitWriteView.do'">방문 인증하기</button>
</div>
		<div class="content">
			<div class="grid">
					<c:forEach items="${vList }" var="vList">				
				<div class="grid__item" data-size="1280x857">
					<a href="/resources/vUploadFiles/${vList.renameFilename }" class="img-wrap"><img src="/resources/vUploadFiles/${vList.renameFilename }" alt="${vList.originalFilename }" />
						<div class="description description--grid">
							<h3>${vList.visitTitle }</h3><hr>
							<p>${vList.visitContents }<em>&mdash; ${loginUser.nickName }</em></p>
							<div class="details">
								<ul>
									<li><i class="icon icon-camera"></i><span>Canon PowerShot S95</span></li>
									<li><i class="icon icon-focal_length"></i><span>22.5mm</span></li>
									<li><i class="icon icon-aperture"></i><span>&fnof;/5.6</span></li>
									<li><i class="icon icon-exposure_time"></i><span>1/1000</span></li>
									<li><i class="icon icon-iso"></i><span>80</span></li>
								</ul>
							</div>
						</div>
					</a>
				</div>
					</c:forEach>
			</div>


			<!-- /grid -->
			<div class="preview">
				<button class="action action--close"><i class="fa fa-times"></i><span class="text-hidden">Close</span></button>
				<div class="description description--preview"></div>
			</div>
			<!-- /preview -->
		</div>
		<!-- /content -->
		</section>
		
	</div>
	<!-- /container -->

	<%-- <%@include file="/footer.jsp" %> --%>
	<%@include file="/footer.jsp" %>
	<script src="/resources/js/visit/modernizr-custom.js"></script>
	<script src="/resources/js/visit/imagesloaded.pkgd.min.js"></script>
	<script src="/resources/js/visit/masonry.pkgd.min.js"></script>
	<script src="/resources/js/visit/classie.js"></script>
	<script src="/resources/js/visit/main.js"></script>
	<script>

		(function() {
			var support = { transitions: Modernizr.csstransitions },
				// transition end event name
				transEndEventNames = { 'WebkitTransition': 'webkitTransitionEnd', 'MozTransition': 'transitionend', 'OTransition': 'oTransitionEnd', 'msTransition': 'MSTransitionEnd', 'transition': 'transitionend' },
				transEndEventName = transEndEventNames[ Modernizr.prefixed( 'transition' ) ],
				onEndTransition = function( el, callback ) {
					var onEndCallbackFn = function( ev ) {
						if( support.transitions ) {
							if( ev.target != this ) return;
							this.removeEventListener( transEndEventName, onEndCallbackFn );
						}
						if( callback && typeof callback === 'function' ) { callback.call(this); }
					};
					if( support.transitions ) {
						el.addEventListener( transEndEventName, onEndCallbackFn );
					}
					else {
						onEndCallbackFn();
					}
				};

			new GridFx(document.querySelector('.grid'), {
				imgPosition : {
					x : -0.5,
					y : 1
				},
				onOpenItem : function(instance, item) {
					instance.items.forEach(function(el) {
						if(item != el) {
							var delay = Math.floor(Math.random() * 50);
							el.style.WebkitTransition = 'opacity .5s ' + delay + 'ms cubic-bezier(.7,0,.3,1), -webkit-transform .5s ' + delay + 'ms cubic-bezier(.7,0,.3,1)';
							el.style.transition = 'opacity .5s ' + delay + 'ms cubic-bezier(.7,0,.3,1), transform .5s ' + delay + 'ms cubic-bezier(.7,0,.3,1)';
							el.style.WebkitTransform = 'scale3d(0.1,0.1,1)';
							el.style.transform = 'scale3d(0.1,0.1,1)';
							el.style.opacity = 0;
						}
					});
				},
				onCloseItem : function(instance, item) {
					instance.items.forEach(function(el) {
						if(item != el) {
							el.style.WebkitTransition = 'opacity .4s, -webkit-transform .4s';
							el.style.transition = 'opacity .4s, transform .4s';
							el.style.WebkitTransform = 'scale3d(1,1,1)';
							el.style.transform = 'scale3d(1,1,1)';
							el.style.opacity = 1;

							onEndTransition(el, function() {
								el.style.transition = 'none';
								el.style.WebkitTransform = 'none';
							});
						}
					});
				}
			});
		})();
	</script>

</body>

</body>
</html>