// 获取路径
var path = window.location.protocol + "//" + window.location.host+ "/XMCP/";
Ext.Loader.setConfig({	enabled : true});
Ext.Loader.setPath('Ext.ux', path + 'js/ext/ux');
Ext.require(['Ext.grid.*', 'Ext.data.*', 'Ext.util.*', 'Ext.state.*','Ext.form.*', 'Ext.ux.CheckColumn']);

Ext.onReady(function() {
	

	
	// grid列表的列模型
	Ext.define('devUnitModel', {
		extend : 'Ext.data.Model',
		fields : [
			{ name : 'id', type : 'string' },
			{ name : 'heatStationId', type : 'string' },
			{ name : 'heatStationName', type : 'string' },
			{ name : 'userName', type : 'string' },
			{ name : 'controlX', type : 'bool' },
			{ name : 'controlB', type : 'bool' },
			{ name : 'controlV', type : 'bool' }
		]
	});

	// create the Data Store
	var store = Ext.create('Ext.data.Store', {
		model : 'devUnitModel',
		//设置每页显示多少条（这个要与后台分页数一致）
		//pageSize : pageSize,
		remoteSort : true,
		proxy : {
			// 异步获取数据，这里的URL可以改为任何动态页面，只要返回JSON数据即可
			type : 'ajax',
			url : path + 'stationAuthorizeAction!queryList.action', // 请求地址
			reader : {
				type : 'json',
				root : 'topics', //那个为list数据集
				totalProperty : 'totalCount' //设置返回的json中那个为记录总数
			},
			simpleSortMode : true
		},
		queryMode : 'local',
		autoLoad : true, //直接查询（无需调用）
		sorters : [
			{
				property : 'uuid',
				direction : 'ASC'
			}
		]
	});
	

	// 用户下拉数据源
	var userStore = Ext.create('Ext.data.JsonStore', {
		fields : ['userId', 'userName'],
		proxy : {
			// 异步获取数据，这里的URL可以改为任何动态页面，只要返回JSON数据即可
			type : 'ajax',
			url : path + 'commonAction!userCombo.action', // 请求地址
			data : 'userComboInfo'
		}
	});
	// 用户下拉框
    var userCombo = Ext.create('Ext.form.field.ComboBox', {
          fieldLabel: '&nbsp;&nbsp;用户名',     //显示名
          displayField: 'userName',     		//显示字段
          valueField: 'userId',     			//以取值的数据的字段名
          id:'userId',
          width: 240,               			//combox宽
          columnWidth:.30,
          multiSelect:false,        			//是否多选
          labelWidth: 60,           			//label长度
          store: userStore,   					//数据源
          //emptyText:'全部',             //默认值
          queryMode: 'local',       			//最好设定queryMode为local，这样可以提高用户的响应速度
          editable:false            			//是否可以编辑
    });

	// create the Data Store
	var storeCombox = Ext.create('Ext.data.Store', {
		model : 'devUnitModel'
	});

	/**
	 * 修复Grid的loadMask的BUG
	 */
	Ext.override(Ext.view.AbstractView, {
		onRender : function() {
			var me = this;
			this.callOverridden();
			if (me.mask && Ext.isObject(me.store)) {
				me.setMaskBind(me.store);
			}
		}
	});

	var cellEditing = Ext.create('Ext.grid.plugin.CellEditing', {
		clicksToEdit : 1
	});
	var rowEditing = Ext.create('Ext.grid.plugin.RowEditing', {
		clicksToMoveEditor : 1,
		autoCancel : false
	});
	
	
	
	// grid表格
	var grid = Ext.create('Ext.grid.Panel', {
		title : '热力站控制下发授权页面',
		store : store,
		//height : 300,
		region : "center",
		//圆角边
		frame : false,
		//split:true,
		collapsible: false,//不能折叠
		viewConfig : {
			loadMask : true,
			loadMask : {
				msg : "数据加载中..."
			}
		},
		columns : [
					{ header : '编号',hidden:true, width:100,dataIndex : 'id',  align : 'center'},
					{ header : '换热站编号', width:100,dataIndex : 'heatStationId',  align : 'center'},
					{ header : '换热站名称',width:140, dataIndex : 'heatStationName',  align : 'center'},
					{ header : '用户',width:140, dataIndex : 'userName',  align : 'center'},
					{ header : '循环泵下发', dataIndex : 'controlX', flex : 1, align : 'center', xtype : 'checkcolumn'},
					{ header : '补水泵下发', dataIndex : 'controlB', flex : 1, align : 'center', xtype : 'checkcolumn' },
					{ header : '调节阀下发', dataIndex : 'controlV', flex : 1, align : 'center', xtype : 'checkcolumn' }
			 ],
		
		tbar : [
			
			userCombo, 
			
			new Ext.Button({
				text : "查询",
				icon : path + 'css/custom/images/query.gif',
				width : 80,
				handler : function(btn) {
					queryRequest();
				}
			})
			, 
			{
				text : '初始化数据',
				icon : path + 'css/custom/images/refresh.png',
				handler : function() {
					
					initData();
				}
			}
			,
			{
				itemId : 'remove',
				text : '删除',
				iconCls : 'icon-delete',
				handler : function() {
					Ext.MessageBox.confirm('确认', '您确认要删除选中的记录吗？',
						function(btn) {
							if (btn == 'yes') {
								var listRecord = new Array();
								var sm = grid.getSelectionModel();
								for (var i = 0; i < sm.getSelection().length; i++) {
									var record = sm.getSelection()[i];
									listRecord.push(record.data.id);
								};
								//删除选中的数据
								deleteConfigData(listRecord, sm);
							}
						}
					);
				},
				disabled : true
			}
			,
			{
				iconCls : 'icon-save',
				itemId : 'icon-save',
				text : '保存',
				scope : this,
				handler : function() {
					   //保存按钮失效
						grid.down('#icon-save').setDisabled(true);
						var listRecord = new Array();
						var listRecord1 = new Array();
						listRecord = store.getModifiedRecords();
						for (var i = 0; i < listRecord.length; i++) {
							var record = listRecord[i];
							listRecord1.push(record.data);
						};
						if (listRecord1.length < 1) {
							Ext.MessageBox.show({ title : "提示", msg : "没有修改！", buttons : Ext.Msg.OK, modal : false });
							//保存按钮生效
							grid.down('#icon-save').setDisabled(false);
							return;
						}else{
							updateConfigData(listRecord1);
						}
				}
			},
			{
				text : '全部授权',
				icon : path + 'css/custom/images/list-items.gif',
				handler : function() {
					
					checkAll();
				}
			}
			,
			{
				text : '全部取消',
				icon : path + 'css/custom/images/grid.png',
				handler : function() {
					
					invertAll();
				}
			}
		],
		selModel : Ext.create('Ext.selection.CheckboxModel', {
			mode : "SIMPLE"
		}),
		plugins : [cellEditing],
		listeners : {
			'selectionchange' : function(view, records) {
				grid.down('#remove').setDisabled(!records.length);
			}
		},
		// 列线
		columnLines : true
	});
	
	
	// 自适应
	var viewport = Ext.create('Ext.Viewport', {
		layout : 'border',
		items : [ grid ]
	});
	
	
	/*************************************************************************************
	 * 加载用户列表时，在顶部添加一个[全部]选项
	 *
	 *************************************************************************************/
	userStore.load({callback :function(r,options,success){  
        if(success){  
        
        	userCombo.setValue(userStore.getAt(0).get("userId"));
        	userCombo.setRawValue(userStore.getAt(0).get("userName"));
        	
        	//查询
        	queryRequest();
        }  
    }});
    
	/*************************************************************************************
	 * 查询列表
	 *
	 *************************************************************************************/
	function queryRequest() {
	    //获得第一个用户的ID
       	var userId = userCombo.getValue();
       	var userName = userCombo.getRawValue();
       	//alert( userId+"-->"+userName );
	       	
        store.load( {    
            params : {    
                userId : userId   ,
                userName:userName
            },    
            scope : this,    
          	//返回值    
            callback : function(r,options,success) {    
               //数据返回了  
               if( store.data.length <= 0 ){
               		//初始化
					//initData();  
               }     
            }    
        });  
	}

	/*************************************************************************************
	 *	初始化数据
	 *
	 *************************************************************************************/
	function initData(){
		
	    //获得当前选择的用户
       	var userId = userCombo.getValue();
       	var userName = userCombo.getRawValue();
       	      	
       	//alert( userId+"-->"+userName );
		//1.提示用户确认初始化数据
		Ext.MessageBox.confirm('确认', '您确认要初始化('+userName+')用户的数据吗？<br/>初始化会清空原有的历史数据！<br/>默认没有下发权限！', function(btn) {     
		    if( btn == 'yes' ){    
		    	//AJAX请求
				Ext.Ajax.request({
					method : "post",
					url : path + "stationAuthorizeAction!initData.action",
					params : {
						userId:userId,
						userName:userName
					},
					success : function(result, request) {
					
						//1.显示服务器返回消息
						Ext.MessageBox.alert('服务器消息', Ext.decode(result.responseText)['msg'] );
						//2.重新查询
		            	queryRequest();
					},
					failure : function(result, request) {
						Ext.MessageBox.alert('服务器消息', Ext.decode(result.responseText)['msg']  );
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						// 信息发送失败
						Ext.MessageBox.alert('消息', '信息发送失败!'  );
					}
				});
		    }    
		});  
	}
	
	/*************************************************************************************
	 *	删除配置数据
	 *
	 *************************************************************************************/
	function deleteConfigData(listRecord, sm){
		// 发起AJAX请求，提交参数
		Ext.Ajax.request({
			method : "POST",
			url : path + "stationAuthorizeAction!deleteConfigData.action",
			params : {
				updateData : Ext.encode(listRecord)
			},
			dataType : "text",
			// 信息发送成功
			success : function(result, request) {
			
				//1.显示服务器返回消息
				Ext.MessageBox.alert('服务器消息', Ext.decode(result.responseText)['msg'] );
				//2.重新查询
            	queryRequest();
				
			},
			failure : function(result, request) {
				Ext.MessageBox.alert('服务器消息', Ext.decode(result.responseText)['msg']  );
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				// 信息发送失败
				Ext.MessageBox.alert('消息', '信息发送失败!'  );
			}
		});
	}

	/*************************************************************************************
	 *	修改配置数据
	 *
	 *************************************************************************************/
	function updateConfigData(listRecord1){

		Ext.MessageBox.confirm('确认', '您确认更新记录吗？',
			function(btn) {
				if (btn == 'yes') {
							
					// 发起AJAX请求，提交参数
					Ext.Ajax.request({
						method : "POST",
						url : path + "stationAuthorizeAction!updateConfigData.action",
						params : {
							updateData : Ext.encode(listRecord1)
						},
						dataType : "text",
						// 信息发送成功
						success : function(result, request) {
						
							//保存按钮生效
							grid.down('#icon-save').setDisabled(false);
							
							//1.显示服务器返回消息
							Ext.MessageBox.alert('服务器消息', Ext.decode(result.responseText)['msg'] );
							//2.重新查询
			            	queryRequest();
							
						},
						failure : function(result, request) {
							Ext.MessageBox.alert('服务器消息', Ext.decode(result.responseText)['msg']  );
							//保存按钮生效
							grid.down('#icon-save').setDisabled(false);
						},
						error : function(XMLHttpRequest, textStatus, errorThrown) {
							// 信息发送失败
							Ext.MessageBox.alert('消息', '信息发送失败!'  );
							//保存按钮生效
							grid.down('#icon-save').setDisabled(false);
						}
					});
				}
			}
		);
	}
	/*************************************************************************************
	 *	全部授权
	 *
	 *************************************************************************************/
	function checkAll(){
	
	    //获得当前选择的用户
       	var userId = userCombo.getValue();
       	var userName = userCombo.getRawValue();
       	
       	if( userId == '' ){
       		alert('不允许将所有用户授权!\n请选择一个用户授权.');
       		return;
       	}
       	
		Ext.MessageBox.confirm('确认', '您确认要将('+userName+')用户中所有站授权吗？',
			function(btn) {
				if (btn == 'yes') {
							
					// 发起AJAX请求，提交参数
					Ext.Ajax.request({
						method : "POST",
						url : path + "stationAuthorizeAction!checkAll.action",
						params : {
							userId:userId
						},
						dataType : "text",
						// 信息发送成功
						success : function(result, request) {
							//1.显示服务器返回消息
							Ext.MessageBox.alert('服务器消息', Ext.decode(result.responseText)['msg'] );
							//2.重新查询
			            	queryRequest();
						},
						failure : function(result, request) {
							Ext.MessageBox.alert('服务器消息', Ext.decode(result.responseText)['msg']  );
						},
						error : function(XMLHttpRequest, textStatus, errorThrown) {
							// 信息发送失败
							Ext.MessageBox.alert('消息', '信息发送失败!'  );
						}
					});
				}
			}
		);
	}
	/*************************************************************************************
	 *	全部取消
	 *
	 *************************************************************************************/
	function invertAll(){
	
	    //获得当前选择的用户
       	var userId = userCombo.getValue();
       	var userName = userCombo.getRawValue();
       	
		Ext.MessageBox.confirm('确认', '您确认要将('+userName+')用户中所有站取消授权吗？',
			function(btn) {
				if (btn == 'yes') {
							
					// 发起AJAX请求，提交参数
					Ext.Ajax.request({
						method : "POST",
						url : path + "stationAuthorizeAction!invertAll.action",
						params : {
							userId:userId
						},
						dataType : "text",
						// 信息发送成功
						success : function(result, request) {
							//1.显示服务器返回消息
							Ext.MessageBox.alert('服务器消息', Ext.decode(result.responseText)['msg'] );
							//2.重新查询
			            	queryRequest();
						},
						failure : function(result, request) {
							Ext.MessageBox.alert('服务器消息', Ext.decode(result.responseText)['msg']  );
						},
						error : function(XMLHttpRequest, textStatus, errorThrown) {
							// 信息发送失败
							Ext.MessageBox.alert('消息', '信息发送失败!'  );
						}
					});
				}
			}
		);
	}

});
