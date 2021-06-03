<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>싸라기별</title>
	<link rel="stylesheet" href="resources/css/point/pointChart.css" type="text/css"/>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(barChart);
      google.charts.setOnLoadCallback(drawChartUsed);
      google.charts.setOnLoadCallback(drawChartEarn);

      function drawChartUsed() {
      	var fundComplete = ${pointForChart.fundTotal*-1 - pointForChart.fundReserved*-1};
        var donationComplete = ${pointForChart.donationTotal*-1 - pointForChart.donationReserved*-1};
        var fundReserved = ${pointForChart.fundReserved*-1};
        var donationReserved = ${pointForChart.donationReserved*-1};
        var givePresent = ${pointForChart.givePresentTotal*-1};
        var data = google.visualization.arrayToDataTable([

          ['구분', '사용 포인트'],
          ['펀딩 완료',     fundComplete],
          ['펀딩 예약',      fundReserved],
          ['기부 완료',  donationComplete],
          ['기부 예약', donationReserved],
          ['선물함',    givePresent]
        ]);

        var options = {
	   		width: 500,
         	height: 300,
          	title: '사용 포인트',
          	pieHole: 0.4
        };

        var chart = new google.visualization.PieChart(document.getElementById('chartUsed'));
        chart.draw(data, options);
      }
      
      function drawChartEarn() {
		  var charge = ${pointForChart.chargeTotal};
		  var visit = ${pointForChart.visitTotal};
		  var takePresent = ${pointForChart.takePresentTotal};
          var data = google.visualization.arrayToDataTable([

        	  ['구분', '사용 포인트'],
              ['충전',     charge],
              ['별 보러 가자',      visit],
              ['선물 받음',  takePresent]
          ]);

          var options = {
       		width: 500,
       		height: 300,
            title: '증가한 포인트',
            pieHole: 0.4
          };

          var chart = new google.visualization.PieChart(document.getElementById('chartEarn'));
          chart.draw(data, options);
        }
      
      function barChart() {
    	  var possiblePoint = ${(pointForChart.fundTotal + pointForChart.donationTotal + pointForChart.visitTotal
    		  					+ pointForChart.takePresentTotal + pointForChart.givePresentTotal + pointForChart.chargeTotal)};
    	  var reservedPoint = ${(pointForChart.fundReserved + pointForChart.donationReserved)*-1};
    	  var data = google.visualization.arrayToDataTable([
    	        ['구분', '예약 중인 포인트', '사용 가능한 포인트', { role: 'annotation' } ],
    	           ['나의 포인트', reservedPoint, possiblePoint, '']
    	      ]);

   	      var options = {
   	        width: 900,
   	        height: 95,
   	        legend: { position: 'top', maxLines: 3 },
   	        bar: { groupWidth: '55%' },
   	        colors: ["#FFB888", "#FE6401"],
   	        isStacked: true
   	      };
	   	   var chart = new google.visualization.BarChart(document.getElementById('barChart'));
	       chart.draw(data, options);
      }
    </script>
</head>
<body>
<%-- <jsp:include page="../../../header.jsp"/>
		<section class="blank"></section>
			<section class="wrapper-left sideBar col-md-3" id="menubar">				
				<a href="pointList.do">전체 포인트 내역</a><hr size="10px">
				<span id="showSubMenu"> + </span>
				<div id="subMenu">
					<a href="pointSearch.do?searchCondition=0" class="sub">충전 내역</a><br><br>
					<a href="pointSearch.do?searchCondition=1" class="sub">펀딩 내역</a><br><br>
					<a href="pointSearch.do?searchCondition=2" class="sub">기부 내역</a><br><br>
					<a href="pointSearch.do?searchCondition=3" class="sub">별 보러 가자</a><br><br>
					<a href="pointSearch.do?searchCondition=4" class="sub">선물 내역</a><br><br>
					<a href="#" id="nav-chart" onclick="chartModal('pointChart.do'); return false;">차트 보기</a>
				</div>	
			</section> --%>
			
	<section id="chart-area">
		<h3>포인트 사용내역</h3>
		<br><br>
		<div class="barChart" id="barChart"></div>
		<br><br>
		<div class="donutChart" id="chartUsed"></div>
		<div class="donutChart" id="chartEarn"></div>
	</section>
	
<%-- 		<jsp:include page="../../../footer.jsp"/> --%>
</body>
</html>