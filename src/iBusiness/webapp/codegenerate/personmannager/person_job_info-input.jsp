<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>人员就职表编辑</title>
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
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">人员就职表编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="person_job_info-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-name">人事档案ID(姓名):</label>
                          <div class="col-lg-3">   <input id="code-name" type="text" name="name" value="${model.name}" class="text form-control input-sm required"  ></div>
                          
                          <label class="col-lg-2 control-label" for="code-department">所属部门:</label>
                          <div class="col-lg-4">   <input id="code-department" type="text" name="department" value="${model.department}" class="text required" >   <a href="#" class="btn btn-primary btn-sm" onclick="$('#departmentSInputDiv').modal('show');" >选择</a>   <script type="text/javascript">   	function changeValue(name){   	$("#code-department").val(name);$('#departmentSInputDiv').modal('hide');        }function searchOwnername(urlStr) {  $.ajax({  	 type: "POST", 	 url: "/"+window.location.pathname.split("/")[1]+"/"+urlStr +$("#code_table_name").val(), 	 dataType:"json", 	 success: function(jsonData){ 	   $("#departmentRowadd tr").remove();  	   $.each(jsonData, function(i, item) { 		   var newRow='            	     <tr>           	        <td><a href="#" class="btn btn-primary btn-sm" onClick="changeValue(\''+item.name+'\')" >选择</a></td>  <td>'+item.name+'</td>           	     </tr>';          $('#departmentRowadd').append(newRow);         });     }, 	 error: function (XMLHttpRequest, textStatus, errorThrown) { 		 alert('请求数据出错了!');     }   }); }    </script>   <div id="departmentSInputDiv" class="modal fade" tabindex="-1" style="top:20%;" >     <div class="modal-dialog">       <div class="modal-content">         <div class="modal-header">           <a href="#" class="close btn btn-primary btn-sm" onclick="$('#departmentSInputDiv').modal('hide');" ><span >&times;</span><span class="sr-only">Close</span></a>           <h4 class="modal-title glyphicon glyphicon-paperclip">选择带出</h4>           <div class="form-group">              <label for="code_table_name">部门名称:</label>              <input type="text" id="code_table_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}">              <a class="btn btn-primary btn-sm" href="#" onclick="searchOwnername('person_job_info/name-list.do?filter_LIKES_name=')"><span class="glyphicon glyphicon-search"></span>查询</a>            </div>          </div>         <div class="modal-body">           <div class="content">           	<table id="codeGrid" class="table table-hover table-bordered">           	   <thead>           	   <tr>           	      <th width="80">&nbsp;</th>   <th class="sorting">部门名称</th>           	   </tr>           	</thead>           	<tbody id='departmentRowadd'>           	   <c:forEach items="${departmentPage.result}" var="item">           	     <tr>           	        <td><a href="#" class="btn btn-primary btn-sm" onClick="changeValue('${item.name}')" >选择</a></td>  <td>${item.name}</td>           	     </tr>           	  </c:forEach>           	</tbody>           </table>         </div>       </div>       <div class="modal-footer">         <a href="#" class="btn btn-primary btn-sm" onclick="$('#departmentSInputDiv').modal('hide');" >关闭</a>       </div>     </div>    </div>  </div></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-post">职务:</label>
                          <div class="col-lg-3">   <input id="code-post" type="text" name="post" value="${model.post}" class="text form-control input-sm required"  minlength="2" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-posttitle">职称:</label>
                          <div class="col-lg-3">   <input id="code-posttitle" type="text" name="posttitle" value="${model.posttitle}" class="text form-control input-sm required"  ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-obtaindate">取得职称时间:</label>
                          <div class="col-lg-3">  <div class="input-append datepicker date">  <span class="add-on">    <input id="code-obtaindate" type="text" name="obtaindate" value="${model.obtaindate}" placeholder="点击选择" class="form-control input-sm required" readonly >  </span>  </div></div>
                          
                          <label class="col-lg-2 control-label" for="code-identity">身份:</label>
                          <div class="col-lg-3">   <input id="code-identity" type="text" name="identity" value="${model.identity}" class="text form-control input-sm required"  ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-adminlevel">行政级别:</label>
                          <div class="col-lg-3">    <select id="code-adminlevel" name="adminlevel" class="form-control input-sm required" >          <option value="" >请选择</option>        <c:forEach items="${adminlevelItems}" var="item">          <option value="${item.key}" ${item.key==model.adminlevel? 'selected':''} >${item.value}</option>        </c:forEach>    </select></div>
                          
                          <label class="col-lg-2 control-label" for="code-salarystandard">工资标准:</label>
                          <div class="col-lg-3">  <input id="code-salarystandard" type="text" name="salarystandard" value="${model.salarystandard}" class="text  form-control input-sm number required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-enterdate">就职时间:</label>
                          <div class="col-lg-3">  <div class="input-append datepicker date">  <span class="add-on">    <input id="code-enterdate" type="text" name="enterdate" value="${model.enterdate}" placeholder="点击选择" class="form-control input-sm required" readonly >  </span>  </div></div>
                          </div>
                          <div class="form-group">
                            <label class="col-lg-2 control-label" for="code-remark">备注:</label>
                            <div class="col-lg-8">    <textarea class="form-control required" id="code-remark" name="remark" rows="2" >${model.remark}</textarea></div>
                          </div>
                  
                  <div class="form-group">
	                  <div class="col-lg-10 col-lg-offset-2">
	                      <button id="submitButton" class="btn btn-primary btn-sm a-submit"><span class="glyphicon glyphicon-floppy-save"></span>保存</button>
	                      <button type="button" onclick="location.href='person_job_info-list.do'" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-log-out"></span> 关闭</button>
	                  </div>
                  </div>
                </form>
        </div>
    </div>
    <!-- end of main -->
  </body>
</html>
