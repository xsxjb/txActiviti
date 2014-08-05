<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "cms");%>
<%pageContext.setAttribute("currentMenu", "cms");%>
<!doctype html>
<html lang="en">
  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="demo.demo.input.title" text="你好"/></title>
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
	<div class="row-fluid m-widget-container-2">
	  <div class="span12">
		    <article class="m-widget-2">
                 <header class="header">
				  <h4 class="title"><i class="icon-user"></i>表字段</h4>
				  <div class="ctrl">
				    <a class="btn"><i class="icon-chevron-up"></i></a>
				  </div>
				</header>
		        <div class="content">
				  <table class="m-table table-hover table-bordered table-striped">
					<thead>
					  <tr>
					    <th>No</th>
						<th>字段</th>
						<th>字段名</th>
						<th>类型</th>
						<th>长度</th>
						<th>允许空</th>
						<th>默认值</th>
						<th>排序</th>
						<th>模型唯一标识</th>
					  </tr>
					</thead>
					<tbody>
					<c:forEach items="${tableInfoList}" var="item">
					  <tr>
					    <td>
						    <span class="input-group-addon">
					            <input type="checkbox">
					        </span>
				        </td>
					    <td>
					    <a href="${scopePrefix}/table/workspace-viewHistory.do?processInstanceId=${item.tableName}" class="btn btn-small btn-primary">${item.tableName}</a>
						</td>
						<td>${item.columnNo}</td>
						<td>${item.tableName}</td>
						<td>${item.tableName}</td>
						<td>${item.tableName}</td>
						<td>${item.tableName}</td>
						<td>${item.tableName}</td>
						<td>${item.tableName}</td>
					  </tr>
					  </c:forEach>
					  
					  <tr>
					    <td>
					        <button id="submitButton" class="btn a-submit"><spring:message code='core.input.save' text='保存'/></button>
					     </td>
					    <td>
					        <input id="cms-comment_1" type="text" name="tableName" value="" class="input-small"  maxlength="50" >
						</td>
						<td>
							<input id="cms-comment_2" type="text" name="columnNo" value="" size="20" class="text input-small"  maxlength="50" >
						</td>
						<td>
						    <div class="controls">
							  <input id="cms-comment_3" type="text" name="columnNo" value="" size="20" class="text input-small"  maxlength="50" />
						    </div>
						</td>
						<td>
							<input id="cms-comment_4" type="text" name="columnNo" value=""  class="text input-small"  maxlength="50" />
						</td>
						<td>
							<input id="cms-comment_5" type="text" name="columnNo" value=""  class="text input-small"  maxlength="50" />
						</td>
						<td>
							<input id="cms-comment_6" type="text" name="columnNo" value=""  class="text input-small"  maxlength="50" />
						</td>
						<td>
							<input id="cms-comment_7" type="text" name="columnNo" value=""  class="text input-small"  maxlength="50" />
						</td>
					  </tr>
					  
					</tbody>
				  </table>
				</div>
			  </article>	
			</div>
			
	  </div>
  </body>
</html>
