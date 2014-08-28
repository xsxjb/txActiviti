<%@page language="java" pageEncoding="UTF-8" %>
    <!-- bootstrap支持响应式CSS -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- bootstrap -->
    <link type="text/css" rel="stylesheet" href="${ctx}/plugin/bootstrap/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/plugin/bootstrap/css/bootstrap-responsive.min.css">
    <!-- test bootswatch  
    <link  type="text/css" rel="stylesheet" href="${ctx}/plugin/bootswatch/${userCSS == null ? 'Cerulean' : userCSS}/bootstrap.min.css"> 
    -->
    <link id=“bootstrapcss”  type="text/css" rel="stylesheet" href="${ctx}/plugin/bootswatch/${userCSS == null ? 'Cerulean' : userCSS}/bootstrap.css">
     
    <!-- jquery -->
    <script type="text/javascript" src="${ctx}/plugin/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/plugin/jquery/jquery-migrate-1.2.1.min.js"></script>
	<!-- bootstrap -->
    <script type="text/javascript" src="${ctx}/plugin/bootstrap/js/bootstrap.min.js"></script>

    <!-- table and pager -->
    <script type="text/javascript" src="${ctx}/plugin/pagination/pagination.js"></script>
    <script type="text/javascript" src="${ctx}/plugin/table/table.js"></script>
    <script type="text/javascript" src="${ctx}/plugin/table/messages_${locale}.js"></script>
    
    <!-- layout -->
    <script type="text/javascript" src="${ctx}/plugin/ibusiness/js/table.js"></script>
    
    