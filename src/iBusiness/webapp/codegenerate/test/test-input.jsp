<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>测试练习表单编辑</title>
    <%@include file="/common/center.jsp"%>
    <script type="text/javascript">
        // 实例化config对象
        var test_sConfig = {
		    id: 'test_sCodeGrid',
		    pageNo: ${test_sPage.pageNo},
		    pageSize: ${test_sPage.pageSize},
		    totalCount:${test_sPage.totalCount},
		    resultSize: ${test_sPage.resultSize},
		    pageCount: ${test_sPage.pageCount},
		    orderBy: '${test_sPage.orderBy == null ? '' : test_sPage.orderBy}',
		    asc: ${test_sPage.asc},
		    params: {
		        'id': '${model.id}'
		    },
			selectedItemClass: 'test_sSelectedItem',
			gridFormId: 'test_sGridForm',
			exportUrl: 'test_s-export.do'
		};
        // 实例化table对象
		var test_sTable;
		$(function() {
			test_sTable = new Table(test_sConfig);
		    test_sTable.configPagination('.test_sM-pagination');
		    test_sTable.configPageInfo('.test_sM-page-info');
		    test_sTable.configPageSize('.test_sM-page-size');
		});
        // 实例化config对象
        var test_s2Config = {
		    id: 'test_s2CodeGrid',
		    pageNo: ${test_s2Page.pageNo},
		    pageSize: ${test_s2Page.pageSize},
		    totalCount:${test_s2Page.totalCount},
		    resultSize: ${test_s2Page.resultSize},
		    pageCount: ${test_s2Page.pageCount},
		    orderBy: '${test_s2Page.orderBy == null ? '' : test_s2Page.orderBy}',
		    asc: ${test_s2Page.asc},
		    params: {
		        'id': '${model.id}'
		    },
			selectedItemClass: 'test_s2SelectedItem',
			gridFormId: 'test_s2GridForm',
			exportUrl: 'test_s2-export.do'
		};
        // 实例化table对象
		var test_s2Table;
		$(function() {
			test_s2Table = new Table(test_s2Config);
		    test_s2Table.configPagination('.test_s2M-pagination');
		    test_s2Table.configPageInfo('.test_s2M-page-info');
		    test_s2Table.configPageSize('.test_s2M-page-size');
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
		
		// 导入excel
		function importtest_sExcel(){
			 $("#test_sexcelForm").submit();
		}
		function importtest_s2Excel(){
			 $("#test_s2excelForm").submit();
		}
    </script>
  </head>
  <body>
    <%@include file="/ibusiness/header/header-portal.jsp"%>
    <div class="row">
	<div class="col-lg-1"></div>
	<!-- start of main -->
	<div class="panel panel-default col-lg-10"> 
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">测试练习表单流程</h4></div>
        <div class="panel-body">
		<div class="content content-inner">
		       <form id="mainForm" method="post" action="test-save.do" class="form-horizontal">
		           <div class="controls">
					      <button id="submitButton" class="btn btn-primary btn-sm a-submit"><span class="glyphicon glyphicon-floppy-save"></span>保存</button>
					      <button type="button" onclick="location.href='test-list.do'" class="btn btn-primary btn-sm a-cancel"><span class="glyphicon glyphicon-log-out"></span>返回</button>
				   </div>
				   <input type="hidden" name="flowId" value="${flowId}">
				   <c:if test="${model != null}">
				       <input type="hidden" name="id" value="${model.id}">
				   </c:if>
                             <div class="form-group">
						      <label class="control-label col-lg-2" for="code-name">名:</label>
                               <div class="col-lg-3">   <input id="code-name" type="text" name="name" value="${model.name}" class="text required" >   <a href="#" class="btn btn-primary btn-sm" onclick="$('#nameSInputDiv').modal('show');" >选择</a>   <script type="text/javascript">   	function changeValue(materialname){   	$("#code-name").val(materialname);$('#nameSInputDiv').modal('hide');        }   </script>   <div id="nameSInputDiv" class="modal fade" tabindex="-1" style="top:20%;" >     <div class="modal-dialog">       <div class="modal-content">         <div class="modal-header">           <a href="#" class="close btn btn-primary btn-sm" onclick="$('#nameSInputDiv').modal('hide');" ><span >&times;</span><span class="sr-only">Close</span></a>           <h4 class="modal-title glyphicon glyphicon-paperclip">选择带出</h4>         </div>         <div class="modal-body">           <div class="content">           	<table id="codeGrid" class="table table-hover table-bordered">           	   <thead>           	   <tr>           	      <th width="80">&nbsp;</th>   <th class="sorting">原料名称</th>           	   </tr>           	</thead>           	<tbody>           	   <c:forEach items="${namePage.result}" var="item">           	     <tr>           	        <td><a href="#" class="btn btn-primary btn-sm" onClick="changeValue('${item.materialname}')" >选择</a></td>  <td>${item.materialname}</td>           	     </tr>           	  </c:forEach>           	</tbody>           </table>         </div>       </div>       <div class="modal-footer">         <a href="#" class="btn btn-primary btn-sm" onclick="$('#nameSInputDiv').modal('hide');" >关闭</a>       </div>     </div>    </div>  </div></div>
                               
                            </div>
							
				</form>
		</div>
        </div> 
        
        <!-- ==================== 子表 ========================================== -->
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">列表</h4></div>
	    <div class="panel-body">
			    <div class="pull-left">
			        <button class="btn btn-primary btn-sm a-insert" href="test_s-input.do?id=${model.id}&subId=&flowId=${flowId}'" data-target="#test_sModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-tasks"></span>新建</button>
				    <button class="btn btn-primary btn-sm a-remove" onclick="test_sTable.removeAll()"><span class="glyphicon glyphicon-trash"></span>删除</button>
				    <button class="btn btn-primary btn-sm" onclick="test_sTable.exportExcel()"><span class="glyphicon glyphicon-export"></span>导出Excel</button>
				    <button class="btn btn-primary btn-sm"  onclick="importExcelAdd.click()"><span class="glyphicon glyphicon-import"></span>导入Excel</button>
				    <form id="test_sexcelForm" method="post" action="test_s-importExcel.do?parentid=${model.id}" class="form-horizontal" enctype="multipart/form-data">
	                    <input id="importExcelAdd" type="file" name="attachment"  style="display:none;" onChange="importtest_sExcel()"> 
	                </form>
	            
				</div>
				<div class="pull-right">
				  每页显示
				  <select class="test_sM-page-size">
				    <option value="10">10</option>
				    <option value="20">20</option>
				    <option value="50">50</option>
				  </select>
				  条
				</div>
			    <div class="m-clear"></div>
		   </div>
		   <div class="content">
				<form id="test_sGridForm" name="test_sGridForm" method='post' action="test_s-remove.do" class="m-form-blank">
				  <table id="test_sCodeGrid" class="table table-hover table-bordered">
				      <thead>
					      <tr>
					          <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
			                      <th class="sorting">邮件</th>
					          <th width="80">&nbsp;</th>
					      </tr>
					    </thead>
						    <tbody>
						      <c:forEach items="${test_sPage.result}" var="item">
								  <tr>
								        <td><input type="checkbox" class="test_sSelectedItem a-check" name="test_sSelectedItem" value="${item.id}"></td>
									            <td>${item.email}</td>
								        <td>
								          <a href="test_s-input.do?id=${model.id}&subId=${item.id}" class="a-update" data-target="#test_sModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-pencil"></span></a>
								        </td>
								  </tr>
						      </c:forEach>
						    </tbody>
						  </table>
						</form>
		        </div>
		        
		      <!-- 模态框 -->
			  <div id="test_sModalInput" class="modal fade" tabindex="-1" style="display: none;" data-backdrop="static">
				  <div class="modal-dialog modal-lg">
					  <div class="modal-content" style="text-align: center;height: 600px">
					  </div>
				  </div>
			  </div>
			  <div class="panel-body">
				  <article>
				    <div class="test_sM-page-info pull-left">
					  共100条记录 显示1到10条记录
					</div>
					<div class="btn-group test_sM-pagination pull-right">
					  <button class="btn btn-small">&lt;</button>
					  <button class="btn btn-small">1</button>
					  <button class="btn btn-small">&gt;</button>
					</div>
				    <div class="m-clear"></div>
			      </article>
			  </div>
        <!-- ==================== 子表 ========================================== -->
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">列表</h4></div>
	    <div class="panel-body">
			    <div class="pull-left">
			        <button class="btn btn-primary btn-sm a-insert" href="test_s2-input.do?id=${model.id}&subId=&flowId=${flowId}'" data-target="#test_s2ModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-tasks"></span>新建</button>
				    <button class="btn btn-primary btn-sm a-remove" onclick="test_s2Table.removeAll()"><span class="glyphicon glyphicon-trash"></span>删除</button>
				    <button class="btn btn-primary btn-sm" onclick="test_s2Table.exportExcel()"><span class="glyphicon glyphicon-export"></span>导出Excel</button>
				    <button class="btn btn-primary btn-sm"  onclick="importExcelAdd.click()"><span class="glyphicon glyphicon-import"></span>导入Excel</button>
				    <form id="test_s2excelForm" method="post" action="test_s2-importExcel.do?parentid=${model.id}" class="form-horizontal" enctype="multipart/form-data">
	                    <input id="importExcelAdd" type="file" name="attachment"  style="display:none;" onChange="importtest_s2Excel()"> 
	                </form>
	            
				</div>
				<div class="pull-right">
				  每页显示
				  <select class="test_s2M-page-size">
				    <option value="10">10</option>
				    <option value="20">20</option>
				    <option value="50">50</option>
				  </select>
				  条
				</div>
			    <div class="m-clear"></div>
		   </div>
		   <div class="content">
				<form id="test_s2GridForm" name="test_s2GridForm" method='post' action="test_s2-remove.do" class="m-form-blank">
				  <table id="test_s2CodeGrid" class="table table-hover table-bordered">
				      <thead>
					      <tr>
					          <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
			                      <th class="sorting">名</th>
			                      <th class="sorting">邮件</th>
					          <th width="80">&nbsp;</th>
					      </tr>
					    </thead>
						    <tbody>
						      <c:forEach items="${test_s2Page.result}" var="item">
								  <tr>
								        <td><input type="checkbox" class="test_s2SelectedItem a-check" name="test_s2SelectedItem" value="${item.id}"></td>
									            <td>${item.name}</td>
									            <td>${item.email}</td>
								        <td>
								          <a href="test_s2-input.do?id=${model.id}&subId=${item.id}" class="a-update" data-target="#test_s2ModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-pencil"></span></a>
								        </td>
								  </tr>
						      </c:forEach>
						    </tbody>
						  </table>
						</form>
		        </div>
		        
		      <!-- 模态框 -->
			  <div id="test_s2ModalInput" class="modal fade" tabindex="-1" style="display: none;" data-backdrop="static">
				  <div class="modal-dialog modal-lg">
					  <div class="modal-content" style="text-align: center;height: 600px">
					  </div>
				  </div>
			  </div>
			  <div class="panel-body">
				  <article>
				    <div class="test_s2M-page-info pull-left">
					  共100条记录 显示1到10条记录
					</div>
					<div class="btn-group test_s2M-pagination pull-right">
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
