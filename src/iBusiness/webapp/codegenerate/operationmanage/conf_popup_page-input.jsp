<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>PLC弹出页面编辑</title>
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
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">PLC弹出页面编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="conf_popup_page-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-pagename">页面名子:</label>
                          <div class="col-lg-3">   <input id="code-pagename" type="text" name="pagename" value="${model.pagename}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-pagetitle">页面标题:</label>
                          <div class="col-lg-3">   <input id="code-pagetitle" type="text" name="pagetitle" value="${model.pagetitle}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-popuptype">弹出方式:</label>
                          <div class="col-lg-3">   <input id="code-popuptype" type="text" name="popuptype" value="${model.popuptype}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-pageurl">页面url路径:</label>
                          <div class="col-lg-3">   <input id="code-pageurl" type="text" name="pageurl" value="${model.pageurl}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-pagetype">页面类型:</label>
                          <div class="col-lg-3">    <select id="code-pagetype" name="pagetype" class="form-control required" >          <option value="" >请选择</option>        <c:forEach items="${pagetypeItems}" var="item">          <option value="${item.key}" ${item.key==model.pagetype? 'selected':''} >${item.value}</option>        </c:forEach>    </select></div>
                          
                          <label class="col-lg-2 control-label" for="code-mainpageid">所属主页面ID:</label>
                          <div class="col-lg-3">    <select id="code-mainpageid" name="mainpageid" class="form-control " >          <option value="" >请选择</option>        <c:forEach items="${mainpageidItems}" var="item">          <option value="${item.key}" ${item.key==model.mainpageid? 'selected':''} >${item.value}</option>        </c:forEach>    </select></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-pagehight">页面高度:</label>
                          <div class="col-lg-3">   <input id="code-pagehight" type="text" name="pagehight" value="${model.pagehight}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-pagewidth">页面宽度:</label>
                          <div class="col-lg-3">   <input id="code-pagewidth" type="text" name="pagewidth" value="${model.pagewidth}" class="text required" ></div>
                          
                            </div>
                  
                  <div class="form-group">
	                  <div class="col-lg-10 col-lg-offset-2">
	                      <button id="submitButton" class="btn btn-primary btn-sm a-submit"><span class="glyphicon glyphicon-floppy-save"></span>保存</button>
	                      <button type="button" onclick="location.href='conf_popup_page-list.do'" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-log-out"></span> 关闭</button>
	                  </div>
                  </div>
                </form>
        </div>
    </div>
    <!-- end of main -->
  </body>
</html>
