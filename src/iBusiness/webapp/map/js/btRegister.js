	//公用 的 取消按钮 事件
	function btCancel(btid, e) {
		$.messager.confirm('提示', '确定不保存?', function(b) {
						if (b) {
								markers.removeMarker(markers.markers[markers.markers.length - 1]);
								$('#' + btid).window('close');
								clearSiteWindow();
						}
				});
	}
	
	//初始化按钮按钮 事件
	function initBt() {
		//添加站点时点击取消按钮事件,需要将最后添加的站点移除
		$('#bt-delete-site-cancel').bind('click', function(e) {
				$('#show-site-window').window('close');
				clearSiteWindow();
		});

	//判断删除权限
//	if (1 == inforid) {

		//删除热力站和热源时 显示窗口的 删除按钮监听事件
		$('#bt-delete-site').bind(
				'click',
				function(e) {openNewPage(2, '删除', document.getElementById("site_id_to_del").value);
					$('#show-site-window').window('close');
				});
	
		//删除结点时 显示窗口的 删除按钮监听事件													
		$('#bt-del-point').bind(
				'click',
				function(e) {
					openNewPage(3, '删除', document.getElementById("point_id_to_del").value);
					$('#show-point-window').window('close');
				});
//	}
		//添加站点时点击  取消按钮 事件,需要将最后添加的站点移除
		$('#bt-add-site-cancel').bind('click', function(e) {
			btCancel('id-site-window',e);
		});
		//添加结点时点击 取消按钮 事件,需要将最后添加的结点移除
		$('#bt-add-point-cancel').bind('click', function(e) {
			btCancel('id-point-window',e);
		});
		//删除结点时点击取消按钮事件,需要将最后添加的站点移除
		$('#bt-del-point-cancel').bind('click', function(e) {
			$('#show-point-window').window('close');
		});
		//添加站点时的 站点搜索
		$('#bt-search-site').bind('click', function(e) {
			searchSite();
		});
		//添加阀门时的 阀门搜索
		$('#bt-search-valve').bind('click', function(e) {
			searchSite();
		});
		//搜索带出 时的 模糊查询-搜索按钮
		$('#bt-search-dim').bind('click', function(e) {
			searchSite();
		});
		//搜索带出 时的 模糊查询  -取消按钮
		$('#bt-search-cancel').bind('click', function(e) {
				$('#id-window-search-site').window('close');
		});
		//绑定添加站点事件
		$('#bt-save-site').bind('click', saveSite);
		//绑定添加结点事件
		$('#bt-save-point').bind('click', savePoint);

	    $('#bt-find').bind('click', searchSites);
		//测距
		$('#bt-line-length').bind('click', function(e) {
			 mouseFlag= 3;  //可以注册鼠标恢复事件
			isDrawLine = true;
			toggleControl('line');
			$('#id-line-type').val('2');
		});
		//测面
		$('#bt-area').bind('click', function(e) {
			 mouseFlag=3;  //可以注册鼠标恢复事件
			isDrawLine = true;
			toggleControl('polygon');
			$('#id-line-type').val('3');
		});
	}