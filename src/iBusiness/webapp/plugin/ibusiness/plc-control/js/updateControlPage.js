
	/**
	 * 利用AJAX返回的json更新控制页面上的实时数据
	 * @author lsm
	 */
	function updateControlPage( json ){
		
		//---------第一层设置页面----------------------------------------------------------------------------
		// TODO 第一层设置页面
		var temp0=$("#controlIframe").is(":visible");//判断是否隐藏/可见
		if( temp0 == true ){
			//alert( '可见' );
			var src = $("#controlIframe").attr("src");
			var p = src.lastIndexOf("?");
			var fileName = null;
			if( p == -1 ){
				fileName = src.substring( src.lastIndexOf("/")+1  );
			}else{
				fileName = src.substring( src.lastIndexOf("/")+1 , src.lastIndexOf("?") );
			}
			
			switch( fileName ){
			case 'plcControlStationStatusAction!queryCyclePump.action'://循环泵
				if( $("#controlIframe").contents().find("#deviceId").length <= 0 ) return;
				var deviceId = $("#controlIframe").contents().find("#deviceId").val();
				var heatStationId = $('#station option:selected').val();
				var heatUnitId = $('#unit option:selected').val();
				var circPumpID = heatStationId+''+heatUnitId+''+deviceId;
				
				
				//频率控制
				if( $("#controlIframe").contents().find("#circPumpFreqGivenValue").length > 0 ){
					$("#controlIframe").contents().find("#circPumpFreqGivenValue").val( json.u.circPumpMap[circPumpID].circPumpFreqGiven );
				}
				
				//压差控制
				if( $("#controlIframe").contents().find("#circPumpPressGivenValue").length > 0 ){
					$("#controlIframe").contents().find("#circPumpPressGivenValue").val( json.u.circPumpMap[circPumpID].circPumpPressGiven );
				}
				
				//温差控制
				if( $("#controlIframe").contents().find("#circPumpTempGivenValue").length > 0 ){
					$("#controlIframe").contents().find("#circPumpTempGivenValue").val( json.u.circPumpMap[circPumpID].circPumpTempGiven );
				}
				
				
				//当前频率
				$("#controlIframe").contents().find("#circPumpFrequency").val( json.u.circPumpMap[circPumpID].circPumpFrequency );
				//电机电流
				$("#controlIframe").contents().find("#circPumpCurrent").val( json.u.circPumpMap[circPumpID].circPumpCurrent );
				//供水压力
				$("#controlIframe").contents().find("#supplyPress").val( json.s.supplyPress );
				//回水压力
				$("#controlIframe").contents().find("#backWaterPress").val( json.s.backWaterPress );
				//供回压差
				$("#controlIframe").contents().find("#supplyPress_backPress").val( json.s.supplyPress - json.s.backWaterPress );
				
				//下面控制8个灯
				//运行灯
				if( json.u.circPumpMap[circPumpID].circPumpState == 1 ){
					$("#controlIframe").contents().find("#a1").show();
					$("#controlIframe").contents().find("#b1").hide();
				}else{
					$("#controlIframe").contents().find("#a1").hide();
					$("#controlIframe").contents().find("#b1").show();	
				}
				//故障灯
				if( json.u.circPumpMap[circPumpID].circPumpFault == 1 ){
					$("#controlIframe").contents().find("#a2").show();
					$("#controlIframe").contents().find("#b2").hide();
				}else{
					$("#controlIframe").contents().find("#a2").hide();
					$("#controlIframe").contents().find("#b2").show();	
				}
				//通讯灯
				if( json.u.circPumpMap[circPumpID].circPumpMessageState == 1 ){
					$("#controlIframe").contents().find("#a3").show();
					$("#controlIframe").contents().find("#b3").hide();
				}else{
					$("#controlIframe").contents().find("#a3").hide();
					$("#controlIframe").contents().find("#b3").show();	
				}
				
				//频率控制灯
				if( $("#controlIframe").contents().find("#c21").length > 0 ){
					//判断是否存在
					if( json.u.circPumpMap[circPumpID].circPumpControlSele == $("#controlIframe").contents().find("#c21").val() ){
						$("#controlIframe").contents().find("#a4").show();
						$("#controlIframe").contents().find("#b4").hide();
					}else{
						$("#controlIframe").contents().find("#a4").hide();
						$("#controlIframe").contents().find("#b4").show();	
					}
				}

				//压差控制灯
				if( $("#controlIframe").contents().find("#c22").length > 0 ){
					//判断是否存在
					if( json.u.circPumpMap[circPumpID].circPumpControlSele == $("#controlIframe").contents().find("#c22").val() ){
						$("#controlIframe").contents().find("#a5").show();
						$("#controlIframe").contents().find("#b5").hide();
					}else{
						$("#controlIframe").contents().find("#a5").hide();
						$("#controlIframe").contents().find("#b5").show();	
					}	
				}

				//温差控制灯
				if( $("#controlIframe").contents().find("#c23").length > 0 ){
					//判断是否存在
					if( json.u.circPumpMap[circPumpID].circPumpControlSele == $("#controlIframe").contents().find("#c23").val() ){
						$("#controlIframe").contents().find("#a6").show();
						$("#controlIframe").contents().find("#b6").hide();
					}else{
						$("#controlIframe").contents().find("#a6").hide();
						$("#controlIframe").contents().find("#b6").show();	
					}
				}

				//有效
				if( $("#controlIframe").contents().find("#a9").length > 0 ){
					//有效灯(1=有效)
					if( json.u.circPumpMap[circPumpID].circPumpSelect == 1 ){
						$("#controlIframe").contents().find("#a9").show();
						$("#controlIframe").contents().find("#b9").hide();
					}else{
						$("#controlIframe").contents().find("#a9").hide();
						$("#controlIframe").contents().find("#b9").show();	
					}
				}
				//无效
				if( $("#controlIframe").contents().find("#a10").length > 0 ){
					//有效灯(1=有效)
					if( json.u.circPumpMap[circPumpID].circPumpSelect == 0 ){
						$("#controlIframe").contents().find("#a10").show();
						$("#controlIframe").contents().find("#b10").hide();
					}else{
						$("#controlIframe").contents().find("#a10").hide();
						$("#controlIframe").contents().find("#b10").show();	
					}
				}
				
				//$("#controlIframe").contents().find("#circPumpControlSele").val( json.u.circPumpMap[circPumpID].circPumpControlSele );
				
				//连锁状态(吉林江南项目没有这些)
				/*
				if( deviceId == 'X1' ){
					if( json.u.circPumpProtect1 == 1 ){
						$("#controlIframe").contents().find("#a7").show();
						$("#controlIframe").contents().find("#b7").hide();
					}else{
						$("#controlIframe").contents().find("#a7").hide();
						$("#controlIframe").contents().find("#b7").show();	
					}
				}else if( deviceId == 'X2' ){
					if( json.u.circPumpProtect2 == 1 ){
						$("#controlIframe").contents().find("#a7").show();
						$("#controlIframe").contents().find("#b7").hide();
					}else{
						$("#controlIframe").contents().find("#a7").hide();
						$("#controlIframe").contents().find("#b7").show();	
					}	
				}else if( deviceId == 'X3' ){
					if( json.u.circPumpProtect3 == 1 ){
						$("#controlIframe").contents().find("#a7").show();
						$("#controlIframe").contents().find("#b7").hide();
					}else{
						$("#controlIframe").contents().find("#a7").hide();
						$("#controlIframe").contents().find("#b7").show();	
					}
				}
	
				//时序状态灯
				if( json.u.circPumpMap[circPumpID].circPumpInput == 1 ){
					$("#controlIframe").contents().find("#a8").show();
					$("#controlIframe").contents().find("#b8").hide();
				}else{
					$("#controlIframe").contents().find("#a8").hide();
					$("#controlIframe").contents().find("#b8").show();	
				}
				*/
				break;
			case 'plcControlStationStatusAction!querySupplyPump.action'://补水泵
				if( $("#controlIframe").contents().find("#deviceId").length <= 0 ) return;
			
				var deviceId = $("#controlIframe").contents().find("#deviceId").val();
				var index = Number(deviceId.substring( 1 ))-1;
				
				var heatStationId = $('#station option:selected').val();
				var heatUnitId = $('#unit option:selected').val();
				var supplyPumpID = heatStationId+''+heatUnitId+''+deviceId;
				
				//频率控制
				$("#controlIframe").contents().find("#supplyPumpFreqGivenValue").val( json.u.supplyPumpMap[supplyPumpID].supplyPumpFreqGiven );
				//压差控制
				$("#controlIframe").contents().find("#supplyPumpPressGivenValue").val( json.u.supplyPumpMap[supplyPumpID].supplyPumpPressGiven );
	
				//电机频率
				$("#controlIframe").contents().find("#supplyPumpFrequency").val( json.u.supplyPumpMap[supplyPumpID].supplyPumpFrequency );
				//电机电流
				$("#controlIframe").contents().find("#supplyPumpCurrent").val( json.u.supplyPumpMap[supplyPumpID].supplyPumpCurrent );
				//补水压力
				if( $("#controlIframe").contents().find("#control1").val() == 1 ){
					$("#controlIframe").contents().find("#backWaterPress").val( json.u.backWaterPress );
				}else{
					$("#controlIframe").contents().find("#pointPressure").val( json.u.pointPressure );
				}
				
				//下面有6个灯
				//运行灯
				if( json.u.supplyPumpMap[supplyPumpID].supplyPumpStatet == 1 ){
					$("#controlIframe").contents().find("#a1").show();
					$("#controlIframe").contents().find("#b1").hide();
				}else{
					$("#controlIframe").contents().find("#a1").hide();
					$("#controlIframe").contents().find("#b1").show();	
				}
				//故障灯
				if( json.u.supplyPumpMap[supplyPumpID].supplyPumpFault == 1 ){
					$("#controlIframe").contents().find("#a2").show();
					$("#controlIframe").contents().find("#b2").hide();
				}else{
					$("#controlIframe").contents().find("#a2").hide();
					$("#controlIframe").contents().find("#b2").show();	
				}
				//通讯灯
				if( json.u.supplyPumpMap[supplyPumpID].supplyPumpMessageState == 1 ){
					$("#controlIframe").contents().find("#a3").show();
					$("#controlIframe").contents().find("#b3").hide();
				}else{
					$("#controlIframe").contents().find("#a3").hide();
					$("#controlIframe").contents().find("#b3").show();	
				}
				
				//频率控制灯
				if( json.u.supplyPumpMap[supplyPumpID].supplyPumpControlSele == $("#controlIframe").contents().find("#c21").val() ){
					$("#controlIframe").contents().find("#a4").show();
					$("#controlIframe").contents().find("#b4").hide();
				}else{
					$("#controlIframe").contents().find("#a4").hide();
					$("#controlIframe").contents().find("#b4").show();	
				}
				//压差控制灯
				if( json.u.supplyPumpMap[supplyPumpID].supplyPumpControlSele == $("#controlIframe").contents().find("#c22").val() ){
					$("#controlIframe").contents().find("#a5").show();
					$("#controlIframe").contents().find("#b5").hide();
				}else{
					$("#controlIframe").contents().find("#a5").hide();
					$("#controlIframe").contents().find("#b5").show();	
				}	
				
				//连锁状态灯
				if( eval('json.u.supplyPumpProtect'+(index+1)) == 1 ){
					$("#controlIframe").contents().find("#a6").show();
					$("#controlIframe").contents().find("#b6").hide();
				}else{
					$("#controlIframe").contents().find("#a6").hide();
					$("#controlIframe").contents().find("#b6").show();	
				}	
				
				break;
			case 'plcControlStationStatusAction!queryRawPump.action'://生水泵
				
				//生水箱液位低停生水泵
				$("#controlIframe").contents().find("#rawWaterStopRawWaterPump").val( json.s.rawWaterStopRawWaterPump );
				//软水箱液位低停生水泵
				$("#controlIframe").contents().find("#softWaterLowRawWaterPump").val( json.s.softWaterLowRawWaterPump );
				//软水箱液位高停生水泵
				$("#controlIframe").contents().find("#softWaterHighRawWaterPump").val( json.s.softWaterHighRawWaterPump );
				
				
				//下面有3个灯
				//运行灯
				if( json.s.rawWaterPumpState == 1 ){
					$("#controlIframe").contents().find("#a1").show();
					$("#controlIframe").contents().find("#b1").hide();
				}else{
					$("#controlIframe").contents().find("#a1").hide();
					$("#controlIframe").contents().find("#b1").show();	
				}
				//手动控制灯
				if( json.s.rawWaterPumpHandAuto == $("#controlIframe").contents().find("#c21").val() ){
					$("#controlIframe").contents().find("#a2").show();
					$("#controlIframe").contents().find("#b2").hide();
				}else{
					$("#controlIframe").contents().find("#a2").hide();
					$("#controlIframe").contents().find("#b2").show();	
				}
				//自动控制灯
				if( json.s.rawWaterPumpHandAuto == $("#controlIframe").contents().find("#c22").val() ){
					$("#controlIframe").contents().find("#a3").show();
					$("#controlIframe").contents().find("#b3").hide();
				}else{
					$("#controlIframe").contents().find("#a3").hide();
					$("#controlIframe").contents().find("#b3").show();	
				}
				
				//$("#controlIframe").contents().find("#rawWaterStopRawWaterPump").val( json.s.rawWaterPumpState );
				//$("#controlIframe").contents().find("#softWaterLowRawWaterPump").val( json.s.rawWaterPumpHandAuto );
				break;
			case 'plcControlStationStatusAction!queryValve.action'://调节阀
				if( $("#controlIframe").contents().find("#deviceId").length <= 0 ) return;
				var deviceId = $("#controlIframe").contents().find("#deviceId").val();
				var heatStationId = $('#station option:selected').val();
				var heatUnitId = $('#unit option:selected').val();
				var regulValveID = heatStationId+''+heatUnitId+''+deviceId;
				
				//手动控制
				$("#controlIframe").contents().find("#regulValveManual").val( json.u.regulValveMap[regulValveID].regulValveManual );
				//自动控制
				$("#controlIframe").contents().find("#regulValveAuto").val( json.u.regulValveMap[regulValveID].regulValveAuto );
				
				//室外温度
				$("#controlIframe").contents().find("#outdoorTemp").val( json.s.outdoorTemp );
				//供水温度
				$("#controlIframe").contents().find("#supplyTemp").val( json.s.supplyTemp );
				//阀门开度
				$("#controlIframe").contents().find("#regulValveFeedback").val( json.u.regulValveMap[regulValveID].regulValveFeedback );
				
				//下面有10个灯
				//开度控制灯
				if( $("#controlIframe").contents().find("#c26").length > 0 ){
					//判断页面中是否存在这个元素
					if( json.u.regulValveMap[regulValveID].regulValveControlSele == $("#controlIframe").contents().find("#c21").val()  ){
						$("#controlIframe").contents().find("#a1").show();
						$("#controlIframe").contents().find("#b1").hide();
					}else{
						$("#controlIframe").contents().find("#a1").hide();
						$("#controlIframe").contents().find("#b1").show();	
					}
				}

				//供水温度灯
				if( $("#controlIframe").contents().find("#c26").length > 0 ){
					//判断页面中是否存在这个元素
					if( json.u.regulValveMap[regulValveID].regulValveControlSele == $("#controlIframe").contents().find("#c22").val()  ){
						$("#controlIframe").contents().find("#a2").show();
						$("#controlIframe").contents().find("#b2").hide();
						$("#controlIframe").contents().find("#xiafa").attr("disabled",false);//立即下发（可用）
					}else{
						$("#controlIframe").contents().find("#a2").hide();
						$("#controlIframe").contents().find("#b2").show();	
						$("#controlIframe").contents().find("#xiafa").attr("disabled",true);//立即下发（可用）
					}
				}

				//平均温度灯
				if( $("#controlIframe").contents().find("#c26").length > 0 ){
					//判断页面中是否存在这个元素
					if( json.u.regulValveMap[regulValveID].regulValveControlSele == $("#controlIframe").contents().find("#c23").val()  ){
						$("#controlIframe").contents().find("#a3").show();
						$("#controlIframe").contents().find("#b3").hide();
					}else{
						$("#controlIframe").contents().find("#a3").hide();
						$("#controlIframe").contents().find("#b3").show();	
					}	
				}

				//曲线温度灯
				if( $("#controlIframe").contents().find("#c26").length > 0 ){
					//判断页面中是否存在这个元素
					if( json.u.regulValveMap[regulValveID].regulValveControlSele == $("#controlIframe").contents().find("#c24").val()  ){
						$("#controlIframe").contents().find("#a4").show();
						$("#controlIframe").contents().find("#b4").hide();
					}else{
						$("#controlIframe").contents().find("#a4").hide();
						$("#controlIframe").contents().find("#b4").show();	
					}	
				}

				//一网流量灯
				if( $("#controlIframe").contents().find("#c26").length > 0 ){
					//判断页面中是否存在这个元素
					if( json.u.regulValveMap[regulValveID].regulValveControlSele == $("#controlIframe").contents().find("#c25").val()  ){
						$("#controlIframe").contents().find("#a5").show();
						$("#controlIframe").contents().find("#b5").hide();
					}else{
						$("#controlIframe").contents().find("#a5").hide();
						$("#controlIframe").contents().find("#b5").show();	
					}
				}

				//瞬时热量灯
				if( $("#controlIframe").contents().find("#c26").length > 0 ){
					//判断页面中是否存在这个元素
					if( json.u.regulValveMap[regulValveID].regulValveControlSele == $("#controlIframe").contents().find("#c26").val()  ){
						$("#controlIframe").contents().find("#a6").show();
						$("#controlIframe").contents().find("#b6").hide();
					}else{
						$("#controlIframe").contents().find("#a6").hide();
						$("#controlIframe").contents().find("#b6").show();	
					}
				}

				//回水温度灯
				if( $("#controlIframe").contents().find("#c27").length > 0 ){
					//判断页面中是否存在这个元素
					if( json.u.regulValveMap[regulValveID].regulValveControlSele == $("#controlIframe").contents().find("#c27").val()  ){
						$("#controlIframe").contents().find("#a7").show();
						$("#controlIframe").contents().find("#b7").hide();
					}else{
						$("#controlIframe").contents().find("#a7").hide();
						$("#controlIframe").contents().find("#b7").show();	
					}
				}

				
				//连锁状态灯
				if( json.u.regulatValveProtect == 1  ){
					$("#controlIframe").contents().find("#a8").show();
					$("#controlIframe").contents().find("#b8").hide();
				}else{
					$("#controlIframe").contents().find("#a8").hide();
					$("#controlIframe").contents().find("#b8").show();	
				}
				//投入PLC曲线灯
				if( json.u.regulValveMap[regulValveID].regulValveControlSele == $("#controlIframe").contents().find("#c24").val()  ){
					$("#controlIframe").contents().find("#a9").show();
					$("#controlIframe").contents().find("#b9").hide();
				}else{
					$("#controlIframe").contents().find("#a9").hide();
					$("#controlIframe").contents().find("#b9").show();	
				}	
				//投入上位曲线灯（等姜博）
				
				
				break;
			case 'plcControlStationStatusAction!querySolenoidValve.action'://泄压阀
				
				//泻压值设定
				$("#controlIframe").contents().find("#reliefValveLowClose").val( json.u.reliefValveLowClose );
				//停止值设定
				$("#controlIframe").contents().find("#reliefValveHighOpen").val( json.u.reliefValveHighOpen );
				
				//下面有4个灯
				//阀门状态灯
				if( json.s.reliefPressValveState == 1 ){
					$("#controlIframe").contents().find("#a1").show();
					$("#controlIframe").contents().find("#b1").hide();
				}else{
					$("#controlIframe").contents().find("#a1").hide();
					$("#controlIframe").contents().find("#b1").show();	
				}
				
				//手动控制灯
				if( json.u.reliefPressValveTransfo == $("#controlIframe").contents().find("#c21").val() ){
					$("#controlIframe").contents().find("#a2").show();
					$("#controlIframe").contents().find("#b2").hide();
				}else{
					$("#controlIframe").contents().find("#a2").hide();
					$("#controlIframe").contents().find("#b2").show();	
				}
				//自动控制灯
				if( json.u.reliefPressValveTransfo == $("#controlIframe").contents().find("#c22").val() ){
					$("#controlIframe").contents().find("#a3").show();
					$("#controlIframe").contents().find("#b3").hide();
				}else{
					$("#controlIframe").contents().find("#a3").hide();
					$("#controlIframe").contents().find("#b3").show();	
				}
				
				//连锁状态灯
				if( json.u.reliefPressValveProtect == 1 ){
					$("#controlIframe").contents().find("#a4").show();
					$("#controlIframe").contents().find("#b4").hide();
				}else{
					$("#controlIframe").contents().find("#a4").hide();
					$("#controlIframe").contents().find("#b4").show();	
				}
				break;
			case 'plcControlStationStatusAction!querySolenoidValve1to2.action'://一补二电磁阀
				
				
				//泻压值设定
				$("#controlIframe").contents().find("#cTwoPressOpenValve").val( json.s.CTwoPressOpenValve );
				//停止值设定
				$("#controlIframe").contents().find("#cTwoPressHighCloseValve").val( json.s.CTwoPressHighCloseValve );
				
				//下面有4个灯
				//阀门状态灯
				if( json.s.compleTwoValveState == 1 ){
					$("#controlIframe").contents().find("#a1").show();
					$("#controlIframe").contents().find("#b1").hide();
				}else{
					$("#controlIframe").contents().find("#a1").hide();
					$("#controlIframe").contents().find("#b1").show();	
				}
				
				//手动控制灯
				if( json.s.compleTwoValveTransfo == $("#controlIframe").contents().find("#c21").val() ){
					$("#controlIframe").contents().find("#a2").show();
					$("#controlIframe").contents().find("#b2").hide();
				}else{
					$("#controlIframe").contents().find("#a2").hide();
					$("#controlIframe").contents().find("#b2").show();	
				}
				//自动控制灯
				if( json.s.compleTwoValveTransfo == $("#controlIframe").contents().find("#c22").val() ){
					$("#controlIframe").contents().find("#a3").show();
					$("#controlIframe").contents().find("#b3").hide();
				}else{
					$("#controlIframe").contents().find("#a3").hide();
					$("#controlIframe").contents().find("#b3").show();	
				}
				
				//连锁状态灯
				if( json.s.compleTwoProtect == 1 ){
					$("#controlIframe").contents().find("#a4").show();
					$("#controlIframe").contents().find("#b4").hide();
				}else{
					$("#controlIframe").contents().find("#a4").hide();
					$("#controlIframe").contents().find("#b4").show();	
				}
				break;
			case 'plcControlStationStatusAction!queryRawValve.action'://生水阀
				
				//开始值设定
				$("#controlIframe").contents().find("#rawWaterOpenValve").val( json.s.rawWaterOpenValve );
				//停止值设定
				$("#controlIframe").contents().find("#rawWaterHighCloseValve").val( json.s.rawWaterHighCloseValve );
	
				
				//下面有3个灯
				//阀门状态灯
				if( json.s.rawWaterValveStatus == 1 ){
					$("#controlIframe").contents().find("#a1").show();
					$("#controlIframe").contents().find("#b1").hide();
				}else{
					$("#controlIframe").contents().find("#a1").hide();
					$("#controlIframe").contents().find("#b1").show();	
				}
				
				//手动控制灯
				if( json.s.rawWaterValveHandAuto == $("#controlIframe").contents().find("#c21").val() ){
					$("#controlIframe").contents().find("#a2").show();
					$("#controlIframe").contents().find("#b2").hide();
				}else{
					$("#controlIframe").contents().find("#a2").hide();
					$("#controlIframe").contents().find("#b2").show();	
				}
				//自动控制灯
				if( json.s.rawWaterValveHandAuto == $("#controlIframe").contents().find("#c22").val() ){
					$("#controlIframe").contents().find("#a3").show();
					$("#controlIframe").contents().find("#b3").hide();
				}else{
					$("#controlIframe").contents().find("#a3").hide();
					$("#controlIframe").contents().find("#b3").show();	
				}
				
				//$("#controlIframe").contents().find("#rawWaterOpenValve").val( json.s.rawWaterValveHandAuto );
				break;
			case 'plcControlStationStatusAction!queryMixingWaterValue.action'://混水阀（吉林江南版本）
				if( $("#controlIframe").contents().find("#deviceId").length <= 0 ) return;
			
				var deviceId = $("#controlIframe").contents().find("#deviceId").val();
				var deviceA = deviceId.substring(0, deviceId.indexOf(",") );
				var deviceB = deviceId.substring(deviceId.indexOf(",")+1 );
				
				var heatStationId = $('#station option:selected').val();
				var heatUnitId = $('#unit option:selected').val();
				
				//蝶阀开度设定
				$("#controlIframe").contents().find("#valueAregulValveManual").val( json.u.regulValveMap[heatStationId+''+heatUnitId+''+deviceA].regulValveManual );
				//调阀开度设定
				$("#controlIframe").contents().find("#valueBregulValveManual").val( json.u.regulValveMap[heatStationId+''+heatUnitId+''+deviceB].regulValveManual );
				//调阀温度给定
				$("#controlIframe").contents().find("#valueBregulValveAuto").val( json.u.regulValveMap[heatStationId+''+heatUnitId+''+deviceB].regulValveAuto );
				//蝶阀开度设定
				$("#controlIframe").contents().find("#valueAregulValveFeedback").val( json.u.regulValveMap[heatStationId+''+heatUnitId+''+deviceA].regulValveFeedback );
				//调阀开度设定
				$("#controlIframe").contents().find("#valueBregulValveFeedback").val( json.u.regulValveMap[heatStationId+''+heatUnitId+''+deviceB].regulValveFeedback );
				
				$("#controlIframe").contents().find("#supplyTemp").val( json.s.supplyTemp );
				$("#controlIframe").contents().find("#backWaterTemp").val( json.s.backWaterTemp );
				$("#controlIframe").contents().find("#supplyTempbackWaterTemp").val( json.s.supplyTemp-json.s.backWaterTemp );
				
				//下面有2个灯
				//手动状态灯
				if( json.u.regulValveMap[heatStationId+''+heatUnitId+''+deviceB].regulValveControlSele == 0 ){
					$("#controlIframe").contents().find("#a1").show();
					$("#controlIframe").contents().find("#b1").hide();
				}else{
					$("#controlIframe").contents().find("#a1").hide();
					$("#controlIframe").contents().find("#b1").show();	
				}
				//自动状态灯
				if( json.u.regulValveMap[heatStationId+''+heatUnitId+''+deviceB].regulValveControlSele == 1 ){
					$("#controlIframe").contents().find("#a2").show();
					$("#controlIframe").contents().find("#b2").hide();
				}else{
					$("#controlIframe").contents().find("#a2").hide();
					$("#controlIframe").contents().find("#b2").show();	
				}
				break;
			case 'plcControlStationStatusAction!querySupplyAndBackWaterValue.action'://供回水阀（吉林江南版本）
				if( $("#controlIframe").contents().find("#deviceId").length <= 0 ) return;
			
				var deviceId = $("#controlIframe").contents().find("#deviceId").val();
				var deviceA = deviceId.split(",")[0];
				var deviceB = deviceId.split(",")[1];
				var deviceC = deviceId.split(",")[2];
				var deviceD = deviceId.split(",")[3];
				
				var heatStationId = $('#station option:selected').val();
				var heatUnitId = $('#unit option:selected').val();
				
				//蝶阀开度设定
				$("#controlIframe").contents().find("#valueAregulValveManual").val( json.u.regulValveMap[heatStationId+''+heatUnitId+''+deviceA].regulValveManual );
				//调阀开度设定
				$("#controlIframe").contents().find("#valueBregulValveManual").val( json.u.regulValveMap[heatStationId+''+heatUnitId+''+deviceB].regulValveManual );
				//调阀温度给定
				$("#controlIframe").contents().find("#valueBregulValveAuto").val( json.u.regulValveMap[heatStationId+''+heatUnitId+''+deviceB].regulValveAuto );
				
				
				//右侧5个值
				$("#controlIframe").contents().find("#valueAregulValveFeedback").val( json.u.regulValveMap[heatStationId+''+heatUnitId+''+deviceA].regulValveFeedback );
				$("#controlIframe").contents().find("#valueBregulValveFeedback").val( json.u.regulValveMap[heatStationId+''+heatUnitId+''+deviceB].regulValveFeedback );
				$("#controlIframe").contents().find("#s_supplyPress").val( json.s.supplyPress );
				$("#controlIframe").contents().find("#supplyValveBackPress").val( json.s.supplyValveBackPress );
				$("#controlIframe").contents().find("#supplyPresssupplyValveBackPress").val( json.s.supplyPress-json.s.supplyValveBackPress );
				//------------------------------------------------------------------------
				//中间的3个值
				$("#controlIframe").contents().find("#u_supplyPress").val( json.u.supplyPress );
				$("#controlIframe").contents().find("#u_backWaterPress").val( json.u.backWaterPress );
				$("#controlIframe").contents().find("#supplyPress_backPress").val( json.u.supplyPress-json.u.backWaterPress );
				//------------------------------------------------------------------------
				//蝶阀开度设定
				$("#controlIframe").contents().find("#valueCregulValveManual").val( json.u.regulValveMap[heatStationId+''+heatUnitId+''+deviceC].regulValveManual );
				//调阀开度设定
				$("#controlIframe").contents().find("#valueDregulValveManual").val( json.u.regulValveMap[heatStationId+''+heatUnitId+''+deviceD].regulValveManual );
				//调阀温度给定
				$("#controlIframe").contents().find("#valueDregulValveAuto").val( json.u.regulValveMap[heatStationId+''+heatUnitId+''+deviceD].regulValveAuto );
				
				
				//右侧5个值
				$("#controlIframe").contents().find("#valueCregulValveFeedback").val( json.u.regulValveMap[heatStationId+''+heatUnitId+''+deviceC].regulValveFeedback );
				$("#controlIframe").contents().find("#valueDregulValveFeedback").val( json.u.regulValveMap[heatStationId+''+heatUnitId+''+deviceD].regulValveFeedback );
				$("#controlIframe").contents().find("#backWaterValveFrontPress").val( json.s.backWaterValveFrontPress );
				$("#controlIframe").contents().find("#s_backWaterPress").val( json.s.backWaterPress );
				$("#controlIframe").contents().find("#backWaterValveFrontPress").val( json.s.backWaterValveFrontPress-json.s.backWaterPress );
				
				//----下面有4个灯----------------------------------
				//手动状态灯
				if( json.u.regulValveMap[heatStationId+''+heatUnitId+''+deviceB].regulValveControlSele == 0 ){
					$("#controlIframe").contents().find("#a1").show();
					$("#controlIframe").contents().find("#b1").hide();
				}else{
					$("#controlIframe").contents().find("#a1").hide();
					$("#controlIframe").contents().find("#b1").show();	
				}
				//自动状态灯
				if( json.u.regulValveMap[heatStationId+''+heatUnitId+''+deviceB].regulValveControlSele == 1 ){
					$("#controlIframe").contents().find("#a2").show();
					$("#controlIframe").contents().find("#b2").hide();
				}else{
					$("#controlIframe").contents().find("#a2").hide();
					$("#controlIframe").contents().find("#b2").show();	
				}
				//手动状态灯
				if( json.u.regulValveMap[heatStationId+''+heatUnitId+''+deviceD].regulValveControlSele == 0 ){
					$("#controlIframe").contents().find("#a3").show();
					$("#controlIframe").contents().find("#b3").hide();
				}else{
					$("#controlIframe").contents().find("#a3").hide();
					$("#controlIframe").contents().find("#b3").show();	
				}
				//自动状态灯
				if( json.u.regulValveMap[heatStationId+''+heatUnitId+''+deviceD].regulValveControlSele == 1 ){
					$("#controlIframe").contents().find("#a4").show();
					$("#controlIframe").contents().find("#b4").hide();
				}else{
					$("#controlIframe").contents().find("#a4").hide();
					$("#controlIframe").contents().find("#b4").show();	
				}
				break;	
			case 'plcControlStationStatusAction!queryDiscValue.action'://碟阀
				if( $("#controlIframe").contents().find("#deviceId").length <= 0 ) return;
			
				var deviceId = $("#controlIframe").contents().find("#deviceId").val();
				var heatStationId = $('#station option:selected').val();
				var heatUnitId = $('#unit option:selected').val();
				var discValueID = heatStationId+''+heatUnitId+''+deviceId;
				
				//蝶阀开度设定
				$("#controlIframe").contents().find("#regulValveManual").val( json.u.regulValveMap[discValueID].regulValveManual );
				$("#controlIframe").contents().find("#regulValveFeedback").val( json.u.regulValveMap[discValueID].regulValveFeedback );
				break;
			default ://其他
				
				break;	
			}
		}
		
		
		
		//-----第一个子窗口----------------------------------------------------------------------------------------------------------------------
		// TODO 第一个子窗口
		var temp1=$("#settingIframe1").is(":visible");//判断是否隐藏/可见
		if( temp1 == true ){
			var src1 = $("#settingIframe1").attr("src");
			var p1 = src1.lastIndexOf("?");
			var fileName1 = null;
			if( p1 == -1 ){
				fileName1 = src1.substring( src1.lastIndexOf("/")+1  );
			}else{
				fileName1 = src1.substring( src1.lastIndexOf("/")+1 , src1.lastIndexOf("?") );
			}
			switch( fileName1 ){
			case 'plcControlStationStatusAction!queryValveParam.action'://调节阀子页面中的[参数设置]
				if( $("#settingIframe1").contents().find("#deviceId").length <= 0 ) return;
				var deviceId = $("#settingIframe1").contents().find("#deviceId").val();
				var heatStationId = $('#station option:selected').val();
				var heatUnitId = $('#unit option:selected').val();
				var regulValveID = heatStationId+''+heatUnitId+''+deviceId;
				//alert(  deviceId );
				
				//上限值
				$("#settingIframe1").contents().find("#regulatValveHigh").val( json.u.regulValveMap[regulValveID].regulatValveHigh );
				//下限值
				$("#settingIframe1").contents().find("#regulatValveLow").val( json.u.regulValveMap[regulValveID].regulatValveLow );	
				//初始值
				$("#settingIframe1").contents().find("#regulatValveInit").val( json.u.regulValveMap[regulValveID].regulatValveInit );
				
				//调节比例
				$("#settingIframe1").contents().find("#regulValveRatio").val( json.u.regulValveMap[regulValveID].regulValveRatio );
				//调节周期
				$("#settingIframe1").contents().find("#regulValveCycle").val( json.u.regulValveMap[regulValveID].regulValveCycle );	
				//调节死区
				$("#settingIframe1").contents().find("#regulatValveDead").val( json.u.regulValveMap[regulValveID].regulatValveDead );	
				
				//二网供水温度超高关阀
				$("#settingIframe1").contents().find("#supplyTempUHighSet").val( json.u.supplyTempUHighSet );
				//一网回水温度超高关阀
				$("#settingIframe1").contents().find("#backWaterTempUHighSet").val( json.u.backWaterTempUHighSet );	
				
				//连锁状态
				if( json.u.regulatValveProtect == 1 ){
					$("#settingIframe1").contents().find("#selectButton").html("&emsp;已投入&emsp;");
				}else{
					$("#settingIframe1").contents().find("#selectButton").html("&emsp;已解除&emsp;");
				}
				
				break;
			case 'plcControlStationStatusAction!queryCyclePumpParam.action'://循环泵子页面中的[参数设置]
				if( $("#settingIframe1").contents().find("#deviceId").length <= 0 ) return;
				var deviceId = $("#settingIframe1").contents().find("#deviceId").val();
				var heatStationId = $('#station option:selected').val();
				var heatUnitId = $('#unit option:selected').val();
				var circPumpID = heatStationId+''+heatUnitId+''+deviceId;
				
				//上限值
				$("#settingIframe1").contents().find("#circPumpHigh").val( json.u.circPumpHigh );
				//下限值
				$("#settingIframe1").contents().find("#circPumpLow").val( json.u.circPumpLow );	
				//初始值
				$("#settingIframe1").contents().find("#circPumpInitial").val( json.u.circPumpInitial );
	
				//超时时间
				$("#settingIframe1").contents().find("#circPumpTimeout").val( json.u.circPumpMap[circPumpID].circPumpTimeout );
				//重试次数
				$("#settingIframe1").contents().find("#circPumpRetry").val( json.u.circPumpMap[circPumpID].circPumpRetry );	
				//重试时间
				$("#settingIframe1").contents().find("#circPumpRetryTime").val( json.u.circPumpMap[circPumpID].circPumpRetryTime );
				
				//调节比例
				$("#settingIframe1").contents().find("#circPumpP").val( json.u.circPumpMap[circPumpID].circPumpP );
				//调节周期
				$("#settingIframe1").contents().find("#circPumpI").val( json.u.circPumpMap[circPumpID].circPumpI );	
				//调节死区
				$("#settingIframe1").contents().find("#circPumpDead").val( json.u.circPumpMap[circPumpID].circPumpDead );	
				
				//二网供水压力超高停循环泵
				$("#settingIframe1").contents().find("#supplyPressUHighSet").val( json.u.supplyPressUHighSet );
				//一网回水压力超低停循环泵
				$("#settingIframe1").contents().find("#backWaterPressLowSet").val( json.u.backWaterPressLowSet );	
				
				//连锁状态
				if( deviceId == 'X1' ){
					if( json.u.circPumpProtect1 == 1 ){
						$("#settingIframe1").contents().find("#selectButton").html("&emsp;已投入&emsp;");
					}else{
						$("#settingIframe1").contents().find("#selectButton").html("&emsp;已解除&emsp;");
					}
				}else if( deviceId == 'X2'  ){
					if( json.u.circPumpProtect2 == 1 ){
						$("#settingIframe1").contents().find("#selectButton").html("&emsp;已投入&emsp;");
					}else{
						$("#settingIframe1").contents().find("#selectButton").html("&emsp;已解除&emsp;");
					}	
				}else if( deviceId == 'X3'  ){
					if( json.u.circPumpProtect3 == 1 ){
						$("#settingIframe1").contents().find("#selectButton").html("&emsp;已投入&emsp;");
					}else{
						$("#settingIframe1").contents().find("#selectButton").html("&emsp;已解除&emsp;");
					}
				}
	
				break;
			case 'plcControlStationStatusAction!querySupplyPumpParam.action'://补水泵子页面中的[参数设置]
				var deviceId = $("#settingIframe1").contents().find("#deviceId").val();
				var heatStationId = $('#station option:selected').val();
				var heatUnitId = $('#unit option:selected').val();
				var supplyPumpID = heatStationId+''+heatUnitId+''+deviceId;
				
				//上 限 值
				$("#settingIframe1").contents().find("#supplyPumpHigh").val( json.u.supplyPumpHigh );
				//下 限 值
				$("#settingIframe1").contents().find("#supplyPumpLow").val( json.u.supplyPumpLow );	
				//初 始 值
				$("#settingIframe1").contents().find("#supplyPumpInit").val( json.u.supplyPumpInit );
				
				//睡 眠 值
				$("#settingIframe1").contents().find("#supplyPumpSleepSet").val( json.u.supplyPumpMap[supplyPumpID].supplyPumpSleepSet );
				//睡眠延迟
				$("#settingIframe1").contents().find("#supplyPumpSleepDelay").val( json.u.supplyPumpMap[supplyPumpID].supplyPumpSleepDelay );
				//唤醒延迟
				$("#settingIframe1").contents().find("#supplyPumpSleepWakeDelay").val( json.u.supplyPumpMap[supplyPumpID].supplyPumpSleepWakeDelay );
				
				//调节比例
				$("#settingIframe1").contents().find("#supplyPumpP").val( json.u.supplyPumpMap[supplyPumpID].supplyPumpP );
				//调节周期
				$("#settingIframe1").contents().find("#supplyPumpI").val( json.u.supplyPumpMap[supplyPumpID].supplyPumpI );
				//调节死区
				$("#settingIframe1").contents().find("#supplyPumpDead").val( json.u.supplyPumpMap[supplyPumpID].supplyPumpDead );
				
				//二网回水压力超低停补水泵
				$("#settingIframe1").contents().find("#backWaterPressLowSet").val( json.u.backWaterPressLowSet );
				
				//连锁状态
				if( eval('json.u.supplyPumpProtect'+(index+1)) == 1 ){
					$("#settingIframe1").contents().find("#selectButton").html("&emsp;已投入&emsp;");
				}else{
					$("#settingIframe1").contents().find("#selectButton").html("&emsp;已解除&emsp;");
				}
				
				break;
			default ://其他
				
				break;	
			}
		}
		
		
		
		//-----第二个子窗口----------------------------------------------------------------------------------------------------------------------
		// TODO 第二个子窗口
		var temp2=$("#settingIframe2").is(":visible");//判断是否隐藏/可见
		if( temp2 == true ){
			var src2 = $("#settingIframe2").attr("src");
			var p2 = src2.lastIndexOf("?");
			var fileName2 = null;
			if( p2 == -1 ){
				fileName2 = src2.substring( src2.lastIndexOf("/")+1  );
			}else{
				fileName2 = src2.substring( src2.lastIndexOf("/")+1 , src2.lastIndexOf("?") );
			}
			switch( fileName2 ){
			case 'plcControlStationStatusAction!queryValvePLCCurve.action'://调节阀子页面中的[PLC曲线设置]
				var deviceId = $("#settingIframe2").contents().find("#deviceId").val();
				var heatStationId = $('#station option:selected').val();
				var heatUnitId = $('#unit option:selected').val();
				var regulValveID = heatStationId+''+heatUnitId+''+deviceId;
				
				//温度曲线X1
				$("#settingIframe2").contents().find("#regulatValveChart").val( json.u.regulatValveChart );
				//温度曲线X2
				$("#settingIframe2").contents().find("#regulatValveChartX2").val( json.u.regulatValveChartX2 );
				//温度曲线X3
				$("#settingIframe2").contents().find("#regulatValveChartX3").val( json.u.regulatValveChartX3 );
				//温度曲线X4
				$("#settingIframe2").contents().find("#regulatValveChartX4").val( json.u.regulatValveChartX4 );
				//温度曲线X5
				$("#settingIframe2").contents().find("#regulatValveChartX5").val( json.u.regulatValveChartX5 );
				//温度曲线X6
				$("#settingIframe2").contents().find("#regulatValveChartX6").val( json.u.regulatValveChartX6 );
				//温度曲线X7
				$("#settingIframe2").contents().find("#regulatValveChartX7").val( json.u.regulatValveChartX7 );
				//温度曲线X8
				$("#settingIframe2").contents().find("#regulatValveChartX8").val( json.u.regulatValveChartX8 );
				//温度曲线X9
				$("#settingIframe2").contents().find("#regulatValveChartX9").val( json.u.regulatValveChartX9 );
				//温度曲线X10
				$("#settingIframe2").contents().find("#regulatValveChart0").val( json.u.regulatValveChart0 );
				
				
				//温度曲线Y1
				$("#settingIframe2").contents().find("#regulatValveChartY1").val( json.u.regulatValveChartY1 );
				//温度曲线Y2
				$("#settingIframe2").contents().find("#regulatValveChartY2").val( json.u.regulatValveChartY2 );
				//温度曲线Y3
				$("#settingIframe2").contents().find("#regulatValveChartY3").val( json.u.regulatValveChartY3 );
				//温度曲线Y4
				$("#settingIframe2").contents().find("#regulatValveChartY4").val( json.u.regulatValveChartY4 );
				//温度曲线Y5
				$("#settingIframe2").contents().find("#regulatValveChartY5").val( json.u.regulatValveChartY5 );
				//温度曲线Y6
				$("#settingIframe2").contents().find("#regulatValveChartY6").val( json.u.regulatValveChartY6 );
				//温度曲线Y7
				$("#settingIframe2").contents().find("#regulatValveChartY7").val( json.u.regulatValveChartY7 );
				//温度曲线Y8
				$("#settingIframe2").contents().find("#regulatValveChartY8").val( json.u.regulatValveChartY8 );
				//温度曲线Y9
				$("#settingIframe2").contents().find("#regulatValveChartY9").val( json.u.regulatValveChartY9 );
				//温度曲线Y10
				$("#settingIframe2").contents().find("#regulatValveChartY10").val( json.u.regulatValveChartY10 );
				
				//曲线修正
				$("#settingIframe2").contents().find("#regulatValveChartModify").val( json.u.regulatValveChartModify );
				//曲线输出
				$("#settingIframe2").contents().find("#regulatValveChartOutput").val( json.u.regulatValveChartOutput );
				
				
				break;
			case 'plcControlStationStatusAction!queryCyclePumpTiming.action'://循环泵子页面中的[时序控制]
				var deviceId = $("#settingIframe2").contents().find("#deviceId").val();
				var heatStationId = $('#station option:selected').val();
				var heatUnitId = $('#unit option:selected').val();
				var circPumpID = heatStationId+''+heatUnitId+''+deviceId;
				//时序1   月
				$("#settingIframe2").contents().find("#circPumpTiming1MM").val( json.u.circPumpTiming1MM );
				//时序1   日
				$("#settingIframe2").contents().find("#circPumpTiming1dd").val( json.u.circPumpTiming1dd );
				//时序1   时
				$("#settingIframe2").contents().find("#circPumpTiming1hh").val( json.u.circPumpTiming1hh );
				//时序1   频率
				$("#settingIframe2").contents().find("#circPumpTim1FreqGiven").val( json.u.circPumpTim1FreqGiven );
				//时序1   压差
				$("#settingIframe2").contents().find("#circPumpTim1PressGiven").val( json.u.circPumpTim1PressGiven );
				//时序1   温差
				$("#settingIframe2").contents().find("#circPumpTim1TempGiven").val( json.u.circPumpTim1TempGiven );
				
				//时序2   月
				$("#settingIframe2").contents().find("#circPumpTiming2MM").val( json.u.circPumpTiming2MM );
				//时序2   日
				$("#settingIframe2").contents().find("#circPumpTiming2dd").val( json.u.circPumpTiming2dd );
				//时序2   时
				$("#settingIframe2").contents().find("#circPumpTiming2hh").val( json.u.circPumpTiming2hh );
				//时序2   频率
				$("#settingIframe2").contents().find("#circPumpTim2FreqGiven").val( json.u.circPumpTim2FreqGiven );
				//时序2   压差
				$("#settingIframe2").contents().find("#circPumpTim2PressGiven").val( json.u.circPumpTim2PressGiven );
				//时序2   温差
				$("#settingIframe2").contents().find("#circPumpTim2TempGiven").val( json.u.circPumpTim2TempGiven );
				
				//时序3   月
				$("#settingIframe2").contents().find("#circPumpTiming3MM").val( json.u.circPumpTiming3MM );
				//时序3   日
				$("#settingIframe2").contents().find("#circPumpTiming3dd").val( json.u.circPumpTiming3dd );
				//时序3   时
				$("#settingIframe2").contents().find("#circPumpTiming3hh").val( json.u.circPumpTiming3hh );
				//时序3   频率
				$("#settingIframe2").contents().find("#circPumpTim3FreqGiven").val( json.u.circPumpTim3FreqGiven );
				//时序3   压差
				$("#settingIframe2").contents().find("#circPumpTim3PressGiven").val( json.u.circPumpTim3PressGiven );
				//时序3   温差
				$("#settingIframe2").contents().find("#circPumpTim3TempGiven").val( json.u.circPumpTim3TempGiven );
				
				//时序4   月
				$("#settingIframe2").contents().find("#circPumpTiming4MM").val( json.u.circPumpTiming4MM );
				//时序4   日
				$("#settingIframe2").contents().find("#circPumpTiming4dd").val( json.u.circPumpTiming4dd );
				//时序4   时
				$("#settingIframe2").contents().find("#circPumpTiming4hh").val( json.u.circPumpTiming4hh );
				
				//时序状态灯
				if( json.u.circPumpMap[circPumpID].circPumpInput == 1 ){
					$("#settingIframe2").contents().find("#a1").show();
					$("#settingIframe2").contents().find("#b1").hide();
				}else{
					$("#settingIframe2").contents().find("#a1").hide();
					$("#settingIframe2").contents().find("#b1").show();	
				}
				
				if( json.u.circPumpMap[circPumpID].circPumpTiming == 0 ){
					//大时序灯
					$("#settingIframe2").contents().find("#a2").show();
					$("#settingIframe2").contents().find("#b2").hide();
					
					$("#settingIframe2").contents().find("#a3").hide();
					$("#settingIframe2").contents().find("#b3").show();
				}else{
					//小时序灯
					$("#settingIframe2").contents().find("#a2").hide();
					$("#settingIframe2").contents().find("#b2").show();
					
					$("#settingIframe2").contents().find("#a3").show();
					$("#settingIframe2").contents().find("#b3").hide();
				}
	
				//$("#settingIframe2").contents().find("#circPumpTim2FreqGiven").val( json.u.circPumpMap[circPumpID].circPumpInput );
				//$("#settingIframe2").contents().find("#circPumpTim2PressGiven").val( json.u.circPumpMap[circPumpID].circPumpTiming );
				
				break;
			default ://其他
				
				break;	
			}
		}
		
			
		
	}