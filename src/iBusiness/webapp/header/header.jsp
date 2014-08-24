<%@ page language="java" pageEncoding="UTF-8" %>
    <c:if test="${not empty flashMessages}">
	<div id="m-success-message" style="display:none;">
	  <ul>
	  <c:forEach items="${flashMessages}" var="item">
	    <li>${item}</li>
	  </c:forEach>
	  </ul>
	</div>
	</c:if>

    <!-- start of header bar -->
    <nav class="navbar navbar-inverse" role="navigation">
      <div class="container-fluid">
        <div class="container">
          <a data-target=".navbar-responsive-collapse" data-toggle="collapse" class="navbar-toggle collapsed">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a href="${scopePrefix}/" class="navbar-brand">天翔</a>
          <div class="collapse navbar-collapse" >
            <ul class="nav navbar-nav">
              <li class="${currentHeader == 'dashboard' ? 'active' : currentHeader == 'bpm-workspace' ? 'active' : ''}"><a href="${scopePrefix}/portal/portal.do">首页</a></li>
              <li class="dropdown ${currentHeader == 'scope' ? 'active' : ''}">
                <a data-toggle="dropdown" class="dropdown-toggle" href="#">系统管理 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="${scopePrefix}/user/user-base-list.do"><i class="icon-user"></i>用户管理</a></li>
                  <li class="divider"></li>
                  <li><a href="#"><i class="icon-user"></i>权限管理</a></li>
                  <li class="divider"></li>
                </ul>
              </li>
              <!-- 后台功能 -->
              <li class="dropdown ${currentHeader == 'manage' ? 'active' : ''}">
                <a data-toggle="dropdown" class="dropdown-toggle" href="#">后台管理<b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="${scopePrefix}/group/org-company-list.do"><i class="icon-user"></i>组织权限管理</a></li>
                  <li><a href="#"><i class="icon-user"></i>菜单管理</a></li>
                  <li class="divider"></li>
                  <li><a href="${scopePrefix}/serviceModule/serviceModule-show.do"><i class="icon-user"></i>业务模块组件</a></li>
                  <li class="divider"></li>
				  <li><a href="${scopePrefix}/table/conf-table-show.do"><i class="icon-user"></i>表存储设计器</a></li>
				  <li><a href="#"><i class="icon-user"></i>表单设计器</a></li>
				  <li><a href="#"><i class="icon-user"></i>流程设计器</a></li>
				  <li><a href="#"><i class="icon-user"></i>通用表单</a></li>
                </ul>
              </li>
            </ul>

            <ul class="nav navbar-nav pull-right">
              <li class="dropdown">
                <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                  <sec:authentication property="principal.displayName" />
                  <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                  <li><a href="${scopePrefix}/user/change-password-input.do">修改密码</a></li>
                  <li><a href="${scopePrefix}/user/profile-list.do">个人信息</a></li>
                  <li class="divider"></li>
                  <li><a href="${scopePrefix}/j_spring_security_logout">退出</a></li>
                </ul>
              </li>
            </ul>
          </div><!-- /.nav-collapse -->
        </div>
      </div><!-- /navbar-inner -->
    </nav>
    <!-- end of header bar -->
