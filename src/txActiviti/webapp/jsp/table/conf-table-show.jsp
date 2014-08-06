<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "cms");%>
<%pageContext.setAttribute("currentMenu", "cms");%>
<!doctype html>
<html>

  <head>
    <%@include file="/common/meta.jsp"%>
    <title>评论列表</title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
		var config = {
		    id: 'tableModelGrid',
			selectedItemClass: 'selectedItem',
			gridFormId: 'tableGridForm'
		};
		
		var table;
		
		$(function() {
			table = new Table(config);
		    table.configPagination('.m-pagination');
		    table.configPageInfo('.m-page-info');
		    table.configPageSize('.m-page-size');
		});
    </script>
  </head>

  <body>
    <%@include file="/header/table.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/table-manage.jsp"%>

	<!-- start of main -->
    <section id="m-main" class="span10">
		    <article class="m-widget-2">
                 <header class="header">
				  <h4 class="title"><i class="icon-user"></i>表存储模型</h4>
				  <div class="ctrl">
				    <a class="btn"><i class="icon-chevron-up"></i></a>
				  </div>
				</header>
				<div class="pull-left">
				  <region:region-permission permission="tableComment:create">
				  	<button class="btn btn-small a-insert" onclick="location.href='conf-table-insert.do'">新建</button>
				  </region:region-permission>
				  <region:region-permission permission="tableComment:delete">
				  	<button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button>
				  </region:region-permission>
				</div>
		        <div class="content">
			        <form id="tableGridForm" name="tableGridForm" method='post' action="conf-table-remove.do" class="m-form-blank">
						<table class="m-table table-hover table-bordered" id=“tableModelGrid” >
							<thead>
							  <tr>
							    <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
								<th>表存储模型</th>
								<th>表名</th>
								<th>唯一标识</th>
							  </tr>
							</thead>
							<tbody>
							<c:forEach items="${tableInfoList}" var="item">
							  <tr>
							    <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.uuId}"></td>
							    <td>
							        <!-- 
							            <a href="javascript:void(window.open('${scopePrefix}/table/conf-table-detail-show.do?tableName=${item.tableName}','newwindow','location=0,resizable=yes,directories=0,width=800, height=600'))" class="btn btn-small btn-primary">${item.tableName}</a>
							         -->
							        <a href="conf-table-detail-show.do?tableName=${item.tableName}" class="btn btn-small btn-primary">${item.tableName}</a>
								    
								</td>
								<td>${item.tableNameComment}</td>
								<td>${item.uuId}</td>
							  </tr>
							  </c:forEach>
							</tbody>
						</table>
					</form>
				</div>
			  </article>	
			</div>
    </section>
	<!-- end of main -->
	</div>

  </body>

</html>