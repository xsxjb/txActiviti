/**
 * 初始化客户图标
 */
function initTB() {
	/** */
	$.ajax( {
				url : pathBase + 'map/queryMapIconType.do',
				success : function(json) {
					var jsonArray = JSON.parse(json);
					var html = '';
					$.each(jsonArray, function(i, n) {
						html += '<td><img src="' + pathBase + n.iconPath + '">';
						if (1 == inforid) {
							html += ' <a href="javascript:void(0);" '
									+ ' onclick="readyAddSite(\'' + n.iconPath
									+ '\',\'' + n.id+ '\',\'' + n.iconId
									+ '\');">' + n.iconName + '</a>';
						} else {
							html += ' ' + n.iconName;
						}
						html += '</td>';
					});
					// 
					$('#id-dv-tb').html('<table width="100%"><tr><td><img src="images/mouse.png" onmouseover="setover(this)" onmouseout="setout(this)"  onclick="recovery()"/></td>' + html + '</tr></table>');
				}
			});
}

/**
 * 准备添加客户
 * @param path 客户类型图片的路径
 * @param type 客户类型
 */
function readyAddSite(path, tb_sn, type) {
	$('#id-site-img').val(pathBase + path);
	$('#id-site-type').val(type);
	$('#point-id-tb-sn').val(tb_sn);
	//isDrawSite = true;
	
	map.events.unregister('mousemove', map, mouseMoveEventForAddSite);
	map.events.unregister('click', map, clickEventForAddSite);
	
    mouseFlag = 1 ;  //此时可以进行鼠标恢复
	map.events.register('mousemove', map, mouseMoveEventForAddSite);
	map.events.register('click', map, clickEventForAddSite);

}

/**
 * 添加客户时鼠标移动事件
 * @param e
 */
function mouseMoveEventForAddSite(e) {
	isDrawSite = true;
	var moveMarker = window.moveMarker;
	if (moveMarker)
		markers.removeMarker(moveMarker);
	var lonlat = map.getLonLatFromViewPortPx(e.xy);
	var feature = new OpenLayers.Feature(markers, lonlat);
	var size = new OpenLayers.Size(16, 16);
	var offset = new OpenLayers.Pixel(-(size.w / 2), -(size.h / 2));
	var icon = new OpenLayers.Icon($('#id-site-img').val(), size, offset);
	feature.data.icon = icon;
	moveMarker = feature.createMarker();
	window.moveMarker = moveMarker;
	markers.addMarker(moveMarker);

}

/**
 * 添加客户时鼠标点击事件(点击后需要弹出窗口进行客户添加)
 * @param e
 */
function clickEventForAddSite(e) {
	var lonlat = map.getLonLatFromViewPortPx(e.xy);
	addSiteMarker( {
		lonlat : lonlat,
		icon : $('#id-site-img').val()
	});
	lonlat = lonlat.transform(new OpenLayers.Projection("EPSG:900913"), new OpenLayers.Projection("EPSG:4326"));
	//form表单赋值
	//如果是添加结点 则显示下面窗口
	if ("P" == $('#id-site-type').val()) {
		var form = $('#id-form-point');
		$(':input[id=pointLongitude]', form).val(lonlat.lon);
		$(':input[id=pointLatitude]', form).val(lonlat.lat);
		openAddPointWindow();
	// 结点 归属单位下拉列表  initUnitSelect();
	} else {//不是添加结点 则显示下面窗口
		var form = $('#id-form-site');
		$(':input[name=longitude]', form).val(lonlat.lon);
		$(':input[name=latitude]', form).val(lonlat.lat);
		openAddSiteWindow();
	
		$.ajax( {
			url : pathBase + 'map/findIconStatusByType.do?iconId=' + $('#id-site-type').val(),
			dataType : 'json',
			success : function(json) {
				$('#id_site_tbsn').combobox( {
					data : json,
					valueField : 'iconId',
					textField : 'iconStatusName'
				});
				//将图标下拉列表默认设置为第一个
			$('#id_site_tbsn').combobox('setValue', json[0].iconId);
		}
		});
	}
}

AutoSizeFramedCloud = OpenLayers.Class(OpenLayers.Popup.FramedCloud, {'autoSize' : true});


/**
 * 添加客户图标
 * @param o
 */
