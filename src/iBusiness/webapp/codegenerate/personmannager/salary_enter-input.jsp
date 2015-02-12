<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>工资录入编辑</title>
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
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">工资录入编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="salary_enter-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-name">人事档案ID(姓名):</label>
                          <div class="col-lg-3">   <input id="code-name" type="text" name="name" value="${model.name}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-time">年月:</label>
                          <div class="col-lg-3">  <div class="input-append datepicker date">  <span class="add-on">    <input id="code-time" type="text" name="time" value="${model.time}" class="text required" readonly >  </span>  </div></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-basicsalary">基本工资:</label>
                          <div class="col-lg-3">  <input id="code-basicsalary" type="text" name="basicsalary" value="${model.basicsalary}" class="text number required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-postsalary">岗位工资:</label>
                          <div class="col-lg-3">  <input id="code-postsalary" type="text" name="postsalary" value="${model.postsalary}" class="text number required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-yearssalary">工龄工资:</label>
                          <div class="col-lg-3">  <input id="code-yearssalary" type="text" name="yearssalary" value="${model.yearssalary}" class="text number required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-performancesalary">绩效工资:</label>
                          <div class="col-lg-3">  <input id="code-performancesalary" type="text" name="performancesalary" value="${model.performancesalary}" class="text number required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-awardsalary">奖励工资:</label>
                          <div class="col-lg-3">  <input id="code-awardsalary" type="text" name="awardsalary" value="${model.awardsalary}" class="text number required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-outworksalary">出勤工资:</label>
                          <div class="col-lg-3">  <input id="code-outworksalary" type="text" name="outworksalary" value="${model.outworksalary}" class="text number required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-countssalary">全勤工资:</label>
                          <div class="col-lg-3">  <input id="code-countssalary" type="text" name="countssalary" value="${model.countssalary}" class="text number required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-finalamounts">应发小计:</label>
                          <div class="col-lg-3">  <input id="code-finalamounts" type="text" name="finalamounts" value="${model.finalamounts}" class="text number required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-deductsalary">扣罚工资:</label>
                          <div class="col-lg-3">  <input id="code-deductsalary" type="text" name="deductsalary" value="${model.deductsalary}" class="text number required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-premium">保险费:</label>
                          <div class="col-lg-3">  <input id="code-premium" type="text" name="premium" value="${model.premium}" class="text number required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-incometax">所得税:</label>
                          <div class="col-lg-3">  <input id="code-incometax" type="text" name="incometax" value="${model.incometax}" class="text number required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-deductamounts">应扣小计:</label>
                          <div class="col-lg-3">  <input id="code-deductamounts" type="text" name="deductamounts" value="${model.deductamounts}" class="text number required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-actualsalary">实发工资:</label>
                          <div class="col-lg-3">  <input id="code-actualsalary" type="text" name="actualsalary" value="${model.actualsalary}" class="text number required" ></div>
                          
                            </div>
                  
                  <div class="form-group">
	                  <div class="col-lg-10 col-lg-offset-2">
	                      <button id="submitButton" class="btn btn-primary btn-sm a-submit"><span class="glyphicon glyphicon-floppy-save"></span>保存</button>
	                      <button type="button" onclick="location.href='salary_enter-list.do'" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-log-out"></span> 关闭</button>
	                  </div>
                  </div>
                </form>
        </div>
    </div>
    <!-- end of main -->
  </body>
</html>
