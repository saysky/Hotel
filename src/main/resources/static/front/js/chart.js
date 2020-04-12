(function($){
"use strict";
	// barchart

	var chart1 = new CanvasJS.Chart("barchart", {
		animationEnabled: true,
		theme: "light2", // "light1", "light2", "dark1", "dark2"
		axisY: {
			title: "Reserves(MMbbl)"
		},
		data: [{        
			type: "column",  
			showInLegend: true, 
			legendMarkerColor: "grey",
			legendText: "MMbbl = one million barrels",
			dataPoints: [      
				{ y: 300878, label: "Venezuela" },
				{ y: 266455,  label: "Saudi" },
				{ y: 169709,  label: "Canada" },
				{ y: 158400,  label: "Iran" },
				{ y: 142503,  label: "Iraq" },
				{ y: 101500, label: "Kuwait" },
				{ y: 97800,  label: "UAE" },
				{ y: 80000,  label: "Russia" }
			]
		}]
	});
	chart1.render();

	// piechart

	var chart4 = new CanvasJS.Chart("piechart", {
		animationEnabled: true,
		data: [{
			type: "pie",
			startAngle: 240,
			yValueFormatString: "##0.00\"%\"",
			indexLabel: "{label} {y}",
			dataPoints: [
				{y: 79.45, label: "Google"},
				{y: 7.31, label: "Bing"},
				{y: 7.06, label: "Baidu"},
				{y: 4.91, label: "Yahoo"},
				{y: 1.26, label: "Others"}
			]
		}]
	});
	chart4.render();

	// Line chart
	var chart2 = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	theme: "light2",
	axisY:{
		includeZero: false
	},
		data: [{        
			type: "line",       
			dataPoints: [
				{ y: 450 },
				{ y: 414},
				{ y: 520, indexLabel: "highest",markerColor: "red", markerType: "triangle" },
				{ y: 460 },
				{ y: 450 },
				{ y: 500 },
				{ y: 480 },
				{ y: 480 },
				{ y: 410 , indexLabel: "lowest",markerColor: "DarkSlateGrey", markerType: "cross" },
				{ y: 500 },
				{ y: 480 },
				{ y: 510 }
			]
		}]
	});
	chart2.render();

	// column chart

	var chart = new CanvasJS.Chart("columchart", {
	animationEnabled: true,
	axisX: {
		interval: 1,
		intervalType: "year"
	},
	axisY:{
		valueFormatString:"$#0bn",
		gridColor: "#B6B1A8",
		tickColor: "#B6B1A8"
	},
	toolTip: {
		shared: true,
		content: toolTipContent
	},
	data: [{
		type: "stackedColumn",
		showInLegend: true,
		color: "#696661",
		name: "Q1",
		dataPoints: [
			{ y: 6.75, x: new Date(2010,0) },
			{ y: 8.57, x: new Date(2011,0) },
			{ y: 10.64, x: new Date(2012,0) },
			{ y: 13.97, x: new Date(2013,0) },
			{ y: 15.42, x: new Date(2014,0) },
			{ y: 17.26, x: new Date(2015,0) },
			{ y: 20.26, x: new Date(2016,0) }
		]
		},
		{        
			type: "stackedColumn",
			showInLegend: true,
			name: "Q2",
			color: "#EDCA93",
			dataPoints: [
				{ y: 6.82, x: new Date(2010,0) },
				{ y: 9.02, x: new Date(2011,0) },
				{ y: 11.80, x: new Date(2012,0) },
				{ y: 14.11, x: new Date(2013,0) },
				{ y: 15.96, x: new Date(2014,0) },
				{ y: 17.73, x: new Date(2015,0) },
				{ y: 21.5, x: new Date(2016,0) }
			]
		},
		{        
			type: "stackedColumn",
			showInLegend: true,
			name: "Q3",
			color: "#695A42",
			dataPoints: [
				{ y: 7.28, x: new Date(2010,0) },
				{ y: 9.72, x: new Date(2011,0) },
				{ y: 13.30, x: new Date(2012,0) },
				{ y: 14.9, x: new Date(2013,0) },
				{ y: 18.10, x: new Date(2014,0) },
				{ y: 18.68, x: new Date(2015,0) },
				{ y: 22.45, x: new Date(2016,0) }
			]
		},
		{        
			type: "stackedColumn",
			showInLegend: true,
			name: "Q4",
			color: "#B6B1A8",
			dataPoints: [
				{ y: 8.44, x: new Date(2010,0) },
				{ y: 10.58, x: new Date(2011,0) },
				{ y: 14.41, x: new Date(2012,0) },
				{ y: 16.86, x: new Date(2013,0) },
				{ y: 10.64, x: new Date(2014,0) },
				{ y: 21.32, x: new Date(2015,0) },
				{ y: 26.06, x: new Date(2016,0) }
			]
	}]
});
chart.render();

})(this.jQuery);