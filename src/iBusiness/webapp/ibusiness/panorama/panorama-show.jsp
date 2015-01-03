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
    <div class="row">
        <div class="col-lg-1"></div> 
		<div class="panel panel-default col-md-10 " > 
			<div class="panel-heading"><h4 class="panel-title">查询</h4></div>
	          <div class="panel-body">
		          <div id="search" class="content content-inner">
					  <form name="cgForm" method="post" action="customer_info-list.do" class="form-inline">
					    <div class="form-group">
			                <label for="code_table_customername">地点:</label>
			                <input type="text" name="filter_LIKES_customername" value="">
						    <a href="#" class="btn btn-default btn-sm">查询</a>
						</div>
					 </form>
				  </div>
			  </div>
		    <div class="panel-heading"><h4 class="panel-title">全景图展示</h4></div>
	        <div class="panel-body">
				<div id="tabContent" class="tab-content">
	              <!-- 全景 -->
	              <div id="popConfTaskNodeDiv" style="height:600px;" >
	                 <iframe id="panoramaIframe" src="/iBusiness/default/ibusiness/panorama/html/360.Html" width="100%" height="100%" ></iframe>
	              </div>
		        </div>
		    </div>
	    </div>
    </div>
  </body>
</html>
