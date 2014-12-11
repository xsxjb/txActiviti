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
					<form id="subForm" method="post" action="product_out_s-save.do?parentid=${parentid}&flowId=${flowId}" class="form-horizontal">
					  <c:if test="${model != null}">
					      <input id="code_id" type="hidden" name="id" value="${model.id}">
					  </c:if>
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-batchno">批次:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.batchno.fcEdit=='1'}">    <input id="code-batchno" type="text" name="batchno" value="${model.batchno}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.batchno.fcEdit!='1'}">    <label>${model.batchno}</label>    <input type="hidden" name="batchno" value="${model.batchno}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-stationname">设备地点:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.stationname.fcEdit=='1'}">    <input id="code-stationname" type="text" name="stationname" value="${model.stationname}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.stationname.fcEdit!='1'}">    <label>${model.stationname}</label>    <input type="hidden" name="stationname" value="${model.stationname}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-productflowid">产品件号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.productflowid.fcEdit=='1'}">    <input id="code-productflowid" type="text" name="productflowid" value="${model.productflowid}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.productflowid.fcEdit!='1'}">    <label>${model.productflowid}</label>    <input type="hidden" name="productflowid" value="${model.productflowid}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-productno">产品产品编号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.productno.fcEdit=='1'}">    <input id="code-productno" type="text" name="productno" value="${model.productno}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.productno.fcEdit!='1'}">    <label>${model.productno}</label>    <input type="hidden" name="productno" value="${model.productno}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-productname">产品名称:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.productname.fcEdit=='1'}">    <input id="code-productname" type="text" name="productname" value="${model.productname}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.productname.fcEdit!='1'}">    <label>${model.productname}</label>    <input type="hidden" name="productname" value="${model.productname}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-modeltype">规格型号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.modeltype.fcEdit=='1'}">    <input id="code-modeltype" type="text" name="modeltype" value="${model.modeltype}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.modeltype.fcEdit!='1'}">    <label>${model.modeltype}</label>    <input type="hidden" name="modeltype" value="${model.modeltype}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-unit">单位:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.unit.fcEdit=='1'}">    <input id="code-unit" type="text" name="unit" value="${model.unit}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.unit.fcEdit!='1'}">    <label>${model.unit}</label>    <input type="hidden" name="unit" value="${model.unit}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-sizes">规格尺寸:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.sizes.fcEdit=='1'}">    <input id="code-sizes" type="text" name="sizes" value="${model.sizes}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.sizes.fcEdit!='1'}">    <label>${model.sizes}</label>    <input type="hidden" name="sizes" value="${model.sizes}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-deliverydate">发货日期:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.deliverydate.fcEdit=='1'}">    <input id="code-deliverydate" type="text" name="deliverydate" value="${model.deliverydate}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.deliverydate.fcEdit!='1'}">    <label>${model.deliverydate}</label>    <input type="hidden" name="deliverydate" value="${model.deliverydate}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-materialnum">数量:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.materialnum.fcEdit=='1'}">    <input id="code-materialnum" type="text" name="materialnum" value="${model.materialnum}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.materialnum.fcEdit!='1'}">    <label>${model.materialnum}</label>    <input type="hidden" name="materialnum" value="${model.materialnum}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-unitprice">单价:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.unitprice.fcEdit=='1'}">    <input id="code-unitprice" type="text" name="unitprice" value="${model.unitprice}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.unitprice.fcEdit!='1'}">    <label>${model.unitprice}</label>    <input type="hidden" name="unitprice" value="${model.unitprice}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-price">金额:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.price.fcEdit=='1'}">    <input id="code-price" type="text" name="price" value="${model.price}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.price.fcEdit!='1'}">    <label>${model.price}</label>    <input type="hidden" name="price" value="${model.price}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-outtype">发货类型:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.outtype.fcEdit=='1'}">    <input id="code-outtype" type="text" name="outtype" value="${model.outtype}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.outtype.fcEdit!='1'}">    <label>${model.outtype}</label>    <input type="hidden" name="outtype" value="${model.outtype}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-goodsaddress">货物所在地:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.goodsaddress.fcEdit=='1'}">    <input id="code-goodsaddress" type="text" name="goodsaddress" value="${model.goodsaddress}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.goodsaddress.fcEdit!='1'}">    <label>${model.goodsaddress}</label>    <input type="hidden" name="goodsaddress" value="${model.goodsaddress}">  </c:if></div>
                              
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
