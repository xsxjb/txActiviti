<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>项目立项表单编辑</title>
    <%@include file="/common/center.jsp"%>
    <script type="text/javascript">
        // 实例化config对象
        var project_product_sConfig = {
		    id: 'project_product_sCodeGrid',
		    pageNo: ${project_product_sPage.pageNo},
		    pageSize: ${project_product_sPage.pageSize},
		    totalCount:${project_product_sPage.totalCount},
		    resultSize: ${project_product_sPage.resultSize},
		    pageCount: ${project_product_sPage.pageCount},
		    orderBy: '${project_product_sPage.orderBy == null ? '' : project_product_sPage.orderBy}',
		    asc: ${project_product_sPage.asc},
		    params: {
		        'id': '${model.id}'
		    },
			selectedItemClass: 'project_product_sSelectedItem',
			gridFormId: 'project_product_sGridForm',
			exportUrl: 'project_product_s-export.do'
		};
        // 实例化table对象
		var project_product_sTable;
		$(function() {
			project_product_sTable = new Table(project_product_sConfig);
		    project_product_sTable.configPagination('.project_product_sM-pagination');
		    project_product_sTable.configPageInfo('.project_product_sM-page-info');
		    project_product_sTable.configPageSize('.project_product_sM-page-size');
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
	    <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">项目立项表单流程控制</h4></div>
	    <div class="panel-body">
	        <div class="pull-left">
	            <a href="#nextTaskUserDiv" role="button" class="btn btn-primary btn-sm" data-toggle="modal">办理</a>
			    <button class="btn btn-primary btn-sm a-submit" onclick="mainFormSubmit('project_approval-save-draft.do')">草稿</button>
			    <button class="btn btn-primary btn-sm" onclick="location.href='project_approval-rollback.do?executionId=${model.executionid}&flowId=${flowId}&flowType=0'">回退</button>
			    <button class="btn btn-primary btn-sm a-remove" onclick="location.href='project_approval-list.do?flowId=${flowId}&flowType=0'">返回</button>
			</div>
	   </div>
	   
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">流程内容</h4></div>
        <div class="panel-body">
		  <div class="content content-inner">
		       <form id="mainForm" method="post" action="project_approval-complete.do" class="form-horizontal">
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
						      <label class="control-label  col-lg-2" for="code-eventdate">日期:</label>
                              <div class="col-lg-3"><c:if test="${nodeColumsMap.eventdate.fcEdit=='1'}">  <div class="input-append datepicker date">  <span class="add-on">    <input id="code-eventdate" type="text" name="eventdate" value="${model.eventdate}" class="text required" readonly >  </span>  </div></c:if><c:if test="${nodeColumsMap.eventdate.fcEdit!='1'}">  <label>${model.eventdate}</label>  <input type="hidden" name="eventdate" value="${model.eventdate}"></c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-pactno">合同编号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.pactno.fcEdit=='1'}">    <input id="code-pactno" type="text" name="pactno" value="${model.pactno}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.pactno.fcEdit!='1'}">    <label>${model.pactno}</label>    <input type="hidden" name="pactno" value="${model.pactno}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-customername">客户名称:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.customername.fcEdit=='1'}">    <input id="code-customername" type="text" name="customername" value="${model.customername}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.customername.fcEdit!='1'}">    <label>${model.customername}</label>    <input type="hidden" name="customername" value="${model.customername}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-projectno">项目编号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.projectno.fcEdit=='1'}">    <input id="code-projectno" type="text" name="projectno" value="${model.projectno}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.projectno.fcEdit!='1'}">    <label>${model.projectno}</label>    <input type="hidden" name="projectno" value="${model.projectno}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-projectname">项目名称:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.projectname.fcEdit=='1'}">    <input id="code-projectname" type="text" name="projectname" value="${model.projectname}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.projectname.fcEdit!='1'}">    <label>${model.projectname}</label>    <input type="hidden" name="projectname" value="${model.projectname}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-projecttype">项目类型:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.projecttype.fcEdit=='1'}">    <input id="code-projecttype" type="text" name="projecttype" value="${model.projecttype}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.projecttype.fcEdit!='1'}">    <label>${model.projecttype}</label>    <input type="hidden" name="projecttype" value="${model.projecttype}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-salesuser">销售人员:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.salesuser.fcEdit=='1'}">    <input id="code-salesuser" type="text" name="salesuser" value="${model.salesuser}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.salesuser.fcEdit!='1'}">    <label>${model.salesuser}</label>    <input type="hidden" name="salesuser" value="${model.salesuser}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-projectmanager">项目经理:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.projectmanager.fcEdit=='1'}">    <input id="code-projectmanager" type="text" name="projectmanager" value="${model.projectmanager}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.projectmanager.fcEdit!='1'}">    <label>${model.projectmanager}</label>    <input type="hidden" name="projectmanager" value="${model.projectmanager}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-planner">计划员:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.planner.fcEdit=='1'}">    <input id="code-planner" type="text" name="planner" value="${model.planner}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.planner.fcEdit!='1'}">    <label>${model.planner}</label>    <input type="hidden" name="planner" value="${model.planner}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-buyer">采购员:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.buyer.fcEdit=='1'}">    <input id="code-buyer" type="text" name="buyer" value="${model.buyer}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.buyer.fcEdit!='1'}">    <label>${model.buyer}</label>    <input type="hidden" name="buyer" value="${model.buyer}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-productmanage">生成负责人:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.productmanage.fcEdit=='1'}">    <input id="code-productmanage" type="text" name="productmanage" value="${model.productmanage}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.productmanage.fcEdit!='1'}">    <label>${model.productmanage}</label>    <input type="hidden" name="productmanage" value="${model.productmanage}">  </c:if></div>
	                                      
						 
					
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
				    <button class="btn btn-primary btn-sm a-insert" onclick="location.href='project_product_s-input.do?id=${model.id}&subId=&flowId=${flowId}'"><span class="glyphicon glyphicon-tasks"></span>新建</button>
				    <button class="btn btn-primary btn-sm a-remove" onclick="project_product_sTable.removeAll()"><span class="glyphicon glyphicon-trash"></span>删除</button>
	            
				</div>
				<div class="pull-right">
				  每页显示
				  <select class="project_product_sM-page-size">
				    <option value="10">10</option>
				    <option value="20">20</option>
				    <option value="50">50</option>
				  </select>
				  条
				</div>
			    <div class="m-clear"></div>
		   </div>
		   <div class="content">
				<form id="project_product_sGridForm" name="project_product_sGridForm" method='post' action="project_product_s-remove.do" class="m-form-blank">
				  <input type="hidden" name="flowId" value="${flowId}">
				  <table id="project_product_sCodeGrid" class="table table-hover table-striped">
				      <thead>
					      <tr>
					          <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
					          <th width="80">&nbsp;</th>
		                      <th class="sorting">产品编号</th>
		                      <th class="sorting">产品名</th>
		                      <th class="sorting">规格型号</th>
		                      <th class="sorting">数量</th>
		                      <th class="sorting">单位</th>
		                      <th class="sorting">单价</th>
		                      <th class="sorting">金额</th>
		                      <th class="sorting">产品类型</th>
		                      <th class="sorting">产品件号</th>
					      </tr>
					    </thead>
						    <tbody>
						      <c:forEach items="${project_product_sPage.result}" var="item" varStatus="status">
								  <tr class="${status.index%2==1? 'active':''}">
								        <td><input type="checkbox" class="project_product_sSelectedItem a-check" name="project_product_sSelectedItem" value="${item.id}"></td>
									    <td>
								            <a href="project_product_s-input.do?id=${model.id}&subId=${item.id}&flowId=${flowId}" class="a-update"><span class="glyphicon glyphicon-pencil"></span></a>
								        </td>
							            <td>${item.productno}</td>
							            <td>${item.productname}</td>
							            <td>${item.productmodel}</td>
							            <td>${item.productnumber}</td>
							            <td>${item.productunit}</td>
							            <td>${item.unitprice}</td>
							            <td>${item.amount}</td>
							            <td>${item.producttype}</td>
							            <td>${item.productflowid}</td>
								  </tr>
						      </c:forEach>
						    </tbody>
						  </table>
						</form>
		        </div>
			  <article>
			    <div class="project_product_sM-page-info pull-left">
				  共100条记录 显示1到10条记录
				</div>
				<div class="btn-group project_product_sM-pagination pull-right">
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
