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
        // 一级菜单
		var config1 = { id: 'leveloneGrid', pageNo: ${page1.pageNo},
		    pageSize: ${page1.pageSize},
		    totalCount: ${page1.totalCount},
		    resultSize: ${page1.resultSize},
		    pageCount: ${page1.pageCount},
		    orderBy: '${page1.orderBy == null ? "" : page1.orderBy}',
		    asc: ${page1.asc},
		    params: {
		        'filter_LIKES_value': '${param.filter_LIKES_value}'
		    },
			selectedItemClass: 'selectedItem1',
			gridFormId: 'leveloneGridForm'
		};
		var table1;
		$(function() {
		    table1 = new Table(config1);
		    table1.configPagination('.m-pagination1');
		    table1.configPageInfo('.m-page1-info');
		    table1.configPageSize('.m-page1-size');
		});
		// 二级菜单
		var config2 = { id: 'leveltwoGrid', pageNo: ${page2.pageNo},
		    pageSize: ${page2.pageSize},
		    totalCount: ${page2.totalCount},
		    resultSize: ${page2.resultSize},
		    pageCount: ${page2.pageCount},
		    orderBy: '${page2.orderBy == null ? "" : page2.orderBy}',
		    asc: ${page2.asc},
		    params: {
		        'filter_LIKES_value': '${param.filter_LIKES_value}'
		    },
			selectedItemClass: 'selectedItem2',
			gridFormId: 'leveltwoGridForm'
		};
		var table2;
		$(function() {
		    table2 = new Table(config2);
		    table2.configPagination('.m-pagination2');
		    table2.configPageInfo('.m-page2-info');
		    table2.configPageSize('.m-page2-size');
		});
		// 三级菜单
		var config3 = { id: 'levelthreeGrid', pageNo: ${page3.pageNo},
		    pageSize: ${page3.pageSize},
		    totalCount: ${page3.totalCount},
		    resultSize: ${page3.resultSize},
		    pageCount: ${page3.pageCount},
		    orderBy: '${page3.orderBy == null ? "" : page3.orderBy}',
		    asc: ${page3.asc},
		    params: {
		        'filter_LIKES_value': '${param.filter_LIKES_value}'
		    },
			selectedItemClass: 'selectedItem3',
			gridFormId: 'levelthreeGridForm'
		};
		var table3;
		$(function() {
		    table3 = new Table(config3);
		    table3.configPagination('.m-pagination3');
		    table3.configPageInfo('.m-page3-info');
		    table3.configPageSize('.m-page3-size');
		});
    </script>
  </head>

  <body>
    <%@include file="/header/header-portal.jsp"%>

	<div class="span1"></div>

	<!-- start of main -->
	<div class="panel panel-default span11">
        <!-- tabs  -->
        <ul class="nav nav-tabs">
		  <li class="${menuLevel == '1' ? 'active' : ''}"><a href="${scopePrefix}/menu/menu-levelone-list.do" >一级菜单</a></li>
		  <li class="${menuLevel == '2' ? 'active' : ''}"><a href="${scopePrefix}/menu/menu-leveltwo-list.do?menuLevelOne=0" >二级菜单</a></li>
		  <li class="${menuLevel == '3' ? 'active' : ''}"><a href="${scopePrefix}/menu/menu-levelthree-list.do?menuLevelOne=0&menuLevelTwo=0">三级菜单</a></li>
		</ul>
		<div id="myTabContent" class="tab-content">
		  <!-- 一级菜单 -->
		  <div id="levelone" class="tab-pane fade ${menuLevel == '1' ? 'active in' : ''}">
		          <div class="panel-body">
				        <div class="pull-left">
						  <button class="btn btn-small a-insert" onclick="location.href='menu-input.do?menuLevel=1&parentId=0'"><spring:message code="core.list.create" text="新建"/></button>
						  <button class="btn btn-small a-remove" onclick="table.removeAll()"><spring:message code="core.list.delete" text="删除"/></button>
						</div>
				        <div class="pull-right">
						  每页显示
						  <select class="m-page1-size">
						    <option value="10">10</option>
						    <option value="20">20</option>
						    <option value="50">50</option>
						  </select>
						  条
						</div>
			      </div>
			      <form id="leveloneGridForm" name="leveloneGridForm" method='post' action="menu-remove.do" class="m-form-blank">
						  <table id="leveloneGrid" class="table table-hover table-bordered">
						      <thead>
						        <tr>
						          <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
						          <th class="sorting" name="menuName"><spring:message code="auth.access.list.type" text="菜单名"/></th>
						          <th class="sorting" name="menuLevel"><spring:message code="auth.access.list.value" text="菜单级别"/></th>
						          <th class="sorting" name="menuUrl"><spring:message code="auth.access.list.perm" text="URL"/></th>
						          <th class="sorting" name="menuOrder"><spring:message code="auth.access.list.priority" text="排序"/></th>
						          <th width="50">&nbsp;</th>
						        </tr>
						      </thead>
						      <tbody>
						        <c:forEach items="${page1.result}" var="item">
						        <tr>
						          <td><input type="checkbox" class="selectedItem a-check" name="selectedItem1" value="${item.id}"></td>
						          <td>${item.menuName}</td>
						          <td>${item.menuLevel}</td>
						          <td>${item.menuUrl}</td>
						          <td>${item.menuOrder}</td>
						          <td>
									<region:region-permission permission="app:write">
						            	<a href="menu-input.do?id=${item.id}&menuLevel=1&parentId=0" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>&nbsp;
									</region:region-permission>
						          </td>
						        </tr>
						        </c:forEach>
						      </tbody>
					    </table>
					</form>
					<div class="m-page1-info pull-left">
						  		共100条记录 显示1到10条记录
					</div>
					<div class="btn-group m-pagination1 pull-right">
							  <button class="btn btn-small">&lt;</button>
							  <button class="btn btn-small">1</button>
							  <button class="btn btn-small">&gt;</button>
					</div>
		  </div>
		  
		  <!-- 二级菜单 -->
		  <div id="leveltwo" class="tab-pane fade ${menuLevel == '2' ? 'active in' : ''}">
		      <div class="panel-body">
				        <div class="pull-left">
							  <button class="btn btn-small a-insert" onclick="location.href='menu-input.do?menuLevel=2&parentId=${menuLevelOne}'">新建</button>
							  <button class="btn btn-small a-remove" onclick="table2.removeAll()"><spring:message code="core.list.delete" text="删除"/></button>
						 	  <!-- 一级父菜单 -->
						      <label class="control-label" for="menu_levelone">一级菜单:</label>
							  <select id="menu_levelone" name="menuLevelOne">
								  <c:forEach items="${levelOneInfos}" var="item">
								    <option value="${item.id}" ${item.id==menuLevelOne ? 'selected' : ''}>${item.menuName}</option>
								  </c:forEach>
							  </select>
							  <button class="btn btn-small" onclick="location.href='menu-leveltwo-list.do?menuLevel=2&menuLevelOne=${menuLevelOne}'">查询</button>
						</div>
				        <div class="pull-right">
						  每页显示
						  <select class="m-page2-size">
						    <option value="10">10</option>
						    <option value="20">20</option>
						    <option value="50">50</option>
						  </select>
						  条
						</div>
			      </div>
			      <form id="leveltwoGridForm" name="leveltwoGridForm" method='post' action="menu-remove.do" class="m-form-blank">
						  <table id="leveltwoGrid" class="table table-hover table-bordered">
						      <thead>
						        <tr>
						          <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
						          <th class="sorting" name="menuName"><spring:message code="auth.access.list.type" text="菜单名"/></th>
						          <th class="sorting" name="menuLevel"><spring:message code="auth.access.list.value" text="菜单级别"/></th>
						          <th class="sorting" name="menuUrl"><spring:message code="auth.access.list.perm" text="URL"/></th>
						          <th class="sorting" name="menuOrder"><spring:message code="auth.access.list.priority" text="排序"/></th>
						          <th width="50">&nbsp;</th>
						        </tr>
						      </thead>
						      <tbody>
						        <c:forEach items="${page2.result}" var="item">
						        <tr>
						          <td><input type="checkbox" class="selectedItem a-check" name="selectedItem2" value="${item.id}"></td>
						          <td>${item.menuName}</td>
						          <td>${item.menuLevel}</td>
						          <td>${item.menuUrl}</td>
						          <td>${item.menuOrder}</td>
						          <td>
									<region:region-permission permission="app:write">
						            <a href="menu-input.do?id=${item.id}&menuLevel=2&parentId=0" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>&nbsp;
									</region:region-permission>
						          </td>
						        </tr>
						        </c:forEach>
						      </tbody>
					    </table>
					</form>
					<div class="m-page2-info pull-left">
						  		共100条记录 显示1到10条记录
					</div>
					<div class="btn-group m-pagination2 pull-right">
							  <button class="btn btn-small">&lt;</button>
							  <button class="btn btn-small">1</button>
							  <button class="btn btn-small">&gt;</button>
					</div>
		  </div>
		  
		  <!-- 三级菜单 -->
		  <div id="levelthree" class="tab-pane fade ${menuLevel == '3' ? 'active in' : ''}">
		      <div class="panel-body">
				        <div class="pull-left">
				        	
							  <button class="btn btn-small" onclick="${scopePrefix}/menu/menu-input.do?menuLevel=2&parentId=${menuLevelTwo}">新建</button>
							  <button class="btn btn-small a-remove" onclick="table3.removeAll()"><spring:message code="core.list.delete" text="删除"/></button>
						  <form name="levelTwoForm" method="post" action="menu-levelthree-list.do" class="">
							  <!-- 一级父菜单 -->
						      <label class="control-label" for="menu_levelone">一级菜单:</label>
							  <select id="menu_levelone" name="menuLevelOne">
								  <c:forEach items="${levelOneInfos}" var="item">
								    <option value="${item.id}" ${item.id==menuLevelOne ? 'selected' : ''}>${item.menuName}</option>
								  </c:forEach>
							  </select>
							  <!-- 二级父菜单 -->
						      <label class="control-label" for="menu_leveltwo">二级菜单:</label>
							  <select id="menu_leveltwo" name="menuLevelTwo">
								  <c:forEach items="${levelTwoInfos}" var="item">
								    <option value="${item.id}" ${item.id==menuLevelTwo ? 'selected' : ''}>${item.menuName}</option>
								  </c:forEach>
							  </select>
							  <button class="btn btn-small" onclick="document.levelTwoForm.submit()">查询</button>
						  </form>
						</div>
				        <div class="pull-right">
						  每页显示
						  <select class="m-page3-size">
						    <option value="10">10</option>
						    <option value="20">20</option>
						    <option value="50">50</option>
						  </select>
						  条
						</div>
			      </div>
			      <form id="levelthreeGridForm" name="levelthreeGridForm" method='post' action="menu-remove.do" class="m-form-blank">
						  <table id="levelthreeGrid" class="table table-hover table-bordered">
						      <thead>
						        <tr>
						          <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
						          <th class="sorting" name="menuName"><spring:message code="auth.access.list.type" text="菜单名"/></th>
						          <th class="sorting" name="menuLevel"><spring:message code="auth.access.list.value" text="菜单级别"/></th>
						          <th class="sorting" name="menuUrl"><spring:message code="auth.access.list.perm" text="URL"/></th>
						          <th class="sorting" name="menuOrder"><spring:message code="auth.access.list.priority" text="排序"/></th>
						          <th width="50">&nbsp;</th>
						        </tr>
						      </thead>
						      <tbody>
						        <c:forEach items="${page3.result}" var="item">
						        <tr>
						          <td><input type="checkbox" class="selectedItem a-check" name="selectedItem3" value="${item.id}"></td>
						          <td>${item.menuName}</td>
						          <td>${item.menuLevel}</td>
						          <td>${item.menuUrl}</td>
						          <td>${item.menuOrder}</td>
						          <td>
									<region:region-permission permission="app:write">
						            <a href="menu-input.do?id=${item.id}&menuLevel=3&parentId=0" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>&nbsp;
									</region:region-permission>
						          </td>
						        </tr>
						        </c:forEach>
						      </tbody>
					    </table>
					</form>
					<div class="m-page3-info pull-left">
						  		共100条记录 显示1到10条记录
					</div>
					<div class="btn-group m-pagination3 pull-right">
							  <button class="btn btn-small">&lt;</button>
							  <button class="btn btn-small">1</button>
							  <button class="btn btn-small">&gt;</button>
					</div>

		  </div>
		</div>
        
    </div>
	<!-- end of main -->

  </body>

</html>
