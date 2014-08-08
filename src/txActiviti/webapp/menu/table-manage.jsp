<%@ page language="java" pageEncoding="UTF-8" %>
      <!-- start of sidebar -->
      <aside id="m-sidebar" class="accordion span2" data-spy="affix" data-offset-top="100">

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="#collapse-cms">
              <i class="icon-user"></i>
              <span class="title">业务组件</span>
            </a>
          </div>
          <div id="collapse-cms" class="accordion-body collapse ${currentMenu == 'table' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/table/conf-table-show.do">表存储设计器</a></li>
			  <li><a href="#">表单设计器</a></li>
			  <li><a href="#">流程设计器</a></li>
            </ul>
          </div>
        </div>

		<footer id="m-footer" class="text-center">
		  <hr>
		  &copy;天翔
		</footer>
      </aside>
      <!-- end of sidebar -->
