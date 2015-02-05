<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>经营预算年度计划增补、变更流程表编辑</title>
    <%@include file="/common/center.jsp"%>
    <script type="text/javascript">
        // 实例化config对象
        var annualchangeplan_sConfig = {
		    id: 'annualchangeplan_sCodeGrid',
		    pageNo: ${annualchangeplan_sPage.pageNo},
		    pageSize: ${annualchangeplan_sPage.pageSize},
		    totalCount:${annualchangeplan_sPage.totalCount},
		    resultSize: ${annualchangeplan_sPage.resultSize},
		    pageCount: ${annualchangeplan_sPage.pageCount},
		    orderBy: '${annualchangeplan_sPage.orderBy == null ? '' : annualchangeplan_sPage.orderBy}',
		    asc: ${annualchangeplan_sPage.asc},
		    params: {
		        'id': '${model.id}'
		    },
			selectedItemClass: 'annualchangeplan_sSelectedItem',
			gridFormId: 'annualchangeplan_sGridForm',
			exportUrl: 'annualchangeplan_s-export.do'
		};
        // 实例化table对象
		var annualchangeplan_sTable;
		$(function() {
			annualchangeplan_sTable = new Table(annualchangeplan_sConfig);
		    annualchangeplan_sTable.configPagination('.annualchangeplan_sM-pagination');
		    annualchangeplan_sTable.configPageInfo('.annualchangeplan_sM-page-info');
		    annualchangeplan_sTable.configPageSize('.annualchangeplan_sM-page-size');
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
	    <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">经营预算年度计划增补、变更流程表流程控制</h4></div>
	    <div class="panel-body">
	        <div class="pull-left">
	            <a href="#nextTaskUserDiv" role="button" class="btn btn-primary btn-sm" data-toggle="modal">办理</a>
			    <button class="btn btn-primary btn-sm a-submit" onclick="mainFormSubmit('annualchangeplan-save-draft.do')">草稿</button>
			    <button class="btn btn-primary btn-sm" onclick="location.href='annualchangeplan-rollback.do?executionId=${model.executionid}&flowId=${flowId}&flowType=0'">回退</button>
			    <button class="btn btn-primary btn-sm a-remove" onclick="location.href='annualchangeplan-list.do?flowId=${flowId}&flowType=0'">返回</button>
			</div>
	   </div>
	   
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">流程内容</h4></div>
        <div class="panel-body">
		  <div class="content content-inner">
		       <form id="mainForm" method="post" action="annualchangeplan-complete.do" class="form-horizontal">
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
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-planname">计划名称:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.planname.fcEdit=='1'}">    <input id="code-planname" type="text" name="planname" value="${model.planname}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.planname.fcEdit!='1'}">    <label>${model.planname}</label>    <input type="hidden" name="planname" value="${model.planname}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-deptname">编制部门:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.deptname.fcEdit=='1'}">    <input id="code-deptname" type="text" name="deptname" value="${model.deptname}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.deptname.fcEdit!='1'}">    <label>${model.deptname}</label>    <input type="hidden" name="deptname" value="${model.deptname}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-eventtime">编制时间:</label>
                              <div class="col-lg-3">  <fmt:formatDate value="${model.eventtime}" pattern="yyyy-MM-dd HH:mm:ss" />  <input id="code-eventtime" type="hidden" name="eventtime" value="${model.eventtime}" ></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-planno">编号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.planno.fcEdit=='1'}">    <input id="code-planno" type="text" name="planno" value="${model.planno}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.planno.fcEdit!='1'}">    <label>${model.planno}</label>    <input type="hidden" name="planno" value="${model.planno}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-projecttype">项目类别:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.projecttype.fcEdit=='1'}">    <input id="code-projecttype" type="text" name="projecttype" value="${model.projecttype}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.projecttype.fcEdit!='1'}">    <label>${model.projecttype}</label>    <input type="hidden" name="projecttype" value="${model.projecttype}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-projectname">项目名称:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.projectname.fcEdit=='1'}">    <input id="code-projectname" type="text" name="projectname" value="${model.projectname}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.projectname.fcEdit!='1'}">    <label>${model.projectname}</label>    <input type="hidden" name="projectname" value="${model.projectname}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-oldplanamount">原计划数:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.oldplanamount.fcEdit=='1'}">    <input id="code-oldplanamount" type="text" name="oldplanamount" value="${model.oldplanamount}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.oldplanamount.fcEdit!='1'}">    <label>${model.oldplanamount}</label>    <input type="hidden" name="oldplanamount" value="${model.oldplanamount}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-changeplanam">项目变更前计划数:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.changeplanam.fcEdit=='1'}">    <input id="code-changeplanam" type="text" name="changeplanam" value="${model.changeplanam}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.changeplanam.fcEdit!='1'}">    <label>${model.changeplanam}</label>    <input type="hidden" name="changeplanam" value="${model.changeplanam}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-changeafterplanam">项目变更后计划数:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.changeafterplanam.fcEdit=='1'}">    <input id="code-changeafterplanam" type="text" name="changeafterplanam" value="${model.changeafterplanam}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.changeafterplanam.fcEdit!='1'}">    <label>${model.changeafterplanam}</label>    <input type="hidden" name="changeafterplanam" value="${model.changeafterplanam}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-addplanam">项目增补、变更数:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.addplanam.fcEdit=='1'}">    <input id="code-addplanam" type="text" name="addplanam" value="${model.addplanam}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.addplanam.fcEdit!='1'}">    <label>${model.addplanam}</label>    <input type="hidden" name="addplanam" value="${model.addplanam}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-planamount">现计划数:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.planamount.fcEdit=='1'}">    <input id="code-planamount" type="text" name="planamount" value="${model.planamount}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.planamount.fcEdit!='1'}">    <label>${model.planamount}</label>    <input type="hidden" name="planamount" value="${model.planamount}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-deptuser">科员备注:</label>
                              <!-- 编辑类型     多行 --><div class="col-lg-6">  <c:if test="${nodeColumsMap.deptuser.fcEdit=='1'}">    <textarea class="form-control" id="code-deptuser" name="deptuser" rows="1" >${model.deptuser}</textarea>  </c:if>  <c:if test="${nodeColumsMap.deptuser.fcEdit!='1'}">    <label>${model.deptuser}</label>    <input type="hidden" name="deptuser" value="${model.deptuser}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-deptleader">科长审批:</label>
                              <!-- 编辑类型     多行 --><div class="col-lg-6">  <c:if test="${nodeColumsMap.deptleader.fcEdit=='1'}">    <textarea class="form-control" id="code-deptleader" name="deptleader" rows="1" >${model.deptleader}</textarea>  </c:if>  <c:if test="${nodeColumsMap.deptleader.fcEdit!='1'}">    <label>${model.deptleader}</label>    <input type="hidden" name="deptleader" value="${model.deptleader}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-generalmanager">总经理审批:</label>
                              <!-- 编辑类型     多行 --><div class="col-lg-6">  <c:if test="${nodeColumsMap.generalmanager.fcEdit=='1'}">    <textarea class="form-control" id="code-generalmanager" name="generalmanager" rows="1" >${model.generalmanager}</textarea>  </c:if>  <c:if test="${nodeColumsMap.generalmanager.fcEdit!='1'}">    <label>${model.generalmanager}</label>    <input type="hidden" name="generalmanager" value="${model.generalmanager}">  </c:if></div>
	                                      
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
				    <button class="btn btn-primary btn-sm a-insert" onclick="location.href='annualchangeplan_s-input.do?id=${model.id}&subId=&flowId=${flowId}'"><span class="glyphicon glyphicon-tasks"></span>新建</button>
				    <button class="btn btn-primary btn-sm a-remove" onclick="annualchangeplan_sTable.removeAll()"><span class="glyphicon glyphicon-trash"></span>删除</button>
				    <button class="btn btn-primary btn-sm" onclick="annualchangeplan_sTable.exportExcel()">导出Excel</button>
	            
				</div>
				<div class="pull-right">
				  每页显示
				  <select class="annualchangeplan_sM-page-size">
				    <option value="10">10</option>
				    <option value="20">20</option>
				    <option value="50">50</option>
				  </select>
				  条
				</div>
			    <div class="m-clear"></div>
		   </div>
		   <div class="content">
				<form id="annualchangeplan_sGridForm" name="annualchangeplan_sGridForm" method='post' action="annualchangeplan_s-remove.do" class="m-form-blank">
				  <input type="hidden" name="flowId" value="${flowId}">
				  <table id="annualchangeplan_sCodeGrid" class="table table-hover table-striped">
				      <thead>
					      <tr>
					          <th width="30" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
					          <th width="30">&nbsp;</th>
		                      <th class="sorting">项目类别</th>
		                      <th class="sorting">项目名称</th>
		                      <th class="sorting">材料类别</th>
		                      <th class="sorting">材料名称</th>
		                      <th class="sorting">规格/型号</th>
		                      <th class="sorting">单位</th>
		                      <th class="sorting">单价</th>
		                      <th class="sorting">数量</th>
		                      <th class="sorting">变更前计划数</th>
		                      <th class="sorting">变更后计划数</th>
		                      <th class="sorting">增补、变更数</th>
		                      <th class="sorting">所属部门</th>
		                      <th class="sorting">备注</th>
					      </tr>
					    </thead>
						    <tbody>
						      <c:forEach items="${annualchangeplan_sPage.result}" var="item" varStatus="status">
								  <tr class="${status.index%2==1? 'active':''}">
								        <td><input type="checkbox" class="annualchangeplan_sSelectedItem a-check" name="annualchangeplan_sSelectedItem" value="${item.id}"></td>
									    <td>
								            <a href="annualchangeplan_s-input.do?id=${model.id}&subId=${item.id}&flowId=${flowId}" class="a-update"><span class="glyphicon glyphicon-pencil"></span></a>
								        </td>
							            <td>${item.projecttype}</td>
							            <td>${item.projectname}</td>
							            <td>${item.materialtype}</td>
							            <td>${item.materialname}</td>
							            <td>${item.materialspec}</td>
							            <td>${item.materialunit}</td>
							            <td>${item.materialprice}</td>
							            <td>${item.materialnum}</td>
							            <td>${item.changeplanam}</td>
							            <td>${item.changeafterplanam}</td>
							            <td>${item.addplanam}</td>
							            <td>${item.deptname}</td>
							            <td>${item.remark}</td>
								  </tr>
						      </c:forEach>
						    </tbody>
						  </table>
						</form>
		        </div>
			  <article>
			    <div class="annualchangeplan_sM-page-info pull-left">
				  共100条记录 显示1到10条记录
				</div>
				<div class="btn-group annualchangeplan_sM-pagination pull-right">
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
