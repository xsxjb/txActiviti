<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>原料分解编辑</title>
    <%@include file="/common/center.jsp"%>
    <script type="text/javascript">
        // 实例化config对象
        var bom_materialsConfig = {
		    id: 'bom_materialsCodeGrid',
		    pageNo: ${bom_materialsPage.pageNo},
		    pageSize: ${bom_materialsPage.pageSize},
		    totalCount:${bom_materialsPage.totalCount},
		    resultSize: ${bom_materialsPage.resultSize},
		    pageCount: ${bom_materialsPage.pageCount},
		    orderBy: '${bom_materialsPage.orderBy == null ? '' : bom_materialsPage.orderBy}',
		    asc: ${bom_materialsPage.asc},
		    params: {
		        'id': '${model.id}'
		    },
			selectedItemClass: 'bom_materialsSelectedItem',
			gridFormId: 'bom_materialsGridForm',
			exportUrl: 'bom_materials-export.do'
		};
        // 实例化table对象
		var bom_materialsTable;
		$(function() {
			bom_materialsTable = new Table(bom_materialsConfig);
		    bom_materialsTable.configPagination('.bom_materialsM-pagination');
		    bom_materialsTable.configPageInfo('.bom_materialsM-page-info');
		    bom_materialsTable.configPageSize('.bom_materialsM-page-size');
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
	<div class="col-lg-1"></div>
	<!-- start of main -->
	<div class="panel panel-default col-lg-10"> 
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">原料分解流程</h4></div>
        <div class="panel-body">
		<div class="content content-inner">
		       <form id="mainForm" method="post" action="bom-save.do" class="form-horizontal">
		           <div class="controls">
					      <button id="submitButton" class="btn btn-primary btn-sm a-submit"><span class="glyphicon glyphicon-floppy-save"></span>保存</button>
					      <button type="button" onclick="location.href='bom-list.do'" class="btn btn-primary btn-sm a-cancel"><span class="glyphicon glyphicon-log-out"></span>返回</button>
				   </div>
				   <input type="hidden" name="flowId" value="${flowId}">
				   <c:if test="${model != null}">
				       <input type="hidden" name="id" value="${model.id}">
				   </c:if>
                             <div class="form-group">
						      <label class="control-label col-lg-2" for="code-projectno">项目编号:</label>
                               <div class="col-lg-3">   <input id="code-projectno" type="text" name="projectno" value="${model.projectno}" class="text " ></div>
                               
							
						      <label class="control-label col-lg-2" for="code-projectname">项目名:</label>
                               <div class="col-lg-3">   <input id="code-projectname" type="text" name="projectname" value="${model.projectname}" class="text required" ></div>
                               
                            </div>
							
                             <div class="form-group">
						      <label class="control-label col-lg-2" for="code-customername">名称客户:</label>
                               <div class="col-lg-3">   <input id="code-customername" type="text" name="customername" value="${model.customername}" class="text " ></div>
                               
							
						      <label class="control-label col-lg-2" for="code-producttype">产品类型:</label>
                               <div class="col-lg-3">   <input id="code-producttype" type="text" name="producttype" value="${model.producttype}" class="text " ></div>
                               
                            </div>
							
                             <div class="form-group">
						      <label class="control-label col-lg-2" for="code-productflowid">产品件号:</label>
                               <div class="col-lg-3">   <input id="code-productflowid" type="text" name="productflowid" value="${model.productflowid}" class="text " ></div>
                               
							
						      <label class="control-label col-lg-2" for="code-productno">产品编号:</label>
                               <div class="col-lg-3">   <input id="code-productno" type="text" name="productno" value="${model.productno}" class="text " ></div>
                               
                            </div>
							
                             <div class="form-group">
						      <label class="control-label col-lg-2" for="code-productname">产品名:</label>
                               <div class="col-lg-3">   <input id="code-productname" type="text" name="productname" value="${model.productname}" class="text required" ></div>
                               
							
						      <label class="control-label col-lg-2" for="code-productmodel">规格型号:</label>
                               <div class="col-lg-3">   <input id="code-productmodel" type="text" name="productmodel" value="${model.productmodel}" class="text " ></div>
                               
                            </div>
							
                             <div class="form-group">
						      <label class="control-label col-lg-2" for="code-productunit">单位:</label>
                               <div class="col-lg-3">   <input id="code-productunit" type="text" name="productunit" value="${model.productunit}" class="text " ></div>
                               
							
						      <label class="control-label col-lg-2" for="code-unitprice">单价:</label>
                               <div class="col-lg-3">  <input id="code-unitprice" type="text" name="unitprice" value="${model.unitprice}" class="text number required" ></div>
                               
                            </div>
							
                             <div class="form-group">
						      <label class="control-label col-lg-2" for="code-productnumber">数量:</label>
                               <div class="col-lg-3">  <input id="code-productnumber" type="text" name="productnumber" value="${model.productnumber}" class="text number required" ></div>
                               
							
						      <label class="control-label col-lg-2" for="code-designuser">原料设计员:</label>
                               <div class="col-lg-3">   <input id="code-designuser" type="text" name="designuser" value="${model.designuser}" class="text required" ></div>
                               
                            </div>
							
                             <div class="form-group">
						      <label class="control-label col-lg-2" for="code-audituser">审核人员:</label>
                               <div class="col-lg-3">   <input id="code-audituser" type="text" name="audituser" value="${model.audituser}" class="text " ></div>
                               
                            </div>
							
				</form>
		</div>
        </div> 
        
        <!-- ==================== 子表 ========================================== -->
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">列表</h4></div>
	    <div class="panel-body">
			    <div class="pull-left">
			        <button class="btn btn-primary btn-sm a-insert" href="bom_materials-input.do?id=${model.id}&subId=&flowId=${flowId}'" data-target="#bom_materialsModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-tasks"></span>新建</button>
				    <button class="btn btn-primary btn-sm a-remove" onclick="bom_materialsTable.removeAll()"><span class="glyphicon glyphicon-trash"></span>删除</button>
	            
				</div>
				<div class="pull-right">
				  每页显示
				  <select class="bom_materialsM-page-size">
				    <option value="10">10</option>
				    <option value="20">20</option>
				    <option value="50">50</option>
				  </select>
				  条
				</div>
			    <div class="m-clear"></div>
		   </div>
		   <div class="content">
				<form id="bom_materialsGridForm" name="bom_materialsGridForm" method='post' action="bom_materials-remove.do" class="m-form-blank">
				  <table id="bom_materialsCodeGrid" class="table table-hover table-striped">
				      <thead>
					      <tr>
					          <th width="30" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
			                      <th class="sorting">分类编号</th>
			                      <th class="sorting">原料编号</th>
			                      <th class="sorting">原料名称</th>
			                      <th class="sorting">规格型号</th>
			                      <th class="sorting">价格</th>
			                      <th class="sorting">单位</th>
			                      <th class="sorting">数量</th>
			                      <th class="sorting">备货类型</th>
			                      <th class="sorting">备注</th>
					          <th width="30">&nbsp;</th>
					      </tr>
					    </thead>
						    <tbody>
						      <c:forEach items="${bom_materialsPage.result}" var="item">
								  <tr>
								        <td><input type="checkbox" class="bom_materialsSelectedItem a-check" name="bom_materialsSelectedItem" value="${item.id}"></td>
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
								          <a href="bom_materials-input.do?id=${model.id}&subId=${item.id}" class="a-update" data-target="#bom_materialsModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-pencil"></span></a>
								        </td>
								  </tr>
						      </c:forEach>
						    </tbody>
						  </table>
						</form>
		        </div>
		        
		      <!-- 模态框 -->
			  <div id="bom_materialsModalInput" class="modal fade" tabindex="-1" style="display: none;" data-backdrop="static">
				  <div class="modal-dialog modal-lg">
					  <div class="modal-content" style="text-align: center;height: 600px">
					  </div>
				  </div>
			  </div>
			  <div class="panel-body">
				  <article>
				    <div class="bom_materialsM-page-info pull-left">
					  共100条记录 显示1到10条记录
					</div>
					<div class="btn-group bom_materialsM-pagination pull-right">
					  <button class="btn btn-small">&lt;</button>
					  <button class="btn btn-small">1</button>
					  <button class="btn btn-small">&gt;</button>
					</div>
				    <div class="m-clear"></div>
			      </article>
			  </div>
      </div>
	<!-- end of main -->
	</div>
  </body>
</html>
