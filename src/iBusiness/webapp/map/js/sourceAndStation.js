	/**
	 * 打开添加站点的窗口
	 */
	function openAddSiteWindow() {
		$('#id-site-window').css('display', 'block');
		$('#id-site-window').window( {
			title : '标注添加',
			width : 500,
			height : 400,
			modal : true,
			closable : false,
			minimizable : false,
			maximizable : false,
			iconCls : 'icon-add'
		});
	}
	/**
	 * 打开显示站点的窗口 删除
	 */
	function openShowSiteWindow() {
		$('#show-site-window').css('display', 'block');
		$('#show-site-window').window( {
			title : '标注信息',
			width : 500,
			height :400,
			modal : true,
			closable : false,
			minimizable : false,
			maximizable : false,
			iconCls : 'icon-add'
		});
	}
	
	
	//装热力站中 各机组的数据
	var showArray =  new Array();
	var associatedSites = new Array();
	/**
	 * 鼠标经过站点时的事件
	 * @param feature
	 * @param site
	 */
	function mouseEventForSite(feature, site, sitetype,siteid,sitetbsn,siteinfo,isMouseout) {
		//判断是否显示信息
		var mouseSelect = document.getElementById('mouseSelect').checked;
		var defaultSite = document.getElementById('defaultSite').checked;
			var popupLength = map.popups.length;
			for ( var i = 0; i < popupLength; i++) {
				popup = map.popups[i];
				map.removePopup(popup);
			}
			feature.popup = feature.createPopup(true);
			feature.popup.size = new OpenLayers.Size(20, 20);
	 //突出显示相关联的的站点	
	 if (defaultSite) {
	  //鼠标移出 恢复默认图标
	  if("mouseout"==isMouseout){
		      	for(var i=0;i<associatedSites.length;i+=2){
		      		     markers.markers[associatedSites[i]].icon.setUrl(associatedSites[i+1]);
			     }
			    associatedSites = new Array();
	    } 
	} else if(mouseSelect){
			if (site) {
			} else {
				feature.popup.contentHTML = '没有ID';
				map.addPopup(feature.popup);
				feature.popup.show();
			}
		}
	}
	
	/**
	 * 浏览热力站时  切换机组
	 * @param {Object} unitInfo
	 */
	function unitTap(unitInfo) {
		document.getElementById('showUnitInfo').innerHTML = showArray[unitInfo];
	}
	/**
	 * 热力站或热源的实时数据超过正常范围的 字体颜色
	 * @param {Object} value
	 * @return {TypeName} 
	 */
	function warnningColor(value) {
		var style = "";
		if (value < -5)
			style = 'style=\'color:blue;font-weight: bold;\'';
		else if (value > 5)
			style = 'style=\'color:red;font-weight: bold;\'';
		else
			style = 'style=\'color:green;font-weight: bold;\'';
		var html = '<td ' + style + '>' + value + '</td>';
		return html;
	}