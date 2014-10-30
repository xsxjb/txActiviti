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
		    pageNo: ${"$" + "{page.pageNo}"},
		    pageSize: ${"$" + "{page.pageSize}"},
		    totalCount:${"$" + "{page.totalCount}"},
		    resultSize: ${"$" + "{page.resultSize}"},
		    pageCount: ${"$" + "{page.pageCount}"},
		    orderBy: '${"$" + "{page.orderBy == null ? "+ "''" +" : page.orderBy}"}',
		    asc: ${"$" + "{page.asc}"},
		    params: {
		        'id': '${"$" + "{model.id}"}'
		    },
			selectedItemClass: 'selectedItem',
			gridFormId: 'gridForm'
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
			${"$" + "('#mainForm').attr('action', path).submit()"};
		}
    </script>
  </head>
  <body>
    <%@include file="/header/header-portal.jsp"%>
    <div class="row">
	<div class="span2"></div>
	<!-- start of main -->
	<div class="panel panel-default col-md-10"> 
	    <div class="panel-heading"><h4 class="panel-title">流程控制</h4></div>
	    <div class="panel-body">
	        <div class="pull-left">
			    <button class="btn btn-default btn-sm a-insert" onclick="mainFormSubmit('${entityName?uncap_first}-complete.do')">办理</button>
			    <button class="btn btn-default btn-sm a-submit" onclick="mainFormSubmit('${entityName?uncap_first}-save-draft.do')">草稿</button>
			    <button class="btn btn-default btn-sm a-remove" onclick="location.href='${entityName?uncap_first}-list.do?flowId=${'$' + '{flowId}'}&flowType=0'">返回</button>
			</div>
	   </div>
	   
        <div class="panel-heading"><h4 class="panel-title">流程内容</h4></div>
        <div class="panel-body">
		<div class="content content-inner">
		       <form id="mainForm" method="post" action="permission-save-draft.do?flowId=${'$' + '{flowId}'}" class="form-horizontal">
				   <input type="hidden" name="flowId" value="${'$' + '{flowId}'}">
				   <c:if test="${'$' + '{model != null}'}">
				       <input type="hidden" name="id" value="${'$' + '{model.id}'}">
				       <input type="hidden" name="executionid" value="${'$' + '{model.executionid}'}">
				       <input type="hidden" name="createdatebpm" value="${'$' + '{model.createdatebpm}'}">
				       <input type="hidden" name="nodename" value="${'$' + '{model.nodename}'}">
				       <input type="hidden" name="doneflag" value="${'$' + '{model.doneflag}'}">
				   </c:if>
				   <#list columns as po>
					   <#if po.fcDisplay="1">
					       <!-- 是否显示 -->
						   <div class="control-group">
							      <div class="col-lg-6">
								      <label class="control-label" for="code-${po.fieldName}">${po.filedComment}:</label>
								      <!-- 是否可编辑 -->
		                              <#if po.fcEdit="1">
		                                  <input id="code-${po.fieldName}" type="text" name="${po.fieldName}" value="${'$' + '{model.${po.fieldName}}'}"  class="text required" >
		                              <#else>
		                                  <input id="code-${po.fieldName}" type="text" name="${po.fieldName}" value="${'$' + '{model.${po.fieldName}}'}" disabled="disabled"  class="text required" >
		                              </#if>
								  </div>
							</div>
					   </#if>
					</#list>
				</form>
		</div>
        </div> 
        <!-- ==================== 子表 ========================================== -->
        <#list subTab as sub>
        <div class="panel-heading"><h4 class="panel-title">列表</h4></div>
	    <div class="panel-body">
			    <div class="pull-left">
				    <button class="btn btn-default btn-sm a-insert" onclick="location.href='${sub.entityName?uncap_first}-input.do?id=${'$' + '{model.id}'}&subId=&flowId=${'$' + '{flowId}'}'">新建</button>
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
				<form id="gridForm" name="gridForm" method='post' action="${entityName?uncap_first}-remove.do" class="m-form-blank">
				  <table id="codeGrid" class="table table-hover table-bordered">
				      <thead>
					      <tr>
					          <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
					          <#list sub.columns as subItem>
			                      <th class="sorting">${subItem.filedComment}</th>
			                  </#list>
					          <th width="80">&nbsp;</th>
					      </tr>
					    </thead>
						    <tbody>
						      <c:forEach items="${'$' + '{page.result}'}" var="item">
								  <tr>
								        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${'$' + '{item.id}'}"></td>
									        <#list sub.columns as subItem>
									            <td>${'$' + '{item.${subItem.fieldName}}'}</td>
									        </#list>
								        <td>
								          <a href="${sub.entityName?uncap_first}-input.do?id=${'$' + '{model.id}'}&subId=${'$' + '{item.id}'}&flowId=${'$' + '{flowId}'}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
				  <button class="btn btn-small">${"&lt"};</button>
				  <button class="btn btn-small">1</button>
				  <button class="btn btn-small">${"&gt"};</button>
				</div>
			    <div class="m-clear"></div>
		      </article>
		  </#list>
      </div>
	<!-- end of main -->
	</div>
  </body>
</html>
