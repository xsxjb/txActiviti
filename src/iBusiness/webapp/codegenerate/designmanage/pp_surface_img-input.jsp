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
					<form id="subForm" method="post" action="pp_surface_img-save.do?parentid=${parentid}&flowId=${flowId}" class="form-horizontal">
					  <c:if test="${model != null}">
					      <input id="code_id" type="hidden" name="id" value="${model.id}">
					  </c:if>
                             <div class="form-group">
                              <label class="control-label col-lg-2" for="code-imgurl">图片地址:</label>
                              <div class="col-lg-10">  <input id="code_table_imgurl_text" type="text" value="">  <a href="#" class="btn btn-primary btn-sm" onclick="$('#file_imgurlupload').click()"><span class="glyphicon glyphicon-upload"></span>上传</a>  <input id="code_table_imgurl" type="hidden" name="imgurl" value="${model.imgurl}">  <c:if test="${model.imgurl != null && model.imgurl !=''}">    <a href="imgurl-download.do?filename=${model.imgurl}&path=${model.imgurl}">${model.imgurl}</a>  </c:if></div>
	                        
                              <label class="control-label col-lg-2" for="code-imginfo"> 图片信息描述:</label>
                              <div class="col-lg-8">    <textarea class="form-control " id="code-imginfo" name="imginfo" rows="2" >${model.imginfo}</textarea></div>
                            </div>
	                        
					  
					  <div class="form-group">
					    <div class="controls">
					      <button id="submitButton" class="btn btn-primary btn-sm a-submit"><span class="glyphicon glyphicon-floppy-save"></span>保存</button>
					      <button type="button" onclick="location.href='project_progress-input.do?id=${parentid}'" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-log-out"></span>返回</button>
					    </div>
					  </div>
					</form>
				            <!-- 上传组件form提交 --><form id="imgurlUploadForm" method="post" action="imgurl-upload.do" class="form-horizontal" enctype="multipart/form-data">    <script type="text/javascript">		function imgurlUpload() {       if( window.confirm("您确认要上传吗?") == true ){			var $form=$('#imgurlUploadForm');	        $form.ajaxSubmit({	            url: $form.attr('action'),	            type: 'POST',	            dataType: 'text',	            beforeSubmit: function () {},	            success: function (data) {	            	$('#code_table_imgurl').attr('value',data);	            	$('#code_table_imgurl_text').attr('value',data);	            },	            error: function () {	            	alert('请求数据出错了!');	            }	        });		}}	 </script>    <input id="file_imgurlupload" type="file" name="attachment" style="display:none;" onChange="imgurlUpload();"> </form>
			</div>
		
      </div>
    </div>
	<!-- end of main -->
  </body>
</html>
