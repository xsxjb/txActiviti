<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>

  <head>
    <%@include file="/common/meta.jsp"%>
    <title>列表</title>
    <%@include file="/common/center.jsp"%>
    <script type="text/javascript">
		var config = {
		    id: 'codeGrid',
		    pageNo: ${page.pageNo},
		    pageSize: ${page.pageSize},
		    totalCount:${page.totalCount},
		    resultSize: ${page.resultSize},
		    pageCount: ${page.pageCount},
		    orderBy: '${page.orderBy == null ? '' : page.orderBy}',
		    asc: ${page.asc},
		    params: {
		        'filter_LIKES_id': '${param.filter_LIKES_id}'
		    },
			selectedItemClass: 'selectedItem',
			gridFormId: 'gridForm'
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
    <%@include file="/ibusiness/header/header-portal.jsp"%>
    <div class="row">
    <div class="span2"></div>
	<!-- start of main -->
	<div class="panel panel-default col-md-10 ">
        <!-- tabs  -->
        <ul class="nav nav-tabs">
		  <li class="${flowType =='0' ? 'active' : ''} "><a href="${scopePrefix}/project_approval/project_approval-list.do?flowId=${flowId}&flowType=0" >待办</a></li>
		  <li class="${flowType =='1' ? 'active' : ''} "><a href="${scopePrefix}/project_approval/project_approval-list.do?flowId=${flowId}&flowType=1" >已办</a></li>
		</ul>
		<div id="tabContent" class="tab-content">
		    <!-- ========================== 待办流程信息 =================================================== -->
			    <c:if test="${flowType == '0'}">
			    <div id=bpmBase class="tab-pane fade  ${flowType == '0'? 'active in' : ''}">
				    <!-- 查询条件 -->
			        <div class="panel-heading"><h4 class="panel-title">待办流程查询</h4></div>
			        <div class="panel-body">
				          <div id="search" class="content content-inner">
							  <form name="bpmFlowForm" method="post" action="project_approval-list.do?flowId=${flowId}&flowType=0" class="form-inline">
							    <div class="form-group">
					                <label for="code_table_flownamebpm">待办流程标题:</label>
					                <input type="text" id="code_table_tasktitle" name="filter_LIKES_tasktitle" value="${param.filter_LIKES_tasktitle}">
								    <button class="btn btn-default btn-sm" onclick="document.bpmFlowForm.submit()">查询</button>
								</div>
							 </form>
						  </div>
					</div>
			        <div class="panel-body">
					    <div class="pull-left">
						    <button class="btn btn-default btn-sm a-insert" onclick="location.href='project_approval-input.do?flowId=${flowId}'">新建</button>
						    <button class="btn btn-default btn-sm a-remove" onclick="table.removeAll()">删除</button>
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
					    <div class="m-clear"></div>
				    </div>
				    <div class="content">
						<form id="gridForm" name="gridForm" method='post' action="project_approval-remove.do" class="m-form-blank">
						    <input type="hidden" name="flowId" value="${flowId}">
						  <table id="codeGrid" class="table table-hover table-bordered">
						      <thead>
							      <tr>
							          <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
					                  <th width="80">&nbsp;</th>
					                  <th class="sorting">日期</th>
					                  <th class="sorting">流程节点</th>
					                  <th class="sorting">来自用户</th>
					                  <th class="sorting">流程标题</th>
							          <th width="60">&nbsp;</th>
							      </tr>
							    </thead>
								    <tbody>
								      <c:forEach items="${page.result}" var="item">
								      <tr>
								        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.id}"></td>
								        <td>
								          <a href="project_approval-input.do?flowId=${flowId}&id=${item.id}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
								        </td>
								        <td><fmt:formatDate value="${item.createdatebpm}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								        <td>${item.nodename}</td>
								        <td>${item.username}</td>
								        <td>${item.tasktitle}</td>
								        <td>
								            <a target="_blank"  href="project_approval-graph.do?flowId=${flowId}&id=${item.id}" class="a-update"><spring:message code="core.list.edit" text="图"/></a>
								        </td>
								      </tr>
								      </c:forEach>
								    </tbody>
								  </table>
								</form>
				      </div>
					  <article>
					    <div class="m-page-info pull-left">
						  共100条记录 显示1到10条记录
						</div>
						<div class="btn-group m-pagination pull-right">
						  <button class="btn btn-small">&lt;</button>
						  <button class="btn btn-small">1</button>
						  <button class="btn btn-small">&gt;</button>
						</div>
					    <div class="m-clear"></div>
				      </article>
			  </div>
			  </c:if>
			  
			  <!-- ========================== 已办流程信息 =================================================== -->
			   <c:if test="${flowType =='1'}">
			   <div id=bpmBase class="tab-pane fade  ${flowType == '1' ?' active in' : ''}">
				    <!-- 查询条件 -->
			        <div class="panel-body">
				          <div id="search" class="content content-inner">
							  <form name="bpmFlowForm" method="post" action="project_approval-list.do" class="form-inline">
							    <div class="form-group">
					                <label for="code_table_flownamebpm">已办流程标题:</label>
					                <input type="text" id="code_table_flownamebpm" name="filter_LIKES_flownamebpm" value="${param.filter_LIKES_flownamebpm}">
								    <button class="btn btn-default btn-sm" onclick="document.bpmFlowForm.submit()">查询</button>
								</div>
							 </form>
						  </div>
					</div>
			        <div class="panel-body">
						<div class="pull-right">
						  每页显示
						  <select class="m-page-size">
						    <option value="10">10</option>
						    <option value="20">20</option>
						    <option value="50">50</option>
						  </select>
						  条
						</div>
					    <div class="m-clear"></div>
				    </div>
				    <div class="content">
						<form id="gridForm" name="gridForm" method='post' action="project_approval-remove.do" class="m-form-blank">
						  <input type="hidden" name="flowId" value="${flowId}">
						  <table id="codeGrid" class="table table-hover table-bordered">
						      <thead>
							      <tr>
							          <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
					                  <th class="sorting">日期</th>
					                  <th class="sorting">流程节点</th>
					                  <th class="sorting">来自用户</th>
					                  <th class="sorting">流程标题</th>
							          <th width="60">&nbsp;</th>
							      </tr>
							    </thead>
								    <tbody>
								      <c:forEach items="${page.result}" var="item">
								      <tr>
								        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.id}"></td>
								        <td><fmt:formatDate value="${item.createdatebpm}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								        <td>${item.nodename}</td>
								        <td>${item.assigneeuser}</td>
								        <td>${item.tasktitle}</td>
								        <td>
								            <a href="${scopePrefix}/bpm-workspace/workspace-viewHistory.do?processInstanceId=${item.executionid}" class="a-update"><spring:message code="core.list.edit" text="历史"/></a>
								        </td>
								      </tr>
								      </c:forEach>
								    </tbody>
								  </table>
								</form>
				      </div>
					  <article>
					    <div class="m-page-info pull-left">
						  共100条记录 显示1到10条记录
						</div>
						<div class="btn-group m-pagination pull-right">
						  <button class="btn btn-small">&lt;</button>
						  <button class="btn btn-small">1</button>
						  <button class="btn btn-small">&gt;</button>
						</div>
					    <div class="m-clear"></div>
				      </article>
			  </div>
			  </c:if>
			  
		   </div>
	    </div>
	<!-- end of main -->
	</div>
  </body>
</html>
