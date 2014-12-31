$(function() {
    //查询【站间复制用 换热站,机组】信息
    $.get("/XMCP/plcControlStationAction!stationCheckBox.action",function(data){
        data = JSON.parse(data);
      //  var optionstr = "<tr><td><input type=\"checkbox\" onclick=\"selectAll(this);\" />全选<br/></td><tr/>";
        var optionstr = "";
        for(var i = 0 ;i< data.length;i++){
            optionstr += "<tr><td><input type='checkbox' name='"+data[i].copyId+"' />"+data[i].copyName+"<br/></td><tr/>";
        }
        $("#copyList")[0].outerHTML=optionstr;
    });
	
	//查询【换热站信息】和【机组信息】二级联动
	$.get("/XMCP/commonAction!stationCombo.action",function(data){
		data = JSON.parse(data);
		var optionstr = " <option value=\"%\">选择换热站..</option> ";
        for(var j = 0 ;j< data.length;j++){
    		optionstr += "<option value=\""+data[j].stationId+"\">"+data[j].stationName+"</option>";
    	}
    	optionstr = "<select id ='station'>"+optionstr+"</select>";
    	$("#station")[0].outerHTML=optionstr;	
    	
    	//选择[换热站]会查询对应的[机组]列表
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
	});
	
	/*
	//获得画板的移动事件
	$('#canvas').mousemove(function(e) {
		//alert('单击事件');
		//alert( e.pageX +","+$('#canvas').offset().left );
		
		var mouseX = e.pageX - $('#canvas').offset().left;
		var mouseY = e.pageY - $('#canvas').offset().top;

		//alert( "鼠标单击位置："+ mouseX +","+mouseY);
		for(var i=0;i<elements.size();i++){
			
			if( elements.get(i).type != 'Pipeline' ){
				elements.get(i).moveOver=1;
			}
			if( elements.get(i).moveOver == 1 ){
				var isRange = elements.get(i).clickRange(mouseX,mouseY);
				if( isRange == true ){
					//$('#canvas').addClass('hover');
					
					elements.get(i).mousemove( mouseX , mouseY );
				}else{
					//$('#canvas').removeClass('hover');
				}
			}
		}
		return false;
	});
	*/
	


	
	
	$('#canvas').dblclick(function (e) {

		var mouseX = e.pageX - $('#canvas').offset().left;
		var mouseY = e.pageY - $('#canvas').offset().top;

		//alert( "鼠标单击位置："+ mouseX +","+mouseY);
		for(var i=0;i<elements.size();i++){
			var isRange = elements.get(i).clickRange(mouseX,mouseY);
			//alert( "鼠标单击位置："+ mouseX +","+mouseY +","+elements.get(i).name+",isRange:"+isRange);
			if( isRange == true ){
				// 隐藏其它弹出框
				$("#iconForm").hide();
				$("#heatForm").hide();
				$("#tankForm").hide();
				$("#operateForm").hide();
				$("#mvForm").hide();
				$("#lampForm").hide();
				$("#lineForm").hide();
				$("#textForm").hide();
				
				
				// 编辑显示当前对象的弹出框
				elements.get(i).clickEdit(mouseX,mouseY);
				return true;
			}
		}
		return false;
	});

	
	
	//用于标示鼠标是否点击（按下）
	var mousedown = false;
	var mouseImage = null;
	var elementId = 1;
	var drawPipeline = null;

	var isQuery = false;
	
	
	//按下鼠标时触发
	$('#canvas').mousedown(function(e) {
		var mouseX = e.pageX - canvas.offsetLeft;
		var mouseY = e.pageY - canvas.offsetTop;
		//设定为按下状态
		mousedown = true;
		
		if( elements.getId('console') != null ){
			elements.getId('console').realData = '鼠标按下：'+mouseX+','+mouseY;
		}
		
		
		//取消【画阀门】【画换热器】【画补水泵】【画水箱】等
		if( mouseImage != null ){
			//elements.remove(mouseImage.id);
			mouseImage = null;
			//初始化工具栏
			initTools();
		}
		
		//记住起始坐标
		if( drawPipeline != null ){
			drawPipeline.x = mouseX;
			drawPipeline.y = mouseY;
		}
		
		// 遍历画面中所有对象,判断当前点击的是哪个对象 TODO
		for(var i=0;i<elements.size();i++){
		    // 判断取得当前点击的对象
			var isRange = elements.get(i).clickRange(mouseX,mouseY);
			if( isRange > 0){
			    // 选中的对象 TODO
			    mouseImage = elements.get(i);
		   }
	   }
	});
	
	//松开鼠标时候触发
	$('#canvas').mouseup(function(e) {
		var mouseX = e.pageX - canvas.offsetLeft;
		var mouseY = e.pageY - canvas.offsetTop;
		mousedown = false;
		
		if( elements.getId('console') != null ){
			elements.getId('console').realData = '鼠标抬起：'+mouseX+','+mouseY;
		}
		
		
		//取消【画阀门】【画换热器】【画补水泵】【画水箱】等
		if( mouseImage != null ){
			//elements.remove(mouseImage.id);
			mouseImage = null;
		}
		
		//取消【画管道】
		if( drawPipeline != null ){
			drawPipeline = null;
			//初始化工具栏
			initTools();
		}
	});
	
	
	//鼠标移动
	$('#canvas').mousemove(function(e) {
		var mouseX = e.pageX - canvas.offsetLeft;
		var mouseY = e.pageY - canvas.offsetTop;
		// 鼠标拖拽图片移动 TODO
		if (mousedown == true && mouseImage != null) {
		    mouseImage.x = mouseX;
		    mouseImage.y = mouseY;
		} else if( mousedown == true ){
			if( elements.getId('console') != null ){
				elements.getId('console').realData = '鼠标拖动：'+mouseX+','+mouseY;
			}

			
			//画【管道】
			if( drawPipeline != null ){
				
				if( drawPipeline.type == 'Pipeline' ){
					var x = mouseX-drawPipeline.x;
					var y = mouseY-drawPipeline.y;
					//north, south, east and west
					if( x > 0 && Math.abs(x)>Math.abs(y) ){
						//东
						drawPipeline.flowTo = 'east';
						drawPipeline.length = x;
						//drawPipeline.width = y;
					}else if( x < 0 && Math.abs(x)>Math.abs(y) ){
						//西
						drawPipeline.flowTo = 'west';
						drawPipeline.length = x;
						//drawPipeline.width = y;
					}else if( y > 0 && Math.abs(x)<Math.abs(y) ){
						//南
						drawPipeline.flowTo = 'south';
						drawPipeline.length = y;
						//drawPipeline.width = x;
					}else if( y < 0 && Math.abs(x)<Math.abs(y) ){
						//北
						drawPipeline.flowTo = 'north';
						drawPipeline.length = y;
						//drawPipeline.width = x;
					}
				}else if( drawPipeline.type == 'Rect' ){
					//alert( '移动' );
					var x = mouseX-drawPipeline.x;
					var y = mouseY-drawPipeline.y;
					//north, south, east and west
					if( x > 0 && y > 0 ){
						//东南
						drawPipeline.height = y;
						drawPipeline.width = x;
					}else if( x > 0 && y < 0 ){
						//东北
						drawPipeline.height = y;
						drawPipeline.width = x;
					}else if( x < 0 && y > 0 ){
						//西南
						drawPipeline.height = y;
						drawPipeline.width = x;
					}else if( x < 0 && y < 0 ){
						//西北
						drawPipeline.height = y;
						drawPipeline.width = x;
					}
				}

				//elements.add( drawPipeline );
			}
		}else{
			if( elements.getId('console') != null  ){
				elements.getId('console').realData = '鼠标移动：'+mouseX+','+mouseY;
			}
			
			
			//如果带着图片
			if( mouseImage != null ){
				mouseImage.x = mouseX;
				mouseImage.y = mouseY;
			}

		}

		if( elements.getId('line') != null ){
			elements.getId('line').x = mouseX;
			elements.getId('line').y = mouseY;
		}
	});
	//鼠标移进
	$('#canvas').mouseover(function(e) {
		var mouseX = e.pageX - canvas.offsetLeft;
		var mouseY = e.pageY - canvas.offsetTop;
		if( elements.getId('console') != null  ){
			elements.getId('console').realData = '鼠标移进画板';
		}
		
		
		//如果选择的不是手型
		if( selectId != 'select' ){
			//alert( selectId +"---->"+ isType(selectId) );
			switch( isType(selectId) ){
			case 'draw':
				if( selectId == 'Pipeline'  ){
					//alert('画管线');
					if( drawPipeline == null ){
						elementId = createId();
						drawPipeline = new Pipeline();
						drawPipeline.id = "p"+elementId;
						//elementId++;
						elements.insert( 0 , drawPipeline );
					}
				}else{
					//alert('画矩形框');
					if( drawPipeline == null ){
						elementId = createId();
						drawPipeline = new Rect();
						drawPipeline.id = "r"+elementId;
						//elementId++;
						elements.insert( 0 , drawPipeline );
					}
				}
				break;
			case 'image':
				//alert('创建一张图片:'+mouseImage+",selectId:"+selectId);
				if( mouseImage == null ){
					elementId = createId();
					mouseImage = createElement(selectId,mouseX,mouseY);
					//alert("创建对象："+ mouseImage );
					elements.add(mouseImage);
				}
				break;
			}
		}
	});
	
	//鼠标移出
	$('#canvas').mouseout(function(e) {
		if( elements.getId('console') != null ){
			elements.getId('console').realData = '鼠标移出画板';
		}
		
		
		if( mouseImage != null ){
			elements.removeId(mouseImage.id);
			mouseImage = null;
		}
	});
	
	
	//工具栏的单击事件（选中某一个）
	$('.tool').click(function() {
		
		if( isQuery == false && $(this).attr("id") != 'search' && $(this).attr("id") != 'save' ){
			alert('请查询完对应【热力站】【机组】后再试！');
			return;
		}
		if( $('#station option:selected').val() == '%' || $('#unit option:selected').val() == '%' ){
			if( $(this).attr("id") != 'search' && $(this).attr("id") != 'save' ){
				alert('请选择对应【热力站】【机组】后再试！');
				//初始化工具栏
				initTools();
				return;	
			}
		}
		
		selectId = $(this).attr("id");
		//select($(this).children().attr("name"), $(this).children().attr("src"))
		
		//鼠标离开时移除divOver样式
		$(".tool[id!="+selectId+"]").css({
			'background-color' : '#CFDFEF',
			'filter' : 'alpha(Opacity=70)',
			'padding':'5px',
			'opacity' : 0.7
		});
		
		mouseImage = null;
	});
	//默认为【选择】手型
	var selectId = 'select';
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
		$(".tool[id!="+selectId+"]").css({
			'background-color' : '#CFDFEF',
			'filter' : 'alpha(Opacity=70)',
			'padding':'5px',
			'opacity' : 0.7
		});
	});
	//设定手型为默认
	$("#select").css({
		'background-color' : '#f58220',
		'padding':'0px 5px 10px 5px',
		'filter' : 'alpha(Opacity=100)',
		'opacity' : 1
	});
	
	//判断是那一个类型
	function isType( selectId ){
		//alert( "selectId:"+selectId);
		switch( selectId ){
		case 'Pipeline'://管线
			return 'draw';
			break;
		case 'AdjustValve'://调阀
			return 'image';
			break;
		case 'DiscValve'://碟阀
			return 'image';
			break;
		case 'WaterHeatExchanger'://热水换热器
			return 'image';
			break;	
		case 'SteamHeatExchanger'://蒸汽换热器
			return 'image';
			break;	
		case 'Thermometer'://温度测量计
			return 'image';
			break;
		case 'WaterFlowmeter'://热水流量计
			return 'image';
			break;
		case 'SteamFlowmeter'://蒸汽流量计
			return 'image';
			break;
		case 'Decontamination'://除污器
			return 'image';
			break;		
		case 'CyclePump'://循环泵
			return 'image';
			break;
		case 'SupplyPump'://补水泵
			return 'image';
			break;		
		case 'RawPump'://生水泵
			return 'image';
			break;		
		case 'ManualValve'://手动阀
			return 'image';
			break;	
		case 'Manometer'://压力计
			return 'image';
			break;
		case 'JointBox'://联箱
			return 'image';
			break;
		case 'SolenoidValve'://电磁阀
			return 'image';
			break;
		case 'WarningLamp'://报警灯
			return 'image';
			break;
		case 'Tank'://水箱
			return 'image';
			break;
		case 'Cabinet'://柜子
			return 'image';
			break;	
		case 'Texts'://文字
			return 'image';
			break;	
		case 'Rect'://矩形框
			return 'draw';
			break;			
		case 'select'://选择
			return '-';
			break;		
		}
	}
	
	//创建元素
	function createElement( selectId , x,y , id ){
		
		switch( selectId ){
		case 'Pipeline'://管线
			return 'draw';
			break;
		case 'AdjustValve'://调阀
			var v = new AdjustValve(id==null?'v'+elementId:id,x,y);
			v.init();
			//elementId++; 
			return v;
			break;
		case 'DiscValve'://碟阀
			var v = new DiscValve(id==null?'v'+elementId:id,x,y);
			v.init();
			//elementId++; 
			return v;
			break;
		case 'WaterHeatExchanger'://热水换热器
			var v = new WaterHeatExchanger(id==null?'h'+elementId:id,x,y);
			v.init();
			//elementId++;
			return v;
			break;	
		case 'SteamHeatExchanger'://蒸汽换热器
			var v = new SteamHeatExchanger(id==null?'h'+elementId:id,x,y);
			v.init();
			//elementId++;
			return v;
			break;	
		case 'Thermometer'://温度测量计
			var v = new Thermometer( id==null?'v'+elementId:id ,x,y);
			v.init();
			//elementId++;
			return v;
			break;
		case 'WaterFlowmeter'://热水流量计
			var v = new WaterFlowmeter( id==null?'v'+elementId:id ,x,y);
			v.init();
			//elementId++;
			return v;
			break;
		case 'SteamFlowmeter'://蒸汽流量计
			var v = new SteamFlowmeter( id==null?'v'+elementId:id ,x,y);
			v.init();
			//elementId++;
			return v;
			break;
		case 'Decontamination'://除污器
			var v = new Decontamination( id==null?'v'+elementId:id ,x,y);
			v.init();
			//elementId++;
			return v;
			break;		
		case 'CyclePump'://循环泵
			var v = new CyclePump( id==null?'p'+elementId:id ,x,y);
			v.init();
			//elementId++;
			return v;
			break;
		case 'SupplyPump'://补水泵
			var v = new SupplyPump( id==null?'p'+elementId:id ,x,y);
			v.init();
			//elementId++;
			return v;
			break;		
		case 'RawPump'://生水泵
			var v = new RawPump( id==null?'p'+elementId:id ,x,y);
			v.init();
			//elementId++;
			return v;
			break;		
		case 'ManualValve'://手动阀
			var v = new ManualValve( id==null?'v'+elementId:id ,x,y);
			v.init();
			//elementId++;
			return v;
			break;	
		case 'Manometer'://压力计
			var v = new Manometer( id==null?'m'+elementId:id ,x,y);
			v.init();
			//elementId++;
			return v;
			break;	
		case 'JointBox'://联箱
			var v = new JointBox( id==null?'m'+elementId:id ,x,y);
			v.init();
			//elementId++;
			return v;
			break;	
				
		case 'SolenoidValve'://电磁阀
			var v = new SolenoidValve( id==null?'v'+elementId:id ,x,y);
			v.init();
			//elementId++;
			return v;
			break;	
		case 'WarningLamp'://报警灯
			var v = new WarningLamp( id==null?'l'+elementId:id ,x,y);
			v.init();
			//elementId++;
			return v;
			break;
		case 'Tank'://水箱
			var v = new Tank( id==null?'w'+elementId:id ,x,y);
			v.init();
			//elementId++;
			return v;
			break;	
		case 'Cabinet'://柜子
			var v = new Cabinet('g'+elementId,x,y);
			v.init();
			//elementId++;
			return v;
			break;
		case 'Texts'://文字
			var v = new Texts( id==null?'T'+elementId:id ,x,y);
			v.init();
			//elementId++;
			return v;
			break;	
		case 'Rect'://矩形框
			var v = new Rect( id==null?'T'+elementId:id ,x,y);
			v.init();
			//elementId++;
			return v;
			break;	
		case 'select'://选择
			return '-';
			break;		
		}
	}
	//----------------------------------------------------------------
	//单击【矩形框编辑表单】中的确定按钮
	$('#addRect').click(function(e) {
		var charCheck = new RegExp("^(\\d+)$");
		if( !charCheck.test($("#rectX").val()) ){
            alert('[X坐标]必须是整数!');
            $("#rectX").focus();
            return;
        }
		if( !charCheck.test($("#rectY").val()) ){
            alert('[Y坐标]必须是整数!');
            $("#rectY").focus();
            return;
        }
		if( !charCheck.test($("#rectW").val()) ){
            alert('[宽度]必须是整数!');
            $("#rectW").focus();
            return;
        }
		if( !charCheck.test($("#rectH").val()) ){
            alert('[高度]必须是整数!');
            $("#rectH").focus();
            return;
        }
		if( window.confirm("您确认要更新该组件吗？") == true ){
	        // 调用设置编辑过的对象
			elements.getId($("#rectId").val()).clickAdd();
		}
	});
	
	//单击【图片编辑表单】中的删除按钮
	$("#deleteRect").click(function(e) {
		
		if( window.confirm("您确认要删除该组件吗？") == true ){
			elements.removeId($("#rectId").val());
			$("#rectForm").hide(300);
		}
	});
	//----------------------------------------------------------------
	//单击【图片编辑表单】中的确定按钮
	$('#addIcon').click(function(e) {
		var charCheck = new RegExp("^(\\d+)$");
		if( !charCheck.test($("#iconX").val()) ){
            alert('[X坐标]必须是整数!');
            $("#iconX").focus();
            return;
        }
		if( !charCheck.test($("#iconY").val()) ){
            alert('[Y坐标]必须是整数!');
            $("#iconY").focus();
            return;
        }
		if( !charCheck.test($("#iconW").val()) ){
            alert('[宽度]必须是整数!');
            $("#iconW").focus();
            return;
        }
		if( !charCheck.test($("#iconH").val()) ){
            alert('[高度]必须是整数!');
            $("#iconH").focus();
            return;
        }
		if( window.confirm("您确认要更新该组件吗？") == true ){
	        // 调用设置编辑过的对象
			elements.getId($("#iconId").val()).clickAdd();
		}
	});
	
	//单击【图片编辑表单】中的删除按钮
	$("#deleteIcon").click(function(e) {
		
		if( window.confirm("您确认要删除该组件吗？") == true ){
			elements.removeId($("#iconId").val());
			$("#iconForm").hide(300);
		}
	});
	
	//----------------------------------------------------------
	//单击【换热站】中的确定按钮
	$('#addHeat').click(function(e) {
		var charCheck = new RegExp("^(\\d+)$");
		if( !charCheck.test($("#heatX").val()) ){
            alert('[X坐标]必须是整数!');
            $("#heatX").focus();
            return;
        }
		if( !charCheck.test($("#heatY").val()) ){
            alert('[Y坐标]必须是整数!');
            $("#heatY").focus();
            return;
        }
		if( !charCheck.test($("#heatW").val()) ){
            alert('[宽度]必须是整数!');
            $("#heatW").focus();
            return;
        }
		if( !charCheck.test($("#heatH").val()) ){
            alert('[高度]必须是整数!');
            $("#heatH").focus();
            return;
        }
		if( window.confirm("您确认要更新该组件吗？") == true ){
			elements.getId($("#heatId").val()).clickAdd();
			$("#heatForm").hide(300);
		}
	});
	
	//单击【换热站】中的删除按钮
	$("#deleteHeat").click(function(e) {
		
		if( window.confirm("您确认要删除该组件吗？") == true ){
			elements.removeId($("#heatId").val());
			$("#heatForm").hide(300);
		}
	});
	//----------------------------------------------------------
	//单击【管道编辑表单】中的确定按钮
	$('#addLine').click(function(e) {
		var charCheck = new RegExp("^(\\d+)$");
		if( !charCheck.test($("#lineX").val()) ){
            alert('[X坐标]必须是整数!');
            $("#lineX").focus();
            return;
        }
		if( !charCheck.test($("#lineY").val()) ){
            alert('[Y坐标]必须是整数!');
            $("#lineY").focus();
            return;
        }
		if( !charCheck.test($("#lineW").val()) ){
            alert('[宽度]必须是整数!');
            $("#lineW").focus();
            return;
        }
        
        //判断管道的流向，向北向西的可以为负数，南和东正数
        switch ( $("#flowTo").val() ) {//north, south, east and west
		case "north"://北
		case "west"://西
	        var charCheck2 = new RegExp("^(-)(\\d+)$");
			if( !charCheck2.test($("#lineL").val()) ){
	            alert('管道的流向为向上或向左时[长度]必须是负数!');
	            $("#lineL").focus();
	            return;
	        }
			break;
		case "south"://南
		case "east"://东
			if( !charCheck.test($("#lineL").val()) ){
	            alert('管道的流向为向下或向右时[长度]必须是整数!');
	            $("#lineL").focus();
	            return;
	        }
			break;
		}

		if( window.confirm("您确认要更新该管道吗？") == true ){
			elements.getId($("#lineId").val()).clickAdd();
			$("#lineForm").hide(300);
		}

	});
	
	//单击【图片编辑表单】中的删除按钮
	$("#deleteLine").click(function(e) {
		
		if( window.confirm("您确认要删除该管道吗？") == true ){
			elements.removeId($("#lineId").val());
			$("#lineForm").hide(300);
		}
	});
	//----------------------------------------------------------
	//单击【柜子】中的确定按钮
	$('#addCabinet').click(function(e) {
		var charCheck = new RegExp("^(\\d+)$");
		if( !charCheck.test($("#cabinetW").val()) ){
            alert('[宽度]必须是整数!');
            $("#cabinetW").focus();
            return;
        }
		if( !charCheck.test($("#cabinetH").val()) ){
            alert('[高度]必须是整数!');
            $("#cabinetH").focus();
            return;
        }
		if( window.confirm("您确认要更新该组件吗？") == true ){
			elements.getId($("#cabinetId").val()).clickAdd();
			$("#cabinetForm").hide(300);
		}
	});
	//单击【柜子】中的删除按钮
	$("#deleteCabinet").click(function(e) {
		
		if( window.confirm("您确认要删除该组件吗？") == true ){
			elements.removeId($("#cabinetId").val());
			$("#cabinetForm").hide(300);
		}
	});
	//----------------------------------------------------------
	//单击【水箱】中的确定按钮
	$('#addTank').click(function(e) {
		var charCheck = new RegExp("^(\\d+)$");
		if( !charCheck.test($("#tankX").val()) ){
            alert('[X坐标]必须是整数!');
            $("#tankX").focus();
            return;
        }
		if( !charCheck.test($("#tankY").val()) ){
            alert('[Y坐标]必须是整数!');
            $("#tankY").focus();
            return;
        }
		if( !charCheck.test($("#tankW").val()) ){
            alert('[宽度]必须是整数!');
            $("#tankW").focus();
            return;
        }
		if( !charCheck.test($("#tankH").val()) ){
            alert('[高度]必须是整数!');
            $("#tankH").focus();
            return;
        }
		if( !charCheck.test($("#tankCapacity").val()) ){
            alert('[水箱容量]必须是整数!');
            $("#tankCapacity").focus();
            return;
        }
		if( window.confirm("您确认要更新该组件吗？") == true ){
			elements.getId($("#tankId").val()).clickAdd();
			$("#tankForm").hide(300);
		}
	});
	
	//单击【水箱】中的删除按钮
	$("#deleteTank").click(function(e) {
		
		if( window.confirm("您确认要删除该组件吗？") == true ){
			elements.removeId($("#tankId").val());
			$("#tankForm").hide(300);
		}
	});
	//----------------------------------------------------------
	//单击【手动阀】中的确定按钮
	$('#addManualValve').click(function(e) {
		var charCheck = new RegExp("^(\\d+)$");
		if( !charCheck.test($("#mvX").val()) ){
            alert('[X坐标]必须是整数!');
            $("#mvX").focus();
            return;
        }
		if( !charCheck.test($("#mvY").val()) ){
            alert('[Y坐标]必须是整数!');
            $("#mvY").focus();
            return;
        }
		if( !charCheck.test($("#mvW").val()) ){
            alert('[宽度]必须是整数!');
            $("#mvW").focus();
            return;
        }
		if( !charCheck.test($("#mvH").val()) ){
            alert('[高度]必须是整数!');
            $("#mvH").focus();
            return;
        }
		if( window.confirm("您确认要更新该组件吗？") == true ){
			elements.getId($("#mvId").val()).clickAdd();
			$("#mvForm").hide(300);
		}
	});
	
	//单击【手动阀】中的删除按钮
	$("#deleteManualValve").click(function(e) {
		
		if( window.confirm("您确认要删除该组件吗？") == true ){
			elements.removeId($("#mvId").val());
			$("#mvForm").hide(300);
		}
	});
	
	//----------------------------------------------------------
	//单击【报警灯】中的确定按钮
	$('#addLamp').click(function(e) {
		var charCheck = new RegExp("^(\\d+)$");
		if( !charCheck.test($("#lampX").val()) ){
            alert('[X坐标]必须是整数!');
            $("#lampX").focus();
            return;
        }
		if( !charCheck.test($("#lampY").val()) ){
            alert('[Y坐标]必须是整数!');
            $("#lampY").focus();
            return;
        }
		if( !charCheck.test($("#lampW").val()) ){
            alert('[宽度]必须是整数!');
            $("#lampW").focus();
            return;
        }
		if( !charCheck.test($("#lampH").val()) ){
            alert('[高度]必须是整数!');
            $("#lampH").focus();
            return;
        }
		if( window.confirm("您确认要更新该组件吗？") == true ){
			elements.getId($("#lampId").val()).clickAdd();
			$("#lampForm").hide(300);
		}
	});
	
	//单击【报警灯】中的删除按钮
	$("#deleteLamp").click(function(e) {
		
		if( window.confirm("您确认要删除该组件吗？") == true ){
			elements.removeId($("#lampId").val());
			$("#lampForm").hide(300);
		}
	});
	
	//----------------------------------------------------------
	//单击【文本编辑表单】中的确定按钮
	$('#addText').click(function(e) {
		var charCheck = new RegExp("^(\\d+)$");
		if( !charCheck.test($("#textX").val()) ){
            alert('[X坐标]必须是整数!');
            $("#textX").focus();
            return;
        }
		if( !charCheck.test($("#textY").val()) ){
            alert('[Y坐标]必须是整数!');
            $("#textY").focus();
            return;
        }
		if( !charCheck.test($("#textW").val()) ){
            alert('[宽度]必须是整数!');
            $("#textW").focus();
            return;
        }
		if( !charCheck.test($("#textH").val()) ){
            alert('[高度]必须是整数!');
            $("#textH").focus();
            return;
        }
		if( !charCheck.test($("#textSize").val()) ){
            alert('[字体大小]必须是整数!');
            $("#textSize").focus();
            return;
        }
		if( window.confirm("您确认要更新该组件吗？") == true ){
			elements.getId($("#textId").val()).clickAdd();
			$("#textForm").hide(300);
		}
	});
	
	//单击【图片编辑表单】中的删除按钮
	$("#deleteText").click(function(e) {
		
		if( window.confirm("您确认要删除该组件吗？") == true ){
			elements.removeId($("#textId").val());
			$("#textForm").hide(300);
		}
	});
	
	//----------------------------------------------------------
	//单击【各种能操作的设备】中的确定按钮
	$('#addOperate').click(function(e) {
		var charCheck = new RegExp("^(\\d+)$");
		if( !charCheck.test($("#operX").val()) ){
            alert('[X坐标]必须是整数!');
            $("#operX").focus();
            return;
        }
		if( !charCheck.test($("#operY").val()) ){
            alert('[Y坐标]必须是整数!');
            $("#operY").focus();
            return;
        }
		if( !charCheck.test($("#operW").val()) ){
            alert('[宽度]必须是整数!');
            $("#operW").focus();
            return;
        }
		if( !charCheck.test($("#operH").val()) ){
            alert('[高度]必须是整数!');
            $("#operH").focus();
            return;
        }
		if( window.confirm("您确认要更新该组件吗？") == true ){
			elements.getId($("#operId").val()).clickAdd();
			$("#operateForm").hide(300);
		}
	});
	
	//单击【手动阀】中的删除按钮
	$("#deleteOperate").click(function(e) {
		
		if( window.confirm("您确认要删除该组件吗？") == true ){
			elements.removeId($("#operId").val());
			$("#operateForm").hide(300);
		}
	});
	
	//------------------------------------------------
	//单击【查询】按钮，将返回的json数据显示到页面上
	$("#search").click(function(e) {
		
		if( $('#station option:selected').val() == '%' || $('#unit option:selected').val() == '%' ){
			alert('请选择对应【热力站】【机组】后再试！');
			//初始化工具栏
			initTools();
			return;
		}
		
		//获得用于选中的【热力站】和机组
		var heatStationId = $('#station option:selected').val();
		var heatUnitId = $('#unit option:selected').val();
		
		//清空页面上的所有元素。
		elements.clear();
		
		//添加一个控制台，用于显示鼠标信息
		var t = new Texts("console",2,5);
		t.width = 200;
		t.textColor = '#FFFFFF';
		elements.add(t);
		
		//添加一个十字辅助线
		var c = new CruciateAuxiliaryLine("line",0,0);
		elements.add(c);
		
		//还原场景
		var rs  = new ReviveScene('design');
		//读取json数据
		rs.requestJson(heatStationId,heatUnitId);
		
		//初始化工具栏
		initTools();
		
		isQuery = true;
		
		//设置2个下拉列表不可编辑
		//$('#station').attr("disabled", "disabled"); 
		//$('#unit').attr("disabled", "disabled");
		
		
		//查询各种【设备类别】一个list。
		$.get("/XMCP/plcControlStationCommonAction!getDeviceList.action",{stationId:heatStationId,unitId:heatUnitId},function(data){
			deviceTyleList = JSON.parse(data);
		});

	
		//查询PLC控制字段选择下拉列表
		$.get("/XMCP/plcControlStationCommonAction!getPointCommandByStation.action",{stationId:heatStationId,unitId:heatUnitId},function(data){
			selectJson = JSON.parse(data);
			$('#columnName').html('');
			$('#columnName').append($("<option value=\"%\">--请选择--</option>")  );  
		    for(var j = 0 ;j< selectJson.length;j++){
		    	var javaKey = selectJson[j].javaKey;
		    	var deviceId = selectJson[j].deviceId;
		    	var deviceName = selectJson[j].deviceName;
		    	var pointName = selectJson[j].pointName;
		    	
		    	//console.log( $("<option value='"+deviceId+"."+javaKey+"'>"+deviceName+"-"+pointName+"</option>") );
		    	$('#columnName').append( $("<option value='"+deviceId+"."+javaKey+"'>"+deviceName+"-"+pointName+"</option>") );  
			}
		});
	
	
	});
	
	//------------------------------------------------
	//单击【站间复制】按钮，将页面上的工艺图信息，保存到所选的站中
	$("#copyStations").click(function(e) {
	   $("#copyForm").show(300);
	});
	// 单击【站间复制】弹出页面中的确认按钮
	$("#copySave").click(function(e) {
	    // 复制多选按钮
	    var copyListJson = "[";
	    var copyCheckboxs = $('input[type=checkbox]');
	    // 遍历所有checkbox
	    for (var idx = 0; idx < copyCheckboxs.length; idx++) {
		    if (eval(copyCheckboxs[idx].checked) == true){//如果已经被选定
				//	copyListJson = copyListJson + ",";
				copyListJson = copyListJson + ",{'copyid':'"+ copyCheckboxs[idx].name + "'}";
	        }
	    }
	    copyListJson = copyListJson + "]";
	    // 
        if( isQuery == false || $('#station option:selected').val() == '%' || $('#unit option:selected').val() == '%' ){
			alert('请查询完对应【热力站】【机组】后再试！');
			//初始化工具栏
			initTools();
			return;
		}
		var result = window.confirm("您确认要复制工艺画图信息吗？");
		if( result == false ){
			//初始化工具栏
			initTools();
			return ;
		}
		var jsonString = "[";
		//遍历所有的元素，生成json格式的数据。
		for(var i=0;i<elements.size();i++){
			var json = elements.get(i).getJson();
			if( elements.get(i).id == 'console' || elements.get(i).id == 'line' ){
				//这个不用保存到表中
				continue;
			}
			jsonString = jsonString + json ;
			if( i < elements.size()-1 ){
				jsonString = jsonString + ",";
			}			
		}
		jsonString = jsonString + "]";
		// alert( jsonString );
		//发起AJAX请求，提交参数
		$.ajax({
			 type: "POST",
			 url: "/XMCP/plcControlStationAction!copyStations.action",
			 data:{contexts:jsonString,copyIdList:copyListJson},
			 dataType: "text",
			 success: function(data){
				 var json = JSON.parse(data);
				 alert( json );
				 jsonString = '';
				//初始化工具栏
				initTools();
			 },
			 error: function (XMLHttpRequest, textStatus, errorThrown) {
				 elements.getId('console').realData = '请求数据出错了!';
	    		//初始化工具栏
	    		initTools();
	         } 
		});
	});
	//-----------------------------------------------------------
	//单击【保存】按钮，将页面上的对象，保存到表中
	$("#save").click(function(e) {
		if( isQuery == false ){
			alert('请查询完对应【热力站】【机组】后再试！');
			//初始化工具栏
			initTools();
			return;
		}
		if( $('#station option:selected').val() == '%' || $('#unit option:selected').val() == '%' ){
			alert('请选择对应【热力站】【机组】后再试！');
			//初始化工具栏
			initTools();
			return;	
		}
		var result = window.confirm("您确认要保存工艺画图信息吗？");
		if( result == false ){
			//初始化工具栏
			initTools();
			return ;
		}
		//获得用于选中的【热力站】和机组
		var heatStationId = $('#station option:selected').val();
		var heatUnitId = $('#unit option:selected').val();
		//alert('保存数据！');
		var jsonString = "[";
		//遍历所有的元素，生成json格式的数据。
		for(var i=0;i<elements.size();i++){
			var json = elements.get(i).getJson();
			if( elements.get(i).id == 'console' || elements.get(i).id == 'line' ){
				//这个不用保存到表中
				continue;
			}
			jsonString = jsonString + json ;
			if( i < elements.size()-1 ){
				jsonString = jsonString + ",";
			}			
		}
		jsonString = jsonString + "]";
		//alert( jsonString );
		//发起AJAX请求，提交参数
		$.ajax({
			 type: "POST",
			 url: "/XMCP/plcControlStationAction!save.action",
			 data:{contexts:jsonString,heatStationId:heatStationId,heatUnitId:heatUnitId},
			 dataType: "text",
			 success: function(data){
				 var json = JSON.parse(data);
				 alert( json );
				 jsonString = '';
				//初始化工具栏
				initTools();
			 },
			 error: function (XMLHttpRequest, textStatus, errorThrown) {
				 elements.getId('console').realData = '请求数据出错了!';
	    		//初始化工具栏
	    		initTools();
	         } 
		});
	});
	
	//------------------------------------------------
	//单击【删除】按钮，将页面上的对象，保存到表中
	$("#delete").click(function(e) {
		
		if( isQuery == false ){
			alert('请查询完对应【热力站】【机组】后再试！');
			//初始化工具栏
			initTools();
			return;
		}
		if( $('#station option:selected').val() == '%' || $('#unit option:selected').val() == '%' ){
			alert('请选择对应【热力站】【机组】后再试！');
			//初始化工具栏
			initTools();
			return;	
		}

		var result = window.confirm("您确认要删除工艺画图信息吗？");
		if( result == false ){
			//初始化工具栏
			initTools();
			return ;
		}
		//获得用于选中的【热力站】和机组
		var heatStationId = $('#station option:selected').val();
		var heatUnitId = $('#unit option:selected').val();


		//发起AJAX请求，提交参数
		$.ajax({
			 type: "POST",
			 url: "/XMCP/plcControlStationAction!delete.action",
			 data:{heatStationId:heatStationId,heatUnitId:heatUnitId},
			 dataType: "text",
			 success: function(data){
				 var json = JSON.parse(data);
				 if( json == '工艺图形数据删除成功!' ){
					 elements.clear();
				 }
				 alert( json );
				//初始化工具栏
				initTools();
			 },
			 error: function (XMLHttpRequest, textStatus, errorThrown) {
				 elements.getId('console').realData = '请求数据出错了!';
	    		//初始化工具栏
	    		initTools();
	         } 

		});
		
	});
	
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
		$("#select").css( {
			'background-color' : '#f58220',
			'padding':'0px 5px 10px 5px',
			'filter' : 'alpha(Opacity=100)',
			'opacity' : 1
		});
	}
	
	/**
	 * 创建界面元素的ID号
	 */
	function createId(){
		
		if( elements.size() == 0 ){
			return 1;
		}
		var max = 0;
		for(var i=0;i<elements.size();i++){
			var ele = elements.get(i);
			var id = ele.id+"";
			if( id == 'console' ){
				continue;
			}
			if( parseInt(id.substring(1)) > max ){
				max = parseInt(id.substring(1));
			}
		}
		return max+1;
	}
	
});