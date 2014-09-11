<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>

  <head>
    <%@include file="/common/meta.jsp"%>
    <title>编辑表单</title>
    <%@include file="/common/center.jsp"%>
  </head>

  <body>
	    <%@include file="/header/header-portal.jsp"%>
	    <%@include file="/component/portal/component-leftmenu.jsp"%>
		<!-- start of main -->
		<div class="panel panel-default col-md-10 " > 
		    <!-- tabs  -->
	        <ul class="nav nav-tabs">
			  <li class="${tabType == 'formBase' ? 'active' : ''} "><a href="${scopePrefix}/form/conf-form-input.do?packageName=${packageName}&formId=${formId}" >表单基础信息</a></li>
			  <li class="${tabType == 'formTables' ? 'active' : ''}"><a href="${scopePrefix}/form/conf-formTables-input.do?packageName=${packageName}&formId=${formId}" >关联表字段</a></li>
			  <li class="${tabType == 'formLabel' ? 'active' : ''}"><a href="${scopePrefix}/form/conf-formLabel-list.do?packageName=${packageName}&formId=${formId}">控件类型</a></li>
			  <li class="${tabType == 'formCode' ? 'active' : ''}"><a href="#">代码生成</a></li>
			</ul>
			<div id="tabContent" class="tab-content">
			  <!-- 表单基础信息 -->
			  <div id="formBase" class="tab-pane fade ${tabType == 'formBase' ? 'active in' : ''}">
			        <div class="panel-body">
				        <form id="formForm" method="post" action="conf-form-save.do" class="form-horizontal">
							  <c:if test="${model != null}">
							  	<input id="conf-form_id" type="hidden" name="formId" value="${formId}">
							  	<input id="conf-form_packagename" type="hidden" name="packageName" value="${model.packageName}">
							  </c:if>
							  <p>
							    <label class="control-label" for="form_package_name">包名:</label>
							    <label class="control-label" id="form_package_name">${model.packageName}</label>
							   </p>
							   <p>
							      <label class="control-label" for="form-formname">表单名称:</label>
								  <input id="form-formname" type="text" name="formName" value="${model.formName}"  class="text required" >
							  </p>
							  <p>
							      <label class="control-label" for="form-formtitle">表单标题:</label>
								  <input id="form-formtitle" type="text" name="formTitle" value="${model.formTitle}"  class="text required" >
							  </p>
							  <p>
							      <button id="submitButton" class="btn btn-default a-submit"><spring:message code='core.input.save' text='保存'/></button>
							      <button type="button" onclick="history.back();" class="btn btn-default a-cancel"><spring:message code='core.input.back' text='返回'/></button>
							  </p>
						</form>
	        		</div>
	        	  </div>
	        	  <!-- 关联表设置 -->
	        	  <div id="formTables" class="tab-pane fade ${tabType == 'formTables' ? 'active in' : ''}">
	        	      <div class="panel panel-primary">
		        		  <div class="panel-heading"><h4 class="panel-title">选择主表/单表：</h4></div>
					          <div class="panel-body">
									  <form name="formTablesForm" method="post" action="conf-formTables-save.do?tableType=main&packageName=${packageName}" class="form-inline">
									      <c:if test="${formName != null}">
									              <input id="conf-form_id" type="hidden" name="formId" value="${formId}">
							  	          </c:if>
									      <div class="form-group">
										      <label class="control-label" for="role_def">表名:</label>
											  <select id="role_def" name="tableId" class="form-control">
												  <c:forEach items="${mainTable}" var="item">
												    <option value="${item.id}" >${item.tableNameComment}</option>
												  </c:forEach>
											  </select>
											  <span class="input-group-btn">
											      <button class="btn btn-default btn-sm a-submit" >添加</button>
											  </span>
										 </div>
									 </form>
									 <!-- 添加表后生成字段 -->
									 <div class="form-group">
										  <c:forEach items="${mainFormTable}" var="mainFormTable">
										      <div class="row-fluid">
										          <div class="well ">
										              <div class="">${mainFormTable.tableName}</div>
										              <button class="btn btn-default btn-sm a-remove" onclick="location.href='conf-formTables-remove.do?packageName=${packageName}&tableName=${mainFormTable.tableName}&formName=${mainFormTable.formName}'" >删除</button>
												      <table class="table table-striped table-hover table-bordered">
														  <thead>
														    <tr>
														         <th>标题：</th>
															      <c:forEach items="${mainFormTable.tableColumns}" var="tableColumn">
																      <th>${tableColumn.columnName}</th>
															      </c:forEach>
														    </tr>
														  </thead>
														  <tbody>
														    <tr>
														        <td>字段:</td>
														        <c:forEach items="${mainFormTable.tableColumns}" var="tableColumn">
														      		<td>${tableColumn.columnValue}</td>
														        </c:forEach>
														    </tr>
														  </tbody>
														</table> 
										          </div>
									      	  </div>
											</c:forEach>
									  </div>
								  
					          </div>
					          <div class="panel-heading"><h4 class="panel-title">选择子表：</h4></div>
					          <div class="panel-body">
									  <form name="formTablesForm" method="post" action="conf-formTables-save.do?tableType=sub" class="form-inline">
					  	                  <input id="conf-form_name" type="hidden" name="formId" value="${formId}">
					  	                  <input id="conf-package-name" type="hidden" name="packageName" value="${packageName}">
									      <div class="form-group">
									          <label class="control-label" for="role_def">表名:</label>
											  <select id="sub_table_id" name="tableId" class="form-control">
												  <c:forEach items="${subTable}" var="item">
												    <option value="${item.id}" >${item.tableNameComment}</option>
												  </c:forEach>
											  </select>
											  <span class="input-group-btn">
											      <button class="btn btn-default btn-sm a-submit" >添加</button>
											  </span>
									    </div>
								    </form>
								    <div class="form-group">
										  <!-- 添加表后生成字段 -->
										  <c:forEach items="${subFormTables}" var="subFormTable">
										      <div class="row-fluid col-lg-4">
										          <div class="well ">
										              <div class="">${subFormTable.tableName}</div>
										              <button class="btn btn-default btn-sm a-remove" onclick="location.href='conf-formTables-remove.do?packageName=${packageName}&tableName=${subFormTable.tableName}&formName=${subFormTable.formName}'" >删除</button>
												      <table class="table table-striped table-hover table-bordered">
														  <thead>
																<tr>
																	<th>字段</th>
																	<th>标题</th>
																</tr>
															</thead>
															<tbody>
															<c:forEach items="${subFormTable.tableColumns}" var="tableColumn">
															    <tr>
																	<td>${tableColumn.columnValue}</td>
																	<td>${tableColumn.columnName}</td>
															    </tr>
															  </c:forEach>
															</tbody>
														</table> 
										          </div>
									      	  </div>
											</c:forEach>
									  </div>
								   
					          </div>
				         </div>
	        	  </div>
	        	  <!-- 控件类型 -->
	        	  <div id="formBase" class="tab-pane fade ${tabType == 'formLabel' ? 'active in' : ''}">
		        	      <table class="table table-hover table-bordered" id=“tableModelGrid” >
								<thead>
									<tr>
									    <th>字段</th>
									    <th>显示标题</th>
									    <th class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)">是否显示</th>
									    <th class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems2(this.checked)">是否可编辑</th>
										<th width="120">&nbsp;</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${formTableColumns}" var="item">
								    <tr>
								        <td>${item.formColumn}</td>
								        <td>${item.formColumnTitle}</td>
								        <td><input type="checkbox" class="selectedItem a-check" name="selectedFcDisplayItem" value="${item.formColumn}" ${item.fcDisplay==1 ? 'checked' : ''}>显示</td>
										<td><input type="checkbox" class="selectedItem2 a-check" name="selectedFcEditItem" value="${item.formColumn}" ${item.fcEdit==1 ? 'checked' : ''}>可编辑</td> 
										<td>
								          <a href="conf-formLabel-input.do?packageName=${item.packageName}&formName=${item.formName}&formColumn=${item.formColumn}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
								        </td>
								    </tr>
								  </c:forEach>
								</tbody>
						  </table>
	        	  </div>
	         </div>
	    </div>
		<!-- end of main -->
  </body>

</html>
