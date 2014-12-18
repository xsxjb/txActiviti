<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>项目生产计划编辑</title>
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
		        'id': '${model.id}'
		    },
			selectedItemClass: 'selectedItem',
			gridFormId: 'gridForm'
			,exportUrl: 'production_plan_s-export.do'
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
        <div class="panel-heading"><h4 class="panel-title">项目生产计划流程</h4></div>
        <div class="panel-body">
		<div class="content content-inner">
		       <form id="mainForm" method="post" action="production_plan-save.do" class="form-horizontal">
		           <div class="controls">
					      <button id="submitButton" class="btn btn-default btn-sm a-submit">保存</button>
					      <button type="button" onclick="location.href='production_plan-list.do'" class="btn btn-default btn-sm a-cancel">返回</button>
				   </div>
				   <input type="hidden" name="flowId" value="${flowId}">
				   <c:if test="${model != null}">
				       <input type="hidden" name="id" value="${model.id}">
				   </c:if>
                             <div class="form-group">
						      <label class="control-label col-lg-2" for="code-projectno">项目编号:</label>
                               <div class="col-lg-3">   <input id="code-projectno" type="text" name="projectno" value="${model.projectno}" class="text " ></div>
                               
							
						      <label class="control-label col-lg-2" for="code-projectname">项目名称:</label>
                               <div class="col-lg-3">   <input id="code-projectname" type="text" name="projectname" value="${model.projectname}" class="text required" ></div>
                               
                            </div>
							
                             <div class="form-group">
						      <label class="control-label col-lg-2" for="code-projecttype">项目类型:</label>
                               <div class="col-lg-3">   <input id="code-projecttype" type="text" name="projecttype" value="${model.projecttype}" class="text " ></div>
                               
							
						      <label class="control-label col-lg-2" for="code-customername">客户名称:</label>
                               <div class="col-lg-3">   <input id="code-customername" type="text" name="customername" value="${model.customername}" class="text " ></div>
                               
                            </div>
							
                             <div class="form-group">
						      <label class="control-label col-lg-2" for="code-productmanage">项目负责人:</label>
                               <div class="col-lg-3">   <input id="code-productmanage" type="text" name="productmanage" value="${model.productmanage}" class="text " ></div>
                               
							
						      <label class="control-label col-lg-2" for="code-workingday">工作日:</label>
                               <div class="col-lg-3">   <input id="code-workingday" type="text" name="workingday" value="${model.workingday}" class="text " ></div>
                               
                            </div>
							
                             <div class="form-group">
						      <label class="control-label col-lg-2" for="code-starttime">总开始时间:</label>
                               <div class="col-lg-3">  <div class="input-append datetimepicker date">  <span class="add-on">    <input data-format="yyyy-MM-dd hh:mm:ss" type="text" name="starttime" value="${model.starttime}" class="text required" maxlength="20" readonly >  </span>  </div></div>
                               
							
						      <label class="control-label col-lg-2" for="code-endtime">总结束时间:</label>
                               <div class="col-lg-3">  <div class="input-append datepicker date">  <span class="add-on">    <input id="code-endtime" type="text" name="endtime" value="${model.endtime}" class="text required" readonly >  </span>  </div></div>
                               
                            </div>
							
                             <div class="form-group">
						      <label class="control-label col-lg-2" for="code-buystarttime">采购开始时间:</label>
                               <div class="col-lg-3">  <div class="input-append datepicker date">  <span class="add-on">    <input id="code-buystarttime" type="text" name="buystarttime" value="${model.buystarttime}" class="text required" readonly >  </span>  </div></div>
                               
							
						      <label class="control-label col-lg-2" for="code-buyendtime">采购结束时间:</label>
                               <div class="col-lg-3">  <div class="input-append datepicker date">  <span class="add-on">    <input id="code-buyendtime" type="text" name="buyendtime" value="${model.buyendtime}" class="text required" readonly >  </span>  </div></div>
                               
                            </div>
							
                             <div class="form-group">
						      <label class="control-label col-lg-2" for="code-prodstarttime">生产开始时间:</label>
                               <div class="col-lg-3">  <div class="input-append datepicker date">  <span class="add-on">    <input id="code-prodstarttime" type="text" name="prodstarttime" value="${model.prodstarttime}" class="text " readonly >  </span>  </div></div>
                               
							
						      <label class="control-label col-lg-2" for="code-prodendtime">生产结束时间:</label>
                               <div class="col-lg-3">  <div class="input-append datepicker date">  <span class="add-on">    <input id="code-prodendtime" type="text" name="prodendtime" value="${model.prodendtime}" class="text " readonly >  </span>  </div></div>
                               
                            </div>
							
                             <div class="form-group">
						      <label class="control-label col-lg-2" for="code-prodoutstarttime">生产外协开始时间:</label>
                               <div class="col-lg-3">  <div class="input-append datepicker date">  <span class="add-on">    <input id="code-prodoutstarttime" type="text" name="prodoutstarttime" value="${model.prodoutstarttime}" class="text required" readonly >  </span>  </div></div>
                               
							
						      <label class="control-label col-lg-2" for="code-prodoutendtime">生产外协结束时间:</label>
                               <div class="col-lg-3">  <div class="input-append datepicker date">  <span class="add-on">    <input id="code-prodoutendtime" type="text" name="prodoutendtime" value="${model.prodoutendtime}" class="text required" readonly >  </span>  </div></div>
                               
                            </div>
							
				</form>
		</div>
        </div> 
        <!-- ==================== 子表 ========================================== -->
        <div class="panel-heading"><h4 class="panel-title">列表</h4></div>
	    <div class="panel-body">
			    <div class="pull-left">
				    <button class="btn btn-default btn-sm a-insert" onclick="location.href='production_plan_s-input.do?id=${model.id}&subId=&flowId=${flowId}'">新建</button>
				    <button class="btn btn-default btn-sm a-remove" onclick="table.removeAll()">删除</button>
				    <button class="btn btn-default btn-sm" onclick="table.exportExcel()">导出Excel</button>
	            
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
				<form id="gridForm" name="gridForm" method='post' action="production_plan-remove.do" class="m-form-blank">
				  <table id="codeGrid" class="table table-hover table-bordered">
				      <thead>
					      <tr>
					          <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
			                      <th class="sorting">项目编号</th>
			                      <th class="sorting">项目名称</th>
			                      <th class="sorting">批次号</th>
			                      <th class="sorting">生产类型</th>
			                      <th class="sorting">生产方式</th>
			                      <th class="sorting">生产场地</th>
			                      <th class="sorting">产品类型</th>
			                      <th class="sorting">产品件号</th>
			                      <th class="sorting">产品编号</th>
			                      <th class="sorting">产品名</th>
			                      <th class="sorting">规格型号</th>
			                      <th class="sorting">数量</th>
			                      <th class="sorting">工作日</th>
			                      <th class="sorting">计划开始时间</th>
			                      <th class="sorting">计划结束时间</th>
					          <th width="80">&nbsp;</th>
					      </tr>
					    </thead>
						    <tbody>
						      <c:forEach items="${page.result}" var="item">
								  <tr>
								        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.id}"></td>
									            <td>${item.projectno}</td>
									            <td>${item.projectname}</td>
									            <td>${item.batchno}</td>
									            <td>${item.productiontype}</td>
									            <td>${item.productionmode}</td>
									            <td>${item.productionaddress}</td>
									            <td>${item.producttype}</td>
									            <td>${item.productflowid}</td>
									            <td>${item.productno}</td>
									            <td>${item.productname}</td>
									            <td>${item.productmodel}</td>
									            <td>${item.productnum}</td>
									            <td>${item.workingday}</td>
									            <td>${item.starttime}</td>
									            <td>${item.endtime}</td>
								        <td>
								          <a href="production_plan_s-input.do?id=${model.id}&subId=${item.id}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
								        </td>
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
