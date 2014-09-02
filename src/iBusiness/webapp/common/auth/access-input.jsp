<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "auth");%>
<%pageContext.setAttribute("currentMenu", "auth");%>
<!doctype html>
<html>

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="auth.access.input.title" text="访问权限"/></title>
    <%@include file="/common/center.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#accessForm").validate({
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
    <%@include file="/header/header-portal.jsp"%>

	<div class="span2"></div>

	<!-- start of main -->
	<div class="panel panel-default span10">
        <div class="panel-heading"><h5 class="title">访问权限</h5></div>
        <div class="panel-body">
              <form id="accessForm" method="post" action="access-save.do" class="form-horizontal">
				  <c:if test="${model != null}">
				      <input id="access_id" type="hidden" name="id" value="${model.id}">
				  </c:if>
				  <p>
					  <label class="control-label" for="access_type"><spring:message code='auth.access.input.type' text='类型'/>:</label>
					  <select id="access_type" name="type">
					    <option value="URL" ${model.type == 'URL' ? selected : ''}>URL</option>
					    <option value="METHOD" ${model.type == 'METHOD' ? selected : ''}>METHOD</option>
					  </select>
				  </p>
				  <p>
					  <label class="control-label" for="access_value"><spring:message code='auth.access.input.value' text='资源'/>:</label>
				      <input id="access_value" type="text" name="value" value="${model.value}"  class="text required"  maxlength="200">
				  </p>
				  <p>
					  <label class="control-label" for="perm_code">权限标签:</label>
				      <input id="perm_code" type="text" name="permCode" value="${model.perm.code}" class="text">
				  </p>
				  <p>
					  <label class="control-label" for="access_perm"><spring:message code='auth.access.input.perm' text='权限名称'/>:</label>
					  <input id="access_perm" type="text" name="permName" value="${model.perm.name}"  class="text required"  maxlength="200">
					  <!-- 
					  <select id="" name="">
					    <c:forEach items="${perms}" var="item">
					    <option value="${item.id}" ${model.perm.id==item.id ? 'selected' : ''}>${item.name}</option>
						</c:forEach>
					  </select>
					   -->
				  </p>
				  <p>
					  <label class="control-label" for="access_priority"><spring:message code='auth.access.input.priority' text='排序'/>:</label>
				      <input id="access_priority" type="text" name="priority" value="${model.priority}"  class="text required number"  maxlength="10">
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
