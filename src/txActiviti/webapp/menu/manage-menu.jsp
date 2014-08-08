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
				<div class="widget-box">
					<div class="widget-title"><span class="icon"><i class="icon-comment"></i></span></div>
					<div class="widget-content nopadding">
						<ul class="recent-comments">
							<li>
								<div class="comments">
									<p>
									    <span class="user-info"><a href="#">车辆管理</a></span>
									</p>
									<a href="#" class="btn btn-primary btn-mini">表存储设计器</a> <a href="#" class="btn btn-success btn-mini">表单设计器</a> <a href="#" class="btn btn-warning btn-mini">流程设计器</a>
								</div>
							</li>
							<li>
								<div class="comments">
									<p>
									    <span class="user-info"><a href="#">公文管理</a></span>
									</p>
									<a href="#" class="btn btn-primary btn-mini">表存储设计器</a> <a href="#" class="btn btn-success btn-mini">表单设计器</a> <a href="#" class="btn btn-warning btn-mini">流程设计器</a>
								</div>
							</li>
							<li class="viewall">
								<a title="View all comments" class="tip-top" href="#"> + View all + </a>
							</li>
						</ul>
					</div>
				</div>
		  </div>
        </div>

		<footer id="m-footer" class="text-center">
		  <hr>
		  &copy;天翔
		</footer>
      </aside>
      <!-- end of sidebar -->
