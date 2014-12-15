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
                <form id="cgForm" method="post" action="production_plan-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-projectno">项目编号:</label>
                          <div class="col-lg-3">   <input id="code-projectno" type="text" name="projectno" value="${model.projectno}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-projectname">项目名称:</label>
                          <div class="col-lg-3">   <input id="code-projectname" type="text" name="projectname" value="${model.projectname}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-projecttype">项目类型:</label>
                          <div class="col-lg-3">   <input id="code-projecttype" type="text" name="projecttype" value="${model.projecttype}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-customername">客户名称:</label>
                          <div class="col-lg-3">   <input id="code-customername" type="text" name="customername" value="${model.customername}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-productmanage">项目负责人:</label>
                          <div class="col-lg-3">   <input id="code-productmanage" type="text" name="productmanage" value="${model.productmanage}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-batchno">批次号:</label>
                          <div class="col-lg-3">   <input id="code-batchno" type="text" name="batchno" value="${model.batchno}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-productiontype">生产类型:</label>
                          <div class="col-lg-3">   <input id="code-productiontype" type="text" name="productiontype" value="${model.productiontype}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-productionmode">生成方式:</label>
                          <div class="col-lg-3">   <input id="code-productionmode" type="text" name="productionmode" value="${model.productionmode}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-productionaddress">生成场地:</label>
                          <div class="col-lg-3">   <input id="code-productionaddress" type="text" name="productionaddress" value="${model.productionaddress}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-producttype">产品类型:</label>
                          <div class="col-lg-3">   <input id="code-producttype" type="text" name="producttype" value="${model.producttype}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-productflowid">产品件号:</label>
                          <div class="col-lg-3">   <input id="code-productflowid" type="text" name="productflowid" value="${model.productflowid}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-productno">产品编号:</label>
                          <div class="col-lg-3">   <input id="code-productno" type="text" name="productno" value="${model.productno}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-productname">产品名:</label>
                          <div class="col-lg-3">   <input id="code-productname" type="text" name="productname" value="${model.productname}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-productmodel">规格型号:</label>
                          <div class="col-lg-3">   <input id="code-productmodel" type="text" name="productmodel" value="${model.productmodel}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-workingday">工作日:</label>
                          <div class="col-lg-3">   <input id="code-workingday" type="text" name="workingday" value="${model.workingday}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-starttime">总开始时间:</label>
                          <div class="col-lg-3">   <input id="code-starttime" type="text" name="starttime" value="${model.starttime}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-endtime">总结束时间:</label>
                          <div class="col-lg-3">   <input id="code-endtime" type="text" name="endtime" value="${model.endtime}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-buystarttime">采购开始时间:</label>
                          <div class="col-lg-3">   <input id="code-buystarttime" type="text" name="buystarttime" value="${model.buystarttime}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-buyendtime">采购结束时间:</label>
                          <div class="col-lg-3">   <input id="code-buyendtime" type="text" name="buyendtime" value="${model.buyendtime}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-prodstarttime">生产开始时间:</label>
                          <div class="col-lg-3">   <input id="code-prodstarttime" type="text" name="prodstarttime" value="${model.prodstarttime}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-prodendtime">生产结束时间:</label>
                          <div class="col-lg-3">   <input id="code-prodendtime" type="text" name="prodendtime" value="${model.prodendtime}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-prodoutstarttime">生产外协开始时间:</label>
                          <div class="col-lg-3">   <input id="code-prodoutstarttime" type="text" name="prodoutstarttime" value="${model.prodoutstarttime}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-prodoutendtime">生产外协结束时间:</label>
                          <div class="col-lg-3">   <input id="code-prodoutendtime" type="text" name="prodoutendtime" value="${model.prodoutendtime}" class="text " ></div>
                          
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
