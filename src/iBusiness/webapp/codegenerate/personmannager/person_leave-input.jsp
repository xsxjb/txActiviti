<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>员工离职编辑</title>
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
		});
    </script>
    <div class="col-lg-1"></div>
    <!-- start of main -->
    <div class="panel panel-default col-lg-12"> 
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">员工离职编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="person_leave-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-name">人事档案ID(姓名):</label>
                          <div class="col-lg-3">   <input id="code-name" type="text" name="name" value="${model.name}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-leavesort">离退类别:</label>
                          <div class="col-lg-3">    <select id="code-leavesort" name="leavesort" class="form-control required" >          <option value="" >请选择</option>        <c:forEach items="${leavesortItems}" var="item">          <option value="${item.key}" ${item.key==model.leavesort? 'selected':''} >${item.value}</option>        </c:forEach>    </select></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-leavestate">离职状态:</label>
                          <div class="col-lg-3">    <select id="code-leavestate" name="leavestate" class="form-control required" >          <option value="" >请选择</option>        <c:forEach items="${leavestateItems}" var="item">          <option value="${item.key}" ${item.key==model.leavestate? 'selected':''} >${item.value}</option>        </c:forEach>    </select></div>
                          
                          <label class="col-lg-2 control-label" for="code-leavesection">离退部门:</label>
                          <div class="col-lg-3">   <input id="code-leavesection" type="text" name="leavesection" value="${model.leavesection}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-leavejob">离退职位:</label>
                          <div class="col-lg-3">   <input id="code-leavejob" type="text" name="leavejob" value="${model.leavejob}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-leavedate">离退时间:</label>
							<div class="col-lg-3">
								<div class="input-append datepicker date">
									<span class="add-on"> 
									<input id="code-leavedate" type="text" name="leavedate" placeholder="请点击选择" value="${model.leavedate}" class="form-control required" readonly>
									</span>
								</div>
							</div>
						</div>
                        <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-stopdate">停薪时间:</label>
                          <div class="col-lg-3">  <div class="input-append datepicker date">  <span class="add-on">    <input id="code-stopdate" type="text" name="stopdate" value="${model.stopdate}" class="text required" readonly >  </span>  </div></div>
                        </div>
                        <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-remark">离职说明:</label>
                          <div class="col-lg-6">    <textarea class="form-control required" id="code-remark" name="remark" rows="1" >${model.remark}</textarea></div>
                        </div>
                  
                  <div class="form-group">
	                  <div class="col-lg-10 col-lg-offset-2">
	                      <button id="submitButton" class="btn btn-primary btn-sm a-submit"><span class="glyphicon glyphicon-floppy-save"></span>保存</button>
	                      <button type="button" onclick="location.href='person_leave-list.do'" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-log-out"></span> 关闭</button>
	                  </div>
                  </div>
                </form>
        </div>
    </div>
    <!-- end of main -->
  </body>
</html>
