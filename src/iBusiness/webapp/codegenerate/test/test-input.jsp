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
                          <label class="col-lg-2 control-label" for="code-mapip">地图-IP:</label>
                          <div class="col-lg-3">   <input id="code-mapip" type="text" name="mapip" value="${model.mapip}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-mapport">地图-PORT端口:</label>
                          <div class="col-lg-3">   <input id="code-mapport" type="text" name="mapport" value="${model.mapport}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-mapcity">地图-CITY城市:</label>
                          <div class="col-lg-3">   <input id="code-mapcity" type="text" name="mapcity" value="${model.mapcity}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-mapshowonline">地图-是否显示在线地图:</label>
                          <div class="col-lg-3">   <input id="code-mapshowonline" type="text" name="mapshowonline" value="${model.mapshowonline}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-mapgrid">地图-初始级别:</label>
                          <div class="col-lg-3">   <input id="code-mapgrid" type="text" name="mapgrid" value="${model.mapgrid}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-mapcenterlongitude">地图-地图初始页面中心经度:</label>
                          <div class="col-lg-3">   <input id="code-mapcenterlongitude" type="text" name="mapcenterlongitude" value="${model.mapcenterlongitude}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-mapcenterlatitude">地图-地图初始页面中心纬度:</label>
                          <div class="col-lg-3">   <input id="code-mapcenterlatitude" type="text" name="mapcenterlatitude" value="${model.mapcenterlatitude}" class="text required" ></div>
                          
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
