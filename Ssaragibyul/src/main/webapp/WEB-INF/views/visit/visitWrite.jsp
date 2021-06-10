<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
<title>방문인증글 작성하기</title>
<%@include file="/header.jsp"%>
<style>
body {
	text-align: left;
}

.wrapper {
	padding: 5em;
	height: 55em;
	overflow: visible;
}

.form {
	margin-top: 5em;
}

.input {
	border: none;
	width: 400px auto;
	/* border-right:0px; 
	border-top:0px; 
	boder-left:0px; 
	boder-bottom:0px;" */
}

span {
	float: right;
}

/* 이미지 */
.product-title {
	text-align: center;
	display: table;
	width: 10em;
	height: 10em;
}

.product-img-div {
	position: relative;
	display: table-cell;
	vertical-align: middle;
}

.product-img {
	position: absolute;
	max-width: 25em;
	max-height: 30em;
	top: 2em;
	left: -5em;
}

#map {
	position: absolute;
	width: 50em;
	height: 250px;
	display: block;
	top: 35em;
}
</style>
</head>

<body>
	<div class="wrapper col-md-12">
		<div class="row">
			<div class="sideBar col-md-6">
				<div class="product-title">
					<div class="product-img-div">
						<img class="product-img" id="img" />
						<!-- 지도 타일 이미지들을 보여줄 영역 div요소 -->
						<div id="map"></div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<form class="form" action="visitRegister.do" method="post"
					enctype="multipart/form-data">
					<div class="register-header">
						<select id="siteType" name="siteType">
							<option value="none">=== 선택 ===</option>
							<c:forEach items="${hList }" var="hList">
								<option value="${hList.siteType }">${hList.siteType }</option>
							</c:forEach>
						</select> <select id="siteName" name="siteName"
							onchange="getSiteLocation()">


						</select>
						<span>방문인증되었습니다.</span>
					</div>
					<hr>
					<div class="register-contents">
						<input type="text" class="input" name="visitTitle"
							placeholder="제목"> <span>${loginUser.nickName }</span> <input
							type="hidden" name="userId" value="${loginUser.userId }">
						<hr>
						<div id="editor">
							<p>입력값</p>
						</div>
						<div id="noti">(0 / 150)</div>
						<input type="hidden" id="visitContents" name="visitContents">
					</div>
					<hr>
					<div class="register-footer">
						<input type="file" id="input_img" size="50" name="uploadFile">
						<hr>
						<button type="reset" onClick="history.go(-1)">이전페이지</button>
						<button type="submit" onclick="regist()">등록완료</button>
						<hr>
						<button type="button" onclick="showMap()">show map</button>
						<button type="button" onclick="showMarker()">show marker</button>
						<button id="getLocation" type="button">방문인증하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@include file="../../../footer.jsp"%>
	<!-- Google 지도 api 사용 스크립트 추가 -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDOlKn_MoHoMoN2w_vlAxgK_eC3kbWcPN0&callback=initMap"
		async defer></script>

	<script>
    	$(function(){
    		
    	// CKEditor
  		   BalloonEditor
  		      .create( document.querySelector( '#editor' ) )
  		      .then( editor => {
  		         window.editor = editor;
  		      } )
  		      .catch( error => {
  		         console.error( 'There was a problem initializing the editor.', error );
  		      } );
  		   // sitetype 선택
    		$("#siteType").change(function(){
    		var siteType = $("#siteType").val();
    			$.ajax({
					url : "getSiteName.do",// 요청할 서버의 url
					type : "POST",	// 요청 method 방식 
					data : { // 서버로 보낼 데이터 명시 
						"siteType" : siteType
					},
					dataType : "json",
					success : function(data){// ajax 가 성공했을시에 수행될 function이다. 이 function의 파라미터는 서버로 부터 return받은 데이터이다.
						var option = "<option value='none'>=== 선택 ===</option>";
						$("#siteName").html("");
						$("#siteName").append(option);
						$.each(data, function (index, item){
							var siteNames = "<option value='"+item.siteName+"'>'"+item.siteName+"'</option>";
							$("#siteName").append(siteNames);
						});
					}
				});// ajax
    		});

    	})
		/* 업로드이미지 미리보기 */
		var sel_file;
	    $("#input_img").on("change", handleImgFileSelect);
		// 버튼 눌렀을 때
		document.getElementById("getLocation").onclick = function() {
		navigator.geolocation.getCurrentPosition(successCallback,
		errorCallback);
		};
		// 이미지 미리보기
		var sel_file;
	        $("#input_img").on("change", handleImgFileSelect);
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
	  		   // 위치 가져오기
	  		   function getSiteLocation(){
	  			   var siteName = $("#siteName").val();
	  			   var lat = "";
	  			   var lnt = "";
	  			   var location = {};
	  			   // 사적지 위치 가져오기
	  	   			$.ajax({
	  					url : "getSiteLocation.do",// 요청할 서버의 url
	  					type : "POST",	// 요청 method 방식 
	  					data : { // 서버로 보낼 데이터 명시 
	  						"siteName" : siteName
	  					},
	  					async: false, // 안하면 showMap부분에서 다시 호출되어 sync?가 안맞음
	  					dataType : "json",
	  					success : function(data){// ajax 가 성공했을시에 수행될 function이다. 이 function의 파라미터는 서버로 부터 return받은 데이터이다.
		  					location.lat = data[0].latitude; 
		  					location.lnt = data[0].longitude;
	  					}// success
	  				});// ajax
	  				console.log("getSiteLocation result: ", location);
	  				return location;
	  			}

	  	function showMap(){
            //지도가 보여질 요소 찾아오기
            var e= document.getElementById('map');
            let map, infoWindow;
			var latitude = 37.486592;
			var longitude = 126.943232;
            // Goolgle지도 객체 생성 및 e요소 보여주기!!
            new google.maps.Map(e, {center:{lat:37.562161, lng:127.035199}, zoom:14});

        }
        function showMarker(){
            // 지도가 보여질 요소
            var e = document.getElementById('map');
            const location = getSiteLocation();
            
            // 원하는 좌표 객체
            var mrhi = new google.maps.LatLng(location.lat, location.lnt);
 
            // 표시되는 지도의 옵션 객체
            var opts = {
                center: mrhi,
                zoom: 14
            };
 
            // 지도 보이기
            var map = new google.maps.Map( e , opts );
            
            // 내 위치 표시 //
            infoWindow = new google.maps.InfoWindow({
				map : map
			});
			infoWindow.setContent('당신의 위치');

            // 지도에 붙일 마커객체 생성
            var marker= new google.maps.Marker( {
                position: mrhi,
                title:"별들의 발자취" // 마커에 마우스를 놓고 있으면 보이는 tootip(말풍선)
            } );
 
            // 지도 객체에 마커 추가하기
            marker.setMap(map);
 
            // 마커 클릭 이벤트 반응하기
            marker.addListener('click', function(){
                open('https://www.iei.or.kr/main/main.kh', '_blank');
            });

 
        }
        // 내위치 표시 성공/실패시
		function successCallback(position) {
			let pos = {
				lat : position.coords.latitude,
				lng : position.coords.longitude
			};
			infoWindow.setPosition(pos);
			//map.setCenter(pos);
			console.log("Your current position is: latitude(" + pos.lat
					+ "), longitude(" + pos.lng + ")");
			   // 내 위치 정보 보내기
	   			$.ajax({
					url : "calDistance.do",// 요청할 서버의 url
					type : "GET",	// 요청 method 방식 
					data : { // 서버로 보낼 데이터 명시 
						"myLat" : pos.lat,
						"myLnt" : pos.lng
					},
					dataType : "json",
					success : function(data){// ajax 가 성공했을시에 수행될 function이다. 이 function의 파라미터는 서버로 부터 return받은 데이터이다.
  						
					}// success
				});// ajax
		}
		function errorCallback(error) {
			alert("Error: " + error.message);
		}
		document.getElementById("getLocation").onclick = function() {
			navigator.geolocation.getCurrentPosition(successCallback,
					errorCallback);
		};
		function regist() {
			var editor = document.getElementById('editor');
			console.log(editor.textContent);
			$("#visitContents").val(editor.textContent);
		}
    </script>



</body>
</html>
