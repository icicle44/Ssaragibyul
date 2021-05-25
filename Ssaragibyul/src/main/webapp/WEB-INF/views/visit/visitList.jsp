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
	<input type="text" placeholder="검색">
<div class="container">
  <button class="btn-2">Button 2</button>
</div>

				<div class="content">
			<div class="grid">
				<div class="grid__item" data-size="1280x857">
					<a href="/resources/img/visit/original/6.jpg" class="img-wrap"><img src="/resources/img/visit/thumbs/6.jpg" alt="img06" />
						<div class="description description--grid">
							<h3>Mother's Love</h3>
							<p>Every time you drink a glass of milk or eat a piece of cheese, you harm a mother. Please go vegan. <em>&mdash; Gary L. Francione</em></p>
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
				<div class="grid__item" data-size="1280x1280">
					<a href="/resources/img/visit/original/7.jpg" class="img-wrap"><img src="/resources/img/visit/thumbs/7.jpg" alt="img07" />
						<div class="description description--grid">
							<h3>Silent Killer</h3>
							<p>Cows’ milk protein may be the single most significant chemical carcinogen to which humans are exposed. <em>&mdash; T. Colin Campbell</em></p>
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
				<div class="grid__item" data-size="1280x853">
					<a href="/resources/img/visit/original/8.jpg" class="img-wrap"><img src="/resources/img/visit/thumbs/8.jpg" alt="img08" />
						<div class="description description--grid">
							<h3>Senseless Suffering</h3>
							<p>The question is not, 'Can they reason?' nor, 'Can they talk?' but rather, 'Can they suffer?' <em>&mdash; Jeremy Bentham</em></p>
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
				<div class="grid__item" data-size="865x1280">
					<a href="/resources/img/visit/original/9.jpg" class="img-wrap"><img src="/resources/img/visit/thumbs/9.jpg" alt="img09" />
						<div class="description description--grid">
							<h3>Rabbit Intelligence</h3>
							<p>If a rabbit defined intelligence the way man does, then the most intelligent animal would be a rabbit, followed by the animal most willing to obey the commands of a rabbit. <em>&mdash; Robert Brault</em></p>
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
				<div class="grid__item" data-size="1280x1280">
					<a href="/resources/img/visit/original/10.jpg" class="img-wrap"><img src="/resources/img/visit/thumbs/10.jpg" alt="img10" />
						<div class="description description--grid">
							<h3>Friendly Terms</h3>
							<p>Man is the only animal that can remain on friendly terms with the victims he intends to eat until he eats them. <em>&mdash; Samuel Butler</em></p>
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
				<div class="grid__item" data-size="1280x850">
					<a href="/resources/img/visit/original/11.jpg" class="img-wrap"><img src="/resources/img/visit/thumbs/11.jpg" alt="img11" />
						<div class="description description--grid">
							<h3>Murder of Men</h3>
							<p>The time will come when men such as I will look upon the murder of animals as they now look upon the murder of men.<em>&mdash; Leonardo Da Vinci</em></p>
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
				<div class="grid__item" data-size="1280x853">
					<a href="/resources/img/visit/original/1.jpg" class="img-wrap"><img src="/resources/img/visit/thumbs/1.jpg" alt="img01" />
						<div class="description description--grid">
							<h3>Highest Ethics</h3>
							<p>Non-violence leads to the highest ethics, which is the goal of all evolution. Until we stop harming all other living beings, we are still savages <em>&mdash; Thomas Edison</em></p>
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
				<div class="grid__item" data-size="958x1280">
					<a href="/resources/img/visit/original/2.jpg" class="img-wrap"><img src="/resources/img/visit/thumbs/2.jpg" alt="img02" />
						<div class="description description--grid">
							<h3>Pleasure, Amusement &amp; Convenience</h3>
							<p>We do not need to eat animals, wear animals, or use animals for entertainment purposes, and our only defense of these uses is our pleasure, amusement, and convenience.<em>&mdash; Gary L. Francione</em></p>
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
				<div class="grid__item" data-size="837x1280">
					<a href="img/original/3.jpg" class="img-wrap"><img src="/resources/img/visit/thumbs/3.jpg" alt="img03" />
						<div class="description description--grid">
							<h3>Dinner</h3>
							<p>We all love animals. Why do we call some 'pets' and others 'dinner'? <em>&mdash; K.D. Lang</em></p>
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
				<div class="grid__item" data-size="1280x961">
					<a href="img/original/4.jpg" class="img-wrap"><img src="/resources/img/visit/thumbs/4.jpg" alt="img04" />
						<div class="description description--grid">
							<h3>Appetite or Suffering?</h3>
							<p>Could you look an animal in the eyes and say to it, 'My appetite is more important than your suffering'? <em>&mdash; Moby</em></p>
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
				<div class="grid__item" data-size="1280x1131">
					<a href="/resources/img/visit/original/5.jpg" class="img-wrap"><img src="/resources/img/visit/thumbs/5.jpg" alt="img05" />
						<div class="description description--grid">
							<h3>The Corpse</h3>
							<p>Recognize meat for what it really is: the antibiotic- and pesticide-laden corpse of a tortured animal. <em>&mdash; Ingrid Newkirk</em></p>
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
				<div class="grid__item" data-size="1280x857">
					<a href="/resources/img/visit/original/6.jpg" class="img-wrap"><img src="/resources/img/visit/thumbs/6.jpg" alt="img06" />
						<div class="description description--grid">
							<h3>Mother's Love</h3>
							<p>Every time you drink a glass of milk or eat a piece of cheese, you harm a mother. Please go vegan. <em>&mdash; Gary L. Francione</em></p>
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
				<div class="grid__item" data-size="1280x1280">
					<a href="img/original/7.jpg" class="img-wrap"><img src="/resources/img/visit/thumbs/7.jpg" alt="img07" />
						<div class="description description--grid">
							<h3>Silent Killer</h3>
							<p>Cows’ milk protein may be the single most significant chemical carcinogen to which humans are exposed. <em>&mdash; T. Colin Campbell</em></p>
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
				<div class="grid__item" data-size="1280x853">
					<a href="img/original/8.jpg" class="img-wrap"><img src="/resources/img/visit/thumbs/8.jpg" alt="img08" />
						<div class="description description--grid">
							<h3>Senseless Suffering</h3>
							<p>The question is not, 'Can they reason?' nor, 'Can they talk?' but rather, 'Can they suffer?' <em>&mdash; Jeremy Bentham</em></p>
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
				<div class="grid__item" data-size="865x1280">
					<a href="/resources/img/visit/original/9.jpg" class="img-wrap"><img src="/resources/img/visit/thumbs/9.jpg" alt="img09" />
						<div class="description description--grid">
							<h3>Rabbit Intelligence</h3>
							<p>If a rabbit defined intelligence the way man does, then the most intelligent animal would be a rabbit, followed by the animal most willing to obey the commands of a rabbit. <em>&mdash; Robert Brault</em></p>
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
				<div class="grid__item" data-size="1280x1280">
					<a href="/resources/img/visit/original/10.jpg" class="img-wrap"><img src="/resources/img/visit/thumbs/10.jpg" alt="img10" />
						<div class="description description--grid">
							<h3>Friendly Terms</h3>
							<p>Man is the only animal that can remain on friendly terms with the victims he intends to eat until he eats them. <em>&mdash; Samuel Butler</em></p>
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
				<div class="grid__item" data-size="1280x850">
					<a href="img/original/11.jpg" class="img-wrap"><img src="/resources/img/visit/thumbs/11.jpg" alt="img11" />
						<div class="description description--grid">
							<h3>Murder of Men</h3>
							<p>The time will come when men such as I will look upon the murder of animals as they now look upon the murder of men.<em>&mdash; Leonardo Da Vinci</em></p>
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
				<div class="grid__item" data-size="1280x853">
					<a href="/resources/img/visit/original/1.jpg" class="img-wrap"><img src="/resources/img/visit/thumbs/1.jpg" alt="img01" />
						<div class="description description--grid">
							<h3>Highest Ethics</h3>
							<p>Non-violence leads to the highest ethics, which is the goal of all evolution. Until we stop harming all other living beings, we are still savages <em>&mdash; Thomas Edison</em></p>
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
				<div class="grid__item" data-size="958x1280">
					<a href="/resources/img/visit/original/2.jpg" class="img-wrap"><img src="/resources/img/visit/thumbs/2.jpg" alt="img02" />
						<div class="description description--grid">
							<h3>Pleasure, Amusement &amp; Convenience</h3>
							<p>We do not need to eat animals, wear animals, or use animals for entertainment purposes, and our only defense of these uses is our pleasure, amusement, and convenience.<em>&mdash; Gary L. Francione</em></p>
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
				<div class="grid__item" data-size="837x1280">
					<a href="/resources/img/visit/original/3.jpg" class="img-wrap"><img src="/resources/img/visit/thumbs/3.jpg" alt="img03" />
						<div class="description description--grid">
							<h3>Dinner</h3>
							<p>We all love animals. Why do we call some 'pets' and others 'dinner'? <em>&mdash; K.D. Lang</em></p>
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
				<div class="grid__item" data-size="1280x961">
					<a href="/resources/img/visit/original/4.jpg" class="img-wrap"><img src="/resources/img/visit/thumbs/4.jpg" alt="img04" />
						<div class="description description--grid">
							<h3>Appetite or Suffering?</h3>
							<p>Could you look an animal in the eyes and say to it, 'My appetite is more important than your suffering'? <em>&mdash; Moby</em></p>
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
				<div class="grid__item" data-size="1280x1131">
					<a href="/resources/img/visit/original/5.jpg" class="img-wrap"><img src="/resources/img/visit/thumbs/5.jpg" alt="img05" />
						<div class="description description--grid">
							<h3>The Corpse</h3>
							<p>Recognize meat for what it really is: the antibiotic- and pesticide-laden corpse of a tortured animal. <em>&mdash; Ingrid Newkirk</em></p>
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