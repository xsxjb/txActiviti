var isDrawSite = false;//为true时，表示为添加站点并且鼠标已经在地图上移动过
var isDrawLine = false;//为true时，表示
var mouseFlag = 0 ; //鼠标恢复标志位

var pathBase = window.location.protocol + "//" + window.location.host
		+ "/iBusiness/default/";
var pathImg = window.location.protocol + "//" + window.location.host
		+ "/webByBPM/";
// 权限设置有权限
var inforid = 1;
$(function() {
	//初始化地图大小
	initMapSize();
	//初始化地图
	init();
	
	//初始化添加站点的图标
	initTB();
	//初始化搜索站点
	initSelect();

	//初始化站点
	initSites();
	//初始化各个窗口的按钮
	initBt();
	
	//操作导航tab
	$('#id-tabs').tabs( {
		onSelect : function(title) {
		var type = $('#id-type').val();
	    if (type == '1' && isDrawSite) {
				//如果原来是添加站点操作并且已经移动过鼠标，则需要将最后一次添加的marker移除
			markers.removeMarker(markers.markers[markers.markers.length - 1]);
		} else if (type == '3') {
			//toggleControl('point');
			//control.deactivate();
		}
		var new_type = $('#id-tabs').tabs('getTab', title).attr('type');
		if (new_type == '3') {
		} else {
			toggleControl('');
		}

	   $('#id-type').val(new_type);
		
		//当操作改变后，移除对应的事件
		map.events.unregister('mousemove', map, mouseMoveEventForAddSite);
		map.events.unregister('click', map, clickEventForAddSite);
	}
    });

});


