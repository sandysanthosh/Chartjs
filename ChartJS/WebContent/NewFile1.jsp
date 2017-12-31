<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.js"></script>
  </head>
<body>

<script>
.chartWrapper {
	  position: relative;
	}

	.chartWrapper > canvas {
	  position: absolute;
	  left: 0;
	  top: 0;
	  pointer-events: none;
	}

	.chartAreaWrapper {
	  width: 600px;
	  overflow-x: scroll;
	}
function generateLabels() {
	  var chartLabels = [];
	  for (x = 0; x < 100; x++) {
	    chartLabels.push("Label" + x);
	  }
	  return chartLabels;
	}

	function generateData() {
	  var chartData = [];
	  for (x = 0; x < 100; x++) {
	    chartData.push(Math.floor((Math.random() * 100) + 1));
	  }
	  return chartData;
	}

	var chartData = {
	  labels: generateLabels(),
	  datasets: [{
	    label: "Test Data Set",
	    data: generateData()
	  }]
	};

	$(function() {
	  var canvasFuelSpend = $('#chart-FuelSpend');
	  var chartFuelSpend = new Chart(canvasFuelSpend, {
	    type: 'bar',
	    data: chartData,
	    maintainAspectRatio: false,
	    responsive: true,
	    options: {
	      tooltips: {
	        titleFontSize: 0,
	        titleMarginBottom: 0,
	        bodyFontSize: 12
	      },
	      legend: {
	        display: false
	      },
	      scales: {
	        xAxes: [{
	          ticks: {
	            fontSize: 12,
	            display: false
	          }
	        }],
	        yAxes: [{
	          ticks: {
	            fontSize: 12,
	            beginAtZero: true
	          }
	        }]
	      },
	      animation: {
	        onComplete: function() {
	          var sourceCanvas = chartFuelSpend.chart.canvas;
	          var copyWidth = chartFuelSpend.scales['y-axis-0'].width - 10;
	          var copyHeight = chartFuelSpend.scales['y-axis-0'].height + chartFuelSpend.scales['y-axis-0'].top + 10;
	          var targetCtx = document.getElementById("axis-FuelSpend").getContext("2d");
	          targetCtx.canvas.width = copyWidth;
	          targetCtx.drawImage(sourceCanvas, 0, 0, copyWidth, copyHeight, 0, 0, copyWidth, copyHeight);
	        }
	      }
	    }
	  });
	});
</script>
<div class="chartWrapper">
  <div class="chartAreaWrapper">
    <canvas id="chart-FuelSpend" height="300" width="1200"></canvas>
  </div>
  <canvas id="axis-FuelSpend" height="300" width="0"></canvas>
</div>

</body>
</html>