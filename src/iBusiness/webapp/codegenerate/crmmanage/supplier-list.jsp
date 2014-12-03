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
				  <form name="cgForm" method="post" action="supplier-list.do" class="form-inline">
				    <div class="form-group">
					    <button class="btn btn-default btn-sm" onclick="document.cgForm.submit()">查询</button>
					</div>
				 </form>
			  </div>
		  </div>
	   <div class="panel-heading"><h4 class="panel-title">列表</h4></div>
       <div class="panel-body">
		    <div class="pull-left">
			    <button class="btn btn-default btn-sm a-insert" onclick="location.href='supplier-input.do'">新建</button>
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
			<form id="gridForm" name="gridForm" method='post' action="supplier-remove.do" class="m-form-blank">
			  <table id="codeGrid" class="table table-hover table-bordered">
			      <thead>
				      <tr>
				        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
					                <th class="sorting">填表人</th>
					                <th class="sorting">供应商编号</th>
					                <th class="sorting">类别</th>
					                <th class="sorting">企业名称</th>
					                <th class="sorting">企业地址</th>
					                <th class="sorting">企业性质</th>
					                <th class="sorting">注册资本</th>
					                <th class="sorting">注册时间</th>
					                <th class="sorting">网址</th>
					                <th class="sorting">公司电话</th>
					                <th class="sorting">公司传真</th>
					                <th class="sorting">供应产品</th>
					                <th class="sorting">企业负责人</th>
					                <th class="sorting">负责人电话</th>
					                <th class="sorting">负责人手机</th>
					                <th class="sorting">负责人传真</th>
					                <th class="sorting">业务联系人</th>
					                <th class="sorting">联系人电话</th>
					                <th class="sorting">联系人手机</th>
					                <th class="sorting">联系人传真</th>
					                <th class="sorting">财务联系人</th>
					                <th class="sorting">财务电话</th>
					                <th class="sorting">财务手机</th>
					                <th class="sorting">财务传真</th>
					                <th class="sorting">汇款单位名称</th>
					                <th class="sorting">开户行</th>
					                <th class="sorting">税号</th>
					                <th class="sorting">帐号</th>
					                <th class="sorting">收件公司</th>
					                <th class="sorting">收件地址</th>
					                <th class="sorting">YOURNAME</th>
					                <th class="sorting">联系电话</th>
					                <th class="sorting">固定电话</th>
					                <th class="sorting">邮编</th>
					                <th class="sorting">目的地城市</th>
					                <th class="sorting">上传资料</th>
				        <th width="80">&nbsp;</th>
				      </tr>
				    </thead>
					    <tbody>
					      <c:forEach items="${page.result}" var="item">
					      <tr>
					        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.id}"></td>
						            <td>${item.information}</td>
						            <td>${item.suppliernumber}</td>
						            <td>${item.category}</td>
						            <td>${item.unitname}</td>
						            <td>${item.useraddress}</td>
						            <td>${item.character}</td>
						            <td>${item.registered}</td>
						            <td>${item.enrolltime}</td>
						            <td>${item.url}</td>
						            <td>${item.companyphone}</td>
						            <td>${item.companyfax}</td>
						            <td>${item.product}</td>
						            <td>${item.userperson}</td>
						            <td>${item.userphone}</td>
						            <td>${item.usermobilephone}</td>
						            <td>${item.userfax}</td>
						            <td>${item.businesscontacts}</td>
						            <td>${item.contacttelephone}</td>
						            <td>${item.contactmobilephone}</td>
						            <td>${item.contactfax}</td>
						            <td>${item.financialcontacts}</td>
						            <td>${item.financialcall}</td>
						            <td>${item.financialphone}</td>
						            <td>${item.financialfax}</td>
						            <td>${item.remittancename}</td>
						            <td>${item.beneficiary}</td>
						            <td>${item.taxno}</td>
						            <td>${item.accountno}</td>
						            <td>${item.yourcompany}</td>
						            <td>${item.youraddress}</td>
						            <td>${item.yourname}</td>
						            <td>${item.yourphone}</td>
						            <td>${item.telephone}</td>
						            <td>${item.code}</td>
						            <td>${item.estinationcity}</td>
						            <td>${item.updatas}</td>
					        <td>
					          <a href="supplier-input.do?id=${item.id}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
