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
					<form id="subForm" method="post" action="material_buy_plan-save.do?parentid=${parentid}&flowId=${flowId}" class="form-horizontal">
					  <c:if test="${model != null}">
					      <input id="code_id" type="hidden" name="id" value="${model.id}">
					  </c:if>
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-materialno">原料编号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.materialno.fcEdit=='1'}">    <input id="code-materialno" type="text" name="materialno" value="${model.materialno}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.materialno.fcEdit!='1'}">    <label>${model.materialno}</label>    <input type="hidden" name="materialno" value="${model.materialno}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-materialname">原料名称:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.materialname.fcEdit=='1'}">    <input id="code-materialname" type="text" name="materialname" value="${model.materialname}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.materialname.fcEdit!='1'}">    <label>${model.materialname}</label>    <input type="hidden" name="materialname" value="${model.materialname}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-model">规格型号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.model.fcEdit=='1'}">    <input id="code-model" type="text" name="model" value="${model.model}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.model.fcEdit!='1'}">    <label>${model.model}</label>    <input type="hidden" name="model" value="${model.model}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-materialnum">数量:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.materialnum.fcEdit=='1'}">    <input id="code-materialnum" type="text" name="materialnum" value="${model.materialnum}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.materialnum.fcEdit!='1'}">    <label>${model.materialnum}</label>    <input type="hidden" name="materialnum" value="${model.materialnum}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-deliverydate">交货日期:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.deliverydate.fcEdit=='1'}">    <input id="code-deliverydate" type="text" name="deliverydate" value="${model.deliverydate}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.deliverydate.fcEdit!='1'}">    <label>${model.deliverydate}</label>    <input type="hidden" name="deliverydate" value="${model.deliverydate}">  </c:if></div>
                              
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
