<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>

  <head>
    <%@include file="/common/meta.jsp"%>
    <title>列表</title>
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
		        'filter_LIKES_username': '${"$" + "{param.filter_LIKES_username}"}',
		        'filter_EQI_status': '${"$" + "{param.filter_EQI_status}"}'
		    },
			selectedItemClass: 'selectedItem',
			gridFormId: 'gridForm',
			exportUrl: '${entityName?uncap_first}-export.do'
		};

		var table;
		$(function() {
			table = new Table(config);
		    table.configPagination('.m-pagination');
		    table.configPageInfo('.m-page-info');
		    table.configPageSize('.m-page-size');
		});
    </script>
  </head>

  <body>
    <%@include file="/header/header-portal.jsp"%>
    <div class="row">
    <div class="span2"></div>
	<!-- start of main -->
	<div class="panel panel-default span10">
        <div class="panel-heading"><h4 class="panel-title">查询</h4></div>
          <div class="panel-body">
	          <div id="userSearch" class="content content-inner">
				  <form name="userForm" method="post" action="${entityName?uncap_first}-list.do" class="form-inline">
				    <div class="form-group">
				      <label for="user_username"><spring:message code='user.user.list.search.username' text='账号'/>:</label>
				      <input type="text" id="user_username" name="filter_LIKES_username" value="${'$' + '{param.filter_LIKES_username}'}">
				      <label for="user_enabled"><spring:message code='user.user.list.search.status' text='状态'/>:</label>
				      <select id="user_enabled" name="filter_EQI_status" class="input-mini">
					      <option value=""></option>
					      <option value="1" ${"$" + "{param.filter_EQI_status == 1 ? 'selected' : ''}"}><spring:message code='user.user.list.search.enabled.true' text='启用'/></option>
					      <option value="0" ${"$" + "{param.filter_EQI_status == 0 ? 'selected' : ''}"}><spring:message code='user.user.list.search.enabled.false' text='禁用'/></option>
				      </select>
					  <button class="btn btn-default btn-sm" onclick="document.userForm.submit()">查询</button>
					</div>
				 </form>
			  </div>
		  </div>
	   <div class="panel-heading"><h4 class="panel-title">用户列表</h4></div>
       <div class="panel-body">
		    <div class="pull-left">
			    <button class="btn btn-default btn-sm a-insert" onclick="location.href='${entityName?uncap_first}-input.do'">新建</button>
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
					        <#list columns as po>
					                <th class="sorting" name="${po.filedComment}">${po.filedComment}</th>
					        </#list>
				        <th width="80">${"&nbsp"};</th>
				      </tr>
				    </thead>
					    <tbody>
					      <c:forEach items="${'$' + '{page.result}'}" var="item">
					      <tr>
					        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${'$' + '{item.id}'}"></td>
					        <#list columns as po>
						        <td>${"$" + "{item.${po.fieldName}}"}</td>
					        </#list>
					        <td>
					          <a href="${entityName?uncap_first}-input.do?id=${'$' + '{item.id}'}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
	<!-- end of main -->
	</div>
  </body>
</html>
