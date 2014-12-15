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
					<form id="subForm" method="post" action="operatbudgetplan_s-save.do?parentid=${parentid}&flowId=${flowId}" class="form-horizontal">
					  <c:if test="${model != null}">
					      <input id="code_id" type="hidden" name="id" value="${model.id}">
					  </c:if>
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-projecttype">资金项目类别:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.projecttype.fcEdit=='1'}">    <input id="code-projecttype" type="text" name="projecttype" value="${model.projecttype}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.projecttype.fcEdit!='1'}">    <label>${model.projecttype}</label>    <input type="hidden" name="projecttype" value="${model.projecttype}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-projectname">项目计划名称:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.projectname.fcEdit=='1'}">    <input id="code-projectname" type="text" name="projectname" value="${model.projectname}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.projectname.fcEdit!='1'}">    <label>${model.projectname}</label>    <input type="hidden" name="projectname" value="${model.projectname}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-materialtype">材料类别:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.materialtype.fcEdit=='1'}">    <input id="code-materialtype" type="text" name="materialtype" value="${model.materialtype}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.materialtype.fcEdit!='1'}">    <label>${model.materialtype}</label>    <input type="hidden" name="materialtype" value="${model.materialtype}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-materialname">材料/用品/费用名称:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.materialname.fcEdit=='1'}">    <input id="code-materialname" type="text" name="materialname" value="${model.materialname}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.materialname.fcEdit!='1'}">    <label>${model.materialname}</label>    <input type="hidden" name="materialname" value="${model.materialname}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-spec">规格/型号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.spec.fcEdit=='1'}">    <input id="code-spec" type="text" name="spec" value="${model.spec}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.spec.fcEdit!='1'}">    <label>${model.spec}</label>    <input type="hidden" name="spec" value="${model.spec}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-unit">单位:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.unit.fcEdit=='1'}">    <input id="code-unit" type="text" name="unit" value="${model.unit}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.unit.fcEdit!='1'}">    <label>${model.unit}</label>    <input type="hidden" name="unit" value="${model.unit}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-price">单价:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.price.fcEdit=='1'}">    <input id="code-price" type="text" name="price" value="${model.price}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.price.fcEdit!='1'}">    <label>${model.price}</label>    <input type="hidden" name="price" value="${model.price}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-numb">数量:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.numb.fcEdit=='1'}">    <input id="code-numb" type="text" name="numb" value="${model.numb}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.numb.fcEdit!='1'}">    <label>${model.numb}</label>    <input type="hidden" name="numb" value="${model.numb}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-planamounts">计划数（元）:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.planamounts.fcEdit=='1'}">    <input id="code-planamounts" type="text" name="planamounts" value="${model.planamounts}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.planamounts.fcEdit!='1'}">    <label>${model.planamounts}</label>    <input type="hidden" name="planamounts" value="${model.planamounts}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-reason">实施原因:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.reason.fcEdit=='1'}">    <input id="code-reason" type="text" name="reason" value="${model.reason}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.reason.fcEdit!='1'}">    <label>${model.reason}</label>    <input type="hidden" name="reason" value="${model.reason}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-info">措施/内容:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.info.fcEdit=='1'}">    <input id="code-info" type="text" name="info" value="${model.info}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.info.fcEdit!='1'}">    <label>${model.info}</label>    <input type="hidden" name="info" value="${model.info}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-dept">所属部门:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.dept.fcEdit=='1'}">    <input id="code-dept" type="text" name="dept" value="${model.dept}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.dept.fcEdit!='1'}">    <label>${model.dept}</label>    <input type="hidden" name="dept" value="${model.dept}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-remark">备注:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.remark.fcEdit=='1'}">    <input id="code-remark" type="text" name="remark" value="${model.remark}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.remark.fcEdit!='1'}">    <label>${model.remark}</label>    <input type="hidden" name="remark" value="${model.remark}">  </c:if></div>
                              
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
