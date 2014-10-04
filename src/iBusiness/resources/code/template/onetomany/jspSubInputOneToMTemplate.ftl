<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>编辑子表</title>
    <%@include file="/common/center.jsp"%>
  </head>
  <body>
    <%@include file="/header/header-portal.jsp"%>
	<div class="span2"></div>
	<!-- start of main -->
    <div class="panel panel-default col-md-10">
        <div class="panel-heading"><h4 class="panel-title">编辑子表</h4></div>
        <div class="panel-body">
			<div class="content content-inner">
					<form id="userForm" method="post" action="${entityName?uncap_first}-save.do?parentid=${'$' + '{parentid}'}&flowId=${'$' + '{flowId}'}" class="form-horizontal">
					  <c:if test="${'$' + '{model != null}'}">
					      <input id="code_id" type="hidden" name="id" value="${'$' + '{model.id}'}">
					  </c:if>
					   <#list columns as po>
						  <div class="form-group">
						    <label class="control-label" for="code-${po.fieldName}">${po.filedComment}</label>
							<div class="controls">
							  <input id="code-${po.fieldName}" type="text" name=${po.fieldName} value="${'$' + '{model.${po.fieldName}}'}"  class="text required"  >
						    </div>
						  </div>
					  </#list>
					  
					  <div class="form-group">
					    <div class="controls">
					      <button id="submitButton" class="btn btn-default btn-sm a-submit"><spring:message code='core.input.save' text='保存'/></button>
					      <button type="button" onclick="history.back();" class="btn btn-default btn-sm a-cancel"><spring:message code='core.input.back' text='返回'/></button>
					    </div>
					  </div>
					</form>
			</div>
		
      </div>
    </div>
	<!-- end of main -->
  </body>
</html>
