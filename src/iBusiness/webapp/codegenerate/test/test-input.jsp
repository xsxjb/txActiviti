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
						      <label class="control-label col-lg-2" for="code-name">姓名:</label>
                               <div class="col-lg-3">   <input id="code-name" type="text" name="name" value="${model.name}" class="text form-control input-sm required"  ></div>
                               
							
						      <label class="control-label col-lg-2" for="code-remark">备注:</label>
                               <div class="col-lg-3">   <input id="code-remark" type="text" name="remark" value="${model.remark}" class="text form-control input-sm required"  ></div>
                               
                            </div>
							
				</form>
		</div>
        </div> 
        
        <!-- ==================== 子表 ========================================== -->
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">列表</h4></div>
	    <div class="panel-body">
			    <div class="pull-left">
			        <button class="btn btn-primary btn-sm a-insert" href="test_s2-input.do?id=${model.id}&subId=&flowId=${flowId}'" data-target="#test_s2ModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-tasks"></span>新建</button>
				    <button class="btn btn-primary btn-sm a-remove" onclick="test_s2Table.removeAll()"><span class="glyphicon glyphicon-trash"></span>删除</button>
	            
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
				  <table id="test_s2CodeGrid" class="table table-hover table-striped">
				      <thead>
					      <tr>
					          <th width="30" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
			                      <th class="sorting">namea</th>
					          <th width="30">&nbsp;</th>
					      </tr>
					    </thead>
						    <tbody>
						      <c:forEach items="${test_s2Page.result}" var="item">
								  <tr>
								        <td><input type="checkbox" class="test_s2SelectedItem a-check" name="test_s2SelectedItem" value="${item.id}"></td>
									            <td>${item.namea}</td>
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
