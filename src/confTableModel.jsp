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
		    pageNo: ${page.pageNo},
		    pageSize: ${page.pageSize},
		    totalCount: ${page.totalCount},
		    resultSize: ${page.resultSize},
		    pageCount: ${page.pageCount},
		    orderBy: '${page.orderBy == null ? "" : page.orderBy}',
		    asc: ${page.asc},
		    params: {
		        'filter_LIKES_cmsCommentname': '${param.filter_LIKES_cmsCommentname}',
		        'filter_EQI_status': '${param.filter_EQI_status}'
		    },
			selectedItemClass: 'selectedItem',
			gridFormId: 'cmsCommentGridForm',
			exportUrl: 'cms-comment-export.do'
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
    <%@include file="/header/cms.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/cms.jsp"%>

	<!-- start of main -->
    <section id="m-main" class="span10">
	  
		    <article class="m-widget-2">
                 <header class="header">
				  <h4 class="title"><i class="icon-user"></i>存储模型</h4>
				  <div class="ctrl">
				    <a class="btn"><i class="icon-chevron-up"></i></a>
				  </div>
				</header>
				<div class="pull-left">
				  <region:region-permission permission="cmsComment:create">
				  <button class="btn btn-small a-insert" onclick="location.href='cms-comment-input.do'">新建</button>
				  </region:region-permission>
				  <region:region-permission permission="cmsComment:delete">
				  <button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button>
				  </region:region-permission>
				  <button class="btn btn-small a-export" onclick="table.exportExcel()">导出</button>
				</div>
		        <div class="content">
				  <table class="m-table table-hover" id=“tableModelGrid” >
					<thead>
					  <tr>
						<th>表存储模型</th>
						<th>表名</th>
						<th>唯一标识</th>
					  </tr>
					</thead>
					<tbody>
					<c:forEach items="${tableInfoList}" var="item">
					  <tr>
					    <td>
					        <a href="javascript:void(window.open('${scopePrefix}/table/confTableDetail.do?processInstanceId=${item.tableName}','newwindow','location=0,resizable=yes,directories=0,width=800, height=600'))" class="btn btn-small btn-primary">${item.tableName}</a>
						</td>
						<td>${item.columnNo}</td>
						<td>${item.tableName}</td>
					  </tr>
					  </c:forEach>
					</tbody>
				  </table>
				</div>
			  </article>	
			</div>
    </section>
	<!-- end of main -->
	</div>

  </body>

</html>