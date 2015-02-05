<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>年度经营预算材料计划汇总表编辑</title>
    <%@include file="/common/center.jsp"%>
    <script type="text/javascript">
        // 实例化config对象
        var annualmaterialplan_sConfig = {
		    id: 'annualmaterialplan_sCodeGrid',
		    pageNo: ${annualmaterialplan_sPage.pageNo},
		    pageSize: ${annualmaterialplan_sPage.pageSize},
		    totalCount:${annualmaterialplan_sPage.totalCount},
		    resultSize: ${annualmaterialplan_sPage.resultSize},
		    pageCount: ${annualmaterialplan_sPage.pageCount},
		    orderBy: '${annualmaterialplan_sPage.orderBy == null ? '' : annualmaterialplan_sPage.orderBy}',
		    asc: ${annualmaterialplan_sPage.asc},
		    params: {
		        'id': '${model.id}'
		    },
			selectedItemClass: 'annualmaterialplan_sSelectedItem',
			gridFormId: 'annualmaterialplan_sGridForm',
			exportUrl: 'annualmaterialplan_s-export.do'
		};
        // 实例化table对象
		var annualmaterialplan_sTable;
		$(function() {
			annualmaterialplan_sTable = new Table(annualmaterialplan_sConfig);
		    annualmaterialplan_sTable.configPagination('.annualmaterialplan_sM-pagination');
		    annualmaterialplan_sTable.configPageInfo('.annualmaterialplan_sM-page-info');
		    annualmaterialplan_sTable.configPageSize('.annualmaterialplan_sM-page-size');
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
	    <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">年度经营预算材料计划汇总表流程控制</h4></div>
	    <div class="panel-body">
	        <div class="pull-left">
	            <a href="#nextTaskUserDiv" role="button" class="btn btn-primary btn-sm" data-toggle="modal">办理</a>
			    <button class="btn btn-primary btn-sm a-submit" onclick="mainFormSubmit('annualmaterialplan-save-draft.do')">草稿</button>
			    <button class="btn btn-primary btn-sm" onclick="location.href='annualmaterialplan-rollback.do?executionId=${model.executionid}&flowId=${flowId}&flowType=0'">回退</button>
			    <button class="btn btn-primary btn-sm a-remove" onclick="location.href='annualmaterialplan-list.do?flowId=${flowId}&flowType=0'">返回</button>
			</div>
	   </div>
	   
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">流程内容</h4></div>
        <div class="panel-body">
		  <div class="content content-inner">
		       <form id="mainForm" method="post" action="annualmaterialplan-complete.do" class="form-horizontal">
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
						      <label class="control-label  col-lg-2" for="code-planyear">计划年:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.planyear.fcEdit=='1'}">    <input id="code-planyear" type="text" name="planyear" value="${model.planyear}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.planyear.fcEdit!='1'}">    <label>${model.planyear}</label>    <input type="hidden" name="planyear" value="${model.planyear}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-deptname">编制部门:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.deptname.fcEdit=='1'}">    <input id="code-deptname" type="text" name="deptname" value="${model.deptname}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.deptname.fcEdit!='1'}">    <label>${model.deptname}</label>    <input type="hidden" name="deptname" value="${model.deptname}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-eventtime">编制时间:</label>
                              <div class="col-lg-3">  <fmt:formatDate value="${model.eventtime}" pattern="yyyy-MM-dd HH:mm:ss" />  <input id="code-eventtime" type="hidden" name="eventtime" value="${model.eventtime}" ></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-planno">编号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.planno.fcEdit=='1'}">    <input id="code-planno" type="text" name="planno" value="${model.planno}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.planno.fcEdit!='1'}">    <label>${model.planno}</label>    <input type="hidden" name="planno" value="${model.planno}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-planamount">计划总数:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.planamount.fcEdit=='1'}">    <input id="code-planamount" type="text" name="planamount" value="${model.planamount}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.planamount.fcEdit!='1'}">    <label>${model.planamount}</label>    <input type="hidden" name="planamount" value="${model.planamount}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-planner">计划员申报:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.planner.fcEdit=='1'}">    <input id="code-planner" type="text" name="planner" value="${model.planner}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.planner.fcEdit!='1'}">    <label>${model.planner}</label>    <input type="hidden" name="planner" value="${model.planner}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-deptleader">科长审批:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.deptleader.fcEdit=='1'}">    <input id="code-deptleader" type="text" name="deptleader" value="${model.deptleader}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.deptleader.fcEdit!='1'}">    <label>${model.deptleader}</label>    <input type="hidden" name="deptleader" value="${model.deptleader}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-financialleader">财务负责人审批:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.financialleader.fcEdit=='1'}">    <input id="code-financialleader" type="text" name="financialleader" value="${model.financialleader}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.financialleader.fcEdit!='1'}">    <label>${model.financialleader}</label>    <input type="hidden" name="financialleader" value="${model.financialleader}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-generalmanager">总经理审批:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.generalmanager.fcEdit=='1'}">    <input id="code-generalmanager" type="text" name="generalmanager" value="${model.generalmanager}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.generalmanager.fcEdit!='1'}">    <label>${model.generalmanager}</label>    <input type="hidden" name="generalmanager" value="${model.generalmanager}">  </c:if></div>
	                                      
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
        </div> 
        
        <!-- ==================== 子表 ========================================== -->
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">列表</h4></div>
	    <div class="panel-body">
			    <div class="pull-left">
				    <button class="btn btn-primary btn-sm a-insert" onclick="location.href='annualmaterialplan_s-input.do?id=${model.id}&subId=&flowId=${flowId}'"><span class="glyphicon glyphicon-tasks"></span>新建</button>
				    <button class="btn btn-primary btn-sm a-remove" onclick="annualmaterialplan_sTable.removeAll()"><span class="glyphicon glyphicon-trash"></span>删除</button>
				    <button class="btn btn-primary btn-sm" onclick="annualmaterialplan_sTable.exportExcel()">导出Excel</button>
	            
				</div>
				<div class="pull-right">
				  每页显示
				  <select class="annualmaterialplan_sM-page-size">
				    <option value="10">10</option>
				    <option value="20">20</option>
				    <option value="50">50</option>
				  </select>
				  条
				</div>
			    <div class="m-clear"></div>
		   </div>
		   <div class="content">
				<form id="annualmaterialplan_sGridForm" name="annualmaterialplan_sGridForm" method='post' action="annualmaterialplan_s-remove.do" class="m-form-blank">
				  <input type="hidden" name="flowId" value="${flowId}">
				  <table id="annualmaterialplan_sCodeGrid" class="table table-hover table-striped">
				      <thead>
					      <tr>
					          <th width="30" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
					          <th width="30">&nbsp;</th>
		                      <th class="sorting">资金项目类别</th>
		                      <th class="sorting">项目名称</th>
		                      <th class="sorting">物料类别</th>
		                      <th class="sorting">物料详细名称</th>
		                      <th class="sorting">计划数</th>
		                      <th class="sorting">所属部门</th>
		                      <th class="sorting">备注</th>
					      </tr>
					    </thead>
						    <tbody>
						      <c:forEach items="${annualmaterialplan_sPage.result}" var="item" varStatus="status">
								  <tr class="${status.index%2==1? 'active':''}">
								        <td><input type="checkbox" class="annualmaterialplan_sSelectedItem a-check" name="annualmaterialplan_sSelectedItem" value="${item.id}"></td>
									    <td>
								            <a href="annualmaterialplan_s-input.do?id=${model.id}&subId=${item.id}&flowId=${flowId}" class="a-update"><span class="glyphicon glyphicon-pencil"></span></a>
								        </td>
							            <td>${item.projecttype}</td>
							            <td>${item.projectname}</td>
							            <td>${item.materialtype}</td>
							            <td>${item.materialname}</td>
							            <td>${item.planamounts}</td>
							            <td>${item.deptname}</td>
							            <td>${item.remark}</td>
								  </tr>
						      </c:forEach>
						    </tbody>
						  </table>
						</form>
		        </div>
			  <article>
			    <div class="annualmaterialplan_sM-page-info pull-left">
				  共100条记录 显示1到10条记录
				</div>
				<div class="btn-group annualmaterialplan_sM-pagination pull-right">
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
