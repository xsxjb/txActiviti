<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>经营预算月计划执行表编辑</title>
    <%@include file="/common/center.jsp"%>
    <script type="text/javascript">
        // 实例化config对象
        var monthbudgetreal_sConfig = {
		    id: 'monthbudgetreal_sCodeGrid',
		    pageNo: ${monthbudgetreal_sPage.pageNo},
		    pageSize: ${monthbudgetreal_sPage.pageSize},
		    totalCount:${monthbudgetreal_sPage.totalCount},
		    resultSize: ${monthbudgetreal_sPage.resultSize},
		    pageCount: ${monthbudgetreal_sPage.pageCount},
		    orderBy: '${monthbudgetreal_sPage.orderBy == null ? '' : monthbudgetreal_sPage.orderBy}',
		    asc: ${monthbudgetreal_sPage.asc},
		    params: {
		        'id': '${model.id}'
		    },
			selectedItemClass: 'monthbudgetreal_sSelectedItem',
			gridFormId: 'monthbudgetreal_sGridForm',
			exportUrl: 'monthbudgetreal_s-export.do'
		};
        // 实例化table对象
		var monthbudgetreal_sTable;
		$(function() {
			monthbudgetreal_sTable = new Table(monthbudgetreal_sConfig);
		    monthbudgetreal_sTable.configPagination('.monthbudgetreal_sM-pagination');
		    monthbudgetreal_sTable.configPageInfo('.monthbudgetreal_sM-page-info');
		    monthbudgetreal_sTable.configPageSize('.monthbudgetreal_sM-page-size');
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
	    <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">经营预算月计划执行表流程控制</h4></div>
	    <div class="panel-body">
	        <div class="pull-left">
	            <a href="#nextTaskUserDiv" role="button" class="btn btn-primary btn-sm" data-toggle="modal">办理</a>
			    <button class="btn btn-primary btn-sm a-submit" onclick="mainFormSubmit('monthbudgetreal-save-draft.do')">草稿</button>
			    <button class="btn btn-primary btn-sm" onclick="location.href='monthbudgetreal-rollback.do?executionId=${model.executionid}&flowId=${flowId}&flowType=0'">回退</button>
			    <button class="btn btn-primary btn-sm a-remove" onclick="location.href='monthbudgetreal-list.do?flowId=${flowId}&flowType=0'">返回</button>
			</div>
	   </div>
	   
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">流程内容</h4></div>
        <div class="panel-body">
		  <div class="content content-inner">
		       <form id="mainForm" method="post" action="monthbudgetreal-complete.do" class="form-horizontal">
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
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-planmonth">计划月:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.planmonth.fcEdit=='1'}">    <input id="code-planmonth" type="text" name="planmonth" value="${model.planmonth}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.planmonth.fcEdit!='1'}">    <label>${model.planmonth}</label>    <input type="hidden" name="planmonth" value="${model.planmonth}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-planname">计划名称:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.planname.fcEdit=='1'}">    <input id="code-planname" type="text" name="planname" value="${model.planname}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.planname.fcEdit!='1'}">    <label>${model.planname}</label>    <input type="hidden" name="planname" value="${model.planname}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-deptname">编制部门:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.deptname.fcEdit=='1'}">    <input id="code-deptname" type="text" name="deptname" value="${model.deptname}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.deptname.fcEdit!='1'}">    <label>${model.deptname}</label>    <input type="hidden" name="deptname" value="${model.deptname}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-eventtime">编制时间:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.eventtime.fcEdit=='1'}">    <input id="code-eventtime" type="text" name="eventtime" value="${model.eventtime}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.eventtime.fcEdit!='1'}">    <label>${model.eventtime}</label>    <input type="hidden" name="eventtime" value="${model.eventtime}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-planno">编号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.planno.fcEdit=='1'}">    <input id="code-planno" type="text" name="planno" value="${model.planno}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.planno.fcEdit!='1'}">    <label>${model.planno}</label>    <input type="hidden" name="planno" value="${model.planno}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-projecttype">项目类别:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.projecttype.fcEdit=='1'}">    <input id="code-projecttype" type="text" name="projecttype" value="${model.projecttype}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.projecttype.fcEdit!='1'}">    <label>${model.projecttype}</label>    <input type="hidden" name="projecttype" value="${model.projecttype}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-projectname">项目名称:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.projectname.fcEdit=='1'}">    <input id="code-projectname" type="text" name="projectname" value="${model.projectname}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.projectname.fcEdit!='1'}">    <label>${model.projectname}</label>    <input type="hidden" name="projectname" value="${model.projectname}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-monthplanamount">月计划数:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.monthplanamount.fcEdit=='1'}">    <input id="code-monthplanamount" type="text" name="monthplanamount" value="${model.monthplanamount}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.monthplanamount.fcEdit!='1'}">    <label>${model.monthplanamount}</label>    <input type="hidden" name="monthplanamount" value="${model.monthplanamount}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-amount">发生数:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.amount.fcEdit=='1'}">    <input id="code-amount" type="text" name="amount" value="${model.amount}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.amount.fcEdit!='1'}">    <label>${model.amount}</label>    <input type="hidden" name="amount" value="${model.amount}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-deptleader">科长审批:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.deptleader.fcEdit=='1'}">    <input id="code-deptleader" type="text" name="deptleader" value="${model.deptleader}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.deptleader.fcEdit!='1'}">    <label>${model.deptleader}</label>    <input type="hidden" name="deptleader" value="${model.deptleader}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-planner">计划员确认:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.planner.fcEdit=='1'}">    <input id="code-planner" type="text" name="planner" value="${model.planner}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.planner.fcEdit!='1'}">    <label>${model.planner}</label>    <input type="hidden" name="planner" value="${model.planner}">  </c:if></div>
	                                      
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
				    <button class="btn btn-primary btn-sm a-insert" onclick="location.href='monthbudgetreal_s-input.do?id=${model.id}&subId=&flowId=${flowId}'"><span class="glyphicon glyphicon-tasks"></span>新建</button>
				    <button class="btn btn-primary btn-sm a-remove" onclick="monthbudgetreal_sTable.removeAll()"><span class="glyphicon glyphicon-trash"></span>删除</button>
				    <button class="btn btn-primary btn-sm" onclick="monthbudgetreal_sTable.exportExcel()">导出Excel</button>
	            
				</div>
				<div class="pull-right">
				  每页显示
				  <select class="monthbudgetreal_sM-page-size">
				    <option value="10">10</option>
				    <option value="20">20</option>
				    <option value="50">50</option>
				  </select>
				  条
				</div>
			    <div class="m-clear"></div>
		   </div>
		   <div class="content">
				<form id="monthbudgetreal_sGridForm" name="monthbudgetreal_sGridForm" method='post' action="monthbudgetreal_s-remove.do" class="m-form-blank">
				  <input type="hidden" name="flowId" value="${flowId}">
				  <table id="monthbudgetreal_sCodeGrid" class="table table-hover table-striped">
				      <thead>
					      <tr>
					          <th width="30" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
					          <th width="30">&nbsp;</th>
		                      <th class="sorting">计划年</th>
		                      <th class="sorting">计划月</th>
		                      <th class="sorting">项目类别</th>
		                      <th class="sorting">项目名称</th>
		                      <th class="sorting">材料类别</th>
		                      <th class="sorting">材料名称</th>
		                      <th class="sorting">规格/型号</th>
		                      <th class="sorting">单位</th>
		                      <th class="sorting">单价</th>
		                      <th class="sorting">数量</th>
		                      <th class="sorting">计划数</th>
		                      <th class="sorting">发生数</th>
		                      <th class="sorting">所属部门</th>
		                      <th class="sorting">备注</th>
					      </tr>
					    </thead>
						    <tbody>
						      <c:forEach items="${monthbudgetreal_sPage.result}" var="item" varStatus="status">
								  <tr class="${status.index%2==1? 'active':''}">
								        <td><input type="checkbox" class="monthbudgetreal_sSelectedItem a-check" name="monthbudgetreal_sSelectedItem" value="${item.id}"></td>
									    <td>
								            <a href="monthbudgetreal_s-input.do?id=${model.id}&subId=${item.id}&flowId=${flowId}" class="a-update"><span class="glyphicon glyphicon-pencil"></span></a>
								        </td>
							            <td>${item.planyear}</td>
							            <td>${item.planmonth}</td>
							            <td>${item.projecttype}</td>
							            <td>${item.projectname}</td>
							            <td>${item.materialtype}</td>
							            <td>${item.materialname}</td>
							            <td>${item.materialspec}</td>
							            <td>${item.materialunit}</td>
							            <td>${item.materialprice}</td>
							            <td>${item.materialnum}</td>
							            <td>${item.planamount}</td>
							            <td>${item.amount}</td>
							            <td>${item.deptname}</td>
							            <td>${item.remark}</td>
								  </tr>
						      </c:forEach>
						    </tbody>
						  </table>
						</form>
		        </div>
			  <article>
			    <div class="monthbudgetreal_sM-page-info pull-left">
				  共100条记录 显示1到10条记录
				</div>
				<div class="btn-group monthbudgetreal_sM-pagination pull-right">
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