function addSiteMarker(o) {
	var feature = new OpenLayers.Feature(markers, o.lonlat);
	feature.closeBox = true;
	feature.popupClass = AutoSizeFramedCloud;
	feature.data.popupContentHTML = '';
	feature.data.overflow = "auto";
	var size = new OpenLayers.Size(16, 16);
	var offset = new OpenLayers.Pixel(-(size.w / 2), -(size.h / 2));
	var icon = new OpenLayers.Icon(o.icon, size, offset);
	feature.data.icon = icon;
	var marker = feature.createMarker();
	//客户鼠标悬停
	marker.events.register("hover", feature, function() {
		window.mouseMoverMarker = marker;
		mouseEventForSite(feature, o.id, o.sitetype, o.siteid,o.sitetb,o.siteInfo,'hover');
	});
	//客户鼠标悬停
	marker.events.register("mouseout", feature, function() {
		window.mouseMoverMarker = marker;
		mouseEventForSite(feature, o.id, o.sitetype, o.siteid,o.sitetb,o.siteInfo,'mouseout');
	});
	//鼠标单击客户 
	marker.events.register('click', feature, function() {
        window.mouseMoverMarker = marker;
		showInforToDel(o.siteid, o.sitetype);
	});
	// 添加Marker图层
	markers.addMarker(marker);
	if (o.isNew) {
		var popupLength = map.popups.length;
		for ( var i = 0; i < popupLength; i++) {
			popup = map.popups[i];
			map.removePopup(popup);
		}
		feature.popup = feature.createPopup(true);
		feature.popup.size = new OpenLayers.Size(20, 20);
		feature.popup.contentHTML = '这个是刚刚新添加的标注';
		map.addPopup(feature.popup);
		feature.popup.show();
	}
	if (o.isSearch) {
		refreshSites(2);//解决搜索多次的时候 会出现图标加深的问题
		var popupLength = map.popups.length;
		for ( var i = 0; i < popupLength; i++) {
			popup = map.popups[i];
			map.removePopup(popup);
		}
		feature.popup = feature.createPopup(true);
		feature.popup.size = new OpenLayers.Size(20, 20);
		feature.popup.contentHTML = '这个是搜索到的标注';
		map.addPopup(feature.popup);
		feature.popup.show();
	}
}

/**
 * 初始化客户,将所有有效的客户进行标注
 */
function initSites() {
	/** */
	$.ajax( {
		url : pathBase + 'map/findValidSites.do',
		dataType : 'json',
		success : function(json) {
			$.each(json, function(i, n) {
				var lonlat = new OpenLayers.LonLat(n.longitude, n.latitude);
				addSiteMarker({lonlat : lonlat.transform(new OpenLayers.Projection("EPSG:4326"), new OpenLayers.Projection("EPSG:900913")),
											icon : pathBase + n.iconPath,
											id : n.id,
											siteid : n.siteNo,
											sitetype : n.iconId,
											sitetb : n.iconTypeId
										});
			});
		}
	});
}

/**
 * 保存客户
 */
function saveSite() {
	if ("" == document.getElementById("site_name1").value) {
		$.messager.alert('提示', '客户名称不能为空！');
		return false;
	} else if ("" == document.getElementById("site_id1").value) {
		$.messager.alert('提示', '客户编号不能为空！');
		return false;
	}else if(("J"==document.getElementById("tbtype1").value)&&( map.zoom>=7)){
		$.messager.alert('提示', map.zoom+'请将地图图层设置为上数1、2级再进行该操作！');
		return false;
	}
	$.ajax( {
		url : pathBase + 'map/saveSite.do',
		type : 'post',
		data : $('#id-form-site').serialize(),
		success : function(json) {
			if (json != '0') {
					//添加成功后，将最后添加的marker清掉
					marker = markers.markers[markers.markers.length - 1];
					//重新添加新的marker
					var lonlat = marker.lonlat;
					var icon = marker.icon;
					markers.removeMarker(marker);
					addSiteMarker( {
							lonlat : lonlat.transform(new OpenLayers.Projection("EPSG:4326"), new OpenLayers.Projection("EPSG:900913")),
							icon : icon,
							id : json,
							isNew : true
					});
					showOk();
					$('#id-site-window').window('close');
					clearSiteWindow();
					window.moveMarker = null;
					refreshSites(2);
					//添加客户后 自动刷新页面
					location.reload();
			}
		}
	});
}


/**
 * 删除客户时，先显示客户信息
 * @param {Object} siteid 为客户编号
 */
