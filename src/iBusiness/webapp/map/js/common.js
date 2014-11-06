/**
 * 定时刷新30s刷新一次图标
 */
var idCheck;
function configRefresh() {
	var refreshCheck = document.getElementById("refreshCheck").checked;
	if (refreshCheck) {
		idCheck = setInterval("refreshSites(1)", 30 * 1000);
	} else {
		clearInterval(idCheck);
	}
}

/**
 * 初始化站点,将所有有效的站点进行标注
 */
function refreshSites(fromflag) { //fromflag：1.是30‘刷新带有各个站点的状态，2 是添加站点后自动刷新所有的图标
	markers.clearMarkers();
	var urlsite;
	if (1 == fromflag) {
		urlsite = 'map/initValidSites.do';
	} else {
		urlsite = 'map/findValidSites.do';
	}
	$.ajax( {
		url : pathBase + urlsite,
		dataType : 'json',
		success : function(json) {
			$.each(json, function(i, n) {
				var lonlat = new OpenLayers.LonLat(n.longitude, n.latitude);
				addSiteMarker( {
										lonlat : lonlat.transform(new OpenLayers.Projection("EPSG:4326"), new OpenLayers.Projection("EPSG:900913")),
										icon : pathBase + n.iconPath,
										id : n.id,
										siteid : n.siteNo,
										sitetype : n.iconId,
										sitetb : n.iconTypeId,
										siteInfo : "n.TB_YL1"
				});
			});
		}
	});
}

var recoeriedMouse = false; //判断是否已经点击过小手，如果已经点击 小手，则在点击添加管道时不删除点
/**
 * 小手 鼠标恢复原状  不跟随
 */
function recovery() {
	if (0 != mouseFlag) { // mouseFlag :0 不可进行恢复 ；1：添加图标后 鼠标恢复 ； 2：添加管线后没有保存管线  3、画线后 保存管线、测距、测面后 鼠标恢复
		if (1 == mouseFlag) {
			markers.removeMarker(markers.markers[markers.markers.length - 1]);
			map.events.unregister('mousemove', map, mouseMoveEventForAddSite);
			map.events.unregister('click', map, clickEventForAddSite);
		} else if (2 == mouseFlag) {
			toggleControl('');
		} else if (3 == mouseFlag || 4 == mouseFlag) {
			toggleControl('');
			polygonStyleLayer.removeFeatures(polygonStyleLayer.features[polygonStyleLayer.features.length - 1]);
		}
		isDrawSite = false;
		mouseFlag = 0;
		recoeriedMouse = true;
	}
}

/**
 * 点击取消、保存按钮 后 将对应的文本框中清空
 */
function clearSiteWindow() {
	document.getElementById("site_name1").value = "";
	document.getElementById("site_id1").value = "";
	document.getElementById("site_addr1").value = "";
	document.getElementById("site_unit1").value = "";

	document.getElementById("site_name_del").value = "";
	document.getElementById("site_id_del").value = "";
	document.getElementById("site_jd_del").value = "";
	document.getElementById("site_wd_del").value = "";
	document.getElementById("site_addr_del").value = "";
	document.getElementById("site_unit_del").value = "";
	document.getElementById("site_bz_del").value = "";
	document.getElementById("site_id_to_del").value = "";
	document.getElementById("id_siteCode").value = "";
	document.getElementById("id_siteName").value = "";
}

/**
 * 操作成功后的提示
 */
function showResult(information) {
	$.messager.show( {
		title : '提示',
		msg : information,
		showType : 'slide'
	});
}

/**
 * 操作成功后的提示
 */
function showOk() {
	$.messager.show( {
		title : '提示',
		msg : '操作成功!',
		showType : 'slide'
	});
}

var geojson_format = new OpenLayers.Format.GeoJSON();

function getGeoJson() {
    if (polygonStyleLayer.features.length > 0) {
        return geojson_format.write(polygonStyleLayer.features[polygonStyleLayer.features.length - 1], true);
    }
    return null;
}
