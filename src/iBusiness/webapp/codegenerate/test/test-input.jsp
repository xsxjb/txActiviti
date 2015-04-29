<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
<head>
<%@include file="/common/meta.jsp"%>
<title>测试练习表单编辑</title>
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
		<div class="panel-heading">
			<h4 class="panel-title glyphicon glyphicon-paperclip">测试练习表单编辑</h4>
		</div>
		<div class="panel-body">
			<form id="cgForm" method="post" action="test-save.do"
				class="form-horizontal">
				<c:if test="${model != null}">
					<input id="code_id" type="hidden" name="id" value="${model.id}">
				</c:if>

				<div class="form-group">
					<label class="col-lg-2 control-label" for="code-name">姓名:</label>
					<div class="col-lg-4">
						<input id="code_table_name_text" type="text" value="">
						  <a href="#" class="btn btn-primary btn-sm" onclick="$('#file_nameupload').click()">
						  <span class="glyphicon glyphicon-upload"></span>上传</a>
						   <input id="code_table_name" type="hidden" name="name" value="${model.name}">
					</div>
					<div class="col-lg-4">
						<c:if test="${model.name != null && model.name !=''}">
							<a
								href="name-download.do?filename=${model.name}&path=${model.name}">${model.name}</a>
						</c:if>
					</div>

					<label class="col-lg-2 control-label" for="code-remark">备注:</label>
					<div class="col-lg-3">
						<input id="code-remark" type="text" name="remark"
							value="${model.remark}"
							class="text form-control input-sm required">
					</div>

				</div>

				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button id="submitButton" class="btn btn-primary btn-sm a-submit">
							<span class="glyphicon glyphicon-floppy-save"></span>保存
						</button>
						<button type="button" onclick="location.href='test-list.do'"
							class="btn btn-primary btn-sm">
							<span class="glyphicon glyphicon-log-out"></span> 关闭
						</button>
					</div>
				</div>
			</form>
			<!-- 上传组件form提交 -->
			<form id="nameUploadForm" method="post" action="name-upload.do"
				class="form-horizontal" enctype="multipart/form-data">
				<script type="text/javascript">		function nameUpload() {       if( window.confirm("您确认要上传吗?") == true ){			var $form=$('#nameUploadForm');	        $form.ajaxSubmit({	            url: $form.attr('action'),	            type: 'POST',	            dataType: 'text',	            beforeSubmit: function () {},	            success: function (data) {	            	$('#code_table_name').attr('value',data);	            	$('#code_table_name_text').attr('value',data);	            },	            error: function () {	            	alert('请求数据出错了!');	            }	        });		}}	 </script>
				<input id="file_nameupload" type="file" name="attachment"
					style="display: none;" onChange="nameUpload();">
			</form>
		</div>
	</div>
	<!-- end of main -->
</body>
</html>
