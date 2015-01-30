<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>产品库存管理表编辑</title>
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
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">产品库存管理表编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="warehouse_product-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
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
                          
                          <label class="col-lg-2 control-label" for="code-productunit">单位:</label>
                          <div class="col-lg-3">   <input id="code-productunit" type="text" name="productunit" value="${model.productunit}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-productprice">单价:</label>
                          <div class="col-lg-3">  <input id="code-productprice" type="text" name="productprice" value="${model.productprice}" class="text number required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-productnum">数量:</label>
                          <div class="col-lg-3">  <input id="code-productnum" type="text" name="productnum" value="${model.productnum}" class="text number required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-warehouseno">仓库编号:</label>
                          <div class="col-lg-3">   <input id="code-warehouseno" type="text" name="warehouseno" value="${model.warehouseno}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-warehousename">仓库名称:</label>
                          <div class="col-lg-3">   <input id="code-warehousename" type="text" name="warehousename" value="${model.warehousename}" class="text " ></div>
                          
                            </div>
                  
                  <div class="form-group">
	                  <div class="col-lg-10 col-lg-offset-2">
	                      <button id="submitButton" class="btn btn-primary btn-sm a-submit"><span class="glyphicon glyphicon-floppy-save"></span>保存</button>
	                      <button type="button" onclick="location.href='warehouse_product-list.do'" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-log-out"></span> 关闭</button>
	                  </div>
                  </div>
                </form>
        </div>
    </div>
    <!-- end of main -->
  </body>
</html>
