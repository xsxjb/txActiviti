<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>人员就职表编辑</title>
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
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">人员就职表编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="person_job_info-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-name">人事档案ID(姓名):</label>
                          <div class="col-lg-3">   <input id="code-name" type="text" name="name" value="${model.name}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-department">所属部门:</label>
                          <div class="col-lg-3">   <input id="code-department" type="text" name="department" value="${model.department}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-post">职务:</label>
                          <div class="col-lg-3">   <input id="code-post" type="text" name="post" value="${model.post}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-posttitle">职称:</label>
                          <div class="col-lg-3">   <input id="code-posttitle" type="text" name="posttitle" value="${model.posttitle}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-obtaindate">取得职称时间:</label>
                          <div class="col-lg-3">  <div class="input-append datepicker date">  <span class="add-on">    <input id="code-obtaindate" type="text" name="obtaindate" value="${model.obtaindate}" class="text required" readonly >  </span>  </div></div>
                          
                          <label class="col-lg-2 control-label" for="code-identity">身份:</label>
                          <div class="col-lg-3">   <input id="code-identity" type="text" name="identity" value="${model.identity}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-adminlevel">行政级别:</label>
                          <div class="col-lg-3">    <select id="code-adminlevel" name="adminlevel" class="form-control required" >          <option value="" >请选择</option>        <c:forEach items="${adminlevelItems}" var="item">          <option value="${item.key}" ${item.key==model.adminlevel? 'selected':''} >${item.value}</option>        </c:forEach>    </select></div>
                          
                          <label class="col-lg-2 control-label" for="code-salarystandard">工资标准:</label>
                          <div class="col-lg-3">  <input id="code-salarystandard" type="text" name="salarystandard" value="${model.salarystandard}" class="text number required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-enterdate">就职时间:</label>
                          <div class="col-lg-3">  <div class="input-append datepicker date">  <span class="add-on">    <input id="code-enterdate" type="text" name="enterdate" value="${model.enterdate}" class="text required" readonly >  </span>  </div></div>
                          
                          <label class="col-lg-2 control-label" for="code-remark">备注:</label>
                          <div class="col-lg-3">   <input id="code-remark" type="text" name="remark" value="${model.remark}" class="text required" ></div>
                          
                            </div>
                  
                  <div class="form-group">
	                  <div class="col-lg-10 col-lg-offset-2">
	                      <button id="submitButton" class="btn btn-primary btn-sm a-submit"><span class="glyphicon glyphicon-floppy-save"></span>保存</button>
	                      <button type="button" onclick="location.href='person_job_info-list.do'" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-log-out"></span> 关闭</button>
	                  </div>
                  </div>
                </form>
        </div>
    </div>
    <!-- end of main -->
  </body>
</html>
