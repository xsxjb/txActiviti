
/**
 *	定义一个调阀类
 *	@author	lsm
 *	@time	2013-05-20
 */
function AdjustValve( id,x,y ){

	this.model = 'design';//设定2个模式（design/control）
	this.id = id;
	this.name = '调阀';
	this.type = 'AdjustValve';
	this.title = '标题';

	this.x = x;			//阀门的起始位置（x坐标）
	this.y = y;			//阀门的起始位置（y坐标）
	this.height = 40;	//阀门的高度
	this.width = 35;	//阀门的宽度

	this.moveOver = 0;		//是否可以移入（0：没有边框,1:画边框）

	this.direction = "vertical";//vertical=竖,horizontal=横
	this.deviceId = '%';
	this.bark = new Image();  
	
	this.isPop = 0;	//是否可以弹出编辑页面
	this.win = "/XMCP/genericPlcControlStationStatusAction!queryValve.action";


	/**
	 *	初始化
	 */
	this.init = function( json ){

		if( json != null ){
			this.id = json.id;
			this.name = json.name;
			this.type = json.type;
			this.title = json.title;
			this.title = json.title;
			
			this.direction = json.direction;
			
			this.x = json.x;
			this.y = json.y;
			this.height = json.height;
			this.width = json.width;

			this.deviceId = json.deviceId;
			this.isPop = json.isPop;
		}

		//判断图片是横着还是竖着
		if( this.direction == "horizontal" ){
			this.bark.src = "../../plugin/ibusiness/plc-control/img/tf-h.png";
		}else{
			this.bark.src = "../../plugin/ibusiness/plc-control/img/tf-v.png";
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
			$("#controlIframe").attr("src", this.win+"?heatStationId="+heatStationId+"&heatUnitId="+heatUnitId+"&deviceId="+this.deviceId+"&userId="+userId );
			$("#controlPage").css({top:(canvas.height-550)/2+50 ,left:(canvas.width-600)/2});
			$("#controlPage").css({width:600 ,height:520});
			$("#controlPage").show(300);
		}

	}

	/**
	 *	单击事件（编辑）
	 */
	this.clickEdit = function(mouseX,mouseY){
		//alert( this.id+this.name+'被单击（编辑）!' );
		
		//$("#iconForm").css("display","block");
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
		
		//如果换了方向（横着/竖着）
		if( this.direction != $("#operDirection").val() ){
			var temp = 0;
			
			if( $("#operDirection").val() == "horizontal" ){
				//变为横向
				this.bark.src = "../../plugin/ibusiness/plc-control/img/tf-h.png";
				this.x = parseInt(this.x) + 0 ;
				this.y = parseInt(this.y) + 16;
				temp = this.width;
				this.width = this.height;
				this.height = temp;
			}else{
				//变为竖向
				this.bark.src = "../../plugin/ibusiness/plc-control/img/tf-v.png";
				this.x = parseInt(this.x) - 0;
				this.y = parseInt(this.y) - 16;
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
		//alert('比较是否是阀门！'+ mouseX +","+mouseY);
		if( mouseX >= this.x && mouseX <= (parseInt(this.x)+parseInt(this.width)) && mouseY >= this.y && mouseY<=(parseInt(this.y)+parseInt(this.height)) ){
			return true;
		}
		return false;
	}

	/**
	 *	画出图片
	 */
	this.paint = function(){
		
		//画出图片
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
		return;
	}

	/**
	 *	设置模型
	 */
	this.setModel = function(model){
		this.model = model;
	}
}