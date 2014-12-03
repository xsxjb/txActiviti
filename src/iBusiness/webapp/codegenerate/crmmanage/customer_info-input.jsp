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
                <form id="cgForm" method="post" action="customer_info-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-customerno">客户编号:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-customerno" type="text" name="customerno" value="${model.customerno}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-customerstate">客户状态:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-customerstate" type="text" name="customerstate" value="${model.customerstate}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-customertype"> 客户类别:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-customertype" type="text" name="customertype" value="${model.customertype}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-customeraddress">客户地址:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-customeraddress" type="text" name="customeraddress" value="${model.customeraddress}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-phone">手机:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-phone" type="text" name="phone" value="${model.phone}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-telephone">联系电话:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-telephone" type="text" name="telephone" value="${model.telephone}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-salesmanager">负责经理:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-salesmanager" type="text" name="salesmanager" value="${model.salesmanager}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-systemsales">系统销售:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-systemsales" type="text" name="systemsales" value="${model.systemsales}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-customername">客户名称:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-customername" type="text" name="customername" value="${model.customername}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-infosource">信息来源:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-infosource" type="text" name="infosource" value="${model.infosource}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-relationshipstatus">关系状态:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-relationshipstatus" type="text" name="relationshipstatus" value="${model.relationshipstatus}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-province">省:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-province" type="text" name="province" value="${model.province}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-city">市:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-city" type="text" name="city" value="${model.city}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-customernature">企业性质:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-customernature" type="text" name="customernature" value="${model.customernature}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-superviseunit">上级主管单位:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-superviseunit" type="text" name="superviseunit" value="${model.superviseunit}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-planinfo">三年内规划描述:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-planinfo" type="text" name="planinfo" value="${model.planinfo}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-customerdemand">客户诉求:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-customerdemand" type="text" name="customerdemand" value="${model.customerdemand}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-cooperationinfo">是否以合作信息表:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-cooperationinfo" type="text" name="cooperationinfo" value="${model.cooperationinfo}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-invoicename">客户发票单位名称:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-invoicename" type="text" name="invoicename" value="${model.invoicename}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-bank">开户行:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-bank" type="text" name="bank" value="${model.bank}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-accountno">帐号:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-accountno" type="text" name="accountno" value="${model.accountno}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-taxid">税号:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-taxid" type="text" name="taxid" value="${model.taxid}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-invoiceuser">开票联系人:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-invoiceuser" type="text" name="invoiceuser" value="${model.invoiceuser}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-invoiceusertel">联系电话:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-invoiceusertel" type="text" name="invoiceusertel" value="${model.invoiceusertel}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-invoicemailunitname">发票邮寄单位名称:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-invoicemailunitname" type="text" name="invoicemailunitname" value="${model.invoicemailunitname}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-mailaddress">邮寄地址:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-mailaddress" type="text" name="mailaddress" value="${model.mailaddress}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-invoiczip">邮编:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-invoiczip" type="text" name="invoiczip" value="${model.invoiczip}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-invoicaddressee">收件人:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-invoicaddressee" type="text" name="invoicaddressee" value="${model.invoicaddressee}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-invoicphonetel">电话:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-invoicphonetel" type="text" name="invoicphonetel" value="${model.invoicphonetel}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-customeruser">首选联系人:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-customeruser" type="text" name="customeruser" value="${model.customeruser}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-userposition">职位:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-userposition" type="text" name="userposition" value="${model.userposition}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-usertelephone">固话/传真:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-usertelephone" type="text" name="usertelephone" value="${model.usertelephone}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-userphone">手机:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-userphone" type="text" name="userphone" value="${model.userphone}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-useremail">邮件:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-useremail" type="text" name="useremail" value="${model.useremail}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-userofficeaddress">办公地址:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-userofficeaddress" type="text" name="userofficeaddress" value="${model.userofficeaddress}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-userzip">邮编:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-userzip" type="text" name="userzip" value="${model.userzip}" class="text required" >
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
