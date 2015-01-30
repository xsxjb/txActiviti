<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>项目生产进度表编辑</title>
    <%@include file="/common/center.jsp"%>
    <script type="text/javascript">
        // 实例化config对象
        var production_schedule_sConfig = {
		    id: 'production_schedule_sCodeGrid',
		    pageNo: ${production_schedule_sPage.pageNo},
		    pageSize: ${production_schedule_sPage.pageSize},
		    totalCount:${production_schedule_sPage.totalCount},
		    resultSize: ${production_schedule_sPage.resultSize},
		    pageCount: ${production_schedule_sPage.pageCount},
		    orderBy: '${production_schedule_sPage.orderBy == null ? '' : production_schedule_sPage.orderBy}',
		    asc: ${production_schedule_sPage.asc},
		    params: {
		        'id': '${model.id}'
		    },
			selectedItemClass: 'production_schedule_sSelectedItem',
			gridFormId: 'production_schedule_sGridForm',
			exportUrl: 'production_schedule_s-export.do'
		};
        // 实例化table对象
		var production_schedule_sTable;
		$(function() {
			production_schedule_sTable = new Table(production_schedule_sConfig);
		    production_schedule_sTable.configPagination('.production_schedule_sM-pagination');
		    production_schedule_sTable.configPageInfo('.production_schedule_sM-page-info');
		    production_schedule_sTable.configPageSize('.production_schedule_sM-page-size');
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
	    <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">项目生产进度表流程控制</h4></div>
	    <div class="panel-body">
	        <div class="pull-left">
	            <a href="#nextTaskUserDiv" role="button" class="btn btn-primary btn-sm" data-toggle="modal">办理</a>
			    <button class="btn btn-primary btn-sm a-submit" onclick="mainFormSubmit('production_schedule-save-draft.do')">草稿</button>
			    <button class="btn btn-primary btn-sm" onclick="location.href='production_schedule-rollback.do?executionId=${model.executionid}&flowId=${flowId}&flowType=0'">回退</button>
			    <button class="btn btn-primary btn-sm a-remove" onclick="location.href='production_schedule-list.do?flowId=${flowId}&flowType=0'">返回</button>
			</div>
	   </div>
	   
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">流程内容</h4></div>
        <div class="panel-body">
		  <div class="content content-inner">
		       <form id="mainForm" method="post" action="production_schedule-complete.do" class="form-horizontal">
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
						      <label class="control-label  col-lg-2" for="code-projectno">项目编号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.projectno.fcEdit=='1'}">    <input id="code-projectno" type="text" name="projectno" value="${model.projectno}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.projectno.fcEdit!='1'}">    <label>${model.projectno}</label>    <input type="hidden" name="projectno" value="${model.projectno}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-projectname">项目名称:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.projectname.fcEdit=='1'}">    <input id="code-projectname" type="text" name="projectname" value="${model.projectname}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.projectname.fcEdit!='1'}">    <label>${model.projectname}</label>    <input type="hidden" name="projectname" value="${model.projectname}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-productmanage">项目负责人:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.productmanage.fcEdit=='1'}">    <input id="code-productmanage" type="text" name="productmanage" value="${model.productmanage}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.productmanage.fcEdit!='1'}">    <label>${model.productmanage}</label>    <input type="hidden" name="productmanage" value="${model.productmanage}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-customername">客户名称:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.customername.fcEdit=='1'}">    <input id="code-customername" type="text" name="customername" value="${model.customername}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.customername.fcEdit!='1'}">    <label>${model.customername}</label>    <input type="hidden" name="customername" value="${model.customername}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-planstatus">计划状态:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.planstatus.fcEdit=='1'}">    <input id="code-planstatus" type="text" name="planstatus" value="${model.planstatus}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.planstatus.fcEdit!='1'}">    <label>${model.planstatus}</label>    <input type="hidden" name="planstatus" value="${model.planstatus}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-endconfirm">完工确认:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.endconfirm.fcEdit=='1'}">    <input id="code-endconfirm" type="text" name="endconfirm" value="${model.endconfirm}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.endconfirm.fcEdit!='1'}">    <label>${model.endconfirm}</label>    <input type="hidden" name="endconfirm" value="${model.endconfirm}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-position">质检员:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.position.fcEdit=='1'}">    <input id="code-position" type="text" name="position" value="${model.position}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.position.fcEdit!='1'}">    <label>${model.position}</label>    <input type="hidden" name="position" value="${model.position}">  </c:if></div>
	                                      
						 
					
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
        </div> 
        
        <!-- ==================== 子表 ========================================== -->
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">列表</h4></div>
	    <div class="panel-body">
			    <div class="pull-left">
				    <button class="btn btn-primary btn-sm a-insert" onclick="location.href='production_schedule_s-input.do?id=${model.id}&subId=&flowId=${flowId}'"><span class="glyphicon glyphicon-tasks"></span>新建</button>
				    <button class="btn btn-primary btn-sm a-remove" onclick="production_schedule_sTable.removeAll()"><span class="glyphicon glyphicon-trash"></span>删除</button>
	            
				</div>
				<div class="pull-right">
				  每页显示
				  <select class="production_schedule_sM-page-size">
				    <option value="10">10</option>
				    <option value="20">20</option>
				    <option value="50">50</option>
				  </select>
				  条
				</div>
			    <div class="m-clear"></div>
		   </div>
		   <div class="content">
				<form id="production_schedule_sGridForm" name="production_schedule_sGridForm" method='post' action="production_schedule_s-remove.do" class="m-form-blank">
				  <input type="hidden" name="flowId" value="${flowId}">
				  <table id="production_schedule_sCodeGrid" class="table table-hover table-striped">
				      <thead>
					      <tr>
					          <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
					          <th width="80">&nbsp;</th>
		                      <th class="sorting">批次号</th>
		                      <th class="sorting">产品类型</th>
		                      <th class="sorting">产品件号</th>
		                      <th class="sorting">产品编号</th>
		                      <th class="sorting">产品名</th>
		                      <th class="sorting">规格型号</th>
		                      <th class="sorting">数量</th>
		                      <th class="sorting">开始时间</th>
		                      <th class="sorting">结束时间</th>
		                      <th class="sorting">场地类型</th>
					      </tr>
					    </thead>
						    <tbody>
						      <c:forEach items="${production_schedule_sPage.result}" var="item" varStatus="status">
								  <tr class="${status.index%2==1? 'active':''}">
								        <td><input type="checkbox" class="production_schedule_sSelectedItem a-check" name="production_schedule_sSelectedItem" value="${item.id}"></td>
									    <td>
								            <a href="production_schedule_s-input.do?id=${model.id}&subId=${item.id}&flowId=${flowId}" class="a-update"><span class="glyphicon glyphicon-pencil"></span></a>
								        </td>
							            <td>${item.batchno}</td>
							            <td>${item.producttype}</td>
							            <td>${item.productflowid}</td>
							            <td>${item.productno}</td>
							            <td>${item.productname}</td>
							            <td>${item.productmodel}</td>
							            <td>${item.materialnum}</td>
							            <td>${item.starttime}</td>
							            <td>${item.endtime}</td>
							            <td>${item.productionaddress}</td>
								  </tr>
						      </c:forEach>
						    </tbody>
						  </table>
						</form>
		        </div>
			  <article>
			    <div class="production_schedule_sM-page-info pull-left">
				  共100条记录 显示1到10条记录
				</div>
				<div class="btn-group production_schedule_sM-pagination pull-right">
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
