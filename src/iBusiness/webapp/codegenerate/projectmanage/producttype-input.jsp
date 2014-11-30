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
        <div class="panel-heading"><h4 class="panel-title">编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="producttype-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-typeno">分类编号:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-typeno" type="text" name="typeno" value="${model.typeno}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-typename">分类名称:</label>
                              <!-- 是否可编辑 -->
                                      <input id="code-typename" type="text" name="typename" value="${model.typename}" class="text required" >
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-rparentid">父节点ID:</label>
                              <!-- 是否可编辑 -->
                                      <div class="col-lg-3">    <select id="code-rparentid" name="rparentid" class="form-control" >          <option value="" >请选择</option>        <c:forEach items="${rparentidItems}" var="item">          <option value="${item.key}" ${item.key==model.rparentid? 'selected':''} >${item.value}</option>        </c:forEach>    </select></div>
                          </div>
                      <!-- 是否显示 -->
                          <div class="form-group">
                              <label class="col-lg-2 control-label" for="code-isleaf">是否叶子节点:</label>
                              <!-- 是否可编辑 -->
                                      <div class="col-lg-3">  <label class="radio"><input type="radio" name="isleaf" value="1" ${1==model.isleaf? 'checked':''} >是</label>  <label class="radio"><input type="radio" name="isleaf" value="2" ${2==model.isleaf? 'checked':''} >否</label> </div>
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
