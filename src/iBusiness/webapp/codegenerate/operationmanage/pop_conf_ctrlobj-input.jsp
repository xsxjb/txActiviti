<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>弹出页面组件配置页面编辑</title>
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
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">弹出页面组件配置页面编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="pop_conf_ctrlobj-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-objname">控件名:</label>
                          <div class="col-lg-3">   <input id="code-objname" type="text" name="objname" value="${model.objname}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-objtitle">控件标题:</label>
                          <div class="col-lg-3">   <input id="code-objtitle" type="text" name="objtitle" value="${model.objtitle}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-objtype">控件类型:</label>
                          <div class="col-lg-3">   <input id="code-objtype" type="text" name="objtype" value="${model.objtype}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-objimg">控件图片1:</label>
                          <div class="col-lg-3">   <input id="code-objimg" type="text" name="objimg" value="${model.objimg}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-objimg2">控件图片2:</label>
                          <div class="col-lg-3">   <input id="code-objimg2" type="text" name="objimg2" value="${model.objimg2}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-objimg3">控件图片3:</label>
                          <div class="col-lg-3">   <input id="code-objimg3" type="text" name="objimg3" value="${model.objimg3}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-objimg4">控件图片4:</label>
                          <div class="col-lg-3">   <input id="code-objimg4" type="text" name="objimg4" value="${model.objimg4}" class="text " ></div>
                          
                            </div>
                  
                  <div class="form-group">
	                  <div class="col-lg-10 col-lg-offset-2">
	                      <button id="submitButton" class="btn btn-primary btn-sm a-submit"><span class="glyphicon glyphicon-floppy-save"></span>保存</button>
	                      <button type="button" onclick="location.href='pop_conf_ctrlobj-list.do'" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-log-out"></span> 关闭</button>
	                  </div>
                  </div>
                </form>
        </div>
    </div>
    <!-- end of main -->
  </body>
</html>
