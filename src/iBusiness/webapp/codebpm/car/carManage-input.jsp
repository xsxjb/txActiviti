<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>编辑</title>
    <%@include file="/common/center.jsp"%>
  </head>
  <body>
    <%@include file="/header/header-portal.jsp"%>
    <div class="row">
	<div class="span2"></div>
	<!-- start of main -->
	<div class="panel panel-default span10"> 
        <div class="panel-heading"><h4 class="panel-title">编辑</h4></div>
        <div class="panel-body">
		<div class="content content-inner">
				<form id="userForm" method="post" action="carManage-save.do?operationMode=STORE" class="form-horizontal">
				  <input id="user-base_userRepoId" type="hidden" name="userRepoId" value="1">
				  <c:if test="${model != null}">
				  <input id="code_id" type="hidden" name="id" value="${model.id}">
				  </c:if>
				  
					  <div class="control-group">
					    <label class="control-label" for="code-name">姓名</label>
						<div class="controls">
						  <input id="code-name" type="text" name="name" value="${model.name}"  class="text required" >
					    </div>
					  </div>
					  <div class="control-group">
					    <label class="control-label" for="code-remark">备注</label>
						<div class="controls">
						  <input id="code-remark" type="text" name="remark" value="${model.remark}"  class="text required" >
					    </div>
					  </div>
				  
				  <div class="control-group">
				    <div class="controls">
				      <button id="submitButton" class="btn a-submit"><spring:message code='core.input.save' text='保存'/></button>
				      <button type="button" onclick="history.back();" class="btn a-cancel"><spring:message code='core.input.back' text='返回'/></button>
				    </div>
				  </div>
				</form>
		</div>
        </div>
    </div>
	<!-- end of main -->
	</div>
  </body>
</html>
