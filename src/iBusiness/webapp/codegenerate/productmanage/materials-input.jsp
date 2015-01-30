<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>原料管理编辑</title>
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
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">原料管理编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="materials-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-materialno">原料编号:</label>
                          <div class="col-lg-3">   <input id="code-materialno" type="text" name="materialno" value="${model.materialno}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-materialname">原料名称:</label>
                          <div class="col-lg-3">   <input id="code-materialname" type="text" name="materialname" value="${model.materialname}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-materialprice">价格:</label>
                          <div class="col-lg-3">  <input id="code-materialprice" type="text" name="materialprice" value="${model.materialprice}" class="text number " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-materialtypeno">分类编号:</label>
                          <div class="col-lg-3">    <select id="code-materialtypeno" name="materialtypeno" class="form-control required" >          <option value="" >请选择</option>        <c:forEach items="${materialtypenoItems}" var="item">          <option value="${item.key}" ${item.key==model.materialtypeno? 'selected':''} >${item.value}</option>        </c:forEach>    </select></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-materialunit">单位:</label>
                          <div class="col-lg-3">   <input id="code-materialunit" type="text" name="materialunit" value="${model.materialunit}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-model">规格型号:</label>
                          <div class="col-lg-3">   <input id="code-model" type="text" name="model" value="${model.model}" class="text " ></div>
                          
                            </div>
                  
                  <div class="form-group">
	                  <div class="col-lg-10 col-lg-offset-2">
	                      <button id="submitButton" class="btn btn-primary btn-sm a-submit"><span class="glyphicon glyphicon-floppy-save"></span>保存</button>
	                      <button type="button" onclick="location.href='materials-list.do'" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-log-out"></span> 关闭</button>
	                  </div>
                  </div>
                </form>
        </div>
    </div>
    <!-- end of main -->
  </body>
</html>
