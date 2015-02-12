<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>编辑子表</title>
    <%@include file="/common/center.jsp"%>
  </head>
  <body>
    <%@include file="/ibusiness/header/header-portal.jsp"%>
    <script type="text/javascript">
        // 表单验证JS
		$(function() {
		    $("#subForm").validate({
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
	<div class="col-lg-1"></div>
	<!-- start of main -->
    <div class="panel panel-default col-lg-10">
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">编辑子表</h4></div>
        <div class="panel-body">
			<div class="content content-inner">
					<form id="subForm" method="post" action="material_in_s-save.do?parentid=${parentid}&flowId=${flowId}" class="form-horizontal">
					  <c:if test="${model != null}">
					      <input id="code_id" type="hidden" name="id" value="${model.id}">
					  </c:if>

Expression po is undefined on line 38, column 56 in bpm/jspSubInputOneToMTemplate.ftl.
The problematic instruction:
----------
==> if po.fcDisplay="1" [on line 38, column 51 in bpm/jspSubInputOneToMTemplate.ftl]
----------

Java backtrace for programmers:
----------
freemarker.core.InvalidReferenceException: Expression po is undefined on line 38, column 56 in bpm/jspSubInputOneToMTemplate.ftl.
	at freemarker.core.TemplateObject.assertNonNull(TemplateObject.java:125)
	at freemarker.core.TemplateObject.invalidTypeException(TemplateObject.java:135)
	at freemarker.core.Dot._getAsTemplateModel(Dot.java:78)
	at freemarker.core.Expression.getAsTemplateModel(Expression.java:89)
	at freemarker.core.ComparisonExpression.isTrue(ComparisonExpression.java:111)
	at freemarker.core.ConditionalBlock.accept(ConditionalBlock.java:77)
	at freemarker.core.Environment.visit(Environment.java:221)
	at freemarker.core.IteratorBlock$Context.runLoop(IteratorBlock.java:179)
	at freemarker.core.Environment.visit(Environment.java:428)
	at freemarker.core.IteratorBlock.accept(IteratorBlock.java:102)
	at freemarker.core.Environment.visit(Environment.java:221)
	at freemarker.core.MixedContent.accept(MixedContent.java:92)
	at freemarker.core.Environment.visit(Environment.java:221)
	at freemarker.core.Environment.process(Environment.java:199)
	at freemarker.template.Template.process(Template.java:259)
	at com.ibusiness.codegenerate.code.generate.CodeFactory.generateFile(CodeFactory.java:51)
	at com.ibusiness.codegenerate.code.generate.CodeFactory.invoke(CodeFactory.java:146)
	at com.ibusiness.codegenerate.code.generate.CodeGenerate.generateToFile(CodeGenerate.java:246)
	at com.ibusiness.component.code.controller.CodeController.codeGenerateSave(CodeController.java:144)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:39)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)
	at java.lang.reflect.Method.invoke(Method.java:597)
	at org.springframework.web.method.support.InvocableHandlerMethod.invoke(InvocableHandlerMethod.java:215)
	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:132)
	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104)
	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandleMethod(RequestMappingHandlerAdapter.java:749)
	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:689)
	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:83)
	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)
	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:870)
	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:961)
	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:863)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:646)
	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:837)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:727)
	at com.ibusiness.core.servlet.ProxyServlet.service(ProxyServlet.java:67)
	at com.ibusiness.core.servlet.ServletFilter.doFilter(ServletFilter.java:61)
	at com.ibusiness.core.servlet.CompositeFilter$VirtualFilterChain.doFilter(CompositeFilter.java:65)
	at com.ibusiness.core.servlet.ProxyFilter.doFilter(ProxyFilter.java:78)
	at com.ibusiness.core.servlet.CompositeFilter$VirtualFilterChain.doFilter(CompositeFilter.java:65)
	at com.ibusiness.core.servlet.ProxyFilter.doFilter(ProxyFilter.java:81)
	at com.ibusiness.core.servlet.CompositeFilter$VirtualFilterChain.doFilter(CompositeFilter.java:65)
	at org.springframework.orm.hibernate4.support.OpenSessionInViewFilter.doFilterInternal(OpenSessionInViewFilter.java:152)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:108)
	at com.ibusiness.core.servlet.ProxyFilter.doFilter(ProxyFilter.java:76)
	at com.ibusiness.core.servlet.CompositeFilter$VirtualFilterChain.doFilter(CompositeFilter.java:65)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:330)
	at org.springframework.security.web.authentication.switchuser.SwitchUserFilter.doFilter(SwitchUserFilter.java:181)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:342)
	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:118)
	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:84)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:342)
	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:113)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:342)
	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:103)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:342)
	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:113)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:342)
	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:154)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:342)
	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:45)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:342)
	at org.springframework.security.web.authentication.www.BasicAuthenticationFilter.doFilter(BasicAuthenticationFilter.java:150)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:342)
	at org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter.doFilter(AbstractAuthenticationProcessingFilter.java:199)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:342)
	at org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:110)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:342)
	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:50)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:108)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:342)
	at com.ibusiness.security.client.AutoLoginFilter.doFilter(AutoLoginFilter.java:42)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:342)
	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:87)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:342)
	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:192)
	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:160)
	at com.ibusiness.core.servlet.ProxyFilter.doFilter(ProxyFilter.java:76)
	at com.ibusiness.core.servlet.CompositeFilter$VirtualFilterChain.doFilter(CompositeFilter.java:65)
	at org.javasimon.javaee.SimonServletFilter.doFilterWithMonitoring(SimonServletFilter.java:219)
	at org.javasimon.javaee.SimonServletFilter.doFilter(SimonServletFilter.java:209)
	at com.ibusiness.core.servlet.ProxyFilter.doFilter(ProxyFilter.java:76)
	at com.ibusiness.core.servlet.CompositeFilter$VirtualFilterChain.doFilter(CompositeFilter.java:65)
	at com.ibusiness.core.i18n.AcceptLanguageHeaderFilter.doFilter(AcceptLanguageHeaderFilter.java:30)
	at com.ibusiness.core.servlet.ProxyFilter.doFilter(ProxyFilter.java:76)
	at com.ibusiness.core.servlet.CompositeFilter$VirtualFilterChain.doFilter(CompositeFilter.java:65)
	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:108)
	at com.ibusiness.core.servlet.ProxyFilter.doFilter(ProxyFilter.java:76)
	at com.ibusiness.core.servlet.CompositeFilter$VirtualFilterChain.doFilter(CompositeFilter.java:65)
	at com.ibusiness.core.servlet.CompositeFilter.doFilter(CompositeFilter.java:42)
	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:344)
	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:261)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:220)
	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:122)
	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:501)
	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:171)
	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:103)
	at org.apache.catalina.valves.AccessLogValve.invoke(AccessLogValve.java:950)
	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:116)
	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:408)
	at org.apache.coyote.http11.AbstractHttp11Processor.process(AbstractHttp11Processor.java:1070)
	at org.apache.coyote.AbstractProtocol$AbstractConnectionHandler.process(AbstractProtocol.java:611)
	at org.apache.tomcat.util.net.JIoEndpoint$SocketProcessor.run(JIoEndpoint.java:316)
	at java.util.concurrent.ThreadPoolExecutor$Worker.runTask(ThreadPoolExecutor.java:886)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:908)
	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)
	at java.lang.Thread.run(Thread.java:662)
