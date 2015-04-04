<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>合同管理编辑</title>
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
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">合同管理编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="contract_manage-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-contractname">合同名:</label>
                          <div class="col-lg-3">   <input id="code-contractname" type="text" name="contractname" value="${model.contractname}" class="text form-control input-sm "  ></div>
                          <label class="col-lg-2 control-label" for="code-typeflag">合同状态:</label>
                          <div class="col-lg-3">    <select id="code-typeflag" name="typeflag" class="form-control input-sm required" >          <option value="" >请选择</option>        <c:forEach items="${typeflagItems}" var="item">          <option value="${item.key}" ${item.key==model.typeflag? 'selected':''} >${item.value}</option>        </c:forEach>    </select></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-projectname">工程项目名称:</label>
                          <div class="col-lg-3">   <input id="code-projectname" type="text" name="projectname" value="${model.projectname}" class="text form-control input-sm required"  ></div>
                          
                          <label class="col-lg-2 control-label" for="code-customername">客户名称:</label>
                          <div class="col-lg-3">   <input id="code-customername" type="text" name="customername" value="${model.customername}" class="text form-control input-sm required"  ></div>
                            </div>
                          <div class="form-group">
                          
                          <label class="col-lg-2 control-label" for="code-customerphone">客户电话:</label>
                          <div class="col-lg-3">   <input id="code-customerphone" type="text" name="customerphone" value="${model.customerphone}" class="text form-control input-sm required"  ></div>
                          
                            </div>
                           <div class="form-group">
                            <label class="col-lg-2 control-label" for="code-contracturl">合同文件地址:</label>
                          <div class="col-lg-10">  <input id="code_table_contracturl_text" type="text" value="">  <a href="#" class="btn btn-primary btn-sm" onclick="$('#file_contracturlupload').click()"><span class="glyphicon glyphicon-upload"></span>上传</a>  <input id="code_table_contracturl" type="hidden" name="contracturl" value="${model.contracturl}">  <c:if test="${model.contracturl != null && model.contracturl !=''}">    <a href="contracturl-download.do?filename=${model.contracturl}&path=${model.contracturl}">${model.contracturl}</a>  </c:if></div>
                          </div>
                          
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-address">客户地址:</label>
                          <div class="col-lg-8">    <textarea class="form-control required" id="code-address" name="address" rows="2" >${model.address}</textarea></div>
                          </div>
                            
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-remark">备注:</label>
                          <div class="col-lg-8">    <textarea class="form-control " id="code-remark" name="remark" rows="2" >${model.remark}</textarea></div>
                          
                            </div>
                  
                  <div class="form-group">
	                  <div class="col-lg-10 col-lg-offset-2">
	                      <button id="submitButton" class="btn btn-primary btn-sm a-submit"><span class="glyphicon glyphicon-floppy-save"></span>保存</button>
	                      <button type="button" onclick="location.href='contract_manage-list.do'" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-log-out"></span> 关闭</button>
	                  </div>
                  </div>
                </form>
			            <!-- 上传组件form提交 --><form id="contracturlUploadForm" method="post" action="contracturl-upload.do" class="form-horizontal" enctype="multipart/form-data">    <script type="text/javascript">		function contracturlUpload() {       if( window.confirm("您确认要上传吗?") == true ){			var $form=$('#contracturlUploadForm');	        $form.ajaxSubmit({	            url: $form.attr('action'),	            type: 'POST',	            dataType: 'text',	            beforeSubmit: function () {},	            success: function (data) {	            	$('#code_table_contracturl').attr('value',data);	            	$('#code_table_contracturl_text').attr('value',data);	            },	            error: function () {	            	alert('请求数据出错了!');	            }	        });		}}	 </script>    <input id="file_contracturlupload" type="file" name="attachment" style="display:none;" onChange="contracturlUpload();"> </form>
        </div>
    </div>
    <!-- end of main -->
  </body>
</html>
