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
		            if (typeof(bootbox) != 'undefined') {
					    bootbox.animate(false);
					    var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
					}
					form.submit();
		        },
		        errorClass: 'validate-error'
		    });
		})
    </script>
    <div class="col-lg-1"></div>
    <!-- start of main -->
    <div class="panel panel-default col-lg-10"> 
        <div class="panel-heading"><h4 class="panel-title">编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="warehouse-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-warehouseno">仓库编号:</label>
                                <!-- 是否可编辑 -->
                                      <div class="col-lg-3">   <input id="code-warehouseno" type="text" name="warehouseno" value="${model.warehouseno}" class="text required" ></div>
                              <label class="col-lg-2 control-label" for="code-warehousename">仓库名称:</label>
                                <!-- 是否可编辑 -->
                                      <div class="col-lg-3">   <input id="code-warehousename" type="text" name="warehousename" value="${model.warehousename}" class="text required" ></div>
                            </div>
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-warehouselocation">仓库位置:</label>
                                <!-- 是否可编辑 -->
                                      <div class="col-lg-6">    <textarea class="form-control" id="code-warehouselocation" name="warehouselocation" rows="1" >${model.warehouselocation}</textarea></div>
                            </div>
                  
                  <div class="form-group">
	                  <div class="col-lg-10 col-lg-offset-2">
	                      <button id="submitButton" class="btn btn-default a-submit"><spring:message code='core.input.save' text='保存'/></button>
	                      <button type="button" onclick="history.back();" class="btn btn-default a-cancel"><spring:message code='core.input.back' text='返回'/></button>
	                  </div>
                  </div>
                </form>
        </div>
    </div>
    <!-- end of main -->
  </body>
</html>
