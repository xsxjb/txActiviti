<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html lang="en">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="core.login.title" text="登录" /></title>
<%@include file="/common/center.jsp"%>
</head>

<body onload='document.f.j_username.focus();'>

	<!-- start of header bar -->
	<div class="navbar navbar-inverse">
		<div class="navbar-header">
		    <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-responsive-collapse">
		      <span class="icon-bar"></span>
		      <span class="icon-bar"></span>
		      <span class="icon-bar"></span>
		    </button>
		    <a class="navbar-brand" href="${scopePrefix}/">iBusiness</a>
	    </div>
	</div>
	<!-- end of header bar -->

	<div class="row">
		<div class="span3"></div>

		<!-- start of main -->
		<section class="span6">
			<div class="alert alert-dismissable  alert-warning"
				${param.error==true ? '' : 'style="display:none"'}>
				<strong><spring:message code="core.login.failure"
						text="登陆失败" /></strong> &nbsp;
				${sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message}
			</div>
			<br>

			<article class="m-widget">
				<header class="header">
					<h3 class="title">
						<strong><spring:message code="core.login.title" text="登录" /></strong>
					</h3>
				</header>

				<div class="content content-inner">
					<!-- 并监听默认的URL  j_spring_security_check 提交登陆信息的URL地址-->
					<form id="userForm" name="f" method="post"
						action="${scopePrefix}/j_spring_security_check"
						class="form-horizontal">

						<div class="form-group">
							<label class="control-label" for="username"><spring:message
									code="core.login.username" text="账号" />:</label>
							<div class="controls">
								<input type='text' id="username" name='j_username'
									class="form-control span2"
									value="${sessionScope['SPRING_SECURITY_LAST_USERNAME']}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label" for="password"><spring:message
									code="core.login.password" text="密码" />:</label>
							<div class="controls">
								<input type='password' id="password" name='j_password'
									class="form-control span2" value=''>
							</div>
						</div>
						<div class="form-group">
							<div class="controls">

								<input class="btn btn-primary" name="submit" type="submit"
									value="<spring:message code='core.login.submit' text='提交'/>" />
							</div>
						</div>
					</form>
				</div>
			</article>

		</section>
		<!-- end of main -->
		<div class="span3"></div>
	</div>

</body>
</html>
