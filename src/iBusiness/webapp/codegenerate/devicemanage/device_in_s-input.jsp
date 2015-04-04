<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>编辑子表</title>
    <%@include file="/common/center.jsp"%>
  </head>
  <body>
    <%@include file="/ibusiness/header/header-portal.jsp"%>
    <script type="text/javascript">
        // 表单验证JS
		$(function() {
		    $("#subForm").validate({
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
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">编辑子表</h4></div>
        <div class="panel-body">
			<div class="content content-inner">
					<form id="subForm" method="post" action="device_in_s-save.do?parentid=${parentid}&flowId=${flowId}" class="form-horizontal">
					  <c:if test="${model != null}">
					      <input id="code_id" type="hidden" name="id" value="${model.id}">
					  </c:if>
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-devicename">设备名称:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.devicename.fcEdit=='1'}">    <input id="code-devicename" type="text" name="devicename" value="${model.devicename}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.devicename.fcEdit!='1'}">    <label>${model.devicename}</label>    <input type="hidden" name="devicename" value="${model.devicename}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-devicemodel">设备规格型号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.devicemodel.fcEdit=='1'}">    <input id="code-devicemodel" type="text" name="devicemodel" value="${model.devicemodel}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.devicemodel.fcEdit!='1'}">    <label>${model.devicemodel}</label>    <input type="hidden" name="devicemodel" value="${model.devicemodel}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-deviceunit">单位:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.deviceunit.fcEdit=='1'}">    <input id="code-deviceunit" type="text" name="deviceunit" value="${model.deviceunit}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.deviceunit.fcEdit!='1'}">    <label>${model.deviceunit}</label>    <input type="hidden" name="deviceunit" value="${model.deviceunit}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-devicenum">数量:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.devicenum.fcEdit=='1'}">    <input id="code-devicenum" type="text" name="devicenum" value="${model.devicenum}" class="text number required" >  </c:if>  <c:if test="${nodeColumsMap.devicenum.fcEdit!='1'}">    <label>${model.devicenum}</label>    <input type="hidden" name="devicenum" value="${model.devicenum}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-amount">金额:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.amount.fcEdit=='1'}">    <input id="code-amount" type="text" name="amount" value="${model.amount}" class="text number required" >  </c:if>  <c:if test="${nodeColumsMap.amount.fcEdit!='1'}">    <label>${model.amount}</label>    <input type="hidden" name="amount" value="${model.amount}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-manufacturename">制造商:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.manufacturename.fcEdit=='1'}">    <input id="code-manufacturename" type="text" name="manufacturename" value="${model.manufacturename}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.manufacturename.fcEdit!='1'}">    <label>${model.manufacturename}</label>    <input type="hidden" name="manufacturename" value="${model.manufacturename}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-remark">备注:</label>
                              <!-- 编辑类型     多行 --><div class="col-lg-6">  <c:if test="${nodeColumsMap.remark.fcEdit=='1'}">    <textarea class="form-control" id="code-remark" name="remark" rows="1" >${model.remark}</textarea>  </c:if>  <c:if test="${nodeColumsMap.remark.fcEdit!='1'}">    <label>${model.remark}</label>    <input type="hidden" name="remark" value="${model.remark}">  </c:if></div>
                              
                            </div>
	                          
					  
					  <div class="form-group">
					    <div class="col-lg-10 col-lg-offset-2">
					      <button id="submitButton" class="btn btn-primary btn-sm a-submit"><spring:message code='core.input.save' text='保存'/></button>
					      <button type="button" onclick="history.back();" class="btn btn-primary btn-sm a-cancel"><spring:message code='core.input.back' text='返回'/></button>
					    </div>
					  </div>
					</form>
			</div>
		
      </div>
    </div>
	<!-- end of main -->
  </body>
</html>
