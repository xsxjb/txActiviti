<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>编辑</title>
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
		        'id': '${model.id}'
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
		// 提交方法--通过传入路径 提交到不同的controller
		function mainFormSubmit(path){
			$('#mainForm').attr('action', path).submit();
		}
		
		// 表单验证JS
		$(function() {
		    $("#mainForm").validate({
		        submitHandler: function(form) {
		            if (typeof(bootbox) != 'undefined') {
					    bootbox.animate(false);
					    var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
		            }
		            form.submit();
		        },
		        errorClass: 'validate-error'
		    });
		})
    </script>
  </head>
  <body>
    <%@include file="/ibusiness/header/header-portal.jsp"%>
    <div class="row">
	<div class="span2"></div>
	<!-- start of main -->
	<div class="panel panel-default col-md-10"> 
        <div class="panel-heading"><h4 class="panel-title">流程内容</h4></div>
        <div class="panel-body">
		<div class="content content-inner">
		       <form id="mainForm" method="post" action="bom-save.do" class="form-horizontal">
		           <div class="controls">
					      <button id="submitButton" class="btn btn-default btn-sm a-submit">保存</button>
					      <button type="button" onclick="location.href='bom-list.do'" class="btn btn-default btn-sm a-cancel">返回</button>
				   </div>
				   <input type="hidden" name="flowId" value="${flowId}">
				   <c:if test="${model != null}">
				       <input type="hidden" name="id" value="${model.id}">
				   </c:if>
                             <div class="form-group">
							      <label class="control-label col-lg-2" for="code-projectno">项目编号:</label>
							      <!-- 是否可编辑 -->
	                                   <div class="col-lg-3">   <input id="code-projectno" type="text" name="projectno" value="${model.projectno}" class="text required" ></div>
							
							      <label class="control-label col-lg-2" for="code-projectname">项目名:</label>
							      <!-- 是否可编辑 -->
	                                   <div class="col-lg-3">   <input id="code-projectname" type="text" name="projectname" value="${model.projectname}" class="text required" ></div>
                            </div>
							
                             <div class="form-group">
							      <label class="control-label col-lg-2" for="code-customername">名称客户:</label>
							      <!-- 是否可编辑 -->
	                                   <div class="col-lg-3">   <input id="code-customername" type="text" name="customername" value="${model.customername}" class="text required" ></div>
							
							      <label class="control-label col-lg-2" for="code-producttype">产品类型:</label>
							      <!-- 是否可编辑 -->
	                                   <div class="col-lg-3">   <input id="code-producttype" type="text" name="producttype" value="${model.producttype}" class="text required" ></div>
                            </div>
							
                             <div class="form-group">
							      <label class="control-label col-lg-2" for="code-productflowid">产品件号:</label>
							      <!-- 是否可编辑 -->
	                                   <div class="col-lg-3">   <input id="code-productflowid" type="text" name="productflowid" value="${model.productflowid}" class="text required" ></div>
							
							      <label class="control-label col-lg-2" for="code-productno">产品编号:</label>
							      <!-- 是否可编辑 -->
	                                   <div class="col-lg-3">   <input id="code-productno" type="text" name="productno" value="${model.productno}" class="text required" ></div>
                            </div>
							
                             <div class="form-group">
							      <label class="control-label col-lg-2" for="code-productname">产品名:</label>
							      <!-- 是否可编辑 -->
	                                   <div class="col-lg-3">   <input id="code-productname" type="text" name="productname" value="${model.productname}" class="text required" ></div>
							
							      <label class="control-label col-lg-2" for="code-productmodel">规格型号:</label>
							      <!-- 是否可编辑 -->
	                                   <div class="col-lg-3">   <input id="code-productmodel" type="text" name="productmodel" value="${model.productmodel}" class="text required" ></div>
                            </div>
							
                             <div class="form-group">
							      <label class="control-label col-lg-2" for="code-productunit">单位:</label>
							      <!-- 是否可编辑 -->
	                                   <div class="col-lg-3">   <input id="code-productunit" type="text" name="productunit" value="${model.productunit}" class="text required" ></div>
							
							      <label class="control-label col-lg-2" for="code-unitprice">单价:</label>
							      <!-- 是否可编辑 -->
	                                   <div class="col-lg-3">  <input id="code-unitprice" type="text" name="unitprice" value="${model.unitprice}" class="text number" ></div>
                            </div>
							
                             <div class="form-group">
							      <label class="control-label col-lg-2" for="code-productnumber">数量:</label>
							      <!-- 是否可编辑 -->
	                                   <div class="col-lg-3">  <input id="code-productnumber" type="text" name="productnumber" value="${model.productnumber}" class="text number" ></div>
							
							      <label class="control-label col-lg-2" for="code-designuser">原料设计员:</label>
							      <!-- 是否可编辑 -->
	                                   <div class="col-lg-3">   <input id="code-designuser" type="text" name="designuser" value="${model.designuser}" class="text required" ></div>
                            </div>
							
                             <div class="form-group">
							      <label class="control-label col-lg-2" for="code-audituser">审核人员:</label>
							      <!-- 是否可编辑 -->
	                                   <div class="col-lg-3">   <input id="code-audituser" type="text" name="audituser" value="${model.audituser}" class="text required" ></div>
                            </div>
							
				</form>
		</div>
        </div> 
        <!-- ==================== 子表 ========================================== -->
        <div class="panel-heading"><h4 class="panel-title">列表</h4></div>
	    <div class="panel-body">
			    <div class="pull-left">
				    <button class="btn btn-default btn-sm a-insert" onclick="location.href='bom_materials-input.do?id=${model.id}&subId=&flowId=${flowId}'">新建</button>
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
				<form id="gridForm" name="gridForm" method='post' action="bom-remove.do" class="m-form-blank">
				  <table id="codeGrid" class="table table-hover table-bordered">
				      <thead>
					      <tr>
					          <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
			                      <th class="sorting">分类编号</th>
			                      <th class="sorting">原料编号</th>
			                      <th class="sorting">原料名称</th>
			                      <th class="sorting">规格型号</th>
			                      <th class="sorting">价格</th>
			                      <th class="sorting">单位</th>
			                      <th class="sorting">数量</th>
			                      <th class="sorting">备货类型</th>
			                      <th class="sorting">备注</th>
					          <th width="80">&nbsp;</th>
					      </tr>
					    </thead>
						    <tbody>
						      <c:forEach items="${page.result}" var="item">
								  <tr>
								        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.id}"></td>
									            <td>${item.materialtypeno}</td>
									            <td>${item.materialno}</td>
									            <td>${item.materialname}</td>
									            <td>${item.model}</td>
									            <td>${item.materialprice}</td>
									            <td>${item.materialunit}</td>
									            <td>${item.materialnum}</td>
									            <td>${item.stocktype}</td>
									            <td>${item.comments}</td>
								        <td>
								          <a href="bom_materials-input.do?id=${model.id}&subId=${item.id}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
	<!-- end of main -->
	</div>
  </body>
</html>
