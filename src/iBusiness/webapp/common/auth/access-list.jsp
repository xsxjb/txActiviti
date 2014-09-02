<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "auth");%>
<%pageContext.setAttribute("currentMenu", "auth");%>
<!doctype html>
<html>

  <head>
    <%@include file="/common/meta.jsp"%>
    <title>资源列表</title>
    <%@include file="/common/center.jsp"%>
    <script type="text/javascript">
var config = {
    id: 'accessGrid',
    pageNo: ${page.pageNo},
    pageSize: ${page.pageSize},
    totalCount: ${page.totalCount},
    resultSize: ${page.resultSize},
    pageCount: ${page.pageCount},
    orderBy: '${page.orderBy == null ? "" : page.orderBy}',
    asc: ${page.asc},
    params: {
        'filter_LIKES_value': '${param.filter_LIKES_value}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'accessGridForm',
	exportUrl: 'access-export.do'
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
    <%@include file="/header/header-portal.jsp"%>

	<div class="span2"></div>

	<!-- start of main -->
	<div class="panel panel-default span10">
        <div class="panel-heading"><h4 class="title">查询</h4></div>
        <div class="panel-body">
	        <div id="accessSearch" class="content content-inner">
			  <form name="accessForm" method="post" action="access-list.do" class="form-inline">
			    <label for="access_name"><spring:message code="auth.access.list.search.value" text="资源"/>:</label>
			    <input type="text" id="access_value" name="filter_LIKES_value" value="${param.filter_LIKES_value}">
				<button class="btn btn-small" onclick="document.userForm.submit()">查询</button>
			  </form>
			</div>
        </div>
        
        <!-- tabs  -->
        <ul class="nav nav-tabs">
		  <li class="active"><a href="#levelone" data-toggle="tab">一级菜单</a></li>
		  <li><a href="#leveltwo" data-toggle="tab">二级菜单</a></li>
		  <li><a href="#levelthree" data-toggle="tab">三级菜单</a></li>
		</ul>
		<div id="myTabContent" class="tab-content">
		  <div id="levelone" class="tab-pane fade active in">
			        <div class="panel-body">
				        <div class="pull-left">
						  <button class="btn btn-small a-insert" onclick="location.href='access-input.do'"><spring:message code="core.list.create" text="新建"/></button>
						  <button class="btn btn-small a-remove" onclick="table.removeAll()"><spring:message code="core.list.delete" text="删除"/></button>
						</div>
				        <div class="pull-right">
						  每页显示
						  <select class="m-page-size">
						    <option value="10">10</option>
						    <option value="20">20</option>
						    <option value="50">50</option>
						  </select>
						  条
						</div>
			        </div>
			         <form id="accessGridForm" name="accessGridForm" method='post' action="access-remove.do" class="m-form-blank">
						    <table id="accessGrid" class="table table-hover table-bordered">
						      <thead>
						        <tr>
						          <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
						          <th class="sorting" name="id"><spring:message code="auth.access.list.id" text="编号"/></th>
						          <th class="sorting" name="type"><spring:message code="auth.access.list.type" text="类型"/></th>
						          <th class="sorting" name="value"><spring:message code="auth.access.list.value" text="资源"/></th>
						          <th class="sorting" name="perm"><spring:message code="auth.access.list.perm" text="权限"/></th>
						          <th class="sorting" name="priority"><spring:message code="auth.access.list.priority" text="排序"/></th>
						          <th class="sorting" name="descn"><spring:message code="auth.access.list.descn" text="备注"/></th>
						          <th width="50">&nbsp;</th>
						        </tr>
						      </thead>
						      <tbody>
						        <c:forEach items="${page.result}" var="item">
						        <tr>
						          <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.id}"></td>
						          <td>${item.id}</td>
						          <td>${item.type}</td>
						          <td>${item.value}</td>
						          <td>${item.perm.name}</td>
						          <td>${item.priority}</td>
						          <td>${item.descn}</td>
						          <td>
									<region:region-permission permission="app:write">
						            <a href="access-input.do?id=${item.id}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>&nbsp;
									</region:region-permission>
						          </td>
						        </tr>
						        </c:forEach>
						      </tbody>
						    </table>
					   </form>
					    <div class="m-page-info pull-left">
						  		共100条记录 显示1到10条记录
						</div>
						<div class="btn-group m-pagination pull-right">
							  <button class="btn btn-small">&lt;</button>
							  <button class="btn btn-small">1</button>
							  <button class="btn btn-small">&gt;</button>
						</div>
		  </div>
		  
		  <!-- 二级菜单 -->
		  <div id="leveltwo" class="tab-pane fade">
		    <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit.</p>
		  </div>
		  
		  <!-- 三级菜单 -->
		  <div id="levelthree" class="tab-pane fade">
		    <p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork.</p>
		  </div>
		</div>
        
        
        
        
        
        
        
        
    </div>
	<!-- end of main -->

  </body>

</html>
