<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>客户信息管理编辑</title>
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
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">客户信息管理编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="customer_info-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-customerno">客户编号:</label>
                          <div class="col-lg-3">   <input id="code-customerno" type="text" name="customerno" value="${model.customerno}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-customerstate">客户状态:</label>
                          <div class="col-lg-3">   <input id="code-customerstate" type="text" name="customerstate" value="${model.customerstate}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-customeraddress">客户地址:</label>
                          <div class="col-lg-3">   <input id="code-customeraddress" type="text" name="customeraddress" value="${model.customeraddress}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-phone">手机:</label>
                          <div class="col-lg-3">   <input id="code-phone" type="text" name="phone" value="${model.phone}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-telephone">联系电话:</label>
                          <div class="col-lg-3">   <input id="code-telephone" type="text" name="telephone" value="${model.telephone}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-salesmanager">负责经理:</label>
                          <div class="col-lg-3">   <input id="code-salesmanager" type="text" name="salesmanager" value="${model.salesmanager}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-customername">客户名称:</label>
                          <div class="col-lg-3">   <input id="code-customername" type="text" name="customername" value="${model.customername}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-infosource">信息来源:</label>
                          <div class="col-lg-3">   <input id="code-infosource" type="text" name="infosource" value="${model.infosource}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-province">省:</label>
                          <div class="col-lg-3">   <input id="code-province" type="text" name="province" value="${model.province}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-city">市:</label>
                          <div class="col-lg-3">   <input id="code-city" type="text" name="city" value="${model.city}" class="text " ></div>
                          
                            </div>
                  
                  <div class="form-group">
	                  <div class="col-lg-10 col-lg-offset-2">
	                      <button id="submitButton" class="btn btn-primary btn-sm a-submit"><span class="glyphicon glyphicon-floppy-save"></span>保存</button>
	                      <button type="button" onclick="location.href='customer_info-list.do'" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-log-out"></span> 关闭</button>
	                  </div>
                  </div>
                </form>
        </div>
    </div>
    <!-- end of main -->
  </body>
</html>
