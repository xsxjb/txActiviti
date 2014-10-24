
/**
 *	定义一个文本类
 *	@author	lsm
 *	@time	2013-05-21
 */
function Texts(	id,x,y ){
	
	this.model = 'design';//设定2个模式（design/control）
	this.id = id;
	this.name = '文本';
	this.type = 'Texts';

	this.title= '文字内容';
	this.realData = '-';	//显示的实时数据
	this.columnName = '%';
	this.textColor = 'red';
	this.size = 20;
	this.unit = '';
	this.align = 'left';	//水平对齐方式（left/right）
	
	this.moveOver = 0;		//是否可以移入（0：没有移入,1:可以移入）

	
	this.x = x;				//文本的起始位置（x坐标）
	this.y = y;				//文本的起始位置（y坐标）
	this.height = 15;		//文本的高度
	this.width = 100;		//文本的宽度

	this.isPop = 1;	//是否可以弹出编辑页面
	this.isError = 0;	//是否出错了（1表示出错啦,0表示正常可以查看实时数据）
	this.win = "/XMCP/jsp/plc-control/station/page/textRecord.jsp";

	/**
	 *	初始化
	 */
	this.init = function( json ){
		
		if( this.columnName == '%' ){
			this.realData = this.title;
		}
		
		if( json != null ){
			this.id = json.id;
			this.name = json.name;
			this.type = json.type;
			this.title = json.title;
			
			this.realData = json.realData;
			this.size = json.size;
			this.columnName = json.columnName;
			this.textColor = json.textColor;
			this.unit = json.unit;
			this.align = json.align;
			
			
			this.x = json.x;
			this.y = json.y;
			this.height = json.height;
			this.width = json.width;
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
					
					"\"realData\":\""+this.realData+"\"," +
					"\"size\":\""+this.size+"\"," +
					"\"columnName\":\""+this.columnName+"\"," +
					"\"textColor\":\""+this.textColor+"\"," +
					"\"unit\":\""+this.unit+"\"," +
					"\"align\":\""+this.align+"\"," +
					
					"\"x\":\""+this.x+"\"," +
					"\"y\":\""+this.y+"\"," +
					"\"width\":\""+this.width+"\"," +
					"\"height\":\""+this.height+"\"" +
					
				"}";
	}
	
	/**
	 *	根据实时数据更新组件的状态
	 */
	this.updateStatus = function( json ){
		try {

			if( this.columnName != '%' ){
				
					
				//更新热力站【实时数据】
				var key = this.columnName.substring(0, this.columnName.indexOf(".") );
				var type = this.columnName.substring(0, 1);
				var value = this.columnName.substring(this.columnName.indexOf(".")+1 );
				var heatStationId = $('#station option:selected').val();
				var heatUnitId = $('#unit option:selected').val();
				var id = heatStationId+''+heatUnitId+''+key;
				
				if( type == "s" ){
					//更新【实时数据】
					this.realData = json[''+heatStationId]['null-null-'+value] ;
					if( this.realData != 'undefined' && this.realData != null ){
						this.isError = 0;
					}else{
						this.realData = title;
						this.isError = 1;
					}
				}else if( type == "u" ){
					//更新【实时数据】
					this.realData = json[heatStationId+''+heatUnitId][heatUnitId+'-null-'+value]  ;
					if( this.realData != 'undefined' && this.realData != null ){
						this.isError = 0;
					}else{
						this.realData = title;
						this.isError = 1;
					}
				}else if( type == "X" ){
					this.realData = json[heatStationId+''+heatUnitId+''+key][heatUnitId+'-'+key+'-'+value];
					if( this.realData != 'undefined' && this.realData != null ){
						this.isError = 0;
					}else{
						this.realData = title;
						this.isError = 1;
					}
				}else if( type == "B" ){
					this.realData = json[heatStationId+''+heatUnitId+''+key][heatUnitId+'-'+key+'-'+value];
					if( this.realData != 'undefined' && this.realData != null ){
						this.isError = 0;
					}else{
						this.realData = title;
						this.isError = 1;
					}
				}else if( type == "V" ){
					this.realData = json[heatStationId+''+heatUnitId+''+key][heatUnitId+'-'+key+'-'+value];
					if( this.realData != 'undefined' && this.realData != null ){
						this.isError = 0;
					}else{
						this.realData = title;
						this.isError = 1;
					}
				}
				
			}
	　　} catch(err) {
			
	　　}
	}
	/**
	 *	鼠标移入事件
	 */
	this.mousemove = function( mouseX,mouseY ){
		
		if( this.columnName != '%' ){
			ctx.strokeStyle="#FFFFFF";
			ctx.strokeRect( parseInt(this.x)-5, parseInt(this.y)-5, parseInt(this.width)+10, parseInt(this.height)+10 , false ); 	
		}

	}
	/**
	 *	单击事件
	 */
	this.clickView = function( mouseX,mouseY ){
		
		if( this.columnName != "%" ){
			
			
			//这个功能还没有做,暂时先不弹出
			var heatStationId = $('#station option:selected').val();
			var heatUnitId = $('#unit option:selected').val();
			
			if( heatStationId == "%" || heatStationId == "" ){
				alert("请确认您选的【换热站】,不然会发错命令！");
				return;
			}
			
			if( this.isError == 0 ){
				//window.open( this.win+"?heatStationId="+heatStationId+"&heatUnitId="+heatUnitId+"&columnName="+this.columnName+"&userId="+userId  );
	
				var url = this.win+"?heatStationId="+heatStationId+"&heatUnitId="+heatUnitId+"&columnName="+this.columnName+"&userId="+userId ;
				//alert( url );
	
				$("#realTimeLiveCurveIframe").attr("src", url );
	
				$("#realTimeLiveCurve").css({top:(canvas.height-500)/2+50 ,left:(canvas.width-770)/2});
				$("#realTimeLiveCurve").css({width:770 ,height:500});
				$("#realTimeLiveCurve").show(300);
			}else{
			
				alert('当前实时数据中没有这个数据，不能显示！');
			}

			
		}
		
	}

	/**
	 *	单击事件（编辑）
	 */
	this.clickEdit = function(mouseX,mouseY){
		//alert( this.id+this.name+'被单击（编辑）!' );

		//1.弹出属性修改页面
		$("#textForm").css({top:mouseY + canvas.offsetTop ,left: mouseX + canvas.offsetLeft});
		$("#textForm").show(300);
		
		//2.初始化下拉列表
		if( selectJson != null ){
			//alert( selectJson.length );
			$("#showSearchBar").hide();
			//清空数据
			$("#searchText").val('');
			$('#columnName').html('');
			
			$('#columnName').append($("<option value=\"%\">--请选择--</option>")  );  
			for(var j = 0 ;j< selectJson.length;j++){
		    	var javaKey = selectJson[j].javaKey;
		    	var deviceId = selectJson[j].deviceId;
		    	var deviceName = selectJson[j].deviceName;
		    	var pointName = selectJson[j].pointName;

				if( this.model == 'design' ){
					$('#columnName').append($("<option value=\""+deviceId+"."+javaKey+"\">"+deviceName+"-"+pointName+"</option>")  );
				}else{
					$('#columnName').append($("<option value=\""+deviceId+"."+javaKey+"\">"+deviceName+"-"+pointName+"</option>")  );
				}
		    	
			}
		}
							

		//3.初始化页面上的数据
		//alert(  this.x );
		$("#textId").attr("value",this.id);
		$("#textN").attr("value",this.name);
		$("#textX").attr("value",this.x);
		$("#textY").attr("value",this.y);
		$("#textW").attr("value",this.width);
		$("#textH").attr("value",this.height);

		$("#textColor").attr("value",this.textColor);
		$("#textColor").css("background",this.textColor);
		
		$("#textUnit").attr("value",this.unit);
		$("#textSize").attr("value",this.size);
		$("#textAlign").attr("value",this.align);
		
		$("#textTitle").attr("value",this.title);
		$("#columnName").attr("value",this.columnName);
		//this.realData = this.title;
	}
	
	/**
	 *	单击事件（新加&编辑）
	 */
	this.clickAdd = function(){
		this.id = $("#textId").val();
		this.name = $("#textN").val();
		this.x = $("#textX").val();
		this.y = $("#textY").val();
		this.width = $("#textW").val();
		this.height = $("#textH").val();
		this.textColor = $("#textColor").val();
		this.size = $("#textSize").val();
		this.title = $("#textTitle").val();
		this.columnName = $("#columnName").val();
		this.unit = $("#textUnit").val();
		this.align = $("#textAlign").val();
		
		if( this.columnName == "%" ){
			this.realData = this.title;
		}else{
			
			if( this.title == '' ){
				this.realData = $("#columnName").find("option:selected").text(); 
				this.title = $("#columnName").find("option:selected").text(); 
			}else{
				this.realData = this.title;
			}
		}
		
		$("#textForm").hide(300);
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
	 *	画出文字
	 */
	this.paint = function(){

		if( this.isError == 1 ){
			//如果出错了，这个文字就不显示了
			return;
		}
		var offX = 0;//偏移位置（右对齐时x坐标可能会偏右）
		if( this.align == 'left' ){
			offX = 0;
		}else if( this.align == 'right' ){
			var realWidth = ((this.realData+'').length+this.unit.length)*10+20;
			offX = parseInt(this.width)-parseInt(realWidth);
		}else if( this.align == 'center' ){
			var realWidth = ((this.realData+'').length+this.unit.length)*10+20;
			offX = (parseInt(this.width)-parseInt(realWidth))/2;
		}
		
		//输出文字
		ctx.fillStyle=this.textColor;  //边框颜色
		ctx.font="normal "+this.size+"px 宋体";
		ctx.fillText( this.realData , parseInt(this.x)+5+offX,parseInt(this.y)+10+5 ,parseInt(this.width), parseInt(this.height)  );
		
		if( this.model == 'control' && this.columnName != '%' ){
			
			var x = this.realData+'';
			//输出单位
			ctx.fillStyle='green';  //边框颜色
			var off = parseInt(this.size)*10/20;
			ctx.fillText( this.unit , parseInt(this.x)+7+x.length*off+offX,parseInt(this.y)+10+5  );
			
			//画出边框（当鼠标移动到文字上面的时候，显示边框和提示标题）
			if( this.isPop == 1 && this.moveOver == 1 ){
				//1.画出边框
				ctx.strokeStyle="#FFFFFF";
				ctx.strokeRect( parseInt(this.x)-5+offX, parseInt(this.y)-5, (x.length+this.unit.length)*10+20, parseInt(this.height)+10 , false ); 	
			
				//2.提示标题
				if( this.realData != this.title ){
					ctx.fillStyle='yellow';  //标题颜色
					ctx.fillText( this.title , parseInt(this.x)-5+offX,parseInt(this.y)-10   );
				}
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