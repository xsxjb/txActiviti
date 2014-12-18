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
					<form id="subForm" method="post" action="production_plan_s-save.do?parentid=${parentid}&flowId=${flowId}" class="form-horizontal">
					  <c:if test="${model != null}">
					      <input id="code_id" type="hidden" name="id" value="${model.id}">
					  </c:if>
                             <div class="form-group">
                              <label class="control-label col-lg-2" for="code-projectno">项目编号:</label>
                              <div class="col-lg-3">   <input id="code-projectno" type="text" name="projectno" value="${model.projectno}" class="text " ></div>
	                        
                              <label class="control-label col-lg-2" for="code-projectname">项目名称:</label>
                              <div class="col-lg-3">   <input id="code-projectname" type="text" name="projectname" value="${model.projectname}" class="text " ></div>
                            </div>
	                        
                             <div class="form-group">
                              <label class="control-label col-lg-2" for="code-batchno">批次号:</label>
                              <div class="col-lg-3">   <input id="code-batchno" type="text" name="batchno" value="${model.batchno}" class="text " ></div>
	                        
                              <label class="control-label col-lg-2" for="code-productiontype">生产类型:</label>
                              <div class="col-lg-3">   <input id="code-productiontype" type="text" name="productiontype" value="${model.productiontype}" class="text " ></div>
                            </div>
	                        
                             <div class="form-group">
                              <label class="control-label col-lg-2" for="code-productionmode">生产方式:</label>
                              <div class="col-lg-3">   <input id="code-productionmode" type="text" name="productionmode" value="${model.productionmode}" class="text " ></div>
	                        
                              <label class="control-label col-lg-2" for="code-productionaddress">生产场地:</label>
                              <div class="col-lg-3">   <input id="code-productionaddress" type="text" name="productionaddress" value="${model.productionaddress}" class="text " ></div>
                            </div>
	                        
                             <div class="form-group">
                              <label class="control-label col-lg-2" for="code-producttype">产品类型:</label>
                              <div class="col-lg-3">   <input id="code-producttype" type="text" name="producttype" value="${model.producttype}" class="text " ></div>
	                        
                              <label class="control-label col-lg-2" for="code-productflowid">产品件号:</label>
                              <div class="col-lg-3">   <input id="code-productflowid" type="text" name="productflowid" value="${model.productflowid}" class="text " ></div>
                            </div>
	                        
                             <div class="form-group">
                              <label class="control-label col-lg-2" for="code-productno">产品编号:</label>
                              <div class="col-lg-3">   <input id="code-productno" type="text" name="productno" value="${model.productno}" class="text " ></div>
	                        
                              <label class="control-label col-lg-2" for="code-productname">产品名:</label>
                              <div class="col-lg-3">   <input id="code-productname" type="text" name="productname" value="${model.productname}" class="text " ></div>
                            </div>
	                        
                             <div class="form-group">
                              <label class="control-label col-lg-2" for="code-productmodel">规格型号:</label>
                              <div class="col-lg-3">   <input id="code-productmodel" type="text" name="productmodel" value="${model.productmodel}" class="text " ></div>
	                        
                              <label class="control-label col-lg-2" for="code-productnum">数量:</label>
                              <div class="col-lg-3">   <input id="code-productnum" type="text" name="productnum" value="${model.productnum}" class="text " ></div>
                            </div>
	                        
                             <div class="form-group">
                              <label class="control-label col-lg-2" for="code-workingday">工作日:</label>
                              <div class="col-lg-3">   <input id="code-workingday" type="text" name="workingday" value="${model.workingday}" class="text " ></div>
	                        
                              <label class="control-label col-lg-2" for="code-starttime">计划开始时间:</label>
                              <div class="col-lg-3">  <div class="input-append datepicker date">  <span class="add-on">    <input id="code-starttime" type="text" name="starttime" value="${model.starttime}" class="text required" readonly >  </span>  </div></div>
                            </div>
	                        
                             <div class="form-group">
                              <label class="control-label col-lg-2" for="code-endtime">计划结束时间:</label>
                              <div class="col-lg-3">  <div class="input-append datepicker date">  <span class="add-on">    <input id="code-endtime" type="text" name="endtime" value="${model.endtime}" class="text required" readonly >  </span>  </div></div>
                            </div>
	                        
					  
					  <div class="form-group">
					    <div class="controls">
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
