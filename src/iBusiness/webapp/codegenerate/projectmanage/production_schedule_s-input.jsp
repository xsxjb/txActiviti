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
					<form id="subForm" method="post" action="production_schedule_s-save.do?parentid=${parentid}&flowId=${flowId}" class="form-horizontal">
					  <c:if test="${model != null}">
					      <input id="code_id" type="hidden" name="id" value="${model.id}">
					  </c:if>
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-batchno">批次号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.batchno.fcEdit=='1'}">    <input id="code-batchno" type="text" name="batchno" value="${model.batchno}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.batchno.fcEdit!='1'}">    <label>${model.batchno}</label>    <input type="hidden" name="batchno" value="${model.batchno}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-producttype">产品类型:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.producttype.fcEdit=='1'}">    <input id="code-producttype" type="text" name="producttype" value="${model.producttype}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.producttype.fcEdit!='1'}">    <label>${model.producttype}</label>    <input type="hidden" name="producttype" value="${model.producttype}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-productflowid">产品件号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.productflowid.fcEdit=='1'}">    <input id="code-productflowid" type="text" name="productflowid" value="${model.productflowid}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.productflowid.fcEdit!='1'}">    <label>${model.productflowid}</label>    <input type="hidden" name="productflowid" value="${model.productflowid}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-productno">产品编号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.productno.fcEdit=='1'}">    <input id="code-productno" type="text" name="productno" value="${model.productno}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.productno.fcEdit!='1'}">    <label>${model.productno}</label>    <input type="hidden" name="productno" value="${model.productno}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-productname">产品名:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.productname.fcEdit=='1'}">    <input id="code-productname" type="text" name="productname" value="${model.productname}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.productname.fcEdit!='1'}">    <label>${model.productname}</label>    <input type="hidden" name="productname" value="${model.productname}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-productmodel">规格型号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.productmodel.fcEdit=='1'}">    <input id="code-productmodel" type="text" name="productmodel" value="${model.productmodel}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.productmodel.fcEdit!='1'}">    <label>${model.productmodel}</label>    <input type="hidden" name="productmodel" value="${model.productmodel}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-materialnum">数量:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.materialnum.fcEdit=='1'}">    <input id="code-materialnum" type="text" name="materialnum" value="${model.materialnum}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.materialnum.fcEdit!='1'}">    <label>${model.materialnum}</label>    <input type="hidden" name="materialnum" value="${model.materialnum}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-starttime">开始时间:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.starttime.fcEdit=='1'}">    <input id="code-starttime" type="text" name="starttime" value="${model.starttime}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.starttime.fcEdit!='1'}">    <label>${model.starttime}</label>    <input type="hidden" name="starttime" value="${model.starttime}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-endtime">结束时间:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.endtime.fcEdit=='1'}">    <input id="code-endtime" type="text" name="endtime" value="${model.endtime}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.endtime.fcEdit!='1'}">    <label>${model.endtime}</label>    <input type="hidden" name="endtime" value="${model.endtime}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-productionaddress">场地类型:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.productionaddress.fcEdit=='1'}">    <input id="code-productionaddress" type="text" name="productionaddress" value="${model.productionaddress}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.productionaddress.fcEdit!='1'}">    <label>${model.productionaddress}</label>    <input type="hidden" name="productionaddress" value="${model.productionaddress}">  </c:if></div>
                              
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
