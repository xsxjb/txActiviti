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
              <form id="menuForm" method="post" action="code-generate-save.do" class="form-horizontal">
				  <c:if test="${model != null}">
				      <input type="hidden" name="formId" value="${formId}">
				      <input type="hidden" name="packageName" value="${model.packageName}">
				  </c:if>
				  <div class="form-group">
					  <label class="col-lg-2 control-label" >包名(小写):</label>
					  <label class="control-label" >${model.packageName}</label>
				  </div>
				  <div class="form-group">
					  <label class="col-lg-2 control-label" for="code_entityName">实体类名(首字母大写):</label>
				      <input id="code_entityName" type="text" name="entityName" value="${model.entityName}" class="text">
				  </div>
				  <div class="form-group">
					  <label class="col-lg-2 control-label" for="code_tableName">表名:</label>
					  <input id="code_tableName" type="text" name="tableName" value="${model.tableName}"  class="text required"  >
				  </div>
				  <div class="form-group">
					  <label class="col-lg-2 control-label" >主键生成策略:</label>
					  <label class="control-label" >${model.keyType}</label>
				  </div>
				  <div class="form-group">
					  <label class="col-lg-2 control-label" for="code_entityTitle">功能描述:</label>
					  <input id="code_entityTitle" type="text" name="entityTitle" value="${model.entityTitle}"  class="text required"  >
				  </div>
				  <div class="form-group">
					  <label class="col-lg-2 control-label" >行字段数目:</label>
					  <label class="control-label" >${model.rowNumber}</label>
				  </div>
				  <div class="form-group">
				      <div class="checkbox">
				          <label><input type="checkbox" name="selectedItem" value="checkboxController" <tags:contains items="${selectedItem}" item="checkboxController">checked</tags:contains>> Controller</label>
				          <label><input type="checkbox" name="selectedItem"  value="checkboxEntity" <tags:contains items="${selectedItem}" item="checkboxEntity">checked</tags:contains>> Entity</label>
				          <label><input type="checkbox" name="selectedItem"  value="checkboxJsp" <tags:contains items="${selectedItem}" item="checkboxJsp">checked</tags:contains>> Jsp</label>
				          <label><input type="checkbox" name="selectedItem"  value="checkboxService" <tags:contains items="${selectedItem}" item="checkboxService">checked</tags:contains>> Service</label>
				          <label><input type="checkbox" name="selectedItem"  value="checkboxServiceImp" <tags:contains items="${selectedItem}" item="checkboxServiceImp">checked</tags:contains>> ServiceImp</label>
				       </div>
				  </div>
				  
				  <div class="form-group">
					  <label class="col-lg-2 control-label" >风格:</label>
					  <label class="control-label" >${model.formStyle}</label>
				  </div>
				  <div class="control-group">
				    <div class="controls">
				      <button id="submitButton" class=" btn btn-default a-submit"><spring:message code='core.input.save' text='生成'/></button>
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
