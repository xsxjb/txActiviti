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
                                  <#if "2"=po.fcType> 
                                      <!-- 编辑类型     多行 -->
                                      <div class="col-lg-6">
                                          <textarea class="form-control" id="code-${po.fieldName}" name="${po.fieldName}" rows="1">${'$' + '{model.${po.fieldName}}'}</textarea>
                                      </div>
                                  </#if>
                                  <#if "6"=po.fcType>
                                       <!-- 编辑类型     下拉  -->
                                      <div class="col-lg-3">
										  <select id="code-${po.fieldName}" name="${po.fieldName}" class="form-control">
										        <option value="" >请选择</option>
											  <c:forEach items="${'$' + '{${po.fieldName}Items}'}" var="item">
											    <option value="${'$' + '{item.key}'}"  >${'$' + '{item.value}'}</option>
											  </c:forEach>
										  </select>
								      </div>
                                  </#if>
                                  <#if "1"=po.fcType>
                                      <!-- 编辑类型      单行 -->
                                      <input id="code-${po.fieldName}" type="text" name="${po.fieldName}" value="${'$' + '{model.${po.fieldName}}'}"  class="text required" >
                                  </#if>
                              <#else>
                                  <label>${'$' + '{model.${po.fieldName}}'}</label>
                                  <input id="code-${po.fieldName}" type="hidden" name="${po.fieldName}" value="${'$' + '{model.${po.fieldName}}'}"  >
                              </#if>
                          </div>
                        </#if>
                  </#list>
                  
                  <div class="form-group">
                      <button id="submitButton" class="btn a-submit"><spring:message code='core.input.save' text='保存'/></button>
                      <button type="button" onclick="history.back();" class="btn a-cancel"><spring:message code='core.input.back' text='返回'/></button>
                  </div>
                </form>
        </div>
    </div>
    <!-- end of main -->
  </body>
</html>
