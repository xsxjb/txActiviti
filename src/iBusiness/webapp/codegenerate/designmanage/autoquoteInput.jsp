<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
<head>
<%@include file="/common/meta.jsp"%>
<title>自动报价页面编辑</title>
<%@include file="/common/center.jsp"%>
<script type="text/javascript">
		//实例化config对象
		var autoquote_bathConfig = {
		    id: 'autoquote_bathCodeGrid',
		    params: { 'id': '${model.id}' },
			selectedItemClass: 'autoquote_bathSelectedItem',
			gridFormId: 'autoquote_bathGridForm',
			exportUrl: 'autoquote_bath-export.do'
		};
        // 实例化table对象
		var autoquote_bathTable;
		$(function() {
			autoquote_bathTable = new Table(autoquote_bathConfig);
		    autoquote_bathTable.configPagination('.autoquote_bathM-pagination');
		});
        // 实例化config对象
        var autoquote_bedroomConfig = {
		    id: 'autoquote_bedroomCodeGrid',
		    params: {'id': '${model.id}'},
			selectedItemClass: 'autoquote_bedroomSelectedItem',
			gridFormId: 'autoquote_bedroomGridForm',
			exportUrl: 'autoquote_bedroom-export.do'
		};
        // 实例化table对象
		var autoquote_bedroomTable;
		$(function() {
			autoquote_bedroomTable = new Table(autoquote_bedroomConfig);
		    autoquote_bedroomTable.configPagination('.autoquote_bedroomM-pagination');
		});
        // 实例化config对象
        var autoquote_hallConfig = {
		    id: 'autoquote_hallCodeGrid',
		    params: { 'id': '${model.id}' },
			selectedItemClass: 'autoquote_hallSelectedItem',
			gridFormId: 'autoquote_hallGridForm',
			exportUrl: 'autoquote_hall-export.do'
		};
        // 实例化table对象
		var autoquote_hallTable;
		$(function() {
			autoquote_hallTable = new Table(autoquote_hallConfig);
		    autoquote_hallTable.configPagination('.autoquote_hallM-pagination');
		});
        // 实例化config对象
        var autoquote_kitchenConfig = {
		    id: 'autoquote_kitchenCodeGrid',
		    params: { 'id': '${model.id}' },
			selectedItemClass: 'autoquote_kitchenSelectedItem',
			gridFormId: 'autoquote_kitchenGridForm',
			exportUrl: 'autoquote_kitchen-export.do'
		};
        // 实例化table对象
		var autoquote_kitchenTable;
		$(function() {
			autoquote_kitchenTable = new Table(autoquote_kitchenConfig);
		    autoquote_kitchenTable.configPagination('.autoquote_kitchenM-pagination');
		});
        // 实例化config对象
        var autoquote_verandaConfig = {
		    id: 'autoquote_verandaCodeGrid',
		    params: { 'id': '${model.id}' },
			selectedItemClass: 'autoquote_verandaSelectedItem',
			gridFormId: 'autoquote_verandaGridForm',
			exportUrl: 'autoquote_veranda-export.do'
		};
        // 实例化table对象
		var autoquote_verandaTable;
		$(function() {
			autoquote_verandaTable = new Table(autoquote_verandaConfig);
		    autoquote_verandaTable.configPagination('.autoquote_verandaM-pagination');
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
					    bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
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
			<div class="panel-heading">
				<h4 class="panel-title glyphicon glyphicon-paperclip">自动报价页面</h4>
			</div>

			<div class="row">
				<!-- ==================== 浴室/洗手间子表 ========================================== -->
				<div class="col-lg-4">
					<div class="panel-body">
						<div class="panel-heading col-lg-6">
							<h4 class="panel-title glyphicon glyphicon-paperclip">浴室/洗手间</h4>
						</div>
						<div class="pull-left">
							<button class="btn btn-primary btn-sm a-insert" href="autoquote_bath-input.do?id=${model.id}&subId=&flowId=${flowId}'" data-target="#autoquote_bathModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-tasks"></span>添加</button>
							<button class="btn btn-primary btn-sm a-remove" onclick="autoquote_bathTable.removeAll()"><span class="glyphicon glyphicon-trash"></span>删除</button>
						</div>
						<div class="m-clear"></div>
					</div>
					<div class="content">
						<form id="autoquote_bathGridForm" name="autoquote_bathGridForm" method='post' action="autoquote_bath-remove.do" class="m-form-blank">
							<table id="autoquote_bathCodeGrid" class="table table-hover table-striped">
								<thead>
									<tr>
										<th width="30" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
										<th class="sorting">面积</th>
										<th class="sorting">门窗</th>
										<th class="sorting">长</th>
										<th class="sorting">宽</th>
										<th class="sorting">高</th>
										<th width="30">&nbsp;</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${autoquote_bathPage}" var="item">
										<tr>
											<td><input type="checkbox" class="autoquote_bathSelectedItem a-check" name="autoquote_bathSelectedItem" value="${item.id}"></td>
											<td>${item.bathArea}</td>
											<td>${item.doorArea}</td>
											<td>${item.bathDepth}</td>
											<td>${item.bathWidth}</td>
											<td>${item.bathHeight}</td>
											<td><a href="autoquote_bath-input.do?id=${model.id}&subId=${item.id}" class="a-update" data-target="#autoquote_bathModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-pencil"></span></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form>
					</div>
					<!-- 模态框 -->
					<div id="autoquote_bathModalInput" class="modal fade" tabindex="-1" style="display: none;" data-backdrop="static">
						<div class="modal-dialog modal-lg">
							<div class="modal-content" style="text-align: center; height: 600px"></div>
						</div>
					</div>
				</div>
				<!-- ==================== 卧室子表 ========================================== -->
				<div class="col-lg-4">
					<div class="panel-body">
						<div class="panel-heading col-lg-4">
							<h4 class="panel-title glyphicon glyphicon-paperclip">卧室</h4>
						</div>
						<div class="pull-left">
							<button class="btn btn-primary btn-sm a-insert" href="autoquote_bedroom-input.do?id=${model.id}&subId=&flowId=${flowId}'" data-target="#autoquote_bedroomModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-tasks"></span>添加</button>
							<button class="btn btn-primary btn-sm a-remove" onclick="autoquote_bedroomTable.removeAll()"><span class="glyphicon glyphicon-trash"></span>删除</button>
						</div>
						<div class="m-clear"></div>
					</div>
					<div class="content">
						<form id="autoquote_bedroomGridForm"
							name="autoquote_bedroomGridForm" method='post'
							action="autoquote_bedroom-remove.do" class="m-form-blank">
							<table id="autoquote_bedroomCodeGrid"
								class="table table-hover table-striped">
								<thead>
									<tr>
										<th width="30" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
										<th class="sorting">面积</th>
										<th class="sorting">门窗</th>
										<th class="sorting">长</th>
										<th class="sorting">宽</th>
										<th class="sorting">高</th>
										<th width="30">&nbsp;</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${autoquote_bedroomPage}" var="item">
										<tr>
											<td><input type="checkbox" class="autoquote_bedroomSelectedItem a-check" name="autoquote_bedroomSelectedItem" value="${item.id}"></td>
											<td>${item.bedroomarea}</td>
											<td>${item.doorArea}</td>
											<td>${item.bedroomdepth}</td>
											<td>${item.bedroomwidth}</td>
											<td>${item.bedroomheight}</td>
											<td><a href="autoquote_bedroom-input.do?id=${model.id}&subId=${item.id}" class="a-update" data-target="#autoquote_bedroomModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-pencil"></span></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form>
					</div>
					<!-- 模态框 -->
					<div id="autoquote_bedroomModalInput" class="modal fade"
						tabindex="-1" style="display: none;" data-backdrop="static">
						<div class="modal-dialog modal-lg">
							<div class="modal-content" style="text-align: center; height: 600px"></div>
						</div>
					</div>
				</div>
				<!-- ==================== 大厅子表 ========================================== -->
				<div class="col-lg-4">
					<div class="panel-body">
						<div class="panel-heading col-lg-5">
							<h4 class="panel-title glyphicon glyphicon-paperclip">大厅/客厅</h4>
						</div>
						<div class="pull-left">
							<button class="btn btn-primary btn-sm a-insert"
								href="autoquote_hall-input.do?id=${model.id}&subId=&flowId=${flowId}'"
								data-target="#autoquote_hallModalInput" data-toggle="modal"
								data-database="true">
								<span class="glyphicon glyphicon-tasks"></span>添加
							</button>
							<button class="btn btn-primary btn-sm a-remove" onclick="autoquote_hallTable.removeAll()"><span class="glyphicon glyphicon-trash"></span>删除</button>
						</div>
						<div class="m-clear"></div>
					</div>
					<div class="content">
						<form id="autoquote_hallGridForm" name="autoquote_hallGridForm"
							method='post' action="autoquote_hall-remove.do"
							class="m-form-blank">
							<table id="autoquote_hallCodeGrid"
								class="table table-hover table-striped">
								<thead>
									<tr>
										<th width="30" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
										<th class="sorting">面积</th>
										<th class="sorting">门窗</th>
										<th class="sorting">长</th>
										<th class="sorting">宽</th>
										<th class="sorting">高</th>
										<th width="30">&nbsp;</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${autoquote_hallPage}" var="item">
										<tr>
											<td><input type="checkbox" class="autoquote_hallSelectedItem a-check" name="autoquote_hallSelectedItem" value="${item.id}"></td>
											<td>${item.hallarea}</td>
											<td>${item.doorArea}</td>
											<td>${item.halldepth}</td>
											<td>${item.hallwidth}</td>
											<td>${item.hallheight}</td>
											<td><a href="autoquote_hall-input.do?id=${model.id}&subId=${item.id}" class="a-update" data-target="#autoquote_hallModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-pencil"></span></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form>
					</div>
					<!-- 模态框 -->
					<div id="autoquote_hallModalInput" class="modal fade" tabindex="-1"
						style="display: none;" data-backdrop="static">
						<div class="modal-dialog modal-lg">
							<div class="modal-content" style="text-align: center; height: 600px"></div>
						</div>
					</div>
				</div>

			</div>
			<div class="row">
			<!-- ==================== 厨房子表 ========================================== -->
			<div class="col-lg-4">
				<div class="panel-body">
					<div class="panel-heading col-lg-4">
						<h4 class="panel-title glyphicon glyphicon-paperclip">厨房</h4>
					</div>
					<div class="pull-left">
						<button class="btn btn-primary btn-sm a-insert" href="autoquote_kitchen-input.do?id=${model.id}&subId=&flowId=${flowId}'" data-target="#autoquote_kitchenModalInput" data-toggle="modal" data-database="true">
							<span class="glyphicon glyphicon-tasks"></span>添加
						</button>
						<button class="btn btn-primary btn-sm a-remove"
							onclick="autoquote_kitchenTable.removeAll()">
							<span class="glyphicon glyphicon-trash"></span>删除
						</button>

					</div>
					<div class="m-clear"></div>
				</div>
				<div class="content">
					<form id="autoquote_kitchenGridForm"
						name="autoquote_kitchenGridForm" method='post'
						action="autoquote_kitchen-remove.do" class="m-form-blank">
						<table id="autoquote_kitchenCodeGrid"
							class="table table-hover table-striped">
							<thead>
								<tr>
									<th width="30" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting">面积</th>
									<th class="sorting">门窗</th>
									<th class="sorting">长</th>
									<th class="sorting">宽</th>
									<th class="sorting">高</th>
									<th width="30">&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${autoquote_kitchenPage}" var="item">
									<tr>
										<td><input type="checkbox" class="autoquote_kitchenSelectedItem a-check" name="autoquote_kitchenSelectedItem" value="${item.id}"></td>
										<td>${item.kitchenarea}</td>
										<td>${item.doorArea}</td>
										<td>${item.kitchendepth}</td>
										<td>${item.kitchenwidth}</td>
										<td>${item.kitchenheight}</td>
										<td><a href="autoquote_kitchen-input.do?id=${model.id}&subId=${item.id}" class="a-update" data-target="#autoquote_kitchenModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-pencil"></span></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
				</div>
				<!-- 模态框 -->
				<div id="autoquote_kitchenModalInput" class="modal fade"
					tabindex="-1" style="display: none;" data-backdrop="static">
					<div class="modal-dialog modal-lg">
						<div class="modal-content" style="text-align: center; height: 600px"></div>
					</div>
				</div>
			</div>
			<!-- ==================== 阳台子表 ========================================== -->
			<div class="col-lg-4">
				<div class="panel-body">
					<div class="panel-heading col-lg-4">
						<h4 class="panel-title glyphicon glyphicon-paperclip">阳台</h4>
					</div>
					<div class="pull-left">
						<button class="btn btn-primary btn-sm a-insert" href="autoquote_veranda-input.do?id=${model.id}&subId=&flowId=${flowId}'" data-target="#autoquote_verandaModalInput" data-toggle="modal" data-database="true">
							<span class="glyphicon glyphicon-tasks"></span>添加
						</button>
						<button class="btn btn-primary btn-sm a-remove"
							onclick="autoquote_verandaTable.removeAll()">
							<span class="glyphicon glyphicon-trash"></span>删除
						</button>
					</div>
					<div class="m-clear"></div>
				</div>
				<div class="content">
					<form id="autoquote_verandaGridForm"
						name="autoquote_verandaGridForm" method='post'
						action="autoquote_veranda-remove.do" class="m-form-blank">
						<table id="autoquote_verandaCodeGrid"
							class="table table-hover table-striped">
							<thead>
								<tr>
									<th width="30" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting">面积</th>
									<th class="sorting">门窗</th>
									<th class="sorting">长</th>
									<th class="sorting">宽</th>
									<th class="sorting">高</th>
									<th width="30">&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${autoquote_verandaPage}" var="item">
									<tr>
										<td><input type="checkbox" class="autoquote_verandaSelectedItem a-check" name="autoquote_verandaSelectedItem" value="${item.id}"></td>
										<td>${item.verandaarea}</td>
										<td>${item.doorArea}</td>
										<td>${item.verandadepth}</td>
										<td>${item.verandawidth}</td>
										<td>${item.verandaheight}</td>
										<td><a href="autoquote_veranda-input.do?id=${model.id}&subId=${item.id}" class="a-update" data-target="#autoquote_verandaModalInput" data-toggle="modal" data-database="true"><span class="glyphicon glyphicon-pencil"></span></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
				</div>
				<!-- 模态框 -->
				<div id="autoquote_verandaModalInput" class="modal fade"
					tabindex="-1" style="display: none;" data-backdrop="static">
					<div class="modal-dialog modal-lg">
						<div class="modal-content" style="text-align: center; height: 600px"></div>
					</div>
				</div>
			</div>
			</div>
			<!-- ========================= 计算 ============================================ -->
			<div class="row">
			<div class="panel-body">
				<div class="content content-inner">
					<form id="mainForm" method="post" action="autoquote-save.do" class="form-horizontal">
						<div class="controls">
							<button id="submitButton" class="btn btn-primary btn-sm a-submit"><span class="glyphicon glyphicon-floppy-save"></span>计算</button>
							<button type="button" onclick="location.href='autoquote-list.do'" class="btn btn-primary btn-sm a-cancel"><span class="glyphicon glyphicon-log-out"></span>返回</button>
						</div>
						<input type="hidden" name="flowId" value="${flowId}">
						<c:if test="${model != null}">
							<input type="hidden" name="id" value="${model.id}">
						</c:if>
						<div class="form-group">
							<label class="control-label col-lg-2" for="code-ceilingarea">吊顶面积:</label>
							<div class="col-lg-2">
								<input id="code-ceilingarea" type="text" name="ceilingarea" value="${model.ceilingarea}" class="text number required">
							</div>
							<label class="control-label col-lg-2">吊顶单价:</label>
							<div class="col-lg-2">
								<input type="text" name="ceilingUPrice" value="${model.ceilingUPrice}" class="text required">
							</div>
							<label class="control-label col-lg-2" for="code-ceilingamount">吊顶金额:</label>
							<div class="col-lg-2">
								<input id="code-ceilingamount" type="text" name="ceilingamount" value="${model.ceilingamount}" class="text required">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-lg-2" for="code-floorarea">地板面积:</label>
							<div class="col-lg-2">
								<input id="code-floorarea" type="text" name="floorarea" value="${model.floorarea}" class="text number required">
							</div>
							<label class="control-label col-lg-2">地板单价:</label>
							<div class="col-lg-2">
								<input type="text" name="floorUPrice" value="${model.floorUPrice}" class="text required">
							</div>
                            <label class="control-label col-lg-2" for="code-flooramount">地板金额:</label>
							<div class="col-lg-2">
								<input id="code-flooramount" type="text" name="flooramount" value="${model.flooramount}" class="text required">
							</div>
						</div>
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="code-paintarea">涂料/壁纸面积:</label>
							<div class="col-lg-2">
								<input id="code-paintarea" type="text" name="paintarea" value="${model.paintarea}" class="text number required">
							</div>
							<label class="control-label col-lg-2">涂料/壁纸单价:</label>
							<div class="col-lg-2">
								<input type="text" name="paintUPrice" value="${model.paintUPrice}" class="text required">
							</div>
							<label class="control-label col-lg-2" for="code-paintamount">涂料/壁纸金额:</label>
							<div class="col-lg-2">
								<input id="code-paintamount" type="text" name="paintamount" value="${model.paintamount}" class="text required">
							</div>
						</div>

						<div class="form-group">
						    <label class="control-label col-lg-2" for="code-tilearea">瓷砖面积:</label>
							<div class="col-lg-2">
								<input id="code-tilearea" type="text" name="tilearea" value="${model.tilearea}" class="text number required">
							</div>
							<label class="control-label col-lg-2">瓷砖单价:</label>
							<div class="col-lg-2">
								<input type="text" name="tileUPrice" value="${model.tileUPrice}" class="text required">
							</div>
							<label class="control-label col-lg-2" for="code-tileamount">瓷砖金额:</label>
							<div class="col-lg-2">
								<input id="code-tileamount" type="text" name="tileamount" value="${model.tileamount}" class="text required">
							</div>
						</div>
						
						
						<div class="form-group">
							<label class="control-label col-lg-2" for="code-totaluserarea">总使用面积:</label>
							<div class="col-lg-2">
								<input id="code-totaluserarea" type="text" name="totaluserarea" value="${model.totaluserarea}" class="text number required">
							</div>
							<label class="control-label col-lg-2">人工费:</label>
							<div class="col-lg-2">
								<input type="text" name="artificialAmount" value="${model.artificialAmount}" class="text number required">
							</div>
                            <label class="control-label col-lg-2" for="code-totalamount">总金额:</label>
							<div class="col-lg-2">
								<input id="code-totalamount" type="text" name="totalamount" value="${model.totalamount}" class="text number required">
							</div>
						</div>

					</form>
				</div>
			</div>
			</div>

		</div>
		<!-- end of main -->
	</div>
</body>
</html>
