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
    <div class="navbar navbar-default">
		  <div class="navbar-header">
		    <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-responsive-collapse">
		      <span class="icon-bar"></span>
		      <span class="icon-bar"></span>
		      <span class="icon-bar"></span>
		    </button>
		    <a class="navbar-brand" href="${scopePrefix}/">天翔</a>
		    </div>
		    
		    <div class="navbar-collapse collapse navbar-responsive-collapse">
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

            <ul class="nav navbar-nav navbar-right">
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
            
            
            <ul class="nav navbar-nav navbar-right">
              <li class="dropdown">
                <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                               皮肤切换
                </a>
                <ul class="dropdown-menu">
                  <li class="divider"></li>
                  <li><a href="${scopePrefix}/uicss/uicss-save.do?userCSS=Cerulean">Cerulean</a></li>
                  <li><a href="${scopePrefix}/uicss/uicss-save.do?userCSS=Slate">Slate</a></li>
                  <li><a href="${scopePrefix}/uicss/uicss-save.do?userCSS=Cosmo">Cosmo</a></li>
                  <li><a href="${scopePrefix}/uicss/uicss-save.do?userCSS=Cyborg">Cyborg</a></li>
                  <li><a href="${scopePrefix}/uicss/uicss-save.do?userCSS=Darkly">Darkly</a></li>
                  <li><a href="${scopePrefix}/uicss/uicss-save.do?userCSS=Flatly">Flatly</a></li>
                  <li><a href="${scopePrefix}/uicss/uicss-save.do?userCSS=Superhero">Superhero</a></li>
				  <li><a href="${scopePrefix}/uicss/uicss-save.do?userCSS=United">United</a></li>
				  <li><a href="${scopePrefix}/uicss/uicss-save.do?userCSS=Yeti">Yeti</a></li>
                  <li class="divider"></li>
                  <li><a href="${scopePrefix}/uicss/uicss-save.do?userCSS=Journal">Journal</a></li>
                  <li><a href="${scopePrefix}/uicss/uicss-save.do?userCSS=Lumen">Lumen</a></li>
                  <li><a href="${scopePrefix}/uicss/uicss-save.do?userCSS=Paper">Paper</a></li>
                  <li><a href="${scopePrefix}/uicss/uicss-save.do?userCSS=Readable">Readable</a></li>
                  <li><a href="${scopePrefix}/uicss/uicss-save.do?userCSS=Sandstone">Sandstone</a></li>
                  <li><a href="${scopePrefix}/uicss/uicss-save.do?userCSS=Simplex">Simplex</a></li>
                  <li><a href="${scopePrefix}/uicss/uicss-save.do?userCSS=Spacelab">Spacelab</a></li>
                  <li class="divider"></li>
                </ul>
              </li>
            </ul>
              
          </div><!-- /.nav-collapse -->
      </div><!-- /navbar-inner -->
    <!-- end of header bar -->
