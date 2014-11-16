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
					bootbox.animate(false);
					var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
		            form.submit();
		        },
		        errorClass: 'validate-error'
		    });
		})
    </script>
    <div class="span2"></div>
    <!-- start of main -->
    <div class="panel panel-default span10"> 
        <div class="panel-heading"><h4 class="panel-title">编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="test-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-age">年龄:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-age" type="text" name="age" value="${model.age}"  class="text number" >
                          </div>
                      <!-- 是否显示 -->
				<div class="form-group">
					<label class="col-lg-2 control-label" for="code-name">姓名:</label>
					<!-- 是否可编辑 -->
					<!-- 编辑类型   单行 -->
					<input id="code-name" type="text" name="name" value="${model.name}" class="text required">
				</div>
				<!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-remark">备注:</label>
                              <!-- 是否可编辑 -->
                                      <!-- 编辑类型     多行 --><div class="col-lg-6">    <textarea class="form-control" id="code-remark" name="remark" rows="1">${model.remark}</textarea></div>
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-sex">性别:</label>
                              <!-- 是否可编辑 -->
                                      <div class="col-lg-3">    <select id="code-sex" name="sex" class="form-control">          <option value="" >请选择</option>        <c:forEach items="${sexItems}" var="item">          <option value="${item.key}"  >${item.value}</option>        </c:forEach>    </select></div>
                          </div>
                  
                  <div class="form-group">
                      <button id="submitButton" class="btn btn-default a-submit"><spring:message code='core.input.save' text='保存'/></button>
                      <button type="button" onclick="history.back();" class="btn btn-default a-cancel"><spring:message code='core.input.back' text='返回'/></button>
                  </div>
                </form>
        </div>
    </div>
    <!-- end of main -->
  </body>
</html>
