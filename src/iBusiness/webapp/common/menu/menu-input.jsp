<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "auth");%>
<%pageContext.setAttribute("currentMenu", "auth");%>
<!doctype html>
<html>

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="auth.access.input.title" text="菜单管理"/></title>
    <%@include file="/common/center.jsp"%>
  </head>

  <body>
    <%@include file="/header/header-portal.jsp"%>

	<div class="span2"></div>

	<!-- start of main -->
	<div class="panel panel-default span10">
        <div class="panel-heading"><h5 class="title">菜单管理</h5></div>
        <div class="panel-body">
              <form id="menuForm" method="post" action="menu-save.do" class="form-horizontal">
				  <c:if test="${model != null}">
				      <input id="menu_id" type="hidden" name="id" value="${model.id}">
				      <input id="menu_level" type="hidden" name="menuLevel" value="${model.menuLevel}">
				      <input id="menu_parentId" type="hidden" name="parentId" value="${parentId}">
				  </c:if>
				  <p>
					  <label class="control-label" for="menu_name">菜单名称:</label>
				      <input id="menu_name" type="text" name="menuName" value="${model.menuName}"  class="text required"  >
				  </p>
				  <p>
					  <label class="control-label" for="menu_url">URL:</label>
				      <input id="menu_url" type="text" name="menuUrl" value="${model.menuUrl}" class="text">
				  </p>
				  <p>
					  <label class="control-label" for="menu_order">菜单排序:</label>
					  <input id="menu_order" type="text" name="menuOrder" value="${model.menuOrder}"  class="text required"  >
				  </p>
				  <div class="control-group">
				    <div class="controls">
				      <button id="submitButton" class="btn a-submit"><spring:message code='core.input.save' text='保存'/></button>
					  &nbsp;
				      <button type="button" onclick="history.back();" class="btn"><spring:message code='core.input.back' text='返回'/></button>
				    </div>
				  </div>
				</form>
        </div>
    </div>
    
	<!-- end of main -->
  </body>
</html>
