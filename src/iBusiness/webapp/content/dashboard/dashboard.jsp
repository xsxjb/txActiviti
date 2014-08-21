<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "dashboard");%>
<%pageContext.setAttribute("currentMenu", "dashboard");%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title>dashboard</title>
    <%@include file="/common/s.jsp"%>

	<script type="text/javascript">
$(function(){
    function widget2ToggleContent() {
        var self = $(this);
        self.toggleClass('icon-chevron-up');
        self.toggleClass('icon-chevron-down');
        var widget = self.parents('.m-widget-2');
        var content = widget.find('.content');
        content.toggle(200);
    }

    $(document).delegate('.m-widget-2 .header .ctrl .icon-chevron-up', 'click', widget2ToggleContent);
    $(document).delegate('.m-widget-2 .header .ctrl .icon-chevron-down', 'click', widget2ToggleContent);
});
    </script>
	<style type="text/css">
.m-widget-container-2 {
	width: 96%;
	margin-left: 2%;
}

.m-widget-2 {
	margin-top: 0px;
	margin-bottom: 20px;
	border-radius: 3px;
	box-shadow: #E6E6E6 0px 1px 1px 0px;
}

.m-widget-2 .header {
	height: 20px;
	padding: 5px 15px;
	border: 1px solid #C2C2C3;
	padding-left: 10px;
	border-radius: 3px 3px 0px 0px;
	background-color: #CCCCCC;
	box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.5) inset;
	background: linear-gradient(to bottom, #FAFAFA 0%, #EFEFEF 100%) repeat scroll 0 0 transparent;
	text-shadow: 0 1px 0 #FFFFFF;
	color: #333333;
}

.m-widget-2 .header .title {
	float: left;
	margin: 0px;
	font-size: 14px;
}

.m-widget-2 .header .ctrl {
	float: right;
}

.m-widget-2 .header .ctrl .btn {
	margin: 0px;
	padding-left: 3px;
	padding-right: 3px;
	padding-top: 0px;
	padding-bottom: 0px;
}

.m-widget-2 .content {
	border-left: 1px solid #C2C2C3;
	border-right: 1px solid #C2C2C3;
	border-bottom: 1px solid #C2C2C3;
	border-radius: 0px 0px 3px 3px;
	height: 200px;
	overflow: hide;
}

.m-widget-2 .content.content-inner {
	padding-left: 10px;
	padding-top:10px;
	font-size: 12px;
}

.m-widget-2 .content .m-table {
	margin-top: 0px;
	margin-bottom: 0px;
}
	</style>
  </head>

  <body>
    <!-- start of main -->
    <section id="m-main" class="span12" style="float:right">
		    <div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<h3 class="text-center">
							iBusiness hello world
						</h3>
						<div class="row-fluid">
							<div class="span4">
								<div class="row-fluid">
									<div class="span4">
									</div>
									<div class="span4">
									</div>
									<div class="span4">
									</div>
								</div>
							</div>
							<div class="span4">
								<div class="row-fluid">
									<div class="span4">
									</div>
									<div class="span4">
									</div>
									<div class="span4">
									</div>
								</div>
							</div>
							<div class="span4">
								<div class="row-fluid">
									<div class="span4">
									</div>
									<div class="span4">
									</div>
									<div class="span4">
									</div>
								</div>
							</div>
						</div>
						<div class="row-fluid">
							<div class="span4">
							</div>
							<div class="span4">
							</div>
							<div class="span4">
							</div>
						</div><img alt="140x140" src="img/a.jpg" class="img-circle" />
						<div class="row-fluid">
							<div class="span4">
							</div>
							<div class="span4">
							</div>
							<div class="span4">
							</div>
						</div>
					</div>
				</div>
			</div>
      </section>
  </body>

</html>
