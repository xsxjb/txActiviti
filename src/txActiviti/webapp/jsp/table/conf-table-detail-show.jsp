<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "cms");%>
<%pageContext.setAttribute("currentMenu", "cms");%>
<!doctype html>
<html lang="en">
  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="demo.demo.input.title" text="表列字段设置"/></title>
    <!-- Bootstrap -->
    <%@include file="/common/s.jsp"%>
    
    <style type="text/css">
		.m-widget-container-2 {
			width: 96%;
			margin-left: 2%;
		}
		.m-widget-2 {
			margin-top: 0px;
			margin-bottom: 20px;
			border-radius: 3px;
			box-shadow: #E6E6E6 0px 1px 1px 0px;
		}
		.m-widget-2 .header {
			height: 20px;
			padding: 5px 15px;
			border: 1px solid #C2C2C3;
			padding-left: 10px;
			border-radius: 3px 3px 0px 0px;
			background-color: #CCCCCC;
			box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.5) inset;
			background: linear-gradient(to bottom, #FAFAFA 0%, #EFEFEF 100%) repeat scroll 0 0 transparent;
			text-shadow: 0 1px 0 #FFFFFF;
			color: #333333;
		}
		.m-widget-2 .header .title {
			float: left;
			margin: 0px;
			font-size: 14px;
		}
		.m-widget-2 .header .ctrl {
			float: right;
		}
		.m-widget-2 .header .ctrl .btn {
			margin: 0px;
			padding-left: 3px;
			padding-right: 3px;
			padding-top: 0px;
			padding-bottom: 0px;
		}
		.m-widget-2 .content {
			border-left: 1px solid #C2C2C3;
			border-right: 1px solid #C2C2C3;
			border-bottom: 1px solid #C2C2C3;
			border-radius: 0px 0px 3px 3px;
			height: 200px;
			overflow: hide;
		}
		.m-widget-2 .content.content-inner {
			padding-left: 10px;
			padding-top:10px;
			font-size: 12px;
		}
		.m-widget-2 .content .m-table {
			margin-top: 0px;
			margin-bottom: 0px;
		}
	</style>
  </head>
  <body>
      <%@include file="/header/table.jsp"%>
      <div class="row-fluid">
	  <%@include file="/menu/table-manage.jsp"%>
	      <!-- start of main -->
	      <section id="m-main" class="span10">
			  <article class="m-widget">
		        <header class="header">
				  <h4 class="title">添加</h4>
				  <div class="ctrl">
				    <a class="btn"><i id="bpmCategorySearchIcon" class="icon-chevron-up"></i></a>
				  </div>
				</header>
		        <div id="bpmCategorySearch" class="content content-inner">
				    <form name="tableForm" method="post" action="${scopePrefix}/table/conf-table-columns-save.do?tableName=${tableName}" class="form-inline">
					    <label for="columnValue">字段名:</label>
					    <input type="text" id="columnValue" name="columnValue" value="" class="input-small" >
					    <label for="columnName">字段标题:</label>
					    <input type="text" id="columnName" name="columnName" value=""  class="input-small" >
					    <label for="columnType">字段类型:</label>
					    <td> <select id="columnType" name="columnType" class="form-control" >
						      <option>VARCHAR</option>
						      <option>INT</option>
						      <option>DOUBLE</option>
						      <option>NUMBER</option>
						  </select>
						</td>
					    <label for="columnSize">长度:</label>
					    <input type="text" id="columnSize" name="columnSize" value="" class="input-small"  >
					    <label for="isNull">允许空:</label>
					    <input type="text" id="isNull" name="isNull" value=""  class="input-small" >
					    <label for="defaultValue">默认值:</label>
					    <input type="text" id="defaultValue" name="defaultValue" value=""  class="input-small" >
					    <label for="columnNo">字段排序编号:</label>
					    <input type="text" id="columnNo" name="columnNo" value=""  class="input-small" >
						<button class="btn a-cancel" onclick="document.tableForm.submit()">保存</button>
						<button type="button" onclick="history.back();" class="btn a-cancel"><spring:message code='core.input.back' text='返回'/></button>
				    </form>
				</div>
			  </article>
	        <!-- /////////////////////////////////////////////////////////////////////////////////// -->
		    <article class="m-widget-2">
		         <header class="header">
				  <h4 class="title">表列字段</h4>
				  <div class="ctrl">
				    <a class="btn"><i id="bpmCategorySearchIcon" class="icon-chevron-up"></i></a>
				  </div>
				</header>
		        <div class="content">
		          <table class="m-table table-hover table-bordered table-striped">
					<thead>
					  <tr>
					    <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
						<th>字段</th>
						<th>字段标题</th>
						<th>类型</th>
						<th>长度</th>
						<th>允许空</th>
						<th>默认值</th>
						<th>排序</th>
					  </tr>
					</thead>
					<tbody>
					<c:forEach items="${tableInfoList}" var="item">
					  <tr>
					    <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.columnValue}"></td>
					    <td>
					    <a href="${scopePrefix}/table/workspace-viewHistory.do?processInstanceId=${item.columnValue}" class="btn btn-small btn-primary">${item.columnValue}</a>
						</td>
						<td>${item.columnName}</td>
						 <td>${item.columnType}</td>
						<td>${item.columnSize}</td>
						<td>${item.isNull}</td>
						<td>${item.defaultValue}</td>
						<td>${item.columnNo}</td>
					  </tr>
					  </c:forEach>
					  
					</tbody>
				  </table>
				</div>
			  </article>	
	    </section>
    <!-- end of main -->
	</div>			
  </body>
</html>
