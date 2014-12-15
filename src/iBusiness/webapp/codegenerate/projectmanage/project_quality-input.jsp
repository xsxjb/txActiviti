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
                <form id="cgForm" method="post" action="project_quality-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-projectno">项目编号:</label>
                          <div class="col-lg-3">   <input id="code-projectno" type="text" name="projectno" value="${model.projectno}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-batchno">批次号:</label>
                          <div class="col-lg-3">   <input id="code-batchno" type="text" name="batchno" value="${model.batchno}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-producttype">产品类型:</label>
                          <div class="col-lg-3">   <input id="code-producttype" type="text" name="producttype" value="${model.producttype}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-productflowid">产品件号:</label>
                          <div class="col-lg-3">   <input id="code-productflowid" type="text" name="productflowid" value="${model.productflowid}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-productno">产品编号:</label>
                          <div class="col-lg-3">   <input id="code-productno" type="text" name="productno" value="${model.productno}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-productname">产品名:</label>
                          <div class="col-lg-3">   <input id="code-productname" type="text" name="productname" value="${model.productname}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-productmodel">规格型号:</label>
                          <div class="col-lg-3">   <input id="code-productmodel" type="text" name="productmodel" value="${model.productmodel}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-materialnum">数量:</label>
                          <div class="col-lg-3">   <input id="code-materialnum" type="text" name="materialnum" value="${model.materialnum}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-qualitydate">质检日期:</label>
                          <div class="col-lg-3">   <input id="code-qualitydate" type="text" name="qualitydate" value="${model.qualitydate}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-qualityresult">质检结果:</label>
                          <div class="col-lg-3">   <input id="code-qualityresult" type="text" name="qualityresult" value="${model.qualityresult}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-qualityuser">质检员:</label>
                          <div class="col-lg-3">   <input id="code-qualityuser" type="text" name="qualityuser" value="${model.qualityuser}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-qualityreport">质检报告:</label>
                          <div class="col-lg-3">   <input id="code-qualityreport" type="text" name="qualityreport" value="${model.qualityreport}" class="text " ></div>
                          
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
