<!DOCTYPE html>
<html>

  <head>
    <title>${confForm.formTitle}列表</title>
    <!-- jquery -->
    <script type="text/javascript" src="../../plugin/jquery/jquery.min.js"></script>
    <!-- bootstrap -->
    <link type="text/css" rel="stylesheet" href="../../plugin/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="../../plugin/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/base.js"></script>
    
    <script type="text/javascript">
        <!-- 数据初始化 -->
		function initData() {
			// 调用初始化方法
			var initdata = "{pageNo:1, pageSize:10}";
			var urlstr = urlpath + "/rs/ws-test/test-list?jsonStr="+initdata;
			$.ajax({
				type: "post",
			    url: urlstr,
				dataType: "json",
			//	data: initdata,
				success: function(json){
					// 进度列表
					var dataList = json.datas;
					// 先删除再插入
				//	$("#datas :last-child").remove();
					for (var i=0; i<dataList.length; i++) {
						var content = "";
						content = content + '<div class="form-group">';
						content = content + '<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div><div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">'+dataList[i].name+'</div><div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">'+dataList[i].remark+'</div><div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>';
						content = content + '</div>';
						content = content + '<div class="form-group">';
						content = content + '<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"><a href="'+urlpath+'/rs/${entityName?uncap_first}-input" >编辑</a></div>';
						content = content + '<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9"></div>';
						content = content + '</div>';
						$("#datas").append(content);
					}
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
					alert("服务器异常请稍后再试。");
				}
			});
		}
		initData();
    </script>
  </head>

  <body>
    <div class="row">
    <div class="col-lg-1"></div>
	<!-- start of main -->
	<div class="panel panel-default col-lg-10">
	   <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">${confForm.formTitle}列表</h4></div>
       <div id="datas" class="panel-body">
       
	   </div>
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
