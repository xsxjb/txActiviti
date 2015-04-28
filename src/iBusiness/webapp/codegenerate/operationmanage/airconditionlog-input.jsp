<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>空调控制记录编辑</title>
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
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">空调控制记录编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="airconditionlog-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-eventtime">操作时间:</label>
                          <div class="col-lg-3">  <fmt:formatDate value="${model.eventtime}" pattern="yyyy-MM-dd HH:mm:ss" />  <input id="code-eventtime" type="hidden" name="eventtime" value="${model.eventtime}" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-controluser">操作人员:</label>
                          <div class="col-lg-3">   <input id="code-controluser" type="text" name="controluser" value="${model.controluser}" class="text form-control input-sm required"  ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-controlinfo">控制内容:</label>
                          <img id="code_img_controlinfo" height="200" width="150" src="${ctx}/ibresources/ibimg/${model.controlinfo}" /><div class="col-lg-4">  <a href="#" class="btn btn-primary btn-sm" onclick="$('#file_controlinfoupload').click()"><span class="glyphicon glyphicon-upload"></span>上传</a>  <input id="code_table_controlinfo" type="hidden" name="controlinfo" value="${model.controlinfo}"></div>
                          
                            </div>
                  
                  <div class="form-group">
	                  <div class="col-lg-10 col-lg-offset-2">
	                      <button id="submitButton" class="btn btn-primary btn-sm a-submit"><span class="glyphicon glyphicon-floppy-save"></span>保存</button>
	                      <button type="button" onclick="location.href='airconditionlog-list.do'" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-log-out"></span> 关闭</button>
	                  </div>
                  </div>
                </form>
			            <!-- 上传组件form提交 --><form id="controlinfoUploadForm" method="post" action="controlinfo-upload.do" class="form-horizontal" enctype="multipart/form-data">    <script type="text/javascript">     function controlinfoUpload() {       if( window.confirm("您确认要上传吗?") == true ){         var $form=$('#controlinfoUploadForm');         $form.ajaxSubmit({             url: $form.attr('action'),             type: 'POST',             dataType: 'text',             beforeSubmit: function () {},             success: function (data) {                 $('#code_table_controlinfo').attr('value',data);                 $('#code_table_controlinfo_text').attr('value',data);                 $('#code_img_controlinfo').attr('src','${ctx}/ibresources/ibimg/'+data);             },             error: function () {                 alert('请求数据出错了!');             }         });     }}  </script>    <input id="file_controlinfoupload" type="file" name="attachment" style="display:none;" onChange="controlinfoUpload();"> </form>
        </div>
    </div>
    <!-- end of main -->
  </body>
</html>
