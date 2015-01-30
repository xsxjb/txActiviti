<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>作废产品原料清单编辑</title>
    <%@include file="/common/center.jsp"%>
  </head>
  <body>
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
    <div class="panel panel-default col-lg-12"> 
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">作废产品原料清单编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="material_waste-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-materialno">原料编号:</label>
                          <div class="col-lg-3">   <input id="code-materialno" type="text" name="materialno" value="${model.materialno}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-materialname">原料名称:</label>
                          <div class="col-lg-3">   <input id="code-materialname" type="text" name="materialname" value="${model.materialname}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-model">规格型号:</label>
                          <div class="col-lg-3">   <input id="code-model" type="text" name="model" value="${model.model}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-materialnum">数量:</label>
                          <div class="col-lg-3">   <input id="code-materialnum" type="text" name="materialnum" value="${model.materialnum}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-currentstatus">目前状态:</label>
                          <div class="col-lg-3">   <input id="code-currentstatus" type="text" name="currentstatus" value="${model.currentstatus}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-processingresults">处理结果:</label>
                          <div class="col-lg-3">   <input id="code-processingresults" type="text" name="processingresults" value="${model.processingresults}" class="text " ></div>
                          
                            </div>
                  
                  <div class="form-group">
	                  <div class="col-lg-10 col-lg-offset-2">
	                      <button id="submitButton" class="btn btn-primary btn-sm a-submit"><span class="glyphicon glyphicon-floppy-save"></span>保存</button>
	                      <button type="button" onclick="location.href='material_waste-list.do'" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-log-out"></span> 关闭</button>
	                  </div>
                  </div>
                </form>
        </div>
    </div>
    <!-- end of main -->
  </body>
</html>
