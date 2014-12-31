
/**
 *	复活场景
 *	@author	lsm
 *	@time	2013-05-21
 */
function ReviveScene(model){

	this.model = model;
	this.json = null;

	/**
	 *	获得服务器端的json数据
	 */
	this.requestJson = function(heatStationId,heatUnitId){
	
		//自适应大小
		//windowResize();
		
		$.ajax({
			 type: "POST",
			 url: "/XMCP/plcControlStationAction!query.action",
			 data:{heatStationId:heatStationId,heatUnitId:heatUnitId},
			 dataType: "text",
			 success: function(data){

				 this.json = JSON.parse(data);
				 
				 //alert( "返回的json数据："+ data );
				 //将json创建各种对象
				for(var i=0;i<this.json.length;i++){
					var jsonString = this.json[i].context;
					
					var json = JSON.parse(jsonString);
					var obj = null;
					//alert( json.type );
					switch( json.type ){
						case "Pipeline":
							var p = new Pipeline();
							p.init( json );
							p.setModel( model );
							elements.insert( 0 , p);
							break;
						case "AdjustValve":
							obj = new AdjustValve();
							break;
						case "DiscValve":
							obj = new DiscValve();
							break;
						case "WaterHeatExchanger":
							obj = new WaterHeatExchanger();
							break;
						case "SteamHeatExchanger":
							obj = new SteamHeatExchanger();
							break;
						case "Thermometer":
							obj = new Thermometer();
							break;
						case "WaterFlowmeter":
							obj = new WaterFlowmeter();
							break;
						case "SteamFlowmeter":
							obj = new SteamFlowmeter();
							break;
						case "Decontamination":
							obj = new Decontamination();
							break;
						case "CyclePump":
							obj = new CyclePump();
							break;
						case "SupplyPump":
							obj = new SupplyPump();
							break;				
						case "RawPump":
							obj = new RawPump();
							break;				
						case "ManualValve":
							obj = new ManualValve();
							break;	
						case "Manometer":
							obj = new Manometer();
							break;		
						case "SolenoidValve":
							obj = new SolenoidValve();
							break;			
						case "JointBox":
							obj = new JointBox();
							break;			
						case "WarningLamp":
							obj = new WarningLamp();
							break;
						case "Tank":
							obj = new Tank();
							break;
						case "Cabinet":
							obj = new Cabinet();
							break;
						case "Texts":
							obj = new Texts();
							break;
						case "Rect":
							obj = new Rect();
							break;					
					}
					if( obj != null ){
						obj.init( json );
						obj.setModel( model );
						elements.add(obj);
					}
					
					
					//alert( elements.size() );
				}
				//alert( elements.size() );
			 },
			 error: function (XMLHttpRequest, textStatus, errorThrown) {
				 elements.getId('console').realData = '请求数据出错了!';
	         } 

		});
		//alert('得到json数据：'+this.json);
	}



	/**
	 *	将json数据画出图形
	 */
	this.paintAll = function(){

		if( ctx != null ){
			/*
			//清空画板
			ctx.clearRect(0,0,800,500);

			for(var i=0;i<elements.size();i++){
				var ele = elements.valSet()[i];
				
				//绘制动画下效果
				ele.animation();
				
			}
			*/
			//将背景画板涂黑
			ctx.fillStyle='#000000';
			ctx.fillRect( 0,0,800,500 );	//填充颜色 x y坐标 宽 高
		}

	}
}