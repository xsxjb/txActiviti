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
	<!-- 菜单CSS样式 -->
	<style type="text/css">
        .dropdown-submenu {
            position: relative;
        }
        .dropdown-submenu > .dropdown-menu {
            top: 0;
            left: 100%;
            margin-top: -6px;
            margin-left: -1px;
            -webkit-border-radius: 0 6px 6px 6px;
            -moz-border-radius: 0 6px 6px;
            border-radius: 0 6px 6px 6px;
        }
        .dropdown-submenu:hover > .dropdown-menu {
            display: block;
        }
        .dropdown-submenu > a:after {
            display: block;
            content: " ";
            float: right;
            width: 0;
            height: 0;
            border-color: transparent;
            border-style: solid;
            border-width: 5px 0 5px 5px;
            border-left-color: #ccc;
            margin-top: 5px;
            margin-right: -10px;
        }
        .dropdown-submenu:hover > a:after {
            border-left-color: #fff;
        }
        .dropdown-submenu.pull-left {
            float: none;
        }
        .dropdown-submenu.pull-left > .dropdown-menu {
            left: -100%;
            margin-left: 10px;
            -webkit-border-radius: 6px 0 6px 6px;
            -moz-border-radius: 6px 0 6px 6px;
            border-radius: 6px 0 6px 6px;
        }
    </style>
	

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
                <ul class="dropdown-menu multi-level">
	                  <li class="divider"></li>
	                  <li class="dropdown-submenu"><a href="#"><i class="icon-user"></i>组织管理</a>
	                         <ul class="dropdown-menu  panel-body nav nav-list">
	                             <li><a href="${scopePrefix}/group/org-company-list.do"><i class="icon-user"></i>公司</a></li>
								  <li><a href="${scopePrefix}/group/org-department-list.do"><i class="icon-user"></i>部门</a></li>
								  <li><a href="${scopePrefix}/group/org-group-list.do"><i class="icon-user"></i>小组</a></li>
	                         </ul>
	                  </li>
	                  <li class="divider"></li>
	                  <li class="dropdown-submenu"><a href="#"><i class="icon-user"></i>职务管理</a>
	                         <ul class="dropdown-menu panel-body nav nav-list">
	                              <li class="m-icn-view-users"><a href="${scopePrefix}/group/job-type-list.do">职务类型管理</a></li>
								  <li class="m-icn-view-users"><a href="${scopePrefix}/group/job-title-list.do">职务名称管理</a></li>
								  <li class="m-icn-view-users"><a href="${scopePrefix}/group/job-info-list.do">职务管理</a></li>
								  <li><a href="${scopePrefix}/user/user-base-list.do"><i class="icon-user"></i>用户管理</a></li>
	                         </ul>
	                  </li>
	                  <li class="divider"></li>
	                  <li class="dropdown-submenu"><a href="#"><i class="icon-user"></i>角色管理</a>
	                         <ul class="dropdown-menu panel-body nav nav-list">
	                              <li><a href="${scopePrefix}/auth/role-def-list.do"><i class="icon-user"></i>角色模板</a></li>
	                         </ul>
	                  </li>
	                  <li class="divider"></li>
	                  
	                  
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
