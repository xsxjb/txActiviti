$(function() {
 
	var isQuery = false;
	
	//查询【热源信息】和【机组信息】二级联动
	$.get("/XMCP/commonAction!stationCombo.action",function(data){
		data = JSON.parse(data);
		var optionstr = " <option value=\"%\">选择换热站..</option> ";
        for(var j = 0 ;j< data.length;j++){
        	//alert( heatStationId+","+data[j].stationId+"="+(heatStationId == data[j].stationId));
        	if( heatStationId == data[j].stationId ){
        		
        		optionstr += "<option value=\""+data[j].stationId+"\" selected>"+data[j].stationName+"</option>";
        	}else{
        		optionstr += "<option value=\""+data[j].stationId+"\">"+data[j].stationName+"</option>";
        	}  
    	}
    	optionstr = "<select id ='station'>"+optionstr+"</select>";
    	$("#station")[0].outerHTML=optionstr;	
    	
    	
    	//二级联动（当选择热力站时，查询得到机组数据）
    	$('#station').change(function(event){
    		var value = event.currentTarget.value;
    		if (value==""){
    			unitOptionStr = "<select id ='unit'><option value='%'>请选择机组</option></select>";
    			$("#unit")[0].outerHTML=unitOptionStr;	
    		}else{
    			$.get("/XMCP/commonAction!unitCombo.action",{stationId:value},function(data){
    				data = JSON.parse(data);
    				var unitOptionStr;
        			for(var j = 0 ;j< data.length;j++){

        				unitOptionStr += "<option value=\""+data[j].unitId+"\">"+data[j].unitName+"</option>";
    				}
	    			unitOptionStr = "<select id ='unit'>"+unitOptionStr+"</select>";
	    			$("#unit")[0].outerHTML=unitOptionStr;	
    			});
    		}
    	});
    	
    	//如果传来了热力站和机组的ID值，就可以查询了。
		if( heatStationId != "%" && heatUnitId != "%" ){
		
			//根据热力站的ID查询机组数据
			$.get("/XMCP/commonAction!unitCombo.action",{stationId:heatStationId},function(data){
				data = JSON.parse(data);
				var unitOptionStr;
				for(var j = 0 ;j< data.length;j++){
					
					if( heatUnitId == data[j].unitId ){
						unitOptionStr += "<option value=\""+data[j].unitId+"\" selected>"+data[j].unitName+"</option>";
					}else{
						unitOptionStr += "<option value=\""+data[j].unitId+"\">"+data[j].unitName+"</option>";
					}
					
				}
				unitOptionStr = "<select id ='unit'>"+unitOptionStr+"</select>";
				$("#unit")[0].outerHTML=unitOptionStr;	
				
				
				//2个下拉列表都准备好了，可以查询了。
				query();
				
				//隐藏查询按钮
				$("#search").hide();
				$('#station').attr("disabled", "disabled"); 
				$('#unit').attr("disabled", "disabled");
			});
		}
	
	});
	



	
	
	//获得画板的单击事件
	$('#canvas').click(function(e) {
		//alert('单击事件');
		//alert( e.pageX +","+$('#canvas').offset().left );
		
		var mouseX = e.pageX - $('#canvas').offset().left;
		var mouseY = e.pageY - $('#canvas').offset().top;

		//计算出窗口放大或者缩小的偏移位置
		mouseX = width * (mouseX/getWidth());
		mouseY = height * (mouseY/getHeight());
		
		//alert( "鼠标单击位置："+ mouseX +","+mouseY);
		var obj = null;
		for(var i=0;i<elements.size();i++){
			if( elements.get(i).isPop == 1 ){
				var isRange = elements.get(i).clickRange(mouseX,mouseY);
				if( isRange == true ){
					if( elements.get(i).type == 'Texts' ){
						//文本可以覆盖其他的鼠标事件
						obj = elements.get(i);
						break;
					}else{
						obj = elements.get(i);
					}
				}
			}
		}
		if( obj != null ){
			obj.clickView( mouseX , mouseY );
		}
		return false;
	});

	//获得画板的移动事件
	$('#canvas').mousemove(function(e) {
		//alert('单击事件');
		//alert( e.pageX +","+$('#canvas').offset().left );
		
		var mouseX = e.pageX - $('#canvas').offset().left;
		var mouseY = e.pageY - $('#canvas').offset().top;
		
		//计算出窗口放大或者缩小的偏移位置
		mouseX = width * (mouseX/getWidth());
		mouseY = height * (mouseY/getHeight());
		
		//alert( "鼠标单击位置："+ mouseX +","+mouseY);
		for(var i=0;i<elements.size();i++){
			
			var isRange = elements.get(i).clickRange(mouseX,mouseY);
			if( isRange == true ){
				//$('#canvas').addClass('hover');
				//elements.get(i).mousemove( mouseX , mouseY );
				elements.get(i).moveOver = 1;
			}else{
				//$('#canvas').removeClass('hover');
				elements.get(i).moveOver = 0;
			}
		}

		return false;
	});
	
	var begin = new Date().getTime();  
	/**
	 *	发起AJAX请求
	 */
	function requestRealData(){
		
		//clearTimeout(timer1);
		
		if( isQuery == false ){
			return;
		}
		
		if( $('#station option:selected').val() == '%' || $('#unit option:selected').val() == '%' ){
			elements.getId('console').realData = '请选择对应【热力站】【机组】才能获得实时数据';
			return;
		}else{
			elements.getId('console').realData = '';
		}
		
		//获得用于选中的【热力站】和机组
		heatStationId = $('#station option:selected').val();
		heatUnitId = $('#unit option:selected').val();
		
		//使用jquery的ajax请求
		http://localhost:9001/XMCP/realTimeDataAction!queryById.action?stationId=Z173&unitId=J1
		var time = new Date().getTime();    
		//如果页面打开1000*60*60时间，强制页面刷新一次
		//console.log( (time-begin > 1000*60*60)+"-->"+(time-begin)+"-->"+begin );
		if( (time-begin) > 1000*60*60 ){
		
			var  userId = $('#userId').val();
			//post提交
			window.location.href = "/XMCP/jsp/plc-control/station/show.jsp?heatStationId="+heatStationId+"&heatUnitId="+heatUnitId+"&userId="+userId; 
			//$("#search").click();
			return ;
		}
		      
		$.ajax({
			 type: "POST",
			 url: "/XMCP/plcControlStationAction!queryById.action",
			 data:{heatStationId:heatStationId,heatUnitId:heatUnitId,time:time},
			 dataType: "text",
			 success: function(data){
				
				if( data == '' || data == '{}' || data == '[]' ){
					elements.getId('console').realData = '返回空值!';
					return;
				}else{
					elements.getId('console').realData = '获得数据!';
				}
				var json = JSON.parse(data) ;

				//循环页面上的所有的文本
				for(var i=0;i<elements.size();i++){
					var ele = elements.get(i);
					//更新页面上的所有组件
					ele.updateStatus( json );
				}
				
				//利用AJAX返回的json更新控制页面上的实时数据
				//updateControlPage( json );
				updateRealData( json );
				
			 },
			 error: function (XMLHttpRequest, textStatus, errorThrown) {
	         	elements.getId('console').realData = '请求数据出错了!';
	         } 
	
		});
	}

	
	setInterval( requestRealData,1000 );
	// ---------------------------------------------------------------
	$("#reset").click(function(e) {
	    heatStationId = $('#station option:selected').val();
	    // 
	    $.get("/XMCP/baseConfAction!xmlRpcExecuetByStationId.action",{heatStationId:heatStationId},function(data){
	        alert("已重置数据请不要频繁点击");
	    });
	});
	
	// ---------------------------------------------------------------
	//单击【查询】按钮，将返回的json数据显示到页面上
	$("#search").click(function(e) {
		if( $('#station option:selected').val() == '%' || $('#unit option:selected').val() == '%' ){
			alert('请选择对应【热力站】【机组】后再试！');
			//初始化工具栏
			initTools();
			return;
		}
		//获得用于选中的【热力站】和机组
		heatStationId = $('#station option:selected').val();
		heatUnitId = $('#unit option:selected').val();
		//请求数据
		query();
	});
	
	/**
	 * 查询功能
	 */
	function query(){

		//清空页面上的所有元素。
		elements.clear();
		
		//添加一个控制台，用于显示鼠标信息
		var t = new Texts("console",2,5);
		t.width = 400;
		t.text = '';
		t.textColor = '#FFFFFF';
		elements.add(t);
		
		
		//还原场景
		var rs  = new ReviveScene('control');
		//读取json数据
		rs.requestJson(heatStationId,heatUnitId);
		
		//初始化工具栏
		initTools();
		
		
		//查询当前站是否存在视频
		queryVideo(heatStationId);
		
		isQuery = true;
		
		//将选择的热力站更新到浏览器的title上
		var heatStationName = $('#station option:selected').text();
		var heatUnitName = $('#unit option:selected').text();
		document.title="【"+heatStationName+"-"+heatUnitName+"】站实时控制显示页面"; 
		
		//将选择的热力站更新到浏览器的title上
		var heatStationName=$('#station option:selected').text();
		var heatUnitName=$('#unit option:selected').text();
		document.title="["+heatStationName+"]站-["+heatUnitName+"]";
		
		//设置2个下拉列表不可编辑
		//$('#station').attr("disabled", "disabled"); 
		//$('#unit').attr("disabled", "disabled");
	}
	
	/**
	 *	显示视频链接
	 */
	function queryVideo(stationId){
		$.get("/XMCP/commonAction!queryVideoByStation.action",{stationId:stationId},function(data){
			//var data = JSON.parse(data);
			
			if( data != "-" ){
				var a = document.createElement("a");
				a.href = data;
				a.target="_blank";
				var text = document.createTextNode("视频链接");
				a.appendChild( text );
				
				$("#video").get(0).innerHTML="";
				$("#video").get(0).appendChild(a);
			}else{
				$("#video").get(0).innerHTML="";
			}
		});
	}
	
	/**
	 * 初始化工具栏（设置为手型）
	 */
	function initTools(){
		selectId = 'select';
		//鼠标离开时移除divOver样式
		$(".tool[id!="+selectId+"]").css({
			'background-color' : '#CFDFEF',
			'filter' : 'alpha(Opacity=70)',
			'padding':'5px',
			'opacity' : 0.7
		});
	}
	
	//工具栏的鼠标事件
	$('.tool').hover(function() {
		$(this).css( {
			'background-color' : '#f58220',
			'padding':'0px 5px 10px 5px',
			'filter' : 'alpha(Opacity=100)',
			'opacity' : 1
		});
		
	}, function() {
		//鼠标离开时移除divOver样式
		$(this).css({
			'background-color' : '#CFDFEF',
			'filter' : 'alpha(Opacity=70)',
			'padding':'5px',
			'opacity' : 0.7
		});
	});
	

	
});