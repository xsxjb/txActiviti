
/**
 * 利用AJAX返回的json更新控制页面上的实时数据
 * @author lsm
 */
function updateRealData( json ){
	//---------第一层设置页面----------------------------------------------------------------------------
	// TODO 第一层设置页面
	var temp0=$("#controlIframe").is(":visible");//判断是否隐藏/可见
	if( temp0 == true ){
		//alert( '可见' );
		
		//利用AJAX返回的json更新控制页面上的实时数据
		update( json );
	}
	
	//-----第一个子窗口----------------------------------------------------------------------------------------------------------------------
	// TODO 第一个子窗口
	var temp1=$("#settingIframe1").is(":visible");//判断是否隐藏/可见
	if( temp1 == true ){
		
		//利用AJAX返回的json更新控制页面上的实时数据
		updateSettingIframe1( json );
	}
	
	//-----第二个子窗口----------------------------------------------------------------------------------------------------------------------
	// TODO 第二个子窗口
	var temp2=$("#settingIframe2").is(":visible");//判断是否隐藏/可见
	if( temp2 == true ){
		//利用AJAX返回的json更新控制页面上的实时数据
		updateSettingIframe2( json );
	}
}
	
/**
 *	更新当前页面
 */
function update( json ){

	
	//获得所有含有key属性的文本框
	var inputs = $("#controlIframe").contents().find("input[type='text'][realData]");
	for(var i=0;i<inputs.length;i++){
		var input = inputs[i];
		var key = $(input).attr('realData');
		if( key.indexOf('-') == -1 ){
			$(input).val( getData( json , key ) );
		}else{
			var keys = key.split('-');
			var a1 = getData( json , keys[0] );
			var a2 = getData( json , keys[1] );
			var value = Number(a1-a2);
			$(input).val( value.toFixed(2) );
		}
	}
	
	//获得所有含有key属性的状态灯
	var imgs = $("#controlIframe").contents().find("img[realData]");
	for(var i=0;i<imgs.length;i++){
		var img = imgs[i];
		var key = $(img).attr('realData');
		var shine = $(img).attr('shine');
		var value = $(img).attr('value');
		//var a = key.substring(0, key.lastIndexOf(".") );
		//var b = key.substring(key.lastIndexOf(".")+1 );
		

		//console.log( key+"-->"+getData( json , key )  );
		if( shine == 'yes' ){
			if( getData( json , key )*1.0 == value*1.0 ){
				
				$(img).show();
			}else{
				$(img).hide();
			}
		}else{
			if( getData( json , key )*1.0 != value*1.0 ){
				
				$(img).show();
			}else{
				$(img).hide();
			}
		}
	}
	//获得所有含有key属性的按钮
	//var buttons = $("#controlIframe").contents().find("input[type='button'][realData]");
}


/**
 * 更新当前SettingIframe1页面
 */
function updateSettingIframe1( json ){
	//获得所有含有key属性的文本框
	var inputs = $("#settingIframe1").contents().find("input[type='text'][realData]");
	for(var i=0;i<inputs.length;i++){
		var input = inputs[i];
		var key = $(input).attr('realData');
		if( key.indexOf('-') == -1 ){
			$(input).val( getData( json , key ) );
		}else{
			var keys = key.split('-');
			var a1 = getData( json , keys[0] );
			var a2 = getData( json , keys[1] );
			var value = Number(a1-a2);
			$(input).val( value.toFixed(2) );
		}
	}
	//获得所有含有key属性的状态灯
	var imgs = $("#settingIframe1").contents().find("img[realData]");
	for(var i=0;i<imgs.length;i++){
		var img = imgs[i];
		var key = $(img).attr('realData');
		var shine = $(img).attr('shine');
		var value = $(img).attr('value');
		if( shine == 'yes' ){
			if( getData( json , key )*1.0 == value*1.0 ){
				$(img).show();
			}else{
				$(img).hide();
			}
		}else{
			if( getData( json , key )*1.0 != value*1.0 ){
				$(img).show();
			}else{
				$(img).hide();
			}
		}
	}
}
/**
 * 更新当前SettingIframe2页面
 */
function updateSettingIframe2( json ){
	//获得所有含有key属性的文本框
	var inputs = $("#settingIframe2").contents().find("input[type='text'][realData]");
	for(var i=0;i<inputs.length;i++){
		var input = inputs[i];
		var key = $(input).attr('realData');
		if( key.indexOf('-') == -1 ){
			$(input).val( getData( json , key ) );
		}else{
			var keys = key.split('-');
			var a1 = getData( json , keys[0] );
			var a2 = getData( json , keys[1] );
			var value = Number(a1-a2);
			$(input).val( value.toFixed(2) );
		}
	}
	//获得所有含有key属性的状态灯
	var imgs = $("#settingIframe2").contents().find("img[realData]");
	for(var i=0;i<imgs.length;i++){
		var img = imgs[i];
		var key = $(img).attr('realData');
		var shine = $(img).attr('shine');
		var value = $(img).attr('value');
		if( shine == 'yes' ){
			if( getData( json , key )*1.0 == value*1.0 ){
				$(img).show();
			}else{
				$(img).hide();
			}
		}else{
			if( getData( json , key )*1.0 != value*1.0 ){
				$(img).show();
			}else{
				$(img).hide();
			}
		}
	}
}

/**
 *	根据key值获得实时数据中的数据
 */
function getData( json , key ){

	var heatStationId = $('#station option:selected').val();
	var heatUnitId = $('#unit option:selected').val();
	
	//realData="X1.circPumpFreqGiven"
	//a='X1'
	//b='circPumpFreqGiven'
	var a = key.substring(0, key.indexOf(".") );
	var b = key.substring(key.indexOf(".")+1 );
	
	switch( a.substring(0,1) ){
		case 's':
		
		return json[''+heatStationId]['null-null-'+b] ;
		break;
		case 'u':
		
		return json[heatStationId+''+heatUnitId][heatUnitId+'-null-'+b] ;
		break;
		case 'X':
		
		return json[heatStationId+''+heatUnitId+''+a][heatUnitId+'-'+a+'-'+b] ;
		break;
		case 'B':
		
		return json[heatStationId+''+heatUnitId+''+a][heatUnitId+'-'+a+'-'+b] ;
		break;
		case 'V':
		
		return json[heatStationId+''+heatUnitId+''+a][heatUnitId+'-'+a+'-'+b] ;
		break;
		default:
		return 0 ;
		break;
	}
}
	

	