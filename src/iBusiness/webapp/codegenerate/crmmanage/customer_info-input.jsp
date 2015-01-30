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
                          <label class="col-lg-2 control-label" for="code-customertype"> 客户类别:</label>
                          <div class="col-lg-3">   <input id="code-customertype" type="text" name="customertype" value="${model.customertype}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-customeraddress">客户地址:</label>
                          <div class="col-lg-3">   <input id="code-customeraddress" type="text" name="customeraddress" value="${model.customeraddress}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-phone">手机:</label>
                          <div class="col-lg-3">   <input id="code-phone" type="text" name="phone" value="${model.phone}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-telephone">联系电话:</label>
                          <div class="col-lg-3">   <input id="code-telephone" type="text" name="telephone" value="${model.telephone}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-salesmanager">负责经理:</label>
                          <div class="col-lg-3">   <input id="code-salesmanager" type="text" name="salesmanager" value="${model.salesmanager}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-systemsales">系统销售:</label>
                          <div class="col-lg-3">   <input id="code-systemsales" type="text" name="systemsales" value="${model.systemsales}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-customername">客户名称:</label>
                          <div class="col-lg-3">   <input id="code-customername" type="text" name="customername" value="${model.customername}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-infosource">信息来源:</label>
                          <div class="col-lg-3">   <input id="code-infosource" type="text" name="infosource" value="${model.infosource}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-relationshipstatus">关系状态:</label>
                          <div class="col-lg-3">   <input id="code-relationshipstatus" type="text" name="relationshipstatus" value="${model.relationshipstatus}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-province">省:</label>
                          <div class="col-lg-3">   <input id="code-province" type="text" name="province" value="${model.province}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-city">市:</label>
                          <div class="col-lg-3">   <input id="code-city" type="text" name="city" value="${model.city}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-customernature">企业性质:</label>
                          <div class="col-lg-3">   <input id="code-customernature" type="text" name="customernature" value="${model.customernature}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-superviseunit">上级主管单位:</label>
                          <div class="col-lg-3">   <input id="code-superviseunit" type="text" name="superviseunit" value="${model.superviseunit}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-planinfo">三年内规划描述:</label>
                          <div class="col-lg-3">   <input id="code-planinfo" type="text" name="planinfo" value="${model.planinfo}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-customerdemand">客户诉求:</label>
                          <div class="col-lg-3">   <input id="code-customerdemand" type="text" name="customerdemand" value="${model.customerdemand}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-cooperationinfo">是否以合作信息表:</label>
                          <div class="col-lg-3">   <input id="code-cooperationinfo" type="text" name="cooperationinfo" value="${model.cooperationinfo}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-invoicename">客户发票单位名称:</label>
                          <div class="col-lg-3">   <input id="code-invoicename" type="text" name="invoicename" value="${model.invoicename}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-bank">开户行:</label>
                          <div class="col-lg-3">   <input id="code-bank" type="text" name="bank" value="${model.bank}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-accountno">帐号:</label>
                          <div class="col-lg-3">   <input id="code-accountno" type="text" name="accountno" value="${model.accountno}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-taxid">税号:</label>
                          <div class="col-lg-3">   <input id="code-taxid" type="text" name="taxid" value="${model.taxid}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-invoiceuser">开票联系人:</label>
                          <div class="col-lg-3">   <input id="code-invoiceuser" type="text" name="invoiceuser" value="${model.invoiceuser}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-invoiceusertel">联系电话:</label>
                          <div class="col-lg-3">   <input id="code-invoiceusertel" type="text" name="invoiceusertel" value="${model.invoiceusertel}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-invoicemailunitname">发票邮寄单位名称:</label>
                          <div class="col-lg-3">   <input id="code-invoicemailunitname" type="text" name="invoicemailunitname" value="${model.invoicemailunitname}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-mailaddress">邮寄地址:</label>
                          <div class="col-lg-3">   <input id="code-mailaddress" type="text" name="mailaddress" value="${model.mailaddress}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-invoiczip">邮编:</label>
                          <div class="col-lg-3">   <input id="code-invoiczip" type="text" name="invoiczip" value="${model.invoiczip}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-invoicaddressee">收件人:</label>
                          <div class="col-lg-3">   <input id="code-invoicaddressee" type="text" name="invoicaddressee" value="${model.invoicaddressee}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-invoicphonetel">电话:</label>
                          <div class="col-lg-3">   <input id="code-invoicphonetel" type="text" name="invoicphonetel" value="${model.invoicphonetel}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-customeruser">首选联系人:</label>
                          <div class="col-lg-3">   <input id="code-customeruser" type="text" name="customeruser" value="${model.customeruser}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-userposition">职位:</label>
                          <div class="col-lg-3">   <input id="code-userposition" type="text" name="userposition" value="${model.userposition}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-usertelephone">固话/传真:</label>
                          <div class="col-lg-3">   <input id="code-usertelephone" type="text" name="usertelephone" value="${model.usertelephone}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-userphone">手机:</label>
                          <div class="col-lg-3">   <input id="code-userphone" type="text" name="userphone" value="${model.userphone}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-useremail">邮件:</label>
                          <div class="col-lg-3">   <input id="code-useremail" type="text" name="useremail" value="${model.useremail}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-userofficeaddress">办公地址:</label>
                          <div class="col-lg-3">   <input id="code-userofficeaddress" type="text" name="userofficeaddress" value="${model.userofficeaddress}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-userzip">邮编:</label>
                          <div class="col-lg-3">   <input id="code-userzip" type="text" name="userzip" value="${model.userzip}" class="text " ></div>
                          
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
