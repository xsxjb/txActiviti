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
		
		// 表单验证JS
		$(function() {
		    $("#mainForm").validate({
		        submitHandler: function(form) {
					bootbox.animate(false);
					var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
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
        <div class="panel-heading"><h4 class="panel-title">流程内容</h4></div>
        <div class="panel-body">
		<div class="content content-inner">
		       <form id="mainForm" method="post" action="${entityName?uncap_first}-save.do" class="form-horizontal">
		           <div class="controls">
					      <button id="submitButton" class="btn btn-default btn-sm a-submit">保存</button>
					      <button type="button" onclick="location.href='${entityName?uncap_first}-list.do'" class="btn btn-default btn-sm a-cancel">返回</button>
				   </div>
				   <input type="hidden" name="flowId" value="${'$' + '{flowId}'}">
				   <c:if test="${'$' + '{model != null}'}">
				       <input type="hidden" name="id" value="${'$' + '{model.id}'}">
				   </c:if>
				   <#list columns as po>
				       <#if po.fcDisplay="1">
				       <!-- 是否显示 -->
						   <div class="form-group">
							      <label class="control-label col-lg-2" for="code-${po.fieldName}">${po.filedComment}:</label>
							      <!-- 是否可编辑 -->
	                              <#if po.fcEdit="1">
	                                   ${po.jspTagInfo}
	                              <#else>
	                                  <div class="col-lg-4">
		                                  <label>${'$' + '{model.${po.fieldName}}'}</label>
	                                      <input id="code-${po.fieldName}" type="hidden" name="${po.fieldName}" value="${'$' + '{model.${po.fieldName}}'}"  >
	                                  </div>
	                              </#if>
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
								          <a href="${sub.entityName?uncap_first}-input.do?id=${'$' + '{model.id}'}&subId=${'$' + '{item.id}'}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
