<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>考核记录编辑</title>
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
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">考核记录编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="assess_record-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-name">人事档案ID(姓名):</label>
                          <div class="col-lg-3">   <input id="code-name" type="text" name="name" value="${model.name}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-checktime">考核时间:</label>
                          <div class="col-lg-3">  <div class="input-append datepicker date">  <span class="add-on">    <input id="code-checktime" type="text" name="checktime" value="${model.checktime}" class="text required" readonly >  </span>  </div></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-job">职务:</label>
                          <div class="col-lg-3">   <input id="code-job" type="text" name="job" value="${model.job}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-checkproject">考核项目:</label>
                          <div class="col-lg-3">   <input id="code-checkproject" type="text" name="checkproject" value="${model.checkproject}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-checkrank">考核等级:</label>
                          <div class="col-lg-3">    <select id="code-checkrank" name="checkrank" class="form-control required" >          <option value="" >请选择</option>        <c:forEach items="${checkrankItems}" var="item">          <option value="${item.key}" ${item.key==model.checkrank? 'selected':''} >${item.value}</option>        </c:forEach>    </select></div>
                          
                          <label class="col-lg-2 control-label" for="code-checkscore">考核分值:</label>
                          <div class="col-lg-3">  <input id="code-checkscore" type="text" name="checkscore" value="${model.checkscore}" class="text number required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-checkassess">考核评价:</label>
                          <div class="col-lg-3">   <input id="code-checkassess" type="text" name="checkassess" value="${model.checkassess}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-checker">考核人员:</label>
                          <div class="col-lg-3">   <input id="code-checker" type="text" name="checker" value="${model.checker}" class="text required" ></div>
                          
                            </div>
                  
                  <div class="form-group">
	                  <div class="col-lg-10 col-lg-offset-2">
	                      <button id="submitButton" class="btn btn-primary btn-sm a-submit"><span class="glyphicon glyphicon-floppy-save"></span>保存</button>
	                      <button type="button" onclick="location.href='assess_record-list.do'" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-log-out"></span> 关闭</button>
	                  </div>
                  </div>
                </form>
        </div>
    </div>
    <!-- end of main -->
  </body>
</html>
