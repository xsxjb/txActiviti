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
	<!-- start of main -->
    <div class="panel panel-default col-lg-12">
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">编辑子表</h4></div>
        <div class="panel-body">
			<div class="content content-inner">
					<form id="subForm" method="post" action="bom_materials-save.do?parentid=${parentid}&flowId=${flowId}" class="form-horizontal">
					  <c:if test="${model != null}">
					      <input id="code_id" type="hidden" name="id" value="${model.id}">
					  </c:if>
                             <div class="form-group">
                              <label class="control-label col-lg-2" for="code-materialtypeno">分类编号:</label>
                              <div class="col-lg-3">   <input id="code-materialtypeno" type="text" name="materialtypeno" value="${model.materialtypeno}" class="text " ></div>
	                        
                              <label class="control-label col-lg-2" for="code-materialno">原料编号:</label>
                              <div class="col-lg-3">   <input id="code-materialno" type="text" name="materialno" value="${model.materialno}" class="text " ></div>
                            </div>
	                        
                             <div class="form-group">
                              <label class="control-label col-lg-2" for="code-materialname">原料名称:</label>
                              <div class="col-lg-3">   <input id="code-materialname" type="text" name="materialname" value="${model.materialname}" class="text " ></div>
	                        
                              <label class="control-label col-lg-2" for="code-model">规格型号:</label>
                              <div class="col-lg-3">   <input id="code-model" type="text" name="model" value="${model.model}" class="text " ></div>
                            </div>
	                        
                             <div class="form-group">
                              <label class="control-label col-lg-2" for="code-materialprice">价格:</label>
                              <div class="col-lg-3">  <input id="code-materialprice" type="text" name="materialprice" value="${model.materialprice}" class="text number required" ></div>
	                        
                              <label class="control-label col-lg-2" for="code-materialunit">单位:</label>
                              <div class="col-lg-3">   <input id="code-materialunit" type="text" name="materialunit" value="${model.materialunit}" class="text " ></div>
                            </div>
	                        
                             <div class="form-group">
                              <label class="control-label col-lg-2" for="code-materialnum">数量:</label>
                              <div class="col-lg-3">  <input id="code-materialnum" type="text" name="materialnum" value="${model.materialnum}" class="text number required" ></div>
	                        
                              <label class="control-label col-lg-2" for="code-stocktype">备货类型:</label>
                              <div class="col-lg-3">   <input id="code-stocktype" type="text" name="stocktype" value="${model.stocktype}" class="text " ></div>
                            </div>
	                        
                             <div class="form-group">
                              <label class="control-label col-lg-2" for="code-comments">备注:</label>
                              <div class="col-lg-6">    <textarea class="form-control required" id="code-comments" name="comments" rows="1" >${model.comments}</textarea></div>
                            </div>
	                        
					  
					  <div class="form-group">
					    <div class="controls">
					      <button id="submitButton" class="btn btn-primary btn-sm a-submit"><span class="glyphicon glyphicon-floppy-save"></span>保存</button>
					      <button type="button" onclick="location.href='bom-input.do?id=${parentid}'" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-log-out"></span>返回</button>
					    </div>
					  </div>
					</form>
			</div>
		
      </div>
    </div>
	<!-- end of main -->
  </body>
</html>
