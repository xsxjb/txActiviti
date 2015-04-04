<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>设备库存管理编辑</title>
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
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">设备库存管理编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="warehouse_device-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-devicetypeno">设备分类编号:</label>
                          <div class="col-lg-3">   <input id="code-devicetypeno" type="text" name="devicetypeno" value="${model.devicetypeno}" class="text form-control input-sm "  ></div>
                          
                          <label class="col-lg-2 control-label" for="code-deviceno">设备编号:</label>
                          <div class="col-lg-3">   <input id="code-deviceno" type="text" name="deviceno" value="${model.deviceno}" class="text form-control input-sm "  ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-devicename">设备名称:</label>
                          <div class="col-lg-3">   <input id="code-devicename" type="text" name="devicename" value="${model.devicename}" class="text form-control input-sm "  ></div>
                          
                          <label class="col-lg-2 control-label" for="code-devicemodel">规格型号:</label>
                          <div class="col-lg-3">   <input id="code-devicemodel" type="text" name="devicemodel" value="${model.devicemodel}" class="text form-control input-sm "  ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-deviceprice">价格:</label>
                          <div class="col-lg-3">   <input id="code-deviceprice" type="text" name="deviceprice" value="${model.deviceprice}" class="text form-control input-sm "  ></div>
                          
                          <label class="col-lg-2 control-label" for="code-deviceunit">单位:</label>
                          <div class="col-lg-3">   <input id="code-deviceunit" type="text" name="deviceunit" value="${model.deviceunit}" class="text form-control input-sm "  ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-devicenum">数量:</label>
                          <div class="col-lg-3">   <input id="code-devicenum" type="text" name="devicenum" value="${model.devicenum}" class="text form-control input-sm "  ></div>
                          
                          <label class="col-lg-2 control-label" for="code-warehouseno">仓库编号:</label>
                          <div class="col-lg-3">   <input id="code-warehouseno" type="text" name="warehouseno" value="${model.warehouseno}" class="text form-control input-sm "  ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-warehousename">仓库名称:</label>
                          <div class="col-lg-3">   <input id="code-warehousename" type="text" name="warehousename" value="${model.warehousename}" class="text form-control input-sm "  ></div>
                          
                            </div>
                  
                  <div class="form-group">
	                  <div class="col-lg-10 col-lg-offset-2">
	                      <button id="submitButton" class="btn btn-primary btn-sm a-submit"><span class="glyphicon glyphicon-floppy-save"></span>保存</button>
	                      <button type="button" onclick="location.href='warehouse_device-list.do'" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-log-out"></span> 关闭</button>
	                  </div>
                  </div>
                </form>
        </div>
    </div>
    <!-- end of main -->
  </body>
</html>
