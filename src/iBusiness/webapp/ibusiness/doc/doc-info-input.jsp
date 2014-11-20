<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="msg-info.msg-info.input.title" text="编辑"/></title>
    <%@include file="/common/center.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#msg-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
})
    </script>
  </head>

  <body>
  <%@include file="/ibusiness/header/header-portal.jsp"%>

    <div class="span2"></div>
	<!-- start of main -->
	<div class="panel panel-default span10"> 
        <div class="panel-heading"><h4 class="panel-title">编辑文档</h4></div>
        <div class="panel-body">
				<form id="msg-infoForm" method="post" action="doc-info-save.do" class="form-horizontal" enctype="multipart/form-data">
				  <c:if test="${model != null}">
				  <input id="msg-info_id" type="hidden" name="id" value="${model.id}">
				  </c:if>
				  <div class="form-group">
				    <label class="control-label" for="msg-info_address">文件</label>
					<div class="controls">
					  <input id="msg-info_address" type="file" name="attachment" value="" size="40" class="text required">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="control-label" for="docInfo_descn">备注</label>
					<div class="controls">
					  <input id="docInfo_descn" type="text" name="descn" value="${model.descn}" size="40" class="text">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="controls">
				      <button type="submit" class="btn btn-default a-submit"><spring:message code='core.input.save' text='保存'/></button>
					  &nbsp;
				      <button type="button" class="btn btn-default a-cancel" onclick="history.back();"><spring:message code='core.input.back' text='返回'/></button>
				    </div>
				  </div>
				</form>
        </div>

	  <!-- end of main -->
	</div>

  </body>

</html>
