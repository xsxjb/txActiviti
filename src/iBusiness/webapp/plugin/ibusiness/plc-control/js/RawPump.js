
/**
 *	定义一个生水泵类
 *	@author	lsm
 *	@time	2013-08-19
 */
function RawPump( id,x,y ){

	this.model = 'design';//设定2个模式（design/control）
	this.id = id;
	this.name = '生水泵';
	this.type = 'RawPump';

	this.title = '标题';
	this.x = x;				//文本的起始位置（x坐标）
	this.y = y;				//文本的起始位置（y坐标）
	
	this.width = 40;		//文本的宽度
	this.height = 35;		//文本的高度
	
	this.direction = "vertical";//vertical=竖,horizontal=横
	
	this.moveOver = 0;		//是否可以移入（0：没有边框,1:画边框）
	
	this.deviceId = '%';
	
	this.bark = new Image();  
	this.status = '未运行';//未运行,运行,故障
	//用于判断是画黑色还是红色
	this.redblack = 1;

	this.isPop = 0;	//是否可以弹出编辑页面
	this.isError = 0;	//是否出错了（1表示出错啦,0表示正常可以查看实时数据）
	this.win = "/XMCP/plcControlStationStatusAction!queryRawPump.action";

	/**
	 *	初始化
	 */
	this.init = function( json ){
		
		if( json != null ){
			this.id = json.id;
			this.name = json.name;
			this.type = json.type;
			this.title = json.title;
			
			this.direction = json.direction;

			this.x = json.x;
			this.y = json.y;
			this.height = json.height;
			this.width = json.width;
			
			this.deviceId = json.deviceId;
			this.isPop = json.isPop;
		}
		
		//判断是横着还是竖着
		if( this.direction == "horizontal" ){
			this.bark.src = "../../../js/icons/bsb1-h-0.png";
		}else{
			this.bark.src = "../../../js/icons/bsb1-v-0.png";
		}
	}
	
	/**
	 *	获得对象的json数据格式
	 */
	this.getJson = function(){
		return "{" +
					"\"id\":\""+this.id+"\"," +
					"\"name\":\""+this.name+"\"," +
					"\"type\":\""+this.type+"\"," +
					"\"title\":\""+this.title+"\"," +
					
					"\"direction\":\""+this.direction+"\"," +
					
					"\"x\":\""+this.x+"\"," +
					"\"y\":\""+this.y+"\"," +
					"\"width\":\""+this.width+"\"," +
					"\"height\":\""+this.height+"\"," +
					
					"\"deviceId\":\""+this.deviceId+"\"," +
					"\"isPop\":\""+this.isPop+"\"" +
				"}";
	}
	
	/**
	 *	根据实时数据更新组件的状态
	 */
	this.updateStatus = function( json ){
		//更新【实时数据】
		try {
			var heatStationId = $('#station option:selected').val();
			var heatUnitId = $('#unit option:selected').val();
			var supplyPumpID = heatStationId+''+heatUnitId+''+this.deviceId;
		
			this.json = json[heatStationId+''+heatUnitId+''+this.deviceId];
			if( this.json == undefined ){
				this.status = '未运行';
				this.isError = 1;
				return;
			}else{
				this.isError = 0;
			}
			
			//console.log( "this.json.circPumpState-->"+ (parseInt(this.json.circPumpState) == 1) );
			if( parseInt(this.json[heatUnitId+'-'+this.deviceId+'-circPumpState']) == 0 ){
				//console.log( "this.json.circPumpFrequency-->"+ parseInt(this.json.circPumpFrequency) );
				//console.log( "this.json.circPumpFrequency-->"+ (parseInt(this.json.circPumpFrequency) >= 5) );
				if( parseInt(this.json[heatUnitId+'-'+this.deviceId+'-circPumpFrequency']) >= 5.0 ){
					this.status = '运行';
				}else{
					this.status = '未运行';
				}
			}else if( parseInt(this.json[heatUnitId+'-'+this.deviceId+'-circPumpState']) >= 1 && parseInt(this.json[heatUnitId+'-'+this.deviceId+'-circPumpFault']) == 0 ){
				this.status = '运行';
			}else if( parseInt(this.json[heatUnitId+'-'+this.deviceId+'-circPumpState']) >= 1 && parseInt(this.json[heatUnitId+'-'+this.deviceId+'-circPumpFault']) >= 1 ){
				this.status = '故障';
			}
	　　} catch(err) {
			this.status = '未运行';
			this.isError = 1;
	　　}

	}
	
	/**
	 *	鼠标移入事件
	 */
	this.mousemove = function( mouseX,mouseY ){
		
		ctx.strokeStyle="#FFFFFF";
		ctx.strokeRect( parseInt(this.x)-5, parseInt(this.y)-5, parseInt(this.width)+10, parseInt(this.height)+10 , false ); 

	}
	
	/**
	 *	单击事件
	 */
	this.clickView = function( mouseX,mouseY ){
		
		if( this.isPop == 1 && this.model == 'control' ){
			var heatStationId = $('#station option:selected').val();
			var heatUnitId = $('#unit option:selected').val();
			
			if( heatStationId == "%" || heatStationId == "" ){
				alert("请确认您选的【换热站】,不然会发错命令！");
				return;
			}
			
			if( this.isError == 0 ){
				var url = this.win+"?heatStationId="+heatStationId+"&heatUnitId="+heatUnitId+"&deviceId="+this.deviceId+"&r="+Math.random()+"&userId="+userId;;
				
				$("#controlIframe").attr("src", url );
				
				if( "/XMCP/plcControlStationStatusAction!queryRawPump.action" == this.win ){
					$("#controlPage").css({top:(canvas.height-350)/2+50 ,left:(canvas.width-550)/2});
					$("#controlPage").css({width:550 ,height:290});
				}else{
					$("#controlPage").css({top:(canvas.height-400)/2+50 ,left:(canvas.width-600)/2});
					$("#controlPage").css({width:560 ,height:360});
				}
	
				$("#controlPage").show(300);
			}else{
				alert('没有配置这个生水泵，不能控制！');
			}
			
		}

		//alert( this.id+this.name+'被单击（显示）!' );
	}

	/**
	 *	单击事件（编辑）
	 */
	this.clickEdit = function(mouseX,mouseY){
		//alert( this.id+this.name+'被单击（编辑）!' );
		
		$("#operateForm").css({top:mouseY + canvas.offsetTop ,left: mouseX + canvas.offsetLeft});
		$("#operateForm").show(300);
		
		//alert(  this.x );
		$("#operId").attr("value",this.id);
		$("#operIsPop").attr("value",this.isPop);
		
		var selectType = "";
		for(var j = 0 ;j< deviceTyleList.length;j++){
			var deviceId = deviceTyleList[j].deviceId;
			var deviceName = deviceTyleList[j].deviceName;
			selectType = selectType+"<option value=\""+deviceId+"\" "+(this.deviceId==deviceId?'selected':'')+">"+deviceName+"</option>";
		}
		$("#deviceId").html( selectType );
		
		$("#operX").attr("value",this.x);
		$("#operY").attr("value",this.y);
		$("#operW").attr("value",this.width);
		$("#operH").attr("value",this.height);
		
		$("#operDirection").attr("value",this.direction);
	}
	
	/**
	 *	单击事件（新加&编辑）
	 */
	this.clickAdd = function(){
		this.id = $("#operId").val();
		this.x = $("#operX").val();
		this.y = $("#operY").val();
		this.width = $("#operW").val();
		this.height = $("#operH").val();

		this.deviceId = $("#deviceId").val();
		this.isPop = $("#operIsPop").val();
		
		for(var j = 0 ;j< deviceTyleList.length;j++){
			if( deviceTyleList[j].deviceId == this.deviceId ){
				this.name = deviceTyleList[j].deviceName;
			}
		}
		
		//图片改变方向（横向/竖向）
		if( this.direction != $("#operDirection").val() ){
			var temp = 0;
			
			if( $("#operDirection").val() == "horizontal" ){
				//变为横向
				this.bark.src = "../../../js/icons/bsb1-h-0.png";
				this.x = parseInt(parseInt(this.x) + parseInt(this.width)/2 - parseInt(this.height)/2)+5;
				this.y = parseInt(parseInt(this.y) + parseInt(this.height)/2 - parseInt(this.width)/2);
				temp = this.width;
				this.width = this.height;
				this.height = temp;
			}else{
				//变为竖向
				this.bark.src = "../../../js/icons/bsb1-v-0.png";
				this.x = parseInt(parseInt(this.x) + parseInt(this.width)/2 - parseInt(this.height)/2)-5;
				this.y = parseInt(parseInt(this.y) + parseInt(this.height)/2 - parseInt(this.width)/2);
				temp = this.width;
				this.width = this.height;
				this.height = temp;
			}
		}
		this.direction = $("#operDirection").val();
		
		$("#operateForm").hide(300);
	}
	
	/**
	 *	判断单击的是自己吗
	 */
	this.clickRange = function( mouseX,mouseY ){
		//alert('比较是否是文字！'+ mouseX +","+mouseY);
		if( mouseX >= this.x && mouseX <= (parseInt(this.x)+parseInt(this.width)) && mouseY >= this.y && mouseY<=(parseInt(this.y)+parseInt(this.height)) ){
			return true;
		}
		return false;
	}

	/**
	 *	画出管道
	 */
	this.paint = function(){

		//ctx.fillRect( this.x, this.y, this.width, this.height  );  //填充颜色 x y坐标 宽 高
		ctx.drawImage( this.bark, this.x, this.y, this.width, this.height ); 

		//画出边线、
		if( this.model == 'design' ){
			if( this.isPop == 1 ){
				ctx.strokeStyle="#FFFFFF";
				ctx.strokeRect( parseInt(this.x)-5, parseInt(this.y)-5, parseInt(this.width)+10, parseInt(this.height)+10 , false );
			}
		}else{
			if( this.isPop == 1 && this.moveOver == 1 ){
				ctx.strokeStyle="#FFFFFF";
				ctx.strokeRect( parseInt(this.x)-5, parseInt(this.y)-5, parseInt(this.width)+10, parseInt(this.height)+10 , false );
			}
		}
	}


	/**
	 *	动画效果
	 */
	this.animation = function(){

		this.paint();
		var dir = "v";
		if( this.direction == 'vertical' ){
			dir = "v";
		}else{
			dir = "h";
		}
		
		if( this.status == '故障' ){
			if( this.redblack == 1 ){
				this.bark.src = "../../../js/icons/bsb1-"+dir+"-2.png";
				this.redblack = 0;
			}else{
				this.bark.src = "../../../js/icons/bsb1-"+dir+"-1.png";
				this.redblack = 1;
			}
		}else if( this.status == '运行'  ){
			this.bark.src = "../../../js/icons/bsb1-"+dir+"-1.png";
		}else if( this.status == '未运行'  ){
			this.bark.src = "../../../js/icons/bsb1-"+dir+"-0.png";
		}
		
		return;
	}

	/**
	 *	设置模型
	 */
	this.setModel = function(model){
		this.model = model;
	}
}