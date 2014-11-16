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
    <%@include file="/ibusiness/header/header-portal.jsp"%>
    <script type="text/javascript">
		$(function() {
		    $("#cgForm").validate({
		        submitHandler: function(form) {
					bootbox.animate(false);
					var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
		            form.submit();
		        },
		        errorClass: 'validate-error'
		    });
		})
    </script>
    <div class="span2"></div>
    <!-- start of main -->
    <div class="panel panel-default span10"> 
        <div class="panel-heading"><h4 class="panel-title">编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="${entityName?uncap_first}-save.do" class="form-horizontal">
                  <c:if test="${'$' + '{model != null}'}">
                      <input id="code_id" type="hidden" name="id" value="${'$' + '{model.id}'}">
                  </c:if>
                  
                  <#list columns as po>
                      <#if po.fcDisplay="1">
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-${po.fieldName}">${po.filedComment}:</label>
                              <!-- 是否可编辑 -->
                              <#if "1"=po.fcEdit>
                                      ${po.jspTagInfo}
                              <#else>
                                  <label>${'$' + '{model.${po.fieldName}}'}</label>
                                  <input id="code-${po.fieldName}" type="hidden" name="${po.fieldName}" value="${'$' + '{model.${po.fieldName}}'}"  >
                              </#if>
                          </div>
                        </#if>
                  </#list>
                  
                  <div class="form-group">
                      <button id="submitButton" class="btn btn-default a-submit"><spring:message code='core.input.save' text='保存'/></button>
                      <button type="button" onclick="history.back();" class="btn btn-default a-cancel"><spring:message code='core.input.back' text='返回'/></button>
                  </div>
                </form>
        </div>
    </div>
    <!-- end of main -->
  </body>
</html>