function showInforToDel(siteid, sitetype) {
	if ("P" == sitetype) {
		$.ajax( {
					url : pathBase + 'map/findPointInfoToDel.action?id=' + siteid ,
					success : function(json) {
					if("0" != json){				
						document.getElementById("point_name_del").value = json.NAMEDEL;
						document.getElementById("point_id_del").value = json.IDDEL;
						document.getElementById("point_jd_del").value = json.JDDEL;
						document.getElementById("point_wd_del").value = json.WDDEL;
						document.getElementById("point_manage_del").value = json.MANAGEDEL;
				
						if(!(null==json.UNITDEL||"null"==json.UNITDEL)){
						document.getElementById("point_unit_del").value = json.UNITDEL;
						}
						document.getElementById("point_id_to_del").value = json.PKID;
							openShowPointWindow();
							}else {
								alert("没有找到相关信息！请联系管理员！");							   
							}
					}
				});
	}  else if ("Z" == sitetype) {
		openShowSiteWindow();
		$.ajax( {
					url : pathBase + 'map/findSiteInfoToDel.do?siteNo=' + siteid + '&iconId=' + sitetype,
					dataType : 'json',
					success : function(json) {
						document.getElementById("site_name_del").value = json.siteName;
						document.getElementById("site_id_del").value = json.siteNo;
						document.getElementById("site_jd_del").value = json.longitude;
						document.getElementById("site_wd_del").value = json.latitude;
						if(!(null==json.customeraddress||"null"==json.customeraddress)){							
						     document.getElementById("site_addr_del").value = json.customeraddress;
						 }
						document.getElementById("site_unit_del").value = json.UNITDEL;
						if(null==json.BZDEL||"null"==json.BZDEL){
					    	document.getElementById("site_bz_del").value = '--';
						 }else{
						   document.getElementById("site_bz_del").value = json.BZDEL;
						 }
						document.getElementById("site_id_to_del").value = json.id;
						if(null!=json.IMAGEURL&&"null"!=json.IMAGEURL){
						  imageInfor.innerHTML="<img src='"+pathImg +"uploadfile/"+ encodeURIComponent(json.IMAGEURL)+"' width='470' height='320'>";
						}else{
						  imageInfor.innerHTML="<table style=\"width:100%\" border=0><tr><td align=\"center\">暂无关联图片！</td></tr></table>";
						}
					}
				});
	}
}
/**
 * 删除图标; 模拟打开新页面
 * @param title
 * @param site
 */
function openNewPage(type, title, site) {
	if (type == 2) {
		$.messager.confirm('提示', '确定要删除?', function(b) {
			if (b) {
				$.ajax( {
					url : pathBase + 'map/deleteSite.do?siteId=' + site,
					dataType : 'json',
					success : function(json) {
						if (json == '1')  {
								showOk();
								markers.removeMarker(window.mouseMoverMarker);
								refreshSites(2);//刷新图标 不带实时状态
								//如果实时显示和鼠标悬停都设置为未勾选
							   document.getElementById('mouseSelect').checked = false;
			                   document.getElementById('initSiteTap').checked = false;
								var popupLength = map.popups.length;
								for ( var i = 0; i < popupLength; i++) {
									popup = map.popups[i];
									map.removePopup(popup);
								}
						}
					}
				});
			}
		});
	} else if(3==type){
			$.messager.confirm('提示', '确定要删除?', function(b) {
			if (b) {
				$.ajax( {
					url : pathBase + 'siteAction!deleteSitePoint.action?siteId=' + site,
					dataType : 'json',
					success : function(json) {
						if (json.result == '1') {
							showOk();
					markers.removeMarker(window.mouseMoverMarker);
					refreshSites(2);//刷新图标 不带实时状态
					var popupLength = map.popups.length;
					for ( var i = 0; i < popupLength; i++) {
						popup = map.popups[i];
						map.removePopup(popup);
					}
				}
			}
				});
			}
		});
	}else {
		$.messager.alert('提示', '调用js方法进行操作提示:' + title + ',客户编号:' + site);
		window.open('newPage.html');
	}
}



/**
 * 搜索客户
 */
function searchSite() {
	$('#id-window-search-site').css('display', 'block');
	$('#id-window-search-site').window( {
		modal : true,
		title : '客户搜索',
		iconCls : 'icon-search',
		width : 550,
		height : 400,
		closable : false,
		minimizable : false,
		maximizable : false

	});
	queryTBSite();
}

/**
 * 搜索客户表 带出客户相关信息
 * @memberOf {TypeName} 
 * @return {TypeName} 
 */
