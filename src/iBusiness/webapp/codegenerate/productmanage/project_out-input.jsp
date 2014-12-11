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
		        'id': '${model.id}',
		        'flowId':'${flowId}'
		    },
			selectedItemClass: 'selectedItem',
			gridFormId: 'gridForm'
			,exportUrl: 'product_out_s-export.do'
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
	    <div class="panel-heading"><h4 class="panel-title">流程控制</h4></div>
	    <div class="panel-body">
	        <div class="pull-left">
	            <a href="#nextTaskUserDiv" role="button" class="btn btn-default btn-sm" data-toggle="modal">办理</a>
			    <button class="btn btn-default btn-sm a-submit" onclick="mainFormSubmit('project_out-save-draft.do')">草稿</button>
			    <button class="btn btn-default btn-sm" onclick="location.href='project_out-rollback.do?executionId=${model.executionid}&flowId=${flowId}&flowType=0'">回退</button>
			    <button class="btn btn-default btn-sm a-remove" onclick="location.href='project_out-list.do?flowId=${flowId}&flowType=0'">返回</button>
			</div>
	   </div>
	   
        <div class="panel-heading"><h4 class="panel-title">流程内容</h4></div>
        <div class="panel-body">
		<div class="content content-inner">
		       <form id="mainForm" method="post" action="project_out-complete.do" class="form-horizontal">
				   <input type="hidden" name="flowId" value="${flowId}">
				   <c:if test="${model != null}">
				       <input type="hidden" name="id" value="${model.id}">
				       <input type="hidden" name="executionid" value="${model.executionid}">
				       <input type="hidden" name="createdatebpm" value="${model.createdatebpm}">
				       <input type="hidden" name="assigneeuser" value="${model.assigneeuser}">
				       <input type="hidden" name="nodename" value="${model.nodename}">
				       <input type="hidden" name="doneflag" value="${model.doneflag}">
				   </c:if>
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-eventdate">单据日期:</label>
                              <div class="col-lg-3">  <label>${model.eventdate}</label>  <input id="code-eventdate" type="hidden" name="eventdate" value="${model.eventdate}" ></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-applicantuser">申请人:</label>
                              <div class="col-lg-3">  <label>${model.applicantuser}</label>  <input id="code-applicantuser" type="hidden" name="applicantuser" value="${model.applicantuser}" ></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-type">出库类型:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.type.fcEdit=='1'}">    <input id="code-type" type="text" name="type" value="${model.type}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.type.fcEdit!='1'}">    <label>${model.type}</label>    <input type="hidden" name="type" value="${model.type}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-projectno">项目编号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.projectno.fcEdit=='1'}">    <input id="code-projectno" type="text" name="projectno" value="${model.projectno}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.projectno.fcEdit!='1'}">    <label>${model.projectno}</label>    <input type="hidden" name="projectno" value="${model.projectno}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-projectname">项目名称:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.projectname.fcEdit=='1'}">    <input id="code-projectname" type="text" name="projectname" value="${model.projectname}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.projectname.fcEdit!='1'}">    <label>${model.projectname}</label>    <input type="hidden" name="projectname" value="${model.projectname}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-projectmanager">项目经理:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.projectmanager.fcEdit=='1'}">    <input id="code-projectmanager" type="text" name="projectmanager" value="${model.projectmanager}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.projectmanager.fcEdit!='1'}">    <label>${model.projectmanager}</label>    <input type="hidden" name="projectmanager" value="${model.projectmanager}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-planner">计划员:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.planner.fcEdit=='1'}">    <input id="code-planner" type="text" name="planner" value="${model.planner}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.planner.fcEdit!='1'}">    <label>${model.planner}</label>    <input type="hidden" name="planner" value="${model.planner}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-pactno">合同编号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.pactno.fcEdit=='1'}">    <input id="code-pactno" type="text" name="pactno" value="${model.pactno}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.pactno.fcEdit!='1'}">    <label>${model.pactno}</label>    <input type="hidden" name="pactno" value="${model.pactno}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-customername">用户名称:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.customername.fcEdit=='1'}">    <input id="code-customername" type="text" name="customername" value="${model.customername}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.customername.fcEdit!='1'}">    <label>${model.customername}</label>    <input type="hidden" name="customername" value="${model.customername}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-salesuser">销售人员:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.salesuser.fcEdit=='1'}">    <input id="code-salesuser" type="text" name="salesuser" value="${model.salesuser}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.salesuser.fcEdit!='1'}">    <label>${model.salesuser}</label>    <input type="hidden" name="salesuser" value="${model.salesuser}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-salesdept">销售所属部门:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.salesdept.fcEdit=='1'}">    <input id="code-salesdept" type="text" name="salesdept" value="${model.salesdept}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.salesdept.fcEdit!='1'}">    <label>${model.salesdept}</label>    <input type="hidden" name="salesdept" value="${model.salesdept}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-transportmode">运输方式:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.transportmode.fcEdit=='1'}">    <input id="code-transportmode" type="text" name="transportmode" value="${model.transportmode}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.transportmode.fcEdit!='1'}">    <label>${model.transportmode}</label>    <input type="hidden" name="transportmode" value="${model.transportmode}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-packagetype">包装类型:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.packagetype.fcEdit=='1'}">    <input id="code-packagetype" type="text" name="packagetype" value="${model.packagetype}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.packagetype.fcEdit!='1'}">    <label>${model.packagetype}</label>    <input type="hidden" name="packagetype" value="${model.packagetype}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-consignee">收货人:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.consignee.fcEdit=='1'}">    <input id="code-consignee" type="text" name="consignee" value="${model.consignee}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.consignee.fcEdit!='1'}">    <label>${model.consignee}</label>    <input type="hidden" name="consignee" value="${model.consignee}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-consigneephone">收货人电话:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.consigneephone.fcEdit=='1'}">    <input id="code-consigneephone" type="text" name="consigneephone" value="${model.consigneephone}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.consigneephone.fcEdit!='1'}">    <label>${model.consigneephone}</label>    <input type="hidden" name="consigneephone" value="${model.consigneephone}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-deliveryaddress">送货地点:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.deliveryaddress.fcEdit=='1'}">    <input id="code-deliveryaddress" type="text" name="deliveryaddress" value="${model.deliveryaddress}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.deliveryaddress.fcEdit!='1'}">    <label>${model.deliveryaddress}</label>    <input type="hidden" name="deliveryaddress" value="${model.deliveryaddress}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-detailedinfo">详细情况描述:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.detailedinfo.fcEdit=='1'}">    <input id="code-detailedinfo" type="text" name="detailedinfo" value="${model.detailedinfo}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.detailedinfo.fcEdit!='1'}">    <label>${model.detailedinfo}</label>    <input type="hidden" name="detailedinfo" value="${model.detailedinfo}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-cardoor">车辆能否到门口:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.cardoor.fcEdit=='1'}">    <input id="code-cardoor" type="text" name="cardoor" value="${model.cardoor}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.cardoor.fcEdit!='1'}">    <label>${model.cardoor}</label>    <input type="hidden" name="cardoor" value="${model.cardoor}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-outdoor">是否置于户外:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.outdoor.fcEdit=='1'}">    <input id="code-outdoor" type="text" name="outdoor" value="${model.outdoor}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.outdoor.fcEdit!='1'}">    <label>${model.outdoor}</label>    <input type="hidden" name="outdoor" value="${model.outdoor}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-otherinfo">其它情况描述:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.otherinfo.fcEdit=='1'}">    <input id="code-otherinfo" type="text" name="otherinfo" value="${model.otherinfo}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.otherinfo.fcEdit!='1'}">    <label>${model.otherinfo}</label>    <input type="hidden" name="otherinfo" value="${model.otherinfo}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-isexecutpact">是否按合同执行:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.isexecutpact.fcEdit=='1'}">    <input id="code-isexecutpact" type="text" name="isexecutpact" value="${model.isexecutpact}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.isexecutpact.fcEdit!='1'}">    <label>${model.isexecutpact}</label>    <input type="hidden" name="isexecutpact" value="${model.isexecutpact}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-paymentinfo">付款情况说明:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.paymentinfo.fcEdit=='1'}">    <input id="code-paymentinfo" type="text" name="paymentinfo" value="${model.paymentinfo}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.paymentinfo.fcEdit!='1'}">    <label>${model.paymentinfo}</label>    <input type="hidden" name="paymentinfo" value="${model.paymentinfo}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-paymentno">付款通知单号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.paymentno.fcEdit=='1'}">    <input id="code-paymentno" type="text" name="paymentno" value="${model.paymentno}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.paymentno.fcEdit!='1'}">    <label>${model.paymentno}</label>    <input type="hidden" name="paymentno" value="${model.paymentno}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-comments">备注说明:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.comments.fcEdit=='1'}">    <input id="code-comments" type="text" name="comments" value="${model.comments}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.comments.fcEdit!='1'}">    <label>${model.comments}</label>    <input type="hidden" name="comments" value="${model.comments}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-pmanagerappr">项目经理审批:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.pmanagerappr.fcEdit=='1'}">    <input id="code-pmanagerappr" type="text" name="pmanagerappr" value="${model.pmanagerappr}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.pmanagerappr.fcEdit!='1'}">    <label>${model.pmanagerappr}</label>    <input type="hidden" name="pmanagerappr" value="${model.pmanagerappr}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-salesdeptmanaappr">销售部门经理审批:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.salesdeptmanaappr.fcEdit=='1'}">    <input id="code-salesdeptmanaappr" type="text" name="salesdeptmanaappr" value="${model.salesdeptmanaappr}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.salesdeptmanaappr.fcEdit!='1'}">    <label>${model.salesdeptmanaappr}</label>    <input type="hidden" name="salesdeptmanaappr" value="${model.salesdeptmanaappr}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-financialappr">财务审批:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.financialappr.fcEdit=='1'}">    <input id="code-financialappr" type="text" name="financialappr" value="${model.financialappr}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.financialappr.fcEdit!='1'}">    <label>${model.financialappr}</label>    <input type="hidden" name="financialappr" value="${model.financialappr}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-salesdirectorappr">销售总监审批:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.salesdirectorappr.fcEdit=='1'}">    <input id="code-salesdirectorappr" type="text" name="salesdirectorappr" value="${model.salesdirectorappr}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.salesdirectorappr.fcEdit!='1'}">    <label>${model.salesdirectorappr}</label>    <input type="hidden" name="salesdirectorappr" value="${model.salesdirectorappr}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-amountcapital">出库总金额大写:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.amountcapital.fcEdit=='1'}">    <input id="code-amountcapital" type="text" name="amountcapital" value="${model.amountcapital}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.amountcapital.fcEdit!='1'}">    <label>${model.amountcapital}</label>    <input type="hidden" name="amountcapital" value="${model.amountcapital}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-amountlowercase">出库总金额小写:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.amountlowercase.fcEdit=='1'}">    <input id="code-amountlowercase" type="text" name="amountlowercase" value="${model.amountlowercase}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.amountlowercase.fcEdit!='1'}">    <label>${model.amountlowercase}</label>    <input type="hidden" name="amountlowercase" value="${model.amountlowercase}">  </c:if></div>
	                                      
                            </div>
						 
					
					<!--  选择下一节点办理人弹出层  -->
				    <div id="nextTaskUserDiv" class="modal fade" tabindex="-1" style="top:20%;" >
				            <div class="modal-dialog">
						    <div class="modal-content">
							      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal"><span >&times;</span><span class="sr-only">Close</span></button>
								        <h4 class="modal-title">办理下一节点</h4>
							      </div>
							      <div class="modal-body">
									    <div class="form-group">
                                            <label class="col-lg-2 control-label" for="code-remark">办理人:</label>
                                            <div class="col-lg-4">
												  <select id="code-sex" name="userId" class="form-control">
												        <option value="" >请选择</option>
													  <c:forEach items="${userItems}" var="item">
													    <option value="${item.id}"  ${item.id == userId ? 'selected' : ''}>${item.displayName}</option>
													  </c:forEach>
												  </select>
										      </div>
						                </div>
						           </div>
						           <div class="modal-footer">
						                    <button class="btn btn-default btn-sm a-insert">办理</button>
						                    <button class="btn btn-default btn-sm" data-dismiss="modal" >关闭</button>
						           </div>
					            </div><!-- /.modal-content -->
						  </div><!-- /.modal-dialog -->
				    </div>
					
				</form>
		</div>
        </div> 
        <!-- ==================== 子表 ========================================== -->
        <div class="panel-heading"><h4 class="panel-title">列表</h4></div>
	    <div class="panel-body">
			    <div class="pull-left">
				    <button class="btn btn-default btn-sm a-insert" onclick="location.href='product_out_s-input.do?id=${model.id}&subId=&flowId=${flowId}'">新建</button>
				    <button class="btn btn-default btn-sm a-remove" onclick="table.removeAll()">删除</button>
				    <button class="btn btn-default btn-sm" onclick="table.exportExcel()">导出Excel</button>
	            
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
				<form id="gridForm" name="gridForm" method='post' action="product_out_s-remove.do" class="m-form-blank">
				  <input type="hidden" name="flowId" value="${flowId}">
				  <table id="codeGrid" class="table table-hover table-bordered">
				      <thead>
					      <tr>
					          <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
					          <th width="80">&nbsp;</th>
		                      <th class="sorting">批次</th>
		                      <th class="sorting">设备地点</th>
		                      <th class="sorting">产品件号</th>
		                      <th class="sorting">产品产品编号</th>
		                      <th class="sorting">产品名称</th>
		                      <th class="sorting">规格型号</th>
		                      <th class="sorting">单位</th>
		                      <th class="sorting">规格尺寸</th>
		                      <th class="sorting">发货日期</th>
		                      <th class="sorting">数量</th>
		                      <th class="sorting">单价</th>
		                      <th class="sorting">金额</th>
		                      <th class="sorting">发货类型</th>
		                      <th class="sorting">货物所在地</th>
					      </tr>
					    </thead>
						    <tbody>
						      <c:forEach items="${page.result}" var="item">
								  <tr>
								        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.id}"></td>
									    <td>
								            <a href="product_out_s-input.do?id=${model.id}&subId=${item.id}&flowId=${flowId}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
								        </td>
							            <td>${item.batchno}</td>
							            <td>${item.stationname}</td>
							            <td>${item.productflowid}</td>
							            <td>${item.productno}</td>
							            <td>${item.productname}</td>
							            <td>${item.modeltype}</td>
							            <td>${item.unit}</td>
							            <td>${item.sizes}</td>
							            <td>${item.deliverydate}</td>
							            <td>${item.materialnum}</td>
							            <td>${item.unitprice}</td>
							            <td>${item.price}</td>
							            <td>${item.outtype}</td>
							            <td>${item.goodsaddress}</td>
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
