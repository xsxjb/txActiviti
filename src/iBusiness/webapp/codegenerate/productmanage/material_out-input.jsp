<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>(领料)原料出库信息编辑</title>
    <%@include file="/common/center.jsp"%>
    <script type="text/javascript">
        // 实例化config对象
        var material_out_sConfig = {
		    id: 'material_out_sCodeGrid',
		    pageNo: ${material_out_sPage.pageNo},
		    pageSize: ${material_out_sPage.pageSize},
		    totalCount:${material_out_sPage.totalCount},
		    resultSize: ${material_out_sPage.resultSize},
		    pageCount: ${material_out_sPage.pageCount},
		    orderBy: '${material_out_sPage.orderBy == null ? '' : material_out_sPage.orderBy}',
		    asc: ${material_out_sPage.asc},
		    params: {
		        'id': '${model.id}'
		    },
			selectedItemClass: 'material_out_sSelectedItem',
			gridFormId: 'material_out_sGridForm',
			exportUrl: 'material_out_s-export.do'
		};
        // 实例化table对象
		var material_out_sTable;
		$(function() {
			material_out_sTable = new Table(material_out_sConfig);
		    material_out_sTable.configPagination('.material_out_sM-pagination');
		    material_out_sTable.configPageInfo('.material_out_sM-page-info');
		    material_out_sTable.configPageSize('.material_out_sM-page-size');
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
	    <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">(领料)原料出库信息流程控制</h4></div>
	    <div class="panel-body">
	        <div class="pull-left">
	            <a href="#nextTaskUserDiv" role="button" class="btn btn-primary btn-sm" data-toggle="modal">办理</a>
			    <button class="btn btn-primary btn-sm a-submit" onclick="mainFormSubmit('material_out-save-draft.do')">草稿</button>
			    <button class="btn btn-primary btn-sm" onclick="location.href='material_out-rollback.do?executionId=${model.executionid}&flowId=${flowId}&flowType=0'">回退</button>
			    <button class="btn btn-primary btn-sm a-remove" onclick="location.href='material_out-list.do?flowId=${flowId}&flowType=0'">返回</button>
			</div>
	   </div>
	   
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">流程内容</h4></div>
        <div class="panel-body">
		  <div class="content content-inner">
		       <form id="mainForm" method="post" action="material_out-complete.do" class="form-horizontal">
				   <input type="hidden" name="flowId" value="${flowId}">
				   <c:if test="${model != null}">
				       <input type="hidden" name="id" value="${model.id}">
				       <input type="hidden" name="executionid" value="${model.executionid}">
				       <input type="hidden" name="createdatebpm" value="${model.createdatebpm}">
				       <input type="hidden" name="assigneeuser" value="${model.assigneeuser}">
				       <input type="hidden" name="nodename" value="${model.nodename}">
				       <input type="hidden" name="doneflag" value="${model.doneflag}">
				   </c:if>
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-eventdate">出库日期:</label>
                              <div class="col-lg-3">  <fmt:formatDate value="${model.eventdate}" pattern="yyyy-MM-dd HH:mm:ss" />  <input id="code-eventdate" type="hidden" name="eventdate" value="${model.eventdate}" ></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-batchno">批次号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.batchno.fcEdit=='1'}">    <input id="code-batchno" type="text" name="batchno" value="${model.batchno}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.batchno.fcEdit!='1'}">    <label>${model.batchno}</label>    <input type="hidden" name="batchno" value="${model.batchno}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-warehouseno">仓库编号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.warehouseno.fcEdit=='1'}">    <select id="code-warehouseno" name="warehouseno" class="form-control" >          <option value="" >请选择</option>        <c:forEach items="${warehousenoItems}" var="item">          <option value="${item.key}" ${item.key==model.warehouseno? 'selected':''} >${item.value}</option>        </c:forEach>    </select>  </c:if>  <c:if test="${nodeColumsMap.warehouseno.fcEdit!='1'}">    <label>${model.warehouseno}</label>    <input type="hidden" name="warehouseno" value="${model.warehouseno}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-productno">产品编号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.productno.fcEdit=='1'}">    <select id="code-productno" name="productno" class="form-control" >          <option value="" >请选择</option>        <c:forEach items="${productnoItems}" var="item">          <option value="${item.key}" ${item.key==model.productno? 'selected':''} >${item.value}</option>        </c:forEach>    </select>  </c:if>  <c:if test="${nodeColumsMap.productno.fcEdit!='1'}">    <label>${model.productno}</label>    <input type="hidden" name="productno" value="${model.productno}">  </c:if></div>
	                                      
                            </div>
						 
						      <label class="control-label  col-lg-2" for="code-materialnum">数量:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.materialnum.fcEdit=='1'}">    <input id="code-materialnum" type="text" name="materialnum" value="${model.materialnum}" class="text number required" >  </c:if>  <c:if test="${nodeColumsMap.materialnum.fcEdit!='1'}">    <label>${model.materialnum}</label>    <input type="hidden" name="materialnum" value="${model.materialnum}">  </c:if></div>
	                                      
                            </div>
						 
					
					<!--  选择下一节点办理人弹出层  -->
				    <div id="nextTaskUserDiv" class="modal fade" tabindex="-1" style="top:20%;" >
				        <div class="modal-dialog">
						    <div class="modal-content">
							      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal"><span >&times;</span><span class="sr-only">Close</span></button>
								        <h4 class="modal-title">办理下一节点</h4>
							      </div>
							      <div class="modal-body">
									    <div class="form-group">
                                            <label class="col-lg-2 control-label" for="code-remark">办理人:</label>
                                            <div class="col-lg-4">
												  <select id="code-sex" name="userId" class="form-control">
												        <option value="" >请选择</option>
													  <c:forEach items="${userItems}" var="item">
													    <option value="${item.id}"  ${item.id == userId ? 'selected' : ''}>${item.displayName}</option>
													  </c:forEach>
												  </select>
										      </div>
						                </div>
						           </div>
						           <div class="modal-footer">
						                    <button class="btn btn-primary btn-sm a-insert">办理</button>
						                    <button class="btn btn-primary btn-sm" data-dismiss="modal" >关闭</button>
						           </div>
					            </div><!-- /.modal-content -->
						  </div><!-- /.modal-dialog -->
				    </div>
					
				</form>
		  </div>
        
        <!-- ==================== 子表 ========================================== -->
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">列表</h4></div>
	    <div class="panel-body">
			    <div class="pull-left">
				    <button class="btn btn-primary btn-sm a-insert" onclick="location.href='material_out_s-input.do?id=${model.id}&subId=&flowId=${flowId}'"><span class="glyphicon glyphicon-tasks"></span>新建</button>
				    <button class="btn btn-primary btn-sm a-remove" onclick="material_out_sTable.removeAll()"><span class="glyphicon glyphicon-trash"></span>删除</button>
	            
				</div>
				<div class="pull-right">
				  每页显示
				  <select class="material_out_sM-page-size">
				    <option value="10">10</option>
				    <option value="20">20</option>
				    <option value="50">50</option>
				  </select>
				  条
				</div>
			    <div class="m-clear"></div>
		   </div>
		   <div class="content">
				<form id="material_out_sGridForm" name="material_out_sGridForm" method='post' action="material_out_s-remove.do" class="m-form-blank">
				  <input type="hidden" name="flowId" value="${flowId}">
				  <table id="material_out_sCodeGrid" class="table table-hover table-striped">
				      <thead>
					      <tr>
					          <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
					          <th width="80">&nbsp;</th>
		                      <th class="sorting">原料编号</th>
		                      <th class="sorting">原料名称</th>
		                      <th class="sorting">原料规格型号</th>
		                      <th class="sorting">单位</th>
		                      <th class="sorting">数量</th>
		                      <th class="sorting">制造商</th>
		                      <th class="sorting">备注</th>
					      </tr>
					    </thead>
						    <tbody>
						      <c:forEach items="${material_out_sPage.result}" var="item" varStatus="status">
								  <tr class="${status.index%2==1? 'active':''}">
								        <td><input type="checkbox" class="material_out_sSelectedItem a-check" name="material_out_sSelectedItem" value="${item.id}"></td>
									    <td>
								            <a href="material_out_s-input.do?id=${model.id}&subId=${item.id}&flowId=${flowId}" class="a-update"><span class="glyphicon glyphicon-pencil"></span></a>
								        </td>
							            <td>${item.materialno}</td>
							            <td>${item.materialname}</td>
							            <td>${item.materialmodel}</td>
							            <td>${item.materialunit}</td>
							            <td>${item.materialnum}</td>
							            <td>${item.manufacturename}</td>
							            <td>${item.remark}</td>
								  </tr>
						      </c:forEach>
						    </tbody>
						  </table>
						</form>
		        </div>
			  <article>
			    <div class="material_out_sM-page-info pull-left">
				  共100条记录 显示1到10条记录
				</div>
				<div class="btn-group material_out_sM-pagination pull-right">
				  <button class="btn btn-small">&lt;</button>
				  <button class="btn btn-small">1</button>
				  <button class="btn btn-small">&gt;</button>
				</div>
			    <div class="m-clear"></div>
		      </article>
      </div>
	<!-- end of main -->
	</div>
  </body>
</html>
