<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>工程进度管理编辑</title>
    <%@include file="/common/center.jsp"%>
    <script type="text/javascript">
        // 实例化config对象
        var pp_demolition_imgConfig = {
		    id: 'pp_demolition_imgCodeGrid',
		    pageNo: ${pp_demolition_imgPage.pageNo},
		    pageSize: ${pp_demolition_imgPage.pageSize},
		    totalCount:${pp_demolition_imgPage.totalCount},
		    resultSize: ${pp_demolition_imgPage.resultSize},
		    pageCount: ${pp_demolition_imgPage.pageCount},
		    orderBy: '${pp_demolition_imgPage.orderBy == null ? '' : pp_demolition_imgPage.orderBy}',
		    asc: ${pp_demolition_imgPage.asc},
		    params: {
		        'id': '${model.id}'
		    },
			selectedItemClass: 'pp_demolition_imgSelectedItem',
			gridFormId: 'pp_demolition_imgGridForm',
			exportUrl: 'pp_demolition_img-export.do'
		};
        // 实例化table对象
		var pp_demolition_imgTable;
		$(function() {
			pp_demolition_imgTable = new Table(pp_demolition_imgConfig);
		    pp_demolition_imgTable.configPagination('.pp_demolition_imgM-pagination');
		    pp_demolition_imgTable.configPageInfo('.pp_demolition_imgM-page-info');
		    pp_demolition_imgTable.configPageSize('.pp_demolition_imgM-page-size');
		});
        // 实例化config对象
        var pp_design_imgConfig = {
		    id: 'pp_design_imgCodeGrid',
		    pageNo: ${pp_design_imgPage.pageNo},
		    pageSize: ${pp_design_imgPage.pageSize},
		    totalCount:${pp_design_imgPage.totalCount},
		    resultSize: ${pp_design_imgPage.resultSize},
		    pageCount: ${pp_design_imgPage.pageCount},
		    orderBy: '${pp_design_imgPage.orderBy == null ? '' : pp_design_imgPage.orderBy}',
		    asc: ${pp_design_imgPage.asc},
		    params: {
		        'id': '${model.id}'
		    },
			selectedItemClass: 'pp_design_imgSelectedItem',
			gridFormId: 'pp_design_imgGridForm',
			exportUrl: 'pp_design_img-export.do'
		};
        // 实例化table对象
		var pp_design_imgTable;
		$(function() {
			pp_design_imgTable = new Table(pp_design_imgConfig);
		    pp_design_imgTable.configPagination('.pp_design_imgM-pagination');
		    pp_design_imgTable.configPageInfo('.pp_design_imgM-page-info');
		    pp_design_imgTable.configPageSize('.pp_design_imgM-page-size');
		});
        // 实例化config对象
        var pp_done_imgConfig = {
		    id: 'pp_done_imgCodeGrid',
		    pageNo: ${pp_done_imgPage.pageNo},
		    pageSize: ${pp_done_imgPage.pageSize},
		    totalCount:${pp_done_imgPage.totalCount},
		    resultSize: ${pp_done_imgPage.resultSize},
		    pageCount: ${pp_done_imgPage.pageCount},
		    orderBy: '${pp_done_imgPage.orderBy == null ? '' : pp_done_imgPage.orderBy}',
		    asc: ${pp_done_imgPage.asc},
		    params: {
		        'id': '${model.id}'
		    },
			selectedItemClass: 'pp_done_imgSelectedItem',
			gridFormId: 'pp_done_imgGridForm',
			exportUrl: 'pp_done_img-export.do'
		};
        // 实例化table对象
		var pp_done_imgTable;
		$(function() {
			pp_done_imgTable = new Table(pp_done_imgConfig);
		    pp_done_imgTable.configPagination('.pp_done_imgM-pagination');
		    pp_done_imgTable.configPageInfo('.pp_done_imgM-page-info');
		    pp_done_imgTable.configPageSize('.pp_done_imgM-page-size');
		});
        // 实例化config对象
        var pp_floor_imgConfig = {
		    id: 'pp_floor_imgCodeGrid',
		    pageNo: ${pp_floor_imgPage.pageNo},
		    pageSize: ${pp_floor_imgPage.pageSize},
		    totalCount:${pp_floor_imgPage.totalCount},
		    resultSize: ${pp_floor_imgPage.resultSize},
		    pageCount: ${pp_floor_imgPage.pageCount},
		    orderBy: '${pp_floor_imgPage.orderBy == null ? '' : pp_floor_imgPage.orderBy}',
		    asc: ${pp_floor_imgPage.asc},
		    params: {
		        'id': '${model.id}'
		    },
			selectedItemClass: 'pp_floor_imgSelectedItem',
			gridFormId: 'pp_floor_imgGridForm',
			exportUrl: 'pp_floor_img-export.do'
		};
        // 实例化table对象
		var pp_floor_imgTable;
		$(function() {
			pp_floor_imgTable = new Table(pp_floor_imgConfig);
		    pp_floor_imgTable.configPagination('.pp_floor_imgM-pagination');
		    pp_floor_imgTable.configPageInfo('.pp_floor_imgM-page-info');
		    pp_floor_imgTable.configPageSize('.pp_floor_imgM-page-size');
		});
        // 实例化config对象
        var pp_metal_imgConfig = {
		    id: 'pp_metal_imgCodeGrid',
		    pageNo: ${pp_metal_imgPage.pageNo},
		    pageSize: ${pp_metal_imgPage.pageSize},
		    totalCount:${pp_metal_imgPage.totalCount},
		    resultSize: ${pp_metal_imgPage.resultSize},
		    pageCount: ${pp_metal_imgPage.pageCount},
		    orderBy: '${pp_metal_imgPage.orderBy == null ? '' : pp_metal_imgPage.orderBy}',
		    asc: ${pp_metal_imgPage.asc},
		    params: {
		        'id': '${model.id}'
		    },
			selectedItemClass: 'pp_metal_imgSelectedItem',
			gridFormId: 'pp_metal_imgGridForm',
			exportUrl: 'pp_metal_img-export.do'
		};
        // 实例化table对象
		var pp_metal_imgTable;
		$(function() {
			pp_metal_imgTable = new Table(pp_metal_imgConfig);
		    pp_metal_imgTable.configPagination('.pp_metal_imgM-pagination');
		    pp_metal_imgTable.configPageInfo('.pp_metal_imgM-page-info');
		    pp_metal_imgTable.configPageSize('.pp_metal_imgM-page-size');
		});
        // 实例化config对象
        var pp_surface_imgConfig = {
		    id: 'pp_surface_imgCodeGrid',
		    pageNo: ${pp_surface_imgPage.pageNo},
		    pageSize: ${pp_surface_imgPage.pageSize},
		    totalCount:${pp_surface_imgPage.totalCount},
		    resultSize: ${pp_surface_imgPage.resultSize},
		    pageCount: ${pp_surface_imgPage.pageCount},
		    orderBy: '${pp_surface_imgPage.orderBy == null ? '' : pp_surface_imgPage.orderBy}',
		    asc: ${pp_surface_imgPage.asc},
		    params: {
		        'id': '${model.id}'
		    },
			selectedItemClass: 'pp_surface_imgSelectedItem',
			gridFormId: 'pp_surface_imgGridForm',
			exportUrl: 'pp_surface_img-export.do'
		};
        // 实例化table对象
		var pp_surface_imgTable;
		$(function() {
			pp_surface_imgTable = new Table(pp_surface_imgConfig);
		    pp_surface_imgTable.configPagination('.pp_surface_imgM-pagination');
		    pp_surface_imgTable.configPageInfo('.pp_surface_imgM-page-info');
		    pp_surface_imgTable.configPageSize('.pp_surface_imgM-page-size');
		});
        // 实例化config对象
        var pp_tile_imgConfig = {
		    id: 'pp_tile_imgCodeGrid',
		    pageNo: ${pp_tile_imgPage.pageNo},
		    pageSize: ${pp_tile_imgPage.pageSize},
		    totalCount:${pp_tile_imgPage.totalCount},
		    resultSize: ${pp_tile_imgPage.resultSize},
		    pageCount: ${pp_tile_imgPage.pageCount},
		    orderBy: '${pp_tile_imgPage.orderBy == null ? '' : pp_tile_imgPage.orderBy}',
		    asc: ${pp_tile_imgPage.asc},
		    params: {
		        'id': '${model.id}'
		    },
			selectedItemClass: 'pp_tile_imgSelectedItem',
			gridFormId: 'pp_tile_imgGridForm',
			exportUrl: 'pp_tile_img-export.do'
		};
        // 实例化table对象
		var pp_tile_imgTable;
		$(function() {
			pp_tile_imgTable = new Table(pp_tile_imgConfig);
		    pp_tile_imgTable.configPagination('.pp_tile_imgM-pagination');
		    pp_tile_imgTable.configPageInfo('.pp_tile_imgM-page-info');
		    pp_tile_imgTable.configPageSize('.pp_tile_imgM-page-size');
		});
        // 实例化config对象
        var pp_wall_imgConfig = {
		    id: 'pp_wall_imgCodeGrid',
		    pageNo: ${pp_wall_imgPage.pageNo},
		    pageSize: ${pp_wall_imgPage.pageSize},
		    totalCount:${pp_wall_imgPage.totalCount},
		    resultSize: ${pp_wall_imgPage.resultSize},
		    pageCount: ${pp_wall_imgPage.pageCount},
		    orderBy: '${pp_wall_imgPage.orderBy == null ? '' : pp_wall_imgPage.orderBy}',
		    asc: ${pp_wall_imgPage.asc},
		    params: {
		        'id': '${model.id}'
		    },
			selectedItemClass: 'pp_wall_imgSelectedItem',
			gridFormId: 'pp_wall_imgGridForm',
			exportUrl: 'pp_wall_img-export.do'
		};
        // 实例化table对象
		var pp_wall_imgTable;
		$(function() {
			pp_wall_imgTable = new Table(pp_wall_imgConfig);
		    pp_wall_imgTable.configPagination('.pp_wall_imgM-pagination');
		    pp_wall_imgTable.configPageInfo('.pp_wall_imgM-page-info');
		    pp_wall_imgTable.configPageSize('.pp_wall_imgM-page-size');
		});
        // 实例化config对象
        var pp_water_imgConfig = {
		    id: 'pp_water_imgCodeGrid',
		    pageNo: ${pp_water_imgPage.pageNo},
		    pageSize: ${pp_water_imgPage.pageSize},
		    totalCount:${pp_water_imgPage.totalCount},
		    resultSize: ${pp_water_imgPage.resultSize},
		    pageCount: ${pp_water_imgPage.pageCount},
		    orderBy: '${pp_water_imgPage.orderBy == null ? '' : pp_water_imgPage.orderBy}',
		    asc: ${pp_water_imgPage.asc},
		    params: {
		        'id': '${model.id}'
		    },
			selectedItemClass: 'pp_water_imgSelectedItem',
			gridFormId: 'pp_water_imgGridForm',
			exportUrl: 'pp_water_img-export.do'
		};
        // 实例化table对象
		var pp_water_imgTable;
		$(function() {
			pp_water_imgTable = new Table(pp_water_imgConfig);
		    pp_water_imgTable.configPagination('.pp_water_imgM-pagination');
		    pp_water_imgTable.configPageInfo('.pp_water_imgM-page-info');
		    pp_water_imgTable.configPageSize('.pp_water_imgM-page-size');
		});
		// 提交方法--通过传入路径 提交到不同的controller
		function mainFormSubmit(path){
			$('#mainForm').attr('action', path).submit();
		}
		
		// 表单验证JS
		$(function() {
		    $("#mainForm").validate({
		        submitHandler: function(form) {
		            if (typeof(bootbox) != 'undefined') {
					    bootbox.animate(false);
					    var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
		            }
		            form.submit();
		        },
		        errorClass: 'validate-error'
		    });
		})
		
    </script>
  </head>
  <body>
    <%@include file="/ibusiness/header/header-portal.jsp"%>
    <div class="row">
	<div class="col-lg-1"></div>
	<!-- start of main -->
	<div class="panel panel-default col-lg-10"> 
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">工程进度管理流程</h4></div>
        <div class="panel-body">
		<div class="content content-inner">
		       <form id="mainForm" method="post" action="project_progress-save.do" class="form-horizontal">
		           <div class="controls">
					      <button id="submitButton" class="btn btn-primary btn-sm a-submit"><span class="glyphicon glyphicon-floppy-save"></span>保存</button>
					      <button type="button" onclick="location.href='project_progress-list.do'" class="btn btn-primary btn-sm a-cancel"><span class="glyphicon glyphicon-log-out"></span>返回</button>
				   </div>
				   <input type="hidden" name="flowId" value="${flowId}">
				   <c:if test="${model != null}">
				       <input type="hidden" name="id" value="${model.id}">
				   </c:if>
				   
                             <div class="form-group">
						      <label class="control-label col-lg-2" for="code-pactno">合同编号:</label>
                               <div class="col-lg-3">   <input id="code-pactno" type="text" name="pactno" value="${model.pactno}" class="text form-control input-sm "  ></div>
                               
							
						      <label class="control-label col-lg-2" for="code-customername">客户名称:</label>
                               <div class="col-lg-3">   <input id="code-customername" type="text" name="customername" value="${model.customername}" class="text required" >   <a href="#" class="btn btn-primary btn-sm" onclick="$('#customernameSInputDiv').modal('show');" >选择</a>   <script type="text/javascript">   	function changeValue(customername,customeraddress){   	$("#code-customername").val(customername);   	$("#code-address1").val(customeraddress);$('#customernameSInputDiv').modal('hide');        }function searchOwnername(urlStr) {  $.ajax({  	 type: "POST", 	 url: "/"+window.location.pathname.split("/")[1]+"/"+urlStr +$("#code_table_customername").val(), 	 dataType:"json", 	 success: function(jsonData){ 	   $("#customernameRowadd tr").remove();  	   $.each(jsonData, function(i, item) { 		   var newRow='            	     <tr>           	        <td><a href="#" class="btn btn-primary btn-sm" onClick="changeValue(\''+item.customername+'\',\''+item.customeraddress+'\')" >选择</a></td>  <td>'+item.customername+'</td>  <td>'+item.customeraddress+'</td>           	     </tr>';          $('#customernameRowadd').append(newRow);         });     }, 	 error: function (XMLHttpRequest, textStatus, errorThrown) { 		 alert('请求数据出错了!');     }   }); }    </script>   <div id="customernameSInputDiv" class="modal fade" tabindex="-1" style="top:20%;" >     <div class="modal-dialog">       <div class="modal-content">         <div class="modal-header">           <a href="#" class="close btn btn-primary btn-sm" onclick="$('#customernameSInputDiv').modal('hide');" ><span >&times;</span><span class="sr-only">Close</span></a>           <h4 class="modal-title glyphicon glyphicon-paperclip">选择带出</h4>           <div class="form-group">              <label for="code_table_customername">客户名:</label>              <input type="text" id="code_table_customername" name="filter_LIKES_customername" value="${param.filter_LIKES_customername}">              <a class="btn btn-primary btn-sm" href="#" onclick="searchOwnername('project_progress/customername-list.do?filter_LIKES_customername=')"><span class="glyphicon glyphicon-search"></span>查询</a>            </div>          </div>         <div class="modal-body">           <div class="content">           	<table id="codeGrid" class="table table-hover table-bordered">           	   <thead>           	   <tr>           	      <th width="80">&nbsp;</th>   <th class="sorting">客户名</th>   <th class="sorting">客户地址</th>           	   </tr>           	</thead>           	<tbody id='customernameRowadd'>           	   <c:forEach items="${customernamePage.result}" var="item">           	     <tr>           	        <td><a href="#" class="btn btn-primary btn-sm" onClick="changeValue('${item.customername}','${item.customeraddress}')" >选择</a></td>  <td>${item.customername}</td>  <td>${item.customeraddress}</td>           	     </tr>           	  </c:forEach>           	</tbody>           </table>         </div>       </div>       <div class="modal-footer">         <a href="#" class="btn btn-primary btn-sm" onclick="$('#customernameSInputDiv').modal('hide');" >关闭</a>       </div>     </div>    </div>  </div></div>
                               
                            </div>
							
                             <div class="form-group">
						      <label class="control-label col-lg-2" for="code-projectname">工程项目名称:</label>
                               <div class="col-lg-3">   <input id="code-projectname" type="text" name="projectname" value="${model.projectname}" class="text form-control input-sm required"  ></div>
                               
							
						      <label class="control-label col-lg-2" for="code-designname">设计师名:</label>
                               <div class="col-lg-3">   <input id="code-designname" type="text" name="designname" value="${model.designname}" class="text form-control input-sm required"  ></div>
                               
                            </div>
							
                             <div class="form-group">
						      <label class="control-label col-lg-2" for="code-worksmanage">工长名字:</label>
                               <div class="col-lg-3">   <input id="code-worksmanage" type="text" name="worksmanage" value="${model.worksmanage}" class="text form-control input-sm required"  ></div>
                               
							
						      <label class="control-label col-lg-2" for="code-currentprogress">当前进度:</label>
                               <div class="col-lg-3">    <select id="code-currentprogress" name="currentprogress" class="form-control input-sm " >          <option value="" >请选择</option>        <c:forEach items="${currentprogressItems}" var="item">          <option value="${item.key}" ${item.key==model.currentprogress? 'selected':''} >${item.value}</option>        </c:forEach>    </select></div>
                               
                            </div>
							
                            <div class="form-group">
						      <label class="control-label col-lg-2" for="code-designflag">设计图完成:</label>
                               <div class="col-lg-1">  <label class="radio"><input type="radio" name="designflag" value="1" ${1==model.designflag? 'checked':''} >是</label>  <label class="radio"><input type="radio" name="designflag" value="2" ${1!=model.designflag? 'checked':''} >否</label> </div>
                               
						      <label class="control-label col-lg-2" for="code-demolitionflag">拆改完成:</label>
                               <div class="col-lg-1">  <label class="radio"><input type="radio" name="demolitionflag" value="1" ${1==model.demolitionflag? 'checked':''} >是</label>  <label class="radio"><input type="radio" name="demolitionflag" value="2" ${1!=model.demolitionflag? 'checked':''} >否</label> </div>
							
						      <label class="control-label col-lg-2" for="code-waterflag">水电改造完成:</label>
                               <div class="col-lg-1">  <label class="radio"><input type="radio" name="waterflag" value="1" ${1==model.waterflag? 'checked':''} >是</label>  <label class="radio"><input type="radio" name="waterflag" value="2" ${1!=model.waterflag? 'checked':''} >否</label> </div>
							
						      <label class="control-label col-lg-2" for="code-tileflag">泥瓦工程图:</label>
                               <div class="col-lg-1">  <label class="radio"><input type="radio" name="tileflag" value="1" ${1==model.tileflag? 'checked':''} >是</label>  <label class="radio"><input type="radio" name="tileflag" value="2" ${1!=model.tileflag? 'checked':''} >否</label> </div>
                           </div>
							
                            <div class="form-group">
						       <label class="control-label col-lg-2" for="code-metalflag">金属工程:</label>
                               <div class="col-lg-1">  <label class="radio"><input type="radio" name="metalflag" value="1" ${1==model.metalflag? 'checked':''} >是</label>  <label class="radio"><input type="radio" name="metalflag" value="2" ${1!=model.metalflag? 'checked':''} >否</label> </div>
                               
						       <label class="control-label col-lg-2" for="code-wallflag">油漆工程完成:</label>
                               <div class="col-lg-1">  <label class="radio"><input type="radio" name="wallflag" value="1" ${1==model.wallflag? 'checked':''} >是</label>  <label class="radio"><input type="radio" name="wallflag" value="2" ${1!=model.wallflag? 'checked':''} >否</label> </div>
						       <label class="control-label col-lg-2" for="code-floorflag">木工工程完成:</label>
                               <div class="col-lg-1">  <label class="radio"><input type="radio" name="floorflag" value="1" ${1==model.floorflag? 'checked':''} >是</label>  <label class="radio"><input type="radio" name="floorflag" value="2" ${1!=model.floorflag? 'checked':''} >否</label> </div>
							
						       <label class="control-label col-lg-2" for="code-surfaceflag">表面工程:</label>
                               <div class="col-lg-1">  <label class="radio"><input type="radio" name="surfaceflag" value="1" ${1==model.surfaceflag? 'checked':''} >是</label>  <label class="radio"><input type="radio" name="surfaceflag" value="2" ${1!=model.surfaceflag? 'checked':''} >否</label> </div>
                           
                               <label class="control-label col-lg-2" for="code-tileflag">竣工验收:</label>
                               <div class="col-lg-1">  <label class="radio"><input type="radio" name="doneflag" value="1" ${1==model.doneflag? 'checked':''} >是</label>  <label class="radio"><input type="radio" name="doneflag" value="2" ${1!=model.doneflag? 'checked':''} >否</label> </div>
                           </div>
				</form>
		</div>
        </div> 
        
    <div class="row" >
        <!-- ==================== 子表 ========================================== -->
        <div class="col-lg-6" >
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">设计图列表</h4></div>
	    <div class="panel-body">
			    <div class="pull-left">
			        <button class="btn btn-primary btn-sm a-insert" href="pp_design_img-input.do?id=${model.id}&subId=&flowId=${flowId}'" data-target="#pp_design_imgModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-tasks"></span>新建</button>
				    <button class="btn btn-primary btn-sm a-remove" onclick="pp_design_imgTable.removeAll()"><span class="glyphicon glyphicon-trash"></span>删除</button>
				</div>
				<div class="pull-right">
				  每页显示
				  <select class="pp_design_imgM-page-size">
				    <option value="10">10</option>
				    <option value="20">20</option>
				    <option value="50">50</option>
				  </select>
				  条
				</div>
			    <div class="m-clear"></div>
		   </div>
		   <div class="content">
				<form id="pp_design_imgGridForm" name="pp_design_imgGridForm" method='post' action="pp_design_img-remove.do" class="m-form-blank">
				  <table id="pp_design_imgCodeGrid" class="table table-hover table-striped">
				      <thead>
					      <tr>
					          <th width="30" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
			                      <th class="sorting">图片地址</th>
			                      <th class="sorting">图片信息描述</th>
					          <th width="30">&nbsp;</th>
					      </tr>
					    </thead>
						    <tbody>
						      <c:forEach items="${pp_design_imgPage.result}" var="item">
								  <tr>
								        <td><input type="checkbox" class="pp_design_imgSelectedItem a-check" name="pp_design_imgSelectedItem" value="${item.id}"></td>
									            <td>${item.imgurl}</td>
									            <td>${item.imginfo}</td>
								        <td>
								          <a href="pp_design_img-input.do?id=${model.id}&subId=${item.id}" class="a-update" data-target="#pp_design_imgModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-pencil"></span></a>
								        </td>
								  </tr>
						      </c:forEach>
						    </tbody>
						  </table>
						</form>
		        </div>
		        
		      <!-- 模态框 -->
			  <div id="pp_design_imgModalInput" class="modal fade" tabindex="-1" style="display: none;" data-backdrop="static">
				  <div class="modal-dialog modal-lg">
					  <div class="modal-content" style="text-align: center;height: 600px">
					  </div>
				  </div>
			  </div>
			  <div class="panel-body">
				  <article>
				    <div class="pp_design_imgM-page-info pull-left">
					  共100条记录 显示1到10条记录
					</div>
					<div class="btn-group pp_design_imgM-pagination pull-right">
					  <button class="btn btn-small">&lt;</button>
					  <button class="btn btn-small">1</button>
					  <button class="btn btn-small">&gt;</button>
					</div>
				    <div class="m-clear"></div>
			      </article>
			  </div>
	    </div>
	    <!-- ==================== 子表 ========================================== -->
        <div class="col-lg-6" >
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">拆改图片列表</h4></div>
	    <div class="panel-body">
			    <div class="pull-left">
			        <button class="btn btn-primary btn-sm a-insert" href="pp_demolition_img-input.do?id=${model.id}&subId=&flowId=${flowId}'" data-target="#pp_demolition_imgModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-tasks"></span>新建</button>
				    <button class="btn btn-primary btn-sm a-remove" onclick="pp_demolition_imgTable.removeAll()"><span class="glyphicon glyphicon-trash"></span>删除</button>
				</div>
				<div class="pull-right">
				  每页显示
				  <select class="pp_demolition_imgM-page-size">
				    <option value="10">10</option>
				    <option value="20">20</option>
				    <option value="50">50</option>
				  </select>
				  条
				</div>
			    <div class="m-clear"></div>
		   </div>
		   <div class="content">
				<form id="pp_demolition_imgGridForm" name="pp_demolition_imgGridForm" method='post' action="pp_demolition_img-remove.do" class="m-form-blank">
				  <table id="pp_demolition_imgCodeGrid" class="table table-hover table-striped">
				      <thead>
					      <tr>
					          <th width="30" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
			                      <th class="sorting">图片地址</th>
			                      <th class="sorting">图片信息描述</th>
					          <th width="30">&nbsp;</th>
					      </tr>
					    </thead>
						    <tbody>
						      <c:forEach items="${pp_demolition_imgPage.result}" var="item">
								  <tr>
								        <td><input type="checkbox" class="pp_demolition_imgSelectedItem a-check" name="pp_demolition_imgSelectedItem" value="${item.id}"></td>
									            <td>${item.imgurl}</td>
									            <td>${item.imginfo}</td>
								        <td>
								          <a href="pp_demolition_img-input.do?id=${model.id}&subId=${item.id}" class="a-update" data-target="#pp_demolition_imgModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-pencil"></span></a>
								        </td>
								  </tr>
						      </c:forEach>
						    </tbody>
						  </table>
						</form>
		        </div>
		        
		      <!-- 模态框 -->
			  <div id="pp_demolition_imgModalInput" class="modal fade" tabindex="-1" style="display: none;" data-backdrop="static">
				  <div class="modal-dialog modal-lg">
					  <div class="modal-content" style="text-align: center;height: 600px">
					  </div>
				  </div>
			  </div>
			  <div class="panel-body">
				  <article>
				    <div class="pp_demolition_imgM-page-info pull-left">
					  共100条记录 显示1到10条记录
					</div>
					<div class="btn-group pp_demolition_imgM-pagination pull-right">
					  <button class="btn btn-small">&lt;</button>
					  <button class="btn btn-small">1</button>
					  <button class="btn btn-small">&gt;</button>
					</div>
				    <div class="m-clear"></div>
			      </article>
			  </div>
	    </div>
    </div>
    
    <div class="row" >
        <!-- ==================== 子表 ========================================== -->
        <div class="col-lg-6" >
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">水电改造图列表</h4></div>
	    <div class="panel-body">
			    <div class="pull-left">
			        <button class="btn btn-primary btn-sm a-insert" href="pp_water_img-input.do?id=${model.id}&subId=&flowId=${flowId}'" data-target="#pp_water_imgModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-tasks"></span>新建</button>
				    <button class="btn btn-primary btn-sm a-remove" onclick="pp_water_imgTable.removeAll()"><span class="glyphicon glyphicon-trash"></span>删除</button>
				</div>
				<div class="pull-right">
				  每页显示
				  <select class="pp_water_imgM-page-size">
				    <option value="10">10</option>
				    <option value="20">20</option>
				    <option value="50">50</option>
				  </select>
				  条
				</div>
			    <div class="m-clear"></div>
		   </div>
		   <div class="content">
				<form id="pp_water_imgGridForm" name="pp_water_imgGridForm" method='post' action="pp_water_img-remove.do" class="m-form-blank">
				  <table id="pp_water_imgCodeGrid" class="table table-hover table-striped">
				      <thead>
					      <tr>
					          <th width="30" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
			                      <th class="sorting">图片地址</th>
			                      <th class="sorting">图片信息描述</th>
					          <th width="30">&nbsp;</th>
					      </tr>
					    </thead>
						    <tbody>
						      <c:forEach items="${pp_water_imgPage.result}" var="item">
								  <tr>
								        <td><input type="checkbox" class="pp_water_imgSelectedItem a-check" name="pp_water_imgSelectedItem" value="${item.id}"></td>
									            <td>${item.imgurl}</td>
									            <td>${item.imginfo}</td>
								        <td>
								          <a href="pp_water_img-input.do?id=${model.id}&subId=${item.id}" class="a-update" data-target="#pp_water_imgModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-pencil"></span></a>
								        </td>
								  </tr>
						      </c:forEach>
						    </tbody>
						  </table>
						</form>
		        </div>
		        <!-- 模态框 -->
			  <div id="pp_water_imgModalInput" class="modal fade" tabindex="-1" style="display: none;" data-backdrop="static">
				  <div class="modal-dialog modal-lg">
					  <div class="modal-content" style="text-align: center;height: 600px">
					  </div>
				  </div>
			  </div>
			  <div class="panel-body">
				  <article>
				    <div class="pp_water_imgM-page-info pull-left">
					  共100条记录 显示1到10条记录
					</div>
					<div class="btn-group pp_water_imgM-pagination pull-right">
					  <button class="btn btn-small">&lt;</button>
					  <button class="btn btn-small">1</button>
					  <button class="btn btn-small">&gt;</button>
					</div>
				    <div class="m-clear"></div>
			      </article>
			  </div>
		    </div>
        
        <!-- ==================== 子表 ========================================== -->
        <div class="col-lg-6" >
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">泥瓦工程图列表</h4></div>
	    <div class="panel-body">
			    <div class="pull-left">
			        <button class="btn btn-primary btn-sm a-insert" href="pp_tile_img-input.do?id=${model.id}&subId=&flowId=${flowId}'" data-target="#pp_tile_imgModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-tasks"></span>新建</button>
				    <button class="btn btn-primary btn-sm a-remove" onclick="pp_tile_imgTable.removeAll()"><span class="glyphicon glyphicon-trash"></span>删除</button>
				</div>
				<div class="pull-right">
				  每页显示
				  <select class="pp_tile_imgM-page-size">
				    <option value="10">10</option>
				    <option value="20">20</option>
				    <option value="50">50</option>
				  </select>
				  条
				</div>
			    <div class="m-clear"></div>
		   </div>
		   <div class="content">
				<form id="pp_tile_imgGridForm" name="pp_tile_imgGridForm" method='post' action="pp_tile_img-remove.do" class="m-form-blank">
				  <table id="pp_tile_imgCodeGrid" class="table table-hover table-striped">
				      <thead>
					      <tr>
					          <th width="30" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
			                      <th class="sorting">图片地址</th>
			                      <th class="sorting">图片信息描述</th>
					          <th width="30">&nbsp;</th>
					      </tr>
					    </thead>
						    <tbody>
						      <c:forEach items="${pp_tile_imgPage.result}" var="item">
								  <tr>
								        <td><input type="checkbox" class="pp_tile_imgSelectedItem a-check" name="pp_tile_imgSelectedItem" value="${item.id}"></td>
									            <td>${item.imgurl}</td>
									            <td>${item.imginfo}</td>
								        <td>
								          <a href="pp_tile_img-input.do?id=${model.id}&subId=${item.id}" class="a-update" data-target="#pp_tile_imgModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-pencil"></span></a>
								        </td>
								  </tr>
						      </c:forEach>
						    </tbody>
						  </table>
						</form>
		        </div>
		        
		      <!-- 模态框 -->
			  <div id="pp_tile_imgModalInput" class="modal fade" tabindex="-1" style="display: none;" data-backdrop="static">
				  <div class="modal-dialog modal-lg">
					  <div class="modal-content" style="text-align: center;height: 600px">
					  </div>
				  </div>
			  </div>
			  <div class="panel-body">
				  <article>
				    <div class="pp_tile_imgM-page-info pull-left">
					  共100条记录 显示1到10条记录
					</div>
					<div class="btn-group pp_tile_imgM-pagination pull-right">
					  <button class="btn btn-small">&lt;</button>
					  <button class="btn btn-small">1</button>
					  <button class="btn btn-small">&gt;</button>
					</div>
				    <div class="m-clear"></div>
			      </article>
			  </div>
	    </div>
    </div>
    
    <div class="row" >
        <!-- ==================== 子表 ========================================== -->
        <div class="col-lg-6" >
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">金属工程图列表</h4></div>
	    <div class="panel-body">
			    <div class="pull-left">
			        <button class="btn btn-primary btn-sm a-insert" href="pp_metal_img-input.do?id=${model.id}&subId=&flowId=${flowId}'" data-target="#pp_metal_imgModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-tasks"></span>新建</button>
				    <button class="btn btn-primary btn-sm a-remove" onclick="pp_metal_imgTable.removeAll()"><span class="glyphicon glyphicon-trash"></span>删除</button>
				</div>
				<div class="pull-right">
				  每页显示
				  <select class="pp_metal_imgM-page-size">
				    <option value="10">10</option>
				    <option value="20">20</option>
				    <option value="50">50</option>
				  </select>
				  条
				</div>
			    <div class="m-clear"></div>
		   </div>
		   <div class="content">
				<form id="pp_metal_imgGridForm" name="pp_metal_imgGridForm" method='post' action="pp_metal_img-remove.do" class="m-form-blank">
				  <table id="pp_metal_imgCodeGrid" class="table table-hover table-striped">
				      <thead>
					      <tr>
					          <th width="30" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
			                      <th class="sorting">图片信息描述</th>
			                      <th class="sorting">图片地址</th>
					          <th width="30">&nbsp;</th>
					      </tr>
					    </thead>
						    <tbody>
						      <c:forEach items="${pp_metal_imgPage.result}" var="item">
								  <tr>
								        <td><input type="checkbox" class="pp_metal_imgSelectedItem a-check" name="pp_metal_imgSelectedItem" value="${item.id}"></td>
									            <td>${item.imginfo}</td>
									            <td>${item.imgurl}</td>
								        <td>
								          <a href="pp_metal_img-input.do?id=${model.id}&subId=${item.id}" class="a-update" data-target="#pp_metal_imgModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-pencil"></span></a>
								        </td>
								  </tr>
						      </c:forEach>
						    </tbody>
						  </table>
						</form>
		        </div>
		        
		      <!-- 模态框 -->
			  <div id="pp_metal_imgModalInput" class="modal fade" tabindex="-1" style="display: none;" data-backdrop="static">
				  <div class="modal-dialog modal-lg">
					  <div class="modal-content" style="text-align: center;height: 600px">
					  </div>
				  </div>
			  </div>
			  <div class="panel-body">
				  <article>
				    <div class="pp_metal_imgM-page-info pull-left">
					  共100条记录 显示1到10条记录
					</div>
					<div class="btn-group pp_metal_imgM-pagination pull-right">
					  <button class="btn btn-small">&lt;</button>
					  <button class="btn btn-small">1</button>
					  <button class="btn btn-small">&gt;</button>
					</div>
				    <div class="m-clear"></div>
			      </article>
			  </div>
	    </div>
        <!-- ==================== 子表 ========================================== -->
        <div class="col-lg-6" >
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">油漆工程图列表</h4></div>
	    <div class="panel-body">
			    <div class="pull-left">
			        <button class="btn btn-primary btn-sm a-insert" href="pp_wall_img-input.do?id=${model.id}&subId=&flowId=${flowId}'" data-target="#pp_wall_imgModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-tasks"></span>新建</button>
				    <button class="btn btn-primary btn-sm a-remove" onclick="pp_wall_imgTable.removeAll()"><span class="glyphicon glyphicon-trash"></span>删除</button>
				</div>
				<div class="pull-right">
				  每页显示
				  <select class="pp_wall_imgM-page-size">
				    <option value="10">10</option>
				    <option value="20">20</option>
				    <option value="50">50</option>
				  </select>
				  条
				</div>
			    <div class="m-clear"></div>
		   </div>
		   <div class="content">
				<form id="pp_wall_imgGridForm" name="pp_wall_imgGridForm" method='post' action="pp_wall_img-remove.do" class="m-form-blank">
				  <table id="pp_wall_imgCodeGrid" class="table table-hover table-striped">
				      <thead>
					      <tr>
					          <th width="30" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
			                      <th class="sorting">图片地址</th>
			                      <th class="sorting">图片信息描述</th>
					          <th width="30">&nbsp;</th>
					      </tr>
					    </thead>
						    <tbody>
						      <c:forEach items="${pp_wall_imgPage.result}" var="item">
								  <tr>
								        <td><input type="checkbox" class="pp_wall_imgSelectedItem a-check" name="pp_wall_imgSelectedItem" value="${item.id}"></td>
									            <td>${item.imgurl}</td>
									            <td>${item.imginfo}</td>
								        <td>
								          <a href="pp_wall_img-input.do?id=${model.id}&subId=${item.id}" class="a-update" data-target="#pp_wall_imgModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-pencil"></span></a>
								        </td>
								  </tr>
						      </c:forEach>
						    </tbody>
						  </table>
						</form>
		        </div>
		        
		      <!-- 模态框 -->
			  <div id="pp_wall_imgModalInput" class="modal fade" tabindex="-1" style="display: none;" data-backdrop="static">
				  <div class="modal-dialog modal-lg">
					  <div class="modal-content" style="text-align: center;height: 600px">
					  </div>
				  </div>
			  </div>
			  <div class="panel-body">
				  <article>
				    <div class="pp_wall_imgM-page-info pull-left">
					  共100条记录 显示1到10条记录
					</div>
					<div class="btn-group pp_wall_imgM-pagination pull-right">
					  <button class="btn btn-small">&lt;</button>
					  <button class="btn btn-small">1</button>
					  <button class="btn btn-small">&gt;</button>
					</div>
				    <div class="m-clear"></div>
			      </article>
			  </div>
		  </div>
    </div>
    
    <div class="row" >
        <!-- ==================== 子表 ========================================== -->
        <div class="col-lg-6" >
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">木工工程图列表</h4></div>
	    <div class="panel-body">
			    <div class="pull-left">
			        <button class="btn btn-primary btn-sm a-insert" href="pp_floor_img-input.do?id=${model.id}&subId=&flowId=${flowId}'" data-target="#pp_floor_imgModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-tasks"></span>新建</button>
				    <button class="btn btn-primary btn-sm a-remove" onclick="pp_floor_imgTable.removeAll()"><span class="glyphicon glyphicon-trash"></span>删除</button>
				</div>
				<div class="pull-right">
				  每页显示
				  <select class="pp_floor_imgM-page-size">
				    <option value="10">10</option>
				    <option value="20">20</option>
				    <option value="50">50</option>
				  </select>
				  条
				</div>
			    <div class="m-clear"></div>
		   </div>
		   <div class="content">
				<form id="pp_floor_imgGridForm" name="pp_floor_imgGridForm" method='post' action="pp_floor_img-remove.do" class="m-form-blank">
				  <table id="pp_floor_imgCodeGrid" class="table table-hover table-striped">
				      <thead>
					      <tr>
					          <th width="30" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
			                      <th class="sorting">图片地址</th>
			                      <th class="sorting">图片信息描述</th>
					          <th width="30">&nbsp;</th>
					      </tr>
					    </thead>
						    <tbody>
						      <c:forEach items="${pp_floor_imgPage.result}" var="item">
								  <tr>
								        <td><input type="checkbox" class="pp_floor_imgSelectedItem a-check" name="pp_floor_imgSelectedItem" value="${item.id}"></td>
									            <td>${item.imgurl}</td>
									            <td>${item.imginfo}</td>
								        <td>
								          <a href="pp_floor_img-input.do?id=${model.id}&subId=${item.id}" class="a-update" data-target="#pp_floor_imgModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-pencil"></span></a>
								        </td>
								  </tr>
						      </c:forEach>
						    </tbody>
						  </table>
						</form>
		        </div>
		        
		      <!-- 模态框 -->
			  <div id="pp_floor_imgModalInput" class="modal fade" tabindex="-1" style="display: none;" data-backdrop="static">
				  <div class="modal-dialog modal-lg">
					  <div class="modal-content" style="text-align: center;height: 600px">
					  </div>
				  </div>
			  </div>
			  <div class="panel-body">
				  <article>
				    <div class="pp_floor_imgM-page-info pull-left">
					  共100条记录 显示1到10条记录
					</div>
					<div class="btn-group pp_floor_imgM-pagination pull-right">
					  <button class="btn btn-small">&lt;</button>
					  <button class="btn btn-small">1</button>
					  <button class="btn btn-small">&gt;</button>
					</div>
				    <div class="m-clear"></div>
			      </article>
			  </div>
        </div>
        <!-- ==================== 子表 ========================================== -->
        <div class="col-lg-6" >
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">表面工程图列表</h4></div>
	    <div class="panel-body">
			    <div class="pull-left">
			        <button class="btn btn-primary btn-sm a-insert" href="pp_surface_img-input.do?id=${model.id}&subId=&flowId=${flowId}'" data-target="#pp_surface_imgModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-tasks"></span>新建</button>
				    <button class="btn btn-primary btn-sm a-remove" onclick="pp_surface_imgTable.removeAll()"><span class="glyphicon glyphicon-trash"></span>删除</button>
				</div>
				<div class="pull-right">
				  每页显示
				  <select class="pp_surface_imgM-page-size">
				    <option value="10">10</option>
				    <option value="20">20</option>
				    <option value="50">50</option>
				  </select>
				  条
				</div>
			    <div class="m-clear"></div>
		   </div>
		   <div class="content">
				<form id="pp_surface_imgGridForm" name="pp_surface_imgGridForm" method='post' action="pp_surface_img-remove.do" class="m-form-blank">
				  <table id="pp_surface_imgCodeGrid" class="table table-hover table-striped">
				      <thead>
					      <tr>
					          <th width="30" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
			                      <th class="sorting">图片地址</th>
			                      <th class="sorting"> 图片信息描述</th>
					          <th width="30">&nbsp;</th>
					      </tr>
					    </thead>
						    <tbody>
						      <c:forEach items="${pp_surface_imgPage.result}" var="item">
								  <tr>
								        <td><input type="checkbox" class="pp_surface_imgSelectedItem a-check" name="pp_surface_imgSelectedItem" value="${item.id}"></td>
									            <td>${item.imgurl}</td>
									            <td>${item.imginfo}</td>
								        <td>
								          <a href="pp_surface_img-input.do?id=${model.id}&subId=${item.id}" class="a-update" data-target="#pp_surface_imgModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-pencil"></span></a>
								        </td>
								  </tr>
						      </c:forEach>
						    </tbody>
						  </table>
						</form>
		        </div>
		        
		      <!-- 模态框 -->
			  <div id="pp_surface_imgModalInput" class="modal fade" tabindex="-1" style="display: none;" data-backdrop="static">
				  <div class="modal-dialog modal-lg">
					  <div class="modal-content" style="text-align: center;height: 600px">
					  </div>
				  </div>
			  </div>
			  <div class="panel-body">
				  <article>
				    <div class="pp_surface_imgM-page-info pull-left">
					  共100条记录 显示1到10条记录
					</div>
					<div class="btn-group pp_surface_imgM-pagination pull-right">
					  <button class="btn btn-small">&lt;</button>
					  <button class="btn btn-small">1</button>
					  <button class="btn btn-small">&gt;</button>
					</div>
				    <div class="m-clear"></div>
			      </article>
			  </div>
	    </div>
	</div>
	
	<div class="row" >
        <!-- ==================== 子表 ========================================== -->
        <div class="col-lg-6" >
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">竣工图列表</h4></div>
	    <div class="panel-body">
			    <div class="pull-left">
			        <button class="btn btn-primary btn-sm a-insert" href="pp_done_img-input.do?id=${model.id}&subId=&flowId=${flowId}'" data-target="#pp_done_imgModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-tasks"></span>新建</button>
				    <button class="btn btn-primary btn-sm a-remove" onclick="pp_done_imgTable.removeAll()"><span class="glyphicon glyphicon-trash"></span>删除</button>
				</div>
				<div class="pull-right">
				  每页显示
				  <select class="pp_done_imgM-page-size">
				    <option value="10">10</option>
				    <option value="20">20</option>
				    <option value="50">50</option>
				  </select>
				  条
				</div>
			    <div class="m-clear"></div>
		   </div>
		   <div class="content">
				<form id="pp_done_imgGridForm" name="pp_done_imgGridForm" method='post' action="pp_done_img-remove.do" class="m-form-blank">
				  <table id="pp_done_imgCodeGrid" class="table table-hover table-striped">
				      <thead>
					      <tr>
					          <th width="30" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
			                      <th class="sorting">图片地址</th>
			                      <th class="sorting">图片信息描述</th>
					          <th width="30">&nbsp;</th>
					      </tr>
					    </thead>
						    <tbody>
						      <c:forEach items="${pp_done_imgPage.result}" var="item">
								  <tr>
								        <td><input type="checkbox" class="pp_done_imgSelectedItem a-check" name="pp_done_imgSelectedItem" value="${item.id}"></td>
									            <td>${item.imgurl}</td>
									            <td>${item.imginfo}</td>
								        <td>
								          <a href="pp_done_img-input.do?id=${model.id}&subId=${item.id}" class="a-update" data-target="#pp_done_imgModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-pencil"></span></a>
								        </td>
								  </tr>
						      </c:forEach>
						    </tbody>
						  </table>
						</form>
		        </div>
		        
		      <!-- 模态框 -->
			  <div id="pp_done_imgModalInput" class="modal fade" tabindex="-1" style="display: none;" data-backdrop="static">
				  <div class="modal-dialog modal-lg">
					  <div class="modal-content" style="text-align: center;height: 600px">
					  </div>
				  </div>
			  </div>
			  <div class="panel-body">
				  <article>
				    <div class="pp_done_imgM-page-info pull-left">
					  共100条记录 显示1到10条记录
					</div>
					<div class="btn-group pp_done_imgM-pagination pull-right">
					  <button class="btn btn-small">&lt;</button>
					  <button class="btn btn-small">1</button>
					  <button class="btn btn-small">&gt;</button>
					</div>
				    <div class="m-clear"></div>
			      </article>
			  </div>
	    </div>
	</div>
		      
	  <!-- ================================================================================================ -->
      </div>
	<!-- end of main -->
	</div>
  </body>
</html>
