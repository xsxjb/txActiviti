<%@page language="java" pageEncoding="UTF-8" %>
    <!-- bootstrap支持响应式CSS -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- bootstrap -->
    <link type="text/css" rel="stylesheet" href="${ctx}/plugin/bootstrap/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/plugin/bootstrap/css/bootstrap-responsive.min.css">
    
    <!-- test bootswatch  
    <link  type="text/css" rel="stylesheet" href="${ctx}/plugin/bootswatch/${userCSS == null ? 'Cerulean' : userCSS}/bootstrap.min.css"> 
    Slate
    -->
    <link id=“bootstrapcss”  type="text/css" rel="stylesheet" href="${ctx}/plugin/bootswatch/${userCSS == null ? 'Spacelab' : userCSS}/bootstrap.css">
     
    <!-- jquery -->
    <script type="text/javascript" src="${ctx}/plugin/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/plugin/jquery/jquery-migrate-1.2.1.min.js"></script>
    
    <link type="text/css" rel="stylesheet" href="${ctx}/plugin/jquery-validation/jquery.validate.css">
    <script type="text/javascript" src="${ctx}/plugin/jquery-validation/jquery.validate.js"></script>
    <script type="text/javascript" src="${ctx}/plugin/jquery-validation/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${ctx}/plugin/jquery-validation/localization/messages_zh_CN.js"></script>
    
    <!-- bootstrap -->
    <script type="text/javascript" src="${ctx}/plugin/bootstrap/js/bootstrap.min.js"></script>
    
    <!-- bootbox -->
    <script type="text/javascript" src="${ctx}/plugin/bootbox/bootbox.min.js"></script>
    
    <!-- datepicker -->
    <link type="text/css" rel="stylesheet" href="${ctx}/plugin/bootstrap-datepicker/datepicker.css">
    <script type="text/javascript" src="${ctx}/plugin/bootstrap-datepicker/bootstrap-datepicker.js"></script>
    
    <link type="text/css" rel="stylesheet" href="${ctx}/plugin/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" >
    <script type="text/javascript" src="${ctx}/plugin/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>

    <!-- table and pager -->
    <script type="text/javascript" src="${ctx}/plugin/pagination/pagination.js"></script>
    <script type="text/javascript" src="${ctx}/plugin/table/table.js"></script>
    <script type="text/javascript" src="${ctx}/plugin/table/messages_${locale}.js"></script>
    
    <!-- layout -->
    <script type="text/javascript" src="${ctx}/plugin/ibusiness/js/table.js"></script>
    
    <!-- tree -->
    <link rel="stylesheet" href="${ctx}/plugin/ztree/zTreeStyle/zTreeStyle.css" type="text/css" />
    <script type="text/javascript" src="${ctx}/plugin/ztree/jquery.ztree.all-3.5.min.js"></script>
    
    <script type="text/javascript">
		$(function() {
			// 显示信息
			if (typeof(showMessage) != 'undefined') {
			    $.showMessage($('#m-success-message').html(), {
			        position: 'top',
			        size: '55',
			        fontSize: '20px'
			    });
			}
		    // 日期控件
		    $('.datepicker').datepicker({format:'yyyy-mm-dd'});
		    // 日期时间控件
		    $('.datetimepicker').datetimepicker({
		    	language: 'zh-CN',
		    	weekStart:1, 
		    	todayBtn:1, 
		    	autoclose:1, 
		    	todayHighlight:1, 
		    	startView:2,
		    	minView:2,
		    	forceParse:0
		    	});
		});
    </script>