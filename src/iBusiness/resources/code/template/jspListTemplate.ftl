<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>

  <head>
    <%@include file="/common/meta.jsp"%>
    <title>${confForm.formTitle}列表</title>
    <%@include file="/common/center.jsp"%>
    <script type="text/javascript">
		var config = {
		    id: 'codeGrid',
		    pageNo: ${"$" + "{page.pageNo}"},
		    pageSize: ${"$" + "{page.pageSize}"},
		    totalCount:${"$" + "{page.totalCount}"},
		    resultSize: ${"$" + "{page.resultSize}"},
		    pageCount: ${"$" + "{page.pageCount}"},
		    orderBy: '${"$" + "{page.orderBy == null ? "+ "''" +" : page.orderBy}"}',
		    asc: ${"$" + "{page.asc}"},
		    params: {
		        'filter_LIKES_id': '${"$" + "{param.filter_LIKES_id}"}'
		        <#list formTableColumnList as formTableColumn>
				    <#if  '1' ==formTableColumn.fcQuery >
		                ,'filter_LIKES_${formTableColumn.tableColumnLower}': '${'$' + '{param.filter_LIKES_${formTableColumn.tableColumnLower}}'}'
		            </#if>
		        </#list>
		    },
			selectedItemClass: 'selectedItem',
			gridFormId: 'gridForm',
	        exportUrl: '${entityName?uncap_first}-export.do'
		};

		var table;
		$(function() {
			table = new Table(config);
		    table.configPagination('.m-pagination');
		    table.configPageInfo('.m-page-info');
		    table.configPageSize('.m-page-size');
		});
		
    <#if  confForm.isImportExport=1 >
		// 导入excel
		function importExcel(){
			 $("#msgInfoForm").submit();
		}
	</#if>
    </script>
  </head>

  <body>
    <%@include file="/ibusiness/header/header-portal.jsp"%>
    <div class="row">
    <div class="col-lg-1 col-md-1 col-sm-1"></div>
	<!-- start of main -->
	<div class="panel panel-default col-lg-10 col-md-10 col-sm-10">
	<!-- 查询条件 -->
	<#if  confForm.isQuery=1 >
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">查询</h4></div>
          <div class="panel-body">
	          <div id="search" class="content content-inner">
				  <form name="cgForm" method="post" action="${entityName?uncap_first}-list.do" class="form-inline">
				    <div class="form-group">
				        <#list formTableColumnList as formTableColumn>
				            <#if  '1' ==formTableColumn.fcQuery >
				                <label for="code_table_${formTableColumn.tableColumnLower}">${formTableColumn.formColumnTitle}:</label>
				                <input type="text" id="code_table_${formTableColumn.tableColumnLower}" name="filter_LIKES_${formTableColumn.tableColumnLower}" value="${'$' + '{param.filter_LIKES_${formTableColumn.tableColumnLower}}'}">
				            </#if>
				        </#list>
					    <button class="btn btn-primary btn-sm" onclick="document.cgForm.submit()"><span class="glyphicon glyphicon-search"></span>查询</button>
					</div>
				 </form>
			  </div>
		  </div>
      </#if>
	   <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">${confForm.formTitle}列表</h4></div>
       <div class="panel-body">
		    <div class="pull-left">
			    <button class="btn btn-primary btn-sm a-insert" href="${entityName?uncap_first}-input.do" data-target="#modalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-tasks"></span>新建</button>
			    <button class="btn btn-primary btn-sm a-remove" onclick="table.removeAll()"><span class="glyphicon glyphicon-trash"></span>删除</button>
            <#if  confForm.isExcelExport=1 >
			    <button class="btn btn-primary btn-sm" onclick="table.exportExcel()"><span class="glyphicon glyphicon-export"></span>导出Excel</button>
			</#if>
		    <#if  confForm.isImportExport=1 >
			    <button class="btn btn-primary btn-sm"  onclick="importExcelAdd.click()"><span class="glyphicon glyphicon-import"></span>导入Excel</button>
			    <form id="msgInfoForm" method="post" action="${entityName?uncap_first}-importExcel.do" class="form-horizontal" enctype="multipart/form-data">
                    <input id="importExcelAdd" type="file" name="attachment"  style="display:none;" onChange="importExcel()"> 
                </form>
            </#if>
            
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
			<form id="gridForm" name="gridForm" method='post' action="${entityName?uncap_first}-remove.do" class="m-form-blank">
			  <table id="codeGrid" class="table table-hover table-striped">
			      <thead>
				      <tr>
				        <th width="30" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
					        <#list columns as po>
					            <#if po.fcDisplay="1">
					                <th class="sorting">${po.filedComment}</th>
					            </#if>
					        </#list>
				        <th width="30">${"&nbsp"};</th>
				      </tr>
				    </thead>
					    <tbody>
					      <c:forEach items="${'$' + '{page.result}'}" var="item" varStatus="status">  
					      <tr class="${'$' + '{status.index%2==1? \'active\':\'\'}'}">
					        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${'$' + '{item.id}'}"></td>
					        <#list columns as po>
					            <#if po.fcDisplay="1">
						            <td>${"$" + "{item.${po.fieldName}}"}</td>
						        </#if>
					        </#list>
					        <td>
					          <a href="${entityName?uncap_first}-input.do?id=${'$' + '{item.id}'}" class="a-update" data-target="#modalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-pencil"></span></a>
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
			  <button class="btn btn-small">${"&lt"};</button>
			  <button class="btn btn-small">1</button>
			  <button class="btn btn-small">${"&gt"};</button>
			</div>
		    <div class="m-clear"></div>
	      </article>
	  </div>
	  <!-- 模态框 -->
	  <div id="modalInput" class="modal fade" tabindex="-1" style="display: none;" data-backdrop="static">
		  <div class="modal-dialog modal-lg">
			  <div class="modal-content" style="text-align: center;height: 600px">
			  </div>
		  </div>
	  </div>
	<!-- end of main -->
	</div>
  </body>
</html>
