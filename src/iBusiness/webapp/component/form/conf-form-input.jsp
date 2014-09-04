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
	<div class="panel panel-default span10"> 
        <div class="panel-heading"><h6 class="title">编辑表单</h6></div>
        <div class="panel-body">
        
        <form id="formForm" method="post" action="conf-form-save.do" class="form-horizontal">
			  <c:if test="${model != null}">
			  	<input id="conf-form_id" type="hidden" name="id" value="${model.id}">
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
	<!-- end of main -->
	</div>

  </body>

</html>
