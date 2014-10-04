<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title>已办流程列表</title>
    <%@include file="/common/center.jsp"%>
  </head>

  <body>
    <%@include file="/header/header-portal.jsp"%>

    <div class="row">

	<!-- start of main -->
    <div class="panel panel-default span10">
        <div class="panel-heading"><h4 class="panel-title">待办流程列表</h4></div>
        <div class="panel-body">
			  <table id="demoGrid" class="table table-hover table-bordered">
			    <thead>
			      <tr>
			        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
			        <th class="sorting" >编号</th>
			        <th class="sorting" >名称</th>
			        <th class="sorting" >创建时间</th>
			        <th class="sorting" >负责人</th>
			        <th class="sorting" >状态</th>
			        <th width="170">&nbsp;</th>
			      </tr>
			    </thead>
			
			    <tbody>
			      <c:forEach items="${tasks}" var="item">
			      <tr>
			        <td><input type="checkbox" class="selectedItem" name="selectedItem" value="${item.id}"></td>
				    <td>${item.id}</td>
				    <td>${item.name}</td>
				    <td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				    <td><tags:user userId="${item.assignee}"/></td>
				    <td>${item.suspended ? '挂起' : '激活'}</td>
			        <td>
			          <a href="${scopePrefix}${item.flowUrl}${item.id}">办理</a>
			          <a href="workspace-viewHistory.do?processInstanceId=${item.processInstanceId}">历史</a>
			        </td>
			      </tr>
			      </c:forEach>
			    </tbody>
			  </table>
        </div>
        </div>
	<!-- end of main -->
	</div>

  </body>

</html>
