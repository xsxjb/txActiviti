/**
 * 实时曲线
 * @author lsm(改成内存中获得，改成amcharts)
 */
Ext.require( [ 'Ext.util.History', 'Ext.tab.Panel' ]);
var a = "amcharts-panel1";
Ext.onReady(function() {

var chartStore = [];

	/**
	 *	定义一个选项卡
	 */
	var tabPanel = Ext.create('Ext.form.Panel', {
		//region:'center',
		id : 'tabs',
		frame : false,   
		border:0,
		height : 400,
		//width : 700,
		layout:'border',
		defaults : {
			padding : 0
		},
		renderTo : 'liveCurve',
		items : [ 
			 {    
	            id:'amcharts-panel1',    
	            frame : false,   
				//title:'111',
	            region: "center",   //自己的布局方式 
	            listeners:{    
	               //窗口变化（鼠标拖动会一直触发这个方法，会产生很多事件）    
	                resize : function(grid,row){    
	                    if( chart1 != null ){    
	                        chart1.validateNow(); 
	                    }    
	                }    
	            }    
	        }  
		]
	});
	
	
	/*
	 *	设定定时刷新
	 */
	setInterval(function(){
			getDataByExchanger();
	
	}, 5000);
	
	
	
	/*
	 *	查询实时数据
	 */
	function getDataByExchanger() {

		//使用AJAX查询
		Ext.Ajax.request( {
			method : "post",
			url : 'plcCentralControlAction!getLiveCurve.action',
			params : {	
			  'heatStationId':Ext.getUrlParam('heatStationId'),
			  'heatUnitId':Ext.getUrlParam('heatUnitId'),
			  'javaKey':Ext.getUrlParam('columnName'),
			  'userId':Ext.getUrlParam('userId')
			},
			success : function(result, request) {
				//成功
				//chartStore.loadData(Ext.decode(result.responseText));
				var data = Ext.decode(result.responseText);
				for ( var i = 0; i < data.length; i++) {
					var s = {
						'oldValue' : data[i].oldValue,
						'eventTime' : data[i].eventTime,
						'infoName' : data[i].infoName,
						'infoData' : data[i].infoData
						};
					chartStore.push(s);
				}
				if(chartStore.length>50){
				  chartStore.shift();
				}
				newAmCharts1(chartStore,chartStore[0].infoData);
		
			},
			failure : function(result, request) {
				Ext.MessageBox.alert('没有数据', "fail");
			}
		});
	}
	
	
	
	//默认查询
	getDataByExchanger();
			
});



// 实例化AmCharts对象
var chart1 = null;
var newAmCharts1 = function newAmCharts(chartStore,title) {
	//if( chart1 == null && Ext.get( "amcharts-panel1" ) != null ){
		chart1 = new AmCharts.AmSerialChart();
		// 
		chart1.dataProvider = chartStore;
	  	chart1.categoryField = "eventTime";
		// 如果设置为TRUE 更新数据集结束时更新视图的范围。
		chart1.glueToTheEnd = true;
		chart1.marginRight = 10;
	    chart1.marginTop = 10;
	    chart1.marginLeft = 0;
	    
	    /*
	    if(!this.Ext.isIE9&&!this.Ext.isIE8&&!this.Ext.isIE7){
	    	//xddd]
	        chart1.startDuration = 1;
	    }
	    */
		// 设置分类轴
	    var categoryAxis = chart1.categoryAxis;
	   	categoryAxis.labelRotation = 90;
	    categoryAxis.dashLength = 4;
	    categoryAxis.gridPosition = "start";
		categoryAxis.zoomOutButton = {
	        backgroundColor: '#E0FFFF',
	        backgroundAlpha: 0.5
	    };
	
	    var distanceAxis = new AmCharts.ValueAxis();
	    distanceAxis.title = "共："+chartStore.length+"个点";
	    chart1.addValueAxis(distanceAxis);
	
		// 一网供水压力线图
		var graph1 = new AmCharts.AmGraph();
		graph1.lineColor = '#296CA9';
		graph1.useDataSetColors = false;
		graph1.lineThickness = 2;
		graph1.valueField = "oldValue";
		graph1.title = title;
		graph1.balloonText =title+ ":[[value]]";
	    graph1.legendValueText = "[[value]]";
		chart1.addGraph(graph1);
	
		// 图光标设置
	    // 如果你改变一个属性初始化后的图，你应该告诉给stockchart
		// 如果没有指定的默认值，默认值将使用chartcursor类。
	    var chartCursor = new AmCharts.ChartCursor();
	    chartCursor.valueBalloonsEnabled = true;
	    chart1.addChartCursor(chartCursor);
	   
		// legend
	    var legend = new AmCharts.AmLegend();
	    legend.bulletType = "round";
	    legend.equalWidths = false;
	    legend.valueWidth = 120;
	    legend.color = "black";
	    chart1.addLegend(legend);
	   
	   
	    var panelId = "amcharts-panel1";
	    var id = Ext.get( panelId ).child("DIV[id='"+panelId+"-body']").getAttribute('id');
	    chart1.write( id );
//	}else{
//		chart1.dataProvider = chartStore;
		// 在你的数据变化或重新设置dataProvider。调用此方法后，图表将分析数据和重绘。
//		chart1.validateData();
//	}
};


// 取得url里的值
Ext.getUrlParam = function(param) { 
    var params = Ext.urlDecode(location.search.substring(1)); 
    return param ? params[param] : params; 
}; 
