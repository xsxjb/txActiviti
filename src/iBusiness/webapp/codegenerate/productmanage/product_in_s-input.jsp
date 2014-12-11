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
					<form id="subForm" method="post" action="product_in_s-save.do?parentid=${parentid}&flowId=${flowId}" class="form-horizontal">
					  <c:if test="${model != null}">
					      <input id="code_id" type="hidden" name="id" value="${model.id}">
					  </c:if>
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-warehouseno">仓库编号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.warehouseno.fcEdit=='1'}">    <input id="code-warehouseno" type="text" name="warehouseno" value="${model.warehouseno}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.warehouseno.fcEdit!='1'}">    <label>${model.warehouseno}</label>    <input type="hidden" name="warehouseno" value="${model.warehouseno}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-warehousename">仓库名称:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.warehousename.fcEdit=='1'}">    <input id="code-warehousename" type="text" name="warehousename" value="${model.warehousename}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.warehousename.fcEdit!='1'}">    <label>${model.warehousename}</label>    <input type="hidden" name="warehousename" value="${model.warehousename}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-producttype">产品类型:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.producttype.fcEdit=='1'}">    <input id="code-producttype" type="text" name="producttype" value="${model.producttype}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.producttype.fcEdit!='1'}">    <label>${model.producttype}</label>    <input type="hidden" name="producttype" value="${model.producttype}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-productflowid">产品件号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.productflowid.fcEdit=='1'}">    <input id="code-productflowid" type="text" name="productflowid" value="${model.productflowid}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.productflowid.fcEdit!='1'}">    <label>${model.productflowid}</label>    <input type="hidden" name="productflowid" value="${model.productflowid}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-productno">产品编号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.productno.fcEdit=='1'}">    <input id="code-productno" type="text" name="productno" value="${model.productno}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.productno.fcEdit!='1'}">    <label>${model.productno}</label>    <input type="hidden" name="productno" value="${model.productno}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-productname">产品名:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.productname.fcEdit=='1'}">    <input id="code-productname" type="text" name="productname" value="${model.productname}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.productname.fcEdit!='1'}">    <label>${model.productname}</label>    <input type="hidden" name="productname" value="${model.productname}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-productmodel">规格型号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.productmodel.fcEdit=='1'}">    <input id="code-productmodel" type="text" name="productmodel" value="${model.productmodel}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.productmodel.fcEdit!='1'}">    <label>${model.productmodel}</label>    <input type="hidden" name="productmodel" value="${model.productmodel}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-productunit">单位:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.productunit.fcEdit=='1'}">    <input id="code-productunit" type="text" name="productunit" value="${model.productunit}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.productunit.fcEdit!='1'}">    <label>${model.productunit}</label>    <input type="hidden" name="productunit" value="${model.productunit}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-unitprice">单价:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.unitprice.fcEdit=='1'}">    <input id="code-unitprice" type="text" name="unitprice" value="${model.unitprice}" class="text number required" >  </c:if>  <c:if test="${nodeColumsMap.unitprice.fcEdit!='1'}">    <label>${model.unitprice}</label>    <input type="hidden" name="unitprice" value="${model.unitprice}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-productnum">数量合计:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.productnum.fcEdit=='1'}">    <input id="code-productnum" type="text" name="productnum" value="${model.productnum}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.productnum.fcEdit!='1'}">    <label>${model.productnum}</label>    <input type="hidden" name="productnum" value="${model.productnum}">  </c:if></div>
                              
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
