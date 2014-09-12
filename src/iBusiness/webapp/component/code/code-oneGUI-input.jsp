<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="auth.access.input.title" text="一对一生成器"/></title>
    <%@include file="/common/center.jsp"%>
  </head>

  <body>
    <%@include file="/header/header-portal.jsp"%>

	<div class="span2"></div>

	<!-- start of main -->
	<div class="panel panel-default span10">
        <div class="panel-heading"><h4 class="panel-title">一对一生成器</h4></div>
        <div class="panel-body">
              <form id="menuForm" method="post" action="menu-save.do" class="form-horizontal">
				  <c:if test="${model != null}">
				      <input id="menu_id" type="hidden" name="id" value="${model.id}">
				      <input id="menu_level" type="hidden" name="menuLevel" value="${model.menuLevel}">
				      <input id="menu_parentId" type="hidden" name="parentId" value="${parentId}">
				  </c:if>
				  <div class="form-group">
					  <label class="col-lg-2 control-label" for="menu_name">菜单名称:</label>
				      <input id="menu_name" type="text" name="menuName" value="${model.menuName}"  class="text required"  >
				  </div>
				  <div class="form-group">
					  <label class="col-lg-2 control-label" for="menu_url">URL:</label>
				      <input id="menu_url" type="text" name="menuUrl" value="${model.menuUrl}" class="text">
				  </div>
				  <div class="form-group">
					  <label class="col-lg-2 control-label" for="menu_order">菜单排序:</label>
					  <input id="menu_order" type="text" name="menuOrder" value="${model.menuOrder}"  class="text required"  >
				  </div>
				  <div class="form-group">
				      <label class="col-lg-2 control-label" for="table-isNull">是否桌面显示</label>
					  <div class="col-lg-3">
						  <select id="table-isNull" name="desktopIcon"  class="form-control">
						        <option ${model.desktopIcon == "2" ? 'selected' : ''}  value="2">否</option>
							    <option ${model.desktopIcon == "1" ? 'selected' : ''}  value="1">是</option>
						   </select>
					  </div>
				  </div>
				  <div class="form-group">
					  <label class="col-lg-2 control-label" for="menu_iconUrl">显示图标:</label>
					  <input id="menu_iconUrl" type="text" name="iconUrl" value="${model.iconUrl}"  class="text required"  >
				  </div>
				  <div class="control-group">
				    <div class="controls">
				      <button id="submitButton" class=" btn btn-default a-submit"><spring:message code='core.input.save' text='保存'/></button>
					  &nbsp;
				      <button type="button" onclick="history.back();" class="btn btn-default"><spring:message code='core.input.back' text='返回'/></button>
				    </div>
				  </div>
				</form>
        </div>
    </div>
    
	<!-- end of main -->
  </body>
</html>