<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>编辑</title>
    <%@include file="/common/center.jsp"%>
  </head>
  <body>
    <%@include file="/header/header-portal.jsp"%>
    <div class="row">
	<%@include file="/component/portal/component-leftmenu.jsp"%>
	<script type="text/javascript">
		$(function() {
		    $("#bpmBaseForm").validate({
		        submitHandler: function(form) {
					bootbox.animate(false);
					var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
		            form.submit();
		        },
		        errorClass: 'validate-error'
		    });
		})
    </script>
	<!-- start of main -->
	<div class="panel panel-default col-md-10 " > 
		    <!-- tabs  -->
	        <ul class="nav nav-tabs">
			  <li class="${bpmType == 'bpmBase' ? 'active' : ''} "><a href="${scopePrefix}/bpm-process/bpm-process-input.do?packageName=${packageName}&bpmId=${bpmId}" >流程基础信息</a></li>
			  <li class="${bpmType == 'bpmCode' ? 'active' : ''}"><a href="${scopePrefix}/code/bpm-code-generate-input.do?packageName=${packageName}&bpmId=${bpmId}" >代码生成</a></li>
			</ul>
			<div id="tabContent" class="tab-content">
			    <!-- ========================== 流程基础信息 =================================================== -->
			    <div id=bpmBase class="tab-pane fade ${bpmType == 'bpmBase' ? 'active in' : ''}">
			    <c:if test="${bpmType == 'bpmBase'}">
			        <div class="panel-body">
						<div class="content content-inner">
								<form id="bpmBaseForm" method="post" action="bpm-process-save.do" class="form-horizontal">
								  <input id="user-base_userRepoId" type="hidden" name="userRepoId" value="1">
								  <c:if test="${model != null}">
								      <input id="code_id" type="hidden" name="id" value="${bpmId}">
								      <input id="code_packageName" type="hidden" name="packageName" value="${model.packageName}">
								  </c:if>
							      <div class="form-group">
									      <label class="col-lg-2 control-label" for="code-packageName">包名:</label>
									      <label class="control-label" id="code-packageName">${model.packageName}</label>
							       </div>
								   <div class="form-group">
									      <label class="col-lg-2 control-label" for="code-flowName">流程名:</label>
									      <c:if test="${model.flowName == null }">
										      <div class="col-lg-3">
											      <input id="code-flowName" type="text" name="flowName" value="${model.flowName}"  class="form-control" >
										      </div>
									      </c:if>
									      <c:if test="${model.flowName != null}">
									           <label class="control-label" >${model.flowName}</label>
									           <input id="code-flowName" type="hidden" name="flowName" value="${model.flowName}">
									      </c:if>
								   </div>
								   <div class="form-group">
									    <label class="col-lg-2 control-label" for="code-flowTitle">流程标题:</label>
										<div class="col-lg-3">
										  <input id="code-flowTitle" type="text" name="flowTitle" value="${model.flowTitle}"  class="form-control" >
									    </div>
								    </div>
								    <!-- 流程关联表单 -->
								    <div class="form-group">
									      <label class="col-lg-2 control-label" for="role_def">关联表单:</label>
									      <div class="col-lg-3">
											  <select id="role_def" name="formId" class="form-control required">
											        <option value="" >请选择</option>
												  <c:forEach items="${formList}" var="item">
												      <option value="${item.id}" ${item.id==model.formId ? 'selected' : ''}>${item.formTitle}</option>
												  </c:forEach>
											  </select>
										  </div>
									 </div>
								    <div class="form-group">
									    <label class="col-lg-2 control-label" for="bpm-graph">URL:</label>
										<div class="col-lg-3">
										    <input id="code-flowForm" type="text" name="flowUrl" value="${model.flowUrl}"  class="form-control" >
									    </div>
									</div>
									<div class="form-group">
									    <label class="col-lg-2 control-label" for="bpm-graph">配置:</label>
										<div class="col-lg-3">
										    <a class="btn btn-primary" href="${scopePrefix}/bpm-process/bpm-conf-node-list.do?flowVersionId=${model.versionId}" >配置</a>
									    </div>
									</div>
									<div class="form-group">
									    <label class="col-lg-2 control-label" for="bpm-graph">图形:</label>
										<div class="col-lg-3">
										    <!-- target="_blank" -->
										    <a class="btn btn-primary" href="${scopePrefix}/bpm-process/bpm-process-graph.do?bpmProcessId=${model.id}"  >图形</a>
									    </div>
									</div>
								  
								  <div class="col-lg-10 col-lg-offset-2">
								      <button id="submitButton" class="btn a-submit"><spring:message code='core.input.save' text='保存'/></button>
								      <button type="button" onclick="history.back();" class="btn a-cancel"><spring:message code='core.input.back' text='返回'/></button>
								  </div>
								</form>
						</div>
                    </div>
                </c:if>
            </div>
            <!-- ==================== 关联表设置 ===================================================== -->
        	<div id="bpmCode" class="tab-pane fade ${tabType == 'bpmCode' ? 'active in' : ''}">
        	<c:if test="${tabType == 'bpmCode'}">
        	  
        	</c:if>
        	</div>
	    </div>
    </div>
	<!-- end of main -->
	</div>
  </body>
</html>
