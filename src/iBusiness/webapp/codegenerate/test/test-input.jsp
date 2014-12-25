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
    <%@include file="/ibusiness/header/header-portal.jsp"%>
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
    <div class="panel panel-default col-lg-10"> 
        <div class="panel-heading"><h4 class="panel-title">测试练习表单编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="test-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-name">姓名:</label>
                          <div class="col-lg-3">   <input id="code-name" type="text" name="name" value="${model.name}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-remark">备注:</label>
                          <div class="col-lg-3">   <input id="code-remark" type="text" name="remark" value="${model.remark}" class="text required" >   <a href="#remarkSInputDiv" class="btn btn-default btn-sm" data-toggle="modal" >选择</a>   
                          <script type="text/javascript">  
                          function changeValue(materialno,materialname,model){ 
                        	  $("#code-materialno").val(materialno);
                        	  $("#code-name").val(materialname);
                        	  $("#code-remark").val(model);
                        	  }
                          </script>   <div id="remarkSInputDiv" class="modal fade" tabindex="-1" style="top:20%;" >     <div class="modal-dialog">       <div class="modal-content">         <div class="modal-header">           <button type="button" class="close" data-dismiss="modal"><span >&times;</span><span class="sr-only">Close</span></button>           <h4 class="modal-title">选择带出</h4>         </div>         <div class="modal-body">           <div class="content">           	<table id="codeGrid" class="table table-hover table-bordered">           	   <thead>           	   <tr>           	      <th width="80">&nbsp;</th>   <th class="sorting">原料编号</th>   <th class="sorting">原料名称</th>   <th class="sorting">规格型号</th>           	   </tr>           	</thead>           	<tbody>           	   <c:forEach items="${remarkPage.result}" var="item">           	     <tr>           	        <td><a href="#" class="btn btn-default btn-sm" onClick="changeValue('${item.materialno}','${item.materialname}','${item.model}')" data-dismiss="modal">选择</a></td>  <td>${item.materialno}</td>  <td>${item.materialname}</td>  <td>${item.model}</td>           	     </tr>           	  </c:forEach>           	</tbody>           </table>         </div>       </div>       <div class="modal-footer">         <button class="btn btn-default btn-sm" data-dismiss="modal" >关闭</button>       </div>     </div>    </div>  </div></div>
                          
                            </div>
                  
                  <div class="form-group">
	                  <div class="col-lg-10 col-lg-offset-2">
	                      <button id="submitButton" class="btn btn-default a-submit"><spring:message code='core.input.save' text='保存'/></button>
	                      <button type="button" onclick="history.back();" class="btn btn-default a-cancel"><spring:message code='core.input.back' text='返回'/></button>
	                  </div>
                  </div>
                </form>
        </div>
    </div>
    <!-- end of main -->
  </body>
</html>
