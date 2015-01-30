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
					<form id="subForm" method="post" action="annualchangeplan_s-save.do?parentid=${parentid}&flowId=${flowId}" class="form-horizontal">
					  <c:if test="${model != null}">
					      <input id="code_id" type="hidden" name="id" value="${model.id}">
					  </c:if>
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-projecttype">项目类别:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.projecttype.fcEdit=='1'}">    <input id="code-projecttype" type="text" name="projecttype" value="${model.projecttype}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.projecttype.fcEdit!='1'}">    <label>${model.projecttype}</label>    <input type="hidden" name="projecttype" value="${model.projecttype}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-projectname">项目名称:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.projectname.fcEdit=='1'}">    <input id="code-projectname" type="text" name="projectname" value="${model.projectname}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.projectname.fcEdit!='1'}">    <label>${model.projectname}</label>    <input type="hidden" name="projectname" value="${model.projectname}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-materialtype">材料类别:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.materialtype.fcEdit=='1'}">    <input id="code-materialtype" type="text" name="materialtype" value="${model.materialtype}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.materialtype.fcEdit!='1'}">    <label>${model.materialtype}</label>    <input type="hidden" name="materialtype" value="${model.materialtype}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-materialname">材料名称:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.materialname.fcEdit=='1'}">    <input id="code-materialname" type="text" name="materialname" value="${model.materialname}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.materialname.fcEdit!='1'}">    <label>${model.materialname}</label>    <input type="hidden" name="materialname" value="${model.materialname}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-materialspec">规格/型号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.materialspec.fcEdit=='1'}">    <input id="code-materialspec" type="text" name="materialspec" value="${model.materialspec}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.materialspec.fcEdit!='1'}">    <label>${model.materialspec}</label>    <input type="hidden" name="materialspec" value="${model.materialspec}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-materialunit">单位:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.materialunit.fcEdit=='1'}">    <input id="code-materialunit" type="text" name="materialunit" value="${model.materialunit}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.materialunit.fcEdit!='1'}">    <label>${model.materialunit}</label>    <input type="hidden" name="materialunit" value="${model.materialunit}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-materialprice">单价:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.materialprice.fcEdit=='1'}">    <input id="code-materialprice" type="text" name="materialprice" value="${model.materialprice}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.materialprice.fcEdit!='1'}">    <label>${model.materialprice}</label>    <input type="hidden" name="materialprice" value="${model.materialprice}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-materialnum">数量:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.materialnum.fcEdit=='1'}">    <input id="code-materialnum" type="text" name="materialnum" value="${model.materialnum}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.materialnum.fcEdit!='1'}">    <label>${model.materialnum}</label>    <input type="hidden" name="materialnum" value="${model.materialnum}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-changeplanam">变更前计划数:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.changeplanam.fcEdit=='1'}">    <input id="code-changeplanam" type="text" name="changeplanam" value="${model.changeplanam}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.changeplanam.fcEdit!='1'}">    <label>${model.changeplanam}</label>    <input type="hidden" name="changeplanam" value="${model.changeplanam}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-changeafterplanam">变更后计划数:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.changeafterplanam.fcEdit=='1'}">    <input id="code-changeafterplanam" type="text" name="changeafterplanam" value="${model.changeafterplanam}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.changeafterplanam.fcEdit!='1'}">    <label>${model.changeafterplanam}</label>    <input type="hidden" name="changeafterplanam" value="${model.changeafterplanam}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-addplanam">增补、变更数:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.addplanam.fcEdit=='1'}">    <input id="code-addplanam" type="text" name="addplanam" value="${model.addplanam}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.addplanam.fcEdit!='1'}">    <label>${model.addplanam}</label>    <input type="hidden" name="addplanam" value="${model.addplanam}">  </c:if></div>
                              
	                          
                              <label class="control-label col-lg-2" for="code-deptname">所属部门:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.deptname.fcEdit=='1'}">    <input id="code-deptname" type="text" name="deptname" value="${model.deptname}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.deptname.fcEdit!='1'}">    <label>${model.deptname}</label>    <input type="hidden" name="deptname" value="${model.deptname}">  </c:if></div>
                              
                            </div>
	                          
                               <div class="form-group">
                              <label class="control-label col-lg-2" for="code-remark">备注:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.remark.fcEdit=='1'}">    <input id="code-remark" type="text" name="remark" value="${model.remark}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.remark.fcEdit!='1'}">    <label>${model.remark}</label>    <input type="hidden" name="remark" value="${model.remark}">  </c:if></div>
                              
                            </div>
	                          
					  
					  <div class="form-group">
					    <div class="col-lg-10 col-lg-offset-2">
					      <button id="submitButton" class="btn btn-primary btn-sm a-submit"><spring:message code='core.input.save' text='保存'/></button>
					      <button type="button" onclick="history.back();" class="btn btn-primary btn-sm a-cancel"><spring:message code='core.input.back' text='返回'/></button>
					    </div>
					  </div>
					</form>
			</div>
		
      </div>
    </div>
	<!-- end of main -->
  </body>
</html>
