<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>经营预算年度数据编辑</title>
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
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">经营预算年度数据编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="operatbudgetyear-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-planyear">计划年:</label>
                          <div class="col-lg-3">   <input id="code-planyear" type="text" name="planyear" value="${model.planyear}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-projecttype">资金项目类别:</label>
                          <div class="col-lg-3">   <input id="code-projecttype" type="text" name="projecttype" value="${model.projecttype}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-projectname">项目计划名称:</label>
                          <div class="col-lg-3">   <input id="code-projectname" type="text" name="projectname" value="${model.projectname}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-changeplanam">变更前计划数:</label>
                          <div class="col-lg-3">   <input id="code-changeplanam" type="text" name="changeplanam" value="${model.changeplanam}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-addplanamount">项目增补变更计划数:</label>
                          <div class="col-lg-3">   <input id="code-addplanamount" type="text" name="addplanamount" value="${model.addplanamount}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-planamount">现计划数:</label>
                          <div class="col-lg-3">   <input id="code-planamount" type="text" name="planamount" value="${model.planamount}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-yearplanbalance">年计划数余额:</label>
                          <div class="col-lg-3">   <input id="code-yearplanbalance" type="text" name="yearplanbalance" value="${model.yearplanbalance}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-amount">实际发生数:</label>
                          <div class="col-lg-3">   <input id="code-amount" type="text" name="amount" value="${model.amount}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-dept">所属部门:</label>
                          <div class="col-lg-3">   <input id="code-dept" type="text" name="dept" value="${model.dept}" class="text " ></div>
                          
                            </div>
                  
                  <div class="form-group">
	                  <div class="col-lg-10 col-lg-offset-2">
	                      <button id="submitButton" class="btn btn-primary btn-sm a-submit"><span class="glyphicon glyphicon-floppy-save"></span>保存</button>
	                      <button type="button" onclick="location.href='operatbudgetyear-list.do'" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-log-out"></span> 关闭</button>
	                  </div>
                  </div>
                </form>
        </div>
    </div>
    <!-- end of main -->
  </body>
</html>
