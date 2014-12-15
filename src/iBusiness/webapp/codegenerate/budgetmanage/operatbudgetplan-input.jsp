<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>编辑</title>
    <%@include file="/common/center.jsp"%>
    <script type="text/javascript">
		var config = {
		    id: 'codeGrid',
		    pageNo: ${page.pageNo},
		    pageSize: ${page.pageSize},
		    totalCount:${page.totalCount},
		    resultSize: ${page.resultSize},
		    pageCount: ${page.pageCount},
		    orderBy: '${page.orderBy == null ? '' : page.orderBy}',
		    asc: ${page.asc},
		    params: {
		        'id': '${model.id}',
		        'flowId':'${flowId}'
		    },
			selectedItemClass: 'selectedItem',
			gridFormId: 'gridForm'
			,exportUrl: 'operatbudgetplan_s-export.do'
		};

		var table;
		$(function() {
			table = new Table(config);
		    table.configPagination('.m-pagination');
		    table.configPageInfo('.m-page-info');
		    table.configPageSize('.m-page-size');
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
	<div class="span2"></div>
	<!-- start of main -->
	<div class="panel panel-default col-md-10"> 
	    <div class="panel-heading"><h4 class="panel-title">流程控制</h4></div>
	    <div class="panel-body">
	        <div class="pull-left">
	            <a href="#nextTaskUserDiv" role="button" class="btn btn-default btn-sm" data-toggle="modal">办理</a>
			    <button class="btn btn-default btn-sm a-submit" onclick="mainFormSubmit('operatbudgetplan-save-draft.do')">草稿</button>
			    <button class="btn btn-default btn-sm" onclick="location.href='operatbudgetplan-rollback.do?executionId=${model.executionid}&flowId=${flowId}&flowType=0'">回退</button>
			    <button class="btn btn-default btn-sm a-remove" onclick="location.href='operatbudgetplan-list.do?flowId=${flowId}&flowType=0'">返回</button>
			</div>
	   </div>
	   
        <div class="panel-heading"><h4 class="panel-title">流程内容</h4></div>
        <div class="panel-body">
		<div class="content content-inner">
		       <form id="mainForm" method="post" action="operatbudgetplan-complete.do" class="form-horizontal">
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
						      <label class="control-label  col-lg-2" for="code-dept">编制部门:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.dept.fcEdit=='1'}">    <input id="code-dept" type="text" name="dept" value="${model.dept}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.dept.fcEdit!='1'}">    <label>${model.dept}</label>    <input type="hidden" name="dept" value="${model.dept}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-eventtime">编制时间:</label>
                              <div class="col-lg-3">  <fmt:formatDate value="${model.eventtime}" pattern="yyyy-MM-dd HH:mm:ss" />  <input id="code-eventtime" type="hidden" name="eventtime" value="${model.eventtime}" ></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-no">编号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.no.fcEdit=='1'}">    <input id="code-no" type="text" name="no" value="${model.no}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.no.fcEdit!='1'}">    <label>${model.no}</label>    <input type="hidden" name="no" value="${model.no}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-planamount">计划总数:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.planamount.fcEdit=='1'}">    <input id="code-planamount" type="text" name="planamount" value="${model.planamount}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.planamount.fcEdit!='1'}">    <label>${model.planamount}</label>    <input type="hidden" name="planamount" value="${model.planamount}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-deptleader">科长审批:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.deptleader.fcEdit=='1'}">    <input id="code-deptleader" type="text" name="deptleader" value="${model.deptleader}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.deptleader.fcEdit!='1'}">    <label>${model.deptleader}</label>    <input type="hidden" name="deptleader" value="${model.deptleader}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-directormanager">主管领导审批:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.directormanager.fcEdit=='1'}">    <input id="code-directormanager" type="text" name="directormanager" value="${model.directormanager}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.directormanager.fcEdit!='1'}">    <label>${model.directormanager}</label>    <input type="hidden" name="directormanager" value="${model.directormanager}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-generalmanager">总经理审批:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.generalmanager.fcEdit=='1'}">    <input id="code-generalmanager" type="text" name="generalmanager" value="${model.generalmanager}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.generalmanager.fcEdit!='1'}">    <label>${model.generalmanager}</label>    <input type="hidden" name="generalmanager" value="${model.generalmanager}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-planner">计划员确认:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.planner.fcEdit=='1'}">    <input id="code-planner" type="text" name="planner" value="${model.planner}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.planner.fcEdit!='1'}">    <label>${model.planner}</label>    <input type="hidden" name="planner" value="${model.planner}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-projecttypesum">项目类别合计:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.projecttypesum.fcEdit=='1'}">    <input id="code-projecttypesum" type="text" name="projecttypesum" value="${model.projecttypesum}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.projecttypesum.fcEdit!='1'}">    <label>${model.projecttypesum}</label>    <input type="hidden" name="projecttypesum" value="${model.projecttypesum}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-projectnamesum">项目名称合计:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.projectnamesum.fcEdit=='1'}">    <input id="code-projectnamesum" type="text" name="projectnamesum" value="${model.projectnamesum}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.projectnamesum.fcEdit!='1'}">    <label>${model.projectnamesum}</label>    <input type="hidden" name="projectnamesum" value="${model.projectnamesum}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-isgm">是否需要总经理审批:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.isgm.fcEdit=='1'}">    <label class="radio"><input type="radio" name="isgm" value="1" ${1==model.isgm? 'checked':''} >是</label>    <label class="radio"><input type="radio" name="isgm" value="2" ${2==model.isgm? 'checked':''} >否</label>  </c:if>  <c:if test="${nodeColumsMap.isgm.fcEdit!='1'}">    <label class="radio"><input type="radio" name="isgm" value="1" ${1==model.isgm? 'checked':'' disabled="disabled"} >是</label>    <label class="radio"><input type="radio" name="isgm" value="2" ${2==model.isgm? 'checked':'' disabled="disabled"} >否</label>    <input type="hidden" name="isgm" value="${model.isgm}">  </c:if> </div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-isdm">是否需要主管领导审批:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.isdm.fcEdit=='1'}">    <label class="radio"><input type="radio" name="isdm" value="1" ${1==model.isdm? 'checked':''} >是</label>    <label class="radio"><input type="radio" name="isdm" value="2" ${2==model.isdm? 'checked':''} >否</label>  </c:if>  <c:if test="${nodeColumsMap.isdm.fcEdit!='1'}">    <label class="radio"><input type="radio" name="isdm" value="1" ${1==model.isdm? 'checked':'' disabled="disabled"} >是</label>    <label class="radio"><input type="radio" name="isdm" value="2" ${2==model.isdm? 'checked':'' disabled="disabled"} >否</label>    <input type="hidden" name="isdm" value="${model.isdm}">  </c:if> </div>
	                                      
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
						                    <button class="btn btn-default btn-sm a-insert">办理</button>
						                    <button class="btn btn-default btn-sm" data-dismiss="modal" >关闭</button>
						           </div>
					            </div><!-- /.modal-content -->
						  </div><!-- /.modal-dialog -->
				    </div>
					
				</form>
		</div>
        </div> 
        <!-- ==================== 子表 ========================================== -->
        <div class="panel-heading"><h4 class="panel-title">列表</h4></div>
	    <div class="panel-body">
			    <div class="pull-left">
				    <button class="btn btn-default btn-sm a-insert" onclick="location.href='operatbudgetplan_s-input.do?id=${model.id}&subId=&flowId=${flowId}'">新建</button>
				    <button class="btn btn-default btn-sm a-remove" onclick="table.removeAll()">删除</button>
	            
				</div>
				<div class="pull-right">
				  每页显示
				  <select class="m-page-size">
				    <option value="10">10</option>
				    <option value="20">20</option>
				    <option value="50">50</option>
				  </select>
				  条
				</div>
			    <div class="m-clear"></div>
		   </div>
		   <div class="content">
				<form id="gridForm" name="gridForm" method='post' action="operatbudgetplan_s-remove.do" class="m-form-blank">
				  <input type="hidden" name="flowId" value="${flowId}">
				  <table id="codeGrid" class="table table-hover table-bordered">
				      <thead>
					      <tr>
					          <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
					          <th width="80">&nbsp;</th>
		                      <th class="sorting">资金项目类别</th>
		                      <th class="sorting">项目计划名称</th>
		                      <th class="sorting">材料类别</th>
		                      <th class="sorting">材料/用品/费用名称</th>
		                      <th class="sorting">规格/型号</th>
		                      <th class="sorting">单位</th>
		                      <th class="sorting">单价</th>
		                      <th class="sorting">数量</th>
		                      <th class="sorting">计划数（元）</th>
		                      <th class="sorting">实施原因</th>
		                      <th class="sorting">措施/内容</th>
		                      <th class="sorting">所属部门</th>
		                      <th class="sorting">备注</th>
					      </tr>
					    </thead>
						    <tbody>
						      <c:forEach items="${page.result}" var="item">
								  <tr>
								        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.id}"></td>
									    <td>
								            <a href="operatbudgetplan_s-input.do?id=${model.id}&subId=${item.id}&flowId=${flowId}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
								        </td>
							            <td>${item.projecttype}</td>
							            <td>${item.projectname}</td>
							            <td>${item.materialtype}</td>
							            <td>${item.materialname}</td>
							            <td>${item.spec}</td>
							            <td>${item.unit}</td>
							            <td>${item.price}</td>
							            <td>${item.numb}</td>
							            <td>${item.planamounts}</td>
							            <td>${item.reason}</td>
							            <td>${item.info}</td>
							            <td>${item.dept}</td>
							            <td>${item.remark}</td>
								  </tr>
						      </c:forEach>
						    </tbody>
						  </table>
						</form>
		        </div>
			  <article>
			    <div class="m-page-info pull-left">
				  共100条记录 显示1到10条记录
				</div>
				<div class="btn-group m-pagination pull-right">
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
