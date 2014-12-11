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
	<div class="span2"></div>
	<!-- start of main -->
    <div class="panel panel-default col-md-10">
        <div class="panel-heading"><h4 class="panel-title">编辑子表</h4></div>
        <div class="panel-body">
			<div class="content content-inner">
					<form id="subForm" method="post" action="material_out_s-save.do?parentid=${parentid}&flowId=${flowId}" class="form-horizontal">
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
                              <label class="control-label col-lg-2" for="code-materialmodel">原料规格型号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.materialmodel.fcEdit=='1'}">    <input id="code-materialmodel" type="text" name="materialmodel" value="${model.materialmodel}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.materialmodel.fcEdit!='1'}">    <label>${model.materialmodel}</label>    <input type="hidden" name="materialmodel" value="${model.materialmodel}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-materialunit">单位:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.materialunit.fcEdit=='1'}">    <input id="code-materialunit" type="text" name="materialunit" value="${model.materialunit}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.materialunit.fcEdit!='1'}">    <label>${model.materialunit}</label>    <input type="hidden" name="materialunit" value="${model.materialunit}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-materialnum">数量:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.materialnum.fcEdit=='1'}">    <input id="code-materialnum" type="text" name="materialnum" value="${model.materialnum}" class="text number required" >  </c:if>  <c:if test="${nodeColumsMap.materialnum.fcEdit!='1'}">    <label>${model.materialnum}</label>    <input type="hidden" name="materialnum" value="${model.materialnum}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-manufacturename">制造商:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.manufacturename.fcEdit=='1'}">    <input id="code-manufacturename" type="text" name="manufacturename" value="${model.manufacturename}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.manufacturename.fcEdit!='1'}">    <label>${model.manufacturename}</label>    <input type="hidden" name="manufacturename" value="${model.manufacturename}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-remark">备注:</label>
                              <!-- 编辑类型     多行 --><div class="col-lg-6">  <c:if test="${nodeColumsMap.remark.fcEdit=='1'}">    <textarea class="form-control" id="code-remark" name="remark" rows="1" >${model.remark}</textarea>  </c:if>  <c:if test="${nodeColumsMap.remark.fcEdit!='1'}">    <label>${model.remark}</label>    <input type="hidden" name="remark" value="${model.remark}">  </c:if></div>
                              
                            </div>
	                          
					  
					  <div class="form-group">
					    <div class="col-lg-10 col-lg-offset-2">
					      <button id="submitButton" class="btn btn-default btn-sm a-submit"><spring:message code='core.input.save' text='保存'/></button>
					      <button type="button" onclick="history.back();" class="btn btn-default btn-sm a-cancel"><spring:message code='core.input.back' text='返回'/></button>
					    </div>
					  </div>
					</form>
			</div>
		
      </div>
    </div>
	<!-- end of main -->
  </body>
</html>