function queryTBSite() {
	if ("Z" == $('#id-site-type').val()) {
		var url = pathBase + 'customer/queryCustomerInfo.do?idSiteCode='
				+ $('#id_siteCode').val() + '&idSiteName=' + $('#id_siteName').val() + '&idSiteType=' + $('#id-site-type').val();
		$('#id-grid-site').datagrid({
		                url : encodeURI(url),
						columns : [ [ 
								              {field : 'customerno', title : '标注编号', width : 90 },
								              {field : 'customername', title : '标注名称', width : 90 },
								              {field : 'telephone', title : '联系电话', width : 100 },
								              {field : 'customeraddress', title : '地址', width : 100 },
										      {field : 'id', title : '操作', width : 80, formatter : function(id) {
										    	           var ret = "<span style='color:red'><input name='aa' value='选择' onClick='javascript: showInfor1(\"" + id + "\")' type='button' /></span>"; 
										    	           return ret;
										    	       }
								              } 
						              ] ],
						iconCls : 'icon-edit',//图标  
						width : 500,
						height : 'auto',
						nowrap : false,
						striped : true,
						border : true,
						collapsible : false,//是否可折叠的  
						// fit: true,//自动大小      
						remoteSort : false,
						idField : 'id',
						singleSelect : false,//是否单选  
						pagination : true,//分页控件  
						rownumbers : true
						//行号  
		    });
	} else if ("R" == $('#id-site-type').val()) {
		var u = pathBase + 'mapHeatSourceAction!findAllSource.action?idSiteCode='
				+ $('#id_siteCode').val() + '&idSiteName='
				+ $('#id_siteName').val() + '&idSiteType='
				+ $('#id-site-type').val();
		$('#id-grid-site')
				.datagrid(
						{
							url : encodeURI(u),
							columns : [ [
									{
										field : 'HEATSOURCEID',
										title : '标注编号',
										width : 90
									},
									{
										field : 'HEATSOURCENAME',
										title : '标注名称',
										width : 90
									},
									{
										field : 'UNITNAME',
										title : '所属单位',
										width : 100
									},
									{
										field : 'HEATSOURCEADDRESS',
										title : '地址',
										width : 100
									},
									{
										field : 'ID',
										title : '操作',
										width : 80,
										formatter : function(ID, rec) {
											var ret = "<span style='color:red'><input name='aa' value='选择' onClick='showInfor1(\""
													+ ID
													+ "\")' type='button' /></span>";
											return ret;
										}
									} ] ],

							iconCls : 'icon-edit',//图标  
							width : 500,
							height : 'auto',
							nowrap : false,
							striped : true,
							border : true,
							collapsible : false,//是否可折叠的  
							// fit: true,//自动大小      
							remoteSort : false,
							idField : 'ID',
							singleSelect : false,//是否单选  
							pagination : true,//分页控件  
							rownumbers : true
						//行号  
						});
	}
	// 
    var p = $('#id-grid-site').datagrid('getPager');  
     $(p).pagination({
	        pageSize: 10,//每页显示的记录条数，默认为10  
	        pageList: [5,10,15],//可以设置每页记录条数的列表  
	        beforePageText: '第',//页数文本框前显示的汉字  
	        afterPageText: '页  共 {pages} 页',  
	        //  displayMsg: '当前显示 {from} - {to} 条记录 共 {total} 条记录',  
	        displayMsg: '共 {total} 条记录',  
	        onBeforeRefresh:function(){ 
		            $(this).pagination('loading'); 
		            $(this).pagination('loaded'); 
	        }  
    });
}
/**
 * 添加客户,公司时，搜索后 点击选择 将信息带出
 * @param {Object} pkid 为tx_site 的主键
 */
function showInfor1( fkid){
	//点击选择后 关掉当前窗口
	 $('#id-window-search-site').window('close');
	 if("R"==$('#id-site-type').val()){
		 $.ajax({
				url:pathBase+'mapHeatSourceAction!findSource.action?snid='+fkid,		
				success:function(json){
					$.each(json.list,function(i,n) {
					      document.getElementById("site_name1").value = n.HEATSOURCENAME;
					      document.getElementById("site_id1").value = n.HEATSOURCEID;
					      document.getElementById("site_addr1").value = n.HEATSOURCEADDRESS;
					      document.getElementById("site_unit1").value = n.UNITNAME;
			       })
			   }	 	
		 });
	 	 //获得关联的标注类型号，	
	      document.getElementById("tbtype1").value = $('#id-site-type').val();
	 	 //获得关联的ID号，	
	      document.getElementById("fkid1").value = fkid;
	 } else if ("Z"==$('#id-site-type').val()){ 
		 // 根据ID取得客户信息
		 	$.ajax({
			    url:pathBase+'customer/queryCustomerById.do?id='+fkid,
			    dataType:'json',
				success:function(json){
				      document.getElementById("site_name1").value = json.customername;
				      document.getElementById("site_id1").value = json.customerno;
				      document.getElementById("site_addr1").value = json.customeraddress;
				      document.getElementById("site_unit1").value = json.telephone;	       
			   }
		   });
		  //获得关联的标注类型号，	
	      document.getElementById("tbtype1").value = $('#id-site-type').val();
	 	  //获得关联的ID号，	
	      document.getElementById("fkid1").value = fkid;
	 }
  }