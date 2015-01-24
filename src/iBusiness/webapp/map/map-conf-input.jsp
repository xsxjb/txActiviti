<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>地图配置页面编辑</title>
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
        <div class="panel-heading"><h4 class="panel-title">地图配置页面编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="map-conf-save.do" class="form-horizontal">
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-mapIp">地图-IP:</label>
                          <div class="col-lg-3">   <input id="code-mapIp" type="text" name="mapIp" value="${model.mapIp}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-mapPort">地图-PORT端口:</label>
                          <div class="col-lg-3">   <input id="code-mapPort" type="text" name="mapPort" value="${model.mapPort}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-mapCity">地图-CITY城市:</label>
                          <div class="col-lg-3">   <input id="code-mapCity" type="text" name="mapCity" value="${model.mapCity}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-mapShowOnline">地图-是否显示在线地图:</label>
                          <div class="col-lg-3">   <input id="code-mapShowOnline" type="text" name="mapShowOnline" value="${model.mapShowOnline}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-mapGrid">地图-初始级别:</label>
                          <div class="col-lg-3">   <input id="code-mapGrid" type="text" name="mapGrid" value="${model.mapGrid}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-mapCenterLongitude">地图-地图初始页面中心经度:</label>
                          <div class="col-lg-3">   <input id="code-mapCenterLongitude" type="text" name="mapCenterLongitude" value="${model.mapCenterLongitude}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-mapCenterLatitude">地图-地图初始页面中心纬度:</label>
                          <div class="col-lg-3">   <input id="code-mapCenterLatitude" type="text" name="mapCenterLatitude" value="${model.mapCenterLatitude}" class="text required" ></div>
                          
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
