<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>人员调动表编辑</title>
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
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">人员调动表编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="person_move-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-name">人事档案ID(姓名):</label>
                          <div class="col-lg-3">   <input id="code-name" type="text" name="name" value="${model.name}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-category">移动类别:</label>
                          <div class="col-lg-3">    <select id="code-category" name="category" class="form-control required" >          <option value="" >请选择</option>        <c:forEach items="${categoryItems}" var="item">          <option value="${item.key}" ${item.key==model.category? 'selected':''} >${item.value}</option>        </c:forEach>    </select></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-beforesection">调前部门:</label>
                          <div class="col-lg-3">   <input id="code-beforesection" type="text" name="beforesection" value="${model.beforesection}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-nowsection">调后部门:</label>
                          <div class="col-lg-3">   <input id="code-nowsection" type="text" name="nowsection" value="${model.nowsection}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-beforejob">调前职务:</label>
                          <div class="col-lg-3">   <input id="code-beforejob" type="text" name="beforejob" value="${model.beforejob}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-nowjob">调后职务:</label>
                          <div class="col-lg-3">   <input id="code-nowjob" type="text" name="nowjob" value="${model.nowjob}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-oldstandard">原工资标准:</label>
                          <div class="col-lg-3">  <input id="code-oldstandard" type="text" name="oldstandard" value="${model.oldstandard}" class="text number required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-newstandard">现工资标准:</label>
                          <div class="col-lg-3">  <input id="code-newstandard" type="text" name="newstandard" value="${model.newstandard}" class="text number required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-movedate">调动日期:</label>
                          <div class="col-lg-3">  <div class="input-append datepicker date">  <span class="add-on">    <input id="code-movedate" type="text" name="movedate" value="${model.movedate}" class="text required" readonly >  </span>  </div></div>
                          
                          <label class="col-lg-2 control-label" for="code-remark">备注:</label>
                          <div class="col-lg-3">   <input id="code-remark" type="text" name="remark" value="${model.remark}" class="text required" ></div>
                          
                            </div>
                  
                  <div class="form-group">
	                  <div class="col-lg-10 col-lg-offset-2">
	                      <button id="submitButton" class="btn btn-primary btn-sm a-submit"><span class="glyphicon glyphicon-floppy-save"></span>保存</button>
	                      <button type="button" onclick="location.href='person_move-list.do'" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-log-out"></span> 关闭</button>
	                  </div>
                  </div>
                </form>
        </div>
    </div>
    <!-- end of main -->
  </body>
</html>
