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
                <form id="cgForm" method="post" action="supplier-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-information">填表人:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-information" type="text" name="information" value="${model.information}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-suppliernumber">供应商编号:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-suppliernumber" type="text" name="suppliernumber" value="${model.suppliernumber}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-category">类别:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-category" type="text" name="category" value="${model.category}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-unitname">企业名称:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-unitname" type="text" name="unitname" value="${model.unitname}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-useraddress">企业地址:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-useraddress" type="text" name="useraddress" value="${model.useraddress}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-character">企业性质:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-character" type="text" name="character" value="${model.character}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-registered">注册资本:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-registered" type="text" name="registered" value="${model.registered}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-enrolltime">注册时间:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-enrolltime" type="text" name="enrolltime" value="${model.enrolltime}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-url">网址:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-url" type="text" name="url" value="${model.url}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-companyphone">公司电话:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-companyphone" type="text" name="companyphone" value="${model.companyphone}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-companyfax">公司传真:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-companyfax" type="text" name="companyfax" value="${model.companyfax}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-product">供应产品:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-product" type="text" name="product" value="${model.product}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-userperson">企业负责人:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-userperson" type="text" name="userperson" value="${model.userperson}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-userphone">负责人电话:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-userphone" type="text" name="userphone" value="${model.userphone}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-usermobilephone">负责人手机:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-usermobilephone" type="text" name="usermobilephone" value="${model.usermobilephone}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-userfax">负责人传真:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-userfax" type="text" name="userfax" value="${model.userfax}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-businesscontacts">业务联系人:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-businesscontacts" type="text" name="businesscontacts" value="${model.businesscontacts}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-contacttelephone">联系人电话:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-contacttelephone" type="text" name="contacttelephone" value="${model.contacttelephone}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-contactmobilephone">联系人手机:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-contactmobilephone" type="text" name="contactmobilephone" value="${model.contactmobilephone}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-contactfax">联系人传真:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-contactfax" type="text" name="contactfax" value="${model.contactfax}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-financialcontacts">财务联系人:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-financialcontacts" type="text" name="financialcontacts" value="${model.financialcontacts}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-financialcall">财务电话:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-financialcall" type="text" name="financialcall" value="${model.financialcall}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-financialphone">财务手机:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-financialphone" type="text" name="financialphone" value="${model.financialphone}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-financialfax">财务传真:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-financialfax" type="text" name="financialfax" value="${model.financialfax}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-remittancename">汇款单位名称:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-remittancename" type="text" name="remittancename" value="${model.remittancename}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-beneficiary">开户行:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-beneficiary" type="text" name="beneficiary" value="${model.beneficiary}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-taxno">税号:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-taxno" type="text" name="taxno" value="${model.taxno}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-accountno">帐号:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-accountno" type="text" name="accountno" value="${model.accountno}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-yourcompany">收件公司:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-yourcompany" type="text" name="yourcompany" value="${model.yourcompany}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-youraddress">收件地址:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-youraddress" type="text" name="youraddress" value="${model.youraddress}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-yourname">YOURNAME:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-yourname" type="text" name="yourname" value="${model.yourname}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-yourphone">联系电话:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-yourphone" type="text" name="yourphone" value="${model.yourphone}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-telephone">固定电话:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-telephone" type="text" name="telephone" value="${model.telephone}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-code">邮编:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-code" type="text" name="code" value="${model.code}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-estinationcity">目的地城市:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-estinationcity" type="text" name="estinationcity" value="${model.estinationcity}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-updatas">上传资料:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-updatas" type="text" name="updatas" value="${model.updatas}" class="text required" >
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
