<%@ page language="java" pageEncoding="UTF-8" %>
      <!-- start of sidebar -->
      <aside id="m-sidebar" class="panel-group span2" data-spy="affix" data-offset-top="100">

        <div class="panel">
          <div class="panel-heading">
            <a class="panel-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="#collapse-user-admin">
              <i class="icon-user"></i>
              <span class="title">用户配置</span>
            </a>
          </div>
          <div id="collapse-user-admin" class="panel-collapse collapse ${currentMenu == 'user-admin' ? 'in' : ''}">
            <ul class="panel-body nav nav-list">
			  <li><a href="${scopePrefix}/user/user-base-list.do"><i class="icon-user"></i>用户管理</a></li>
            </ul>
          </div>
        </div>
        
        <div class="panel">
          <div class="panel-heading">
            <a class="panel-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="#collapse-auth">
              <i class="icon-user"></i>
              <span class="title">角色管理</span>
            </a>
          </div>
          <div id="collapse-auth" class="panel-collapse collapse ${currentMenu == 'scope' ? 'in' : ''}">
            <ul class="panel-body nav nav-list">
              <li><a href="${scopePrefix}/auth/role-def-list.do"><i class="icon-user"></i>角色模板</a></li>
            </ul>
          </div>
        </div>

        <div class="panel">
          <div class="panel-heading">
            <a class="panel-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="#collapse-group">
              <i class="icon-user"></i>
              <span class="title">组织管理</span>
            </a>
          </div>
          <div id="collapse-group" class="panel-collapse collapse ${currentMenu == 'group' ? 'in' : ''}">
            <ul class="panel-body nav nav-list">
			  <li><a href="${scopePrefix}/group/org-company-list.do"><i class="icon-user"></i>公司</a></li>
			  <li><a href="${scopePrefix}/group/org-department-list.do"><i class="icon-user"></i>部门</a></li>
			  <li><a href="${scopePrefix}/group/org-group-list.do"><i class="icon-user"></i>小组</a></li>
            </ul>
          </div>
        </div>

        <div class="panel">
          <div class="panel-heading">
            <a class="panel-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="#collapse-job">
              <i class="icon-user"></i>
              <span class="title">职务管理</span>
            </a>
          </div>
          <div id="collapse-job" class="panel-collapse collapse ${currentMenu == 'job' ? 'in' : ''}">
            <ul class="panel-body nav nav-list">
			  <li class="m-icn-view-users"><a href="${scopePrefix}/group/job-type-list.do">职务类型管理</a></li>
			  <li class="m-icn-view-users"><a href="${scopePrefix}/group/job-title-list.do">职务名称管理</a></li>
			  <li class="m-icn-view-users"><a href="${scopePrefix}/group/job-info-list.do">职务管理</a></li>
			  <li class="m-icn-view-users"><a href="${scopePrefix}/group/job-user-list.do">人员职务管理</a></li>
            </ul>
          </div>
        </div>

		<footer id="m-footer" class="text-center">
		  <hr>
		  &copy;天翔
		</footer>
      </aside>
      <!-- end of sidebar -->
