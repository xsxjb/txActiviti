<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html lang="en">
    
  <head>
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
    <%@include file="/common/meta.jsp"%>
    <title>dashboard</title>
    <%@include file="/common/center.jsp"%>
    <!-- CSS  -->
    <link rel="stylesheet" href="${ctx}/plugin/ibusiness/imac/css/style.css" type="text/css" />
    <script type="text/javascript" src="${ctx}/plugin/ibusiness/imac/js/imac.js"></script>
    <!--  -->
    <script type="text/javascript">
	    function init() {
	        $(".launch").click();
	    }
    </script>
    
  </head>

  <body onload="init()">
    <!-- start of main -->
    <%@include file="/header/header-portal.jsp"%>
    
    <div class="panel panel-default ">
    <!-- 图标显示画布DIV  -->
      <div id="launchpad" style="width:100%">
          <!--***************************   ***********************************-->
          <c:forEach items="${deskMenuItems}" var="item">
                <div class="icon" style="width:30px">
                      <a href="${scopePrefix}${item.menuUrl}">
                          <img src="${ctx}/plugin/ibusiness/${item.iconUrl}" title="${item.menuName}"  />
                          <span class="">${item.menuName}</span>
                       </a>
                 </div>
          </c:forEach>
      </div>
      
      <div class="title"></div>
      <img src="${ctx}/plugin/ibusiness/imac/img/launchpad.png" title="launchpad"  class="launch"  />
    </div>
  </body>
</html>


