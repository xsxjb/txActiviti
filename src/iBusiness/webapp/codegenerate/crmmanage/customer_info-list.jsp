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
    <div class="col-lg-1"></div>
	<!-- start of main -->
	<div class="panel panel-default col-lg-10">
	<!-- 查询条件 -->
        <div class="panel-heading"><h4 class="panel-title">查询</h4></div>
          <div class="panel-body">
	          <div id="search" class="content content-inner">
				  <form name="cgForm" method="post" action="customer_info-list.do" class="form-inline">
				    <div class="form-group">
					    <button class="btn btn-default btn-sm" onclick="document.cgForm.submit()">查询</button>
					</div>
				 </form>
			  </div>
		  </div>
	   <div class="panel-heading"><h4 class="panel-title">列表</h4></div>
       <div class="panel-body">
		    <div class="pull-left">
			    <button class="btn btn-default btn-sm a-insert" onclick="location.href='customer_info-input.do'">新建</button>
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
			<form id="gridForm" name="gridForm" method='post' action="customer_info-remove.do" class="m-form-blank">
			  <table id="codeGrid" class="table table-hover table-bordered">
			      <thead>
				      <tr>
				        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
					                <th class="sorting">客户编号</th>
					                <th class="sorting">客户状态</th>
					                <th class="sorting"> 客户类别</th>
					                <th class="sorting">客户地址</th>
					                <th class="sorting">手机</th>
					                <th class="sorting">联系电话</th>
					                <th class="sorting">负责经理</th>
					                <th class="sorting">系统销售</th>
					                <th class="sorting">客户名称</th>
					                <th class="sorting">信息来源</th>
					                <th class="sorting">关系状态</th>
					                <th class="sorting">省</th>
					                <th class="sorting">市</th>
					                <th class="sorting">企业性质</th>
					                <th class="sorting">上级主管单位</th>
					                <th class="sorting">三年内规划描述</th>
					                <th class="sorting">客户诉求</th>
					                <th class="sorting">是否以合作信息表</th>
					                <th class="sorting">客户发票单位名称</th>
					                <th class="sorting">开户行</th>
					                <th class="sorting">帐号</th>
					                <th class="sorting">税号</th>
					                <th class="sorting">开票联系人</th>
					                <th class="sorting">联系电话</th>
					                <th class="sorting">发票邮寄单位名称</th>
					                <th class="sorting">邮寄地址</th>
					                <th class="sorting">邮编</th>
					                <th class="sorting">收件人</th>
					                <th class="sorting">电话</th>
					                <th class="sorting">首选联系人</th>
					                <th class="sorting">职位</th>
					                <th class="sorting">固话/传真</th>
					                <th class="sorting">手机</th>
					                <th class="sorting">邮件</th>
					                <th class="sorting">办公地址</th>
					                <th class="sorting">邮编</th>
				        <th width="80">&nbsp;</th>
				      </tr>
				    </thead>
					    <tbody>
					      <c:forEach items="${page.result}" var="item">
					      <tr>
					        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.id}"></td>
						            <td>${item.customerno}</td>
						            <td>${item.customerstate}</td>
						            <td>${item.customertype}</td>
						            <td>${item.customeraddress}</td>
						            <td>${item.phone}</td>
						            <td>${item.telephone}</td>
						            <td>${item.salesmanager}</td>
						            <td>${item.systemsales}</td>
						            <td>${item.customername}</td>
						            <td>${item.infosource}</td>
						            <td>${item.relationshipstatus}</td>
						            <td>${item.province}</td>
						            <td>${item.city}</td>
						            <td>${item.customernature}</td>
						            <td>${item.superviseunit}</td>
						            <td>${item.planinfo}</td>
						            <td>${item.customerdemand}</td>
						            <td>${item.cooperationinfo}</td>
						            <td>${item.invoicename}</td>
						            <td>${item.bank}</td>
						            <td>${item.accountno}</td>
						            <td>${item.taxid}</td>
						            <td>${item.invoiceuser}</td>
						            <td>${item.invoiceusertel}</td>
						            <td>${item.invoicemailunitname}</td>
						            <td>${item.mailaddress}</td>
						            <td>${item.invoiczip}</td>
						            <td>${item.invoicaddressee}</td>
						            <td>${item.invoicphonetel}</td>
						            <td>${item.customeruser}</td>
						            <td>${item.userposition}</td>
						            <td>${item.usertelephone}</td>
						            <td>${item.userphone}</td>
						            <td>${item.useremail}</td>
						            <td>${item.userofficeaddress}</td>
						            <td>${item.userzip}</td>
					        <td>
					          <a href="customer_info-input.do?id=${item.id}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
