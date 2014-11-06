/**
 * 打开显示结点的窗口 删除
 */
function openShowPointWindow() {
	$('#show-point-window').css('display', 'block');
	$('#show-point-window').window( {
		title : '标注信息',
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
 * 打开添加结点的窗口
 */
function openAddPointWindow() {
	$('#id-point-window').css('display', 'block');
	$('#id-point-window').window( {
		title : '结点添加',
		width : 500,
		height : 300,
		modal : true,
		closable : false,
		minimizable : false,
		maximizable : false,
		iconCls : 'icon-add'
	});
}

/**
 * 保存结点
 */
function savePoint() {
	var siteId = document.getElementById("site_id2").value;
	var siteName = document.getElementById("site_name2").value;
	// 经度
	var pointLongitude = document.getElementById("pointLongitude").value;
	var pointLatitude = document.getElementById("pointLatitude").value;
	if ("" == siteName) {
		$.messager.alert('提示', '结点名称不能为空！');
		return false;

	} else if ("" == siteId) {
		$.messager.alert('提示', '结点编号不能为空！');
		return false;
	} else if ( '' == $('#owner_unit').val()) {
		$.messager.alert('提示', '请选择管理单位！');
		return false;
	}  else if ("Z" == $('#ownertype').val()
			&& ('' == $('#owner_site').combobox('getValue'))) {

		$.messager.alert('提示', '请选择热力站！');
		return false;

	}else if ("R" == $('#ownertype').val()
			&& ('' == $('#owner_site').combobox('getValue'))) {
		$.messager.alert('提示', '请选择热源！');
		return false;
	} else {
		var urlStr = pathBase + 'map/savePoint.do?siteName='+siteName+'&siteId='+siteId+'&pointLongitude='+pointLongitude+'&pointLatitude='+pointLatitude;
		alert("url:"+urlStr);
		$.ajax( {
			url : urlStr,
			type : 'post',
			data : $('#id-form-point').serialize(),
			success : function(json) {
				//添加成功后，将最后添加的marker清掉				
				if ("0" == json) {
					$.messager.alert('提示', '名称或编号已存在！');
					return false;
				} else {
						//添加成功后，将最后添加的marker清掉
						showResult(json[0].message);
						$('#id-point-window').window('close');
						refreshSites(2);//添加完后进行刷新图标
				}
			}
		});
	}
}