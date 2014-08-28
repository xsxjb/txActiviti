<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "user");%>
<%pageContext.setAttribute("currentMenu", "user");%>
<!doctype html>
<html>

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="user.user.input.title" text="编辑用户"/></title>
    <%@include file="/common/center.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#userForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error',
        rules: {
            username: {
                remote: {
                    url: 'user-base-checkUsername.do',
                    data: {
                        <c:if test="${model != null}">
                        id: function() {
                            return $('#user-base_id').val();
                        }
                        </c:if>
                    }
                }
            }
        },
        messages: {
            username: {
                remote: "<spring:message code='user.user.input.duplicate' text='存在重复账号'/>"
            }
        }
    });
})
    </script>
  </head>

  <body>
    <%@include file="/header/header-portal.jsp"%>

    <div class="span2"> </div>
	<!-- start of main -->
	<div class="panel panel-default span10"> 
        <div class="panel-heading"><h6 class="title">编辑用户</h6></div>
        <div class="panel-body">
        
        <form id="userForm" method="post" action="user-base-save.do?operationMode=STORE" class="form-horizontal">
			  <input id="user-base_userRepoId" type="hidden" name="userRepoId" value="1">
			  <c:if test="${model != null}">
			  	<input id="user-base_id" type="hidden" name="id" value="${model.id}">
			  </c:if>
			  <p>
			    <label class="control-label" for="user-base_username">账号:</label>
			    <input id="user-base_username" type="text" name="username" value="${model.username}"  class="text" >
			   </p>
			   <c:if test="${model == null || model.password == null}">
					<p>
					    <label class="control-label" for="user-base_password"><spring:message code="user.user.input.password" text="密码"/>:</label>
						 <input id="user-base_password" type="password" name="password" class="text required" maxlength="10">
					 </p>
					 <p>
					    <label class="control-label" for="user-base_confirmPassword"><spring:message code="user.user.input.confirmpassword" text="验证密码"/>:</label>
					    <input id="user-base_confirmPassword" type="password" name="confirmPassword" class="text required" maxlength="10" equalTo="#user-base_password">
					 </p>
				 </c:if>
				  <p>
				      <label class="control-label" for="user-base_status"><spring:message code="user.user.input.enabled" text="启用"/>:</label>
					  <input id="user-base_status" type="checkbox" name="status" value="1" ${model.status == 1 ? 'checked' : ''}>
				  </p>
				  <p>
				      <label class="control-label" for="user-base_displayName">显示名:</label>
					  <input id="user-base_displayName" type="text" name="displayName" value="${model.displayName}"  class="text required" minlength="2" maxlength="50">
				  </p>
				  <p>
				    <label class="control-label" for="job_level">职位:</label>
					  <select id="job_level" name="jobId">
						  <c:forEach items="${jobInfos}" var="item">
						    <option value="${item.id}" ${item.id==model.jobInfo.id ? 'selected' : ''}>${item.jobTitle.name}</option>
						  </c:forEach>
					  </select>
				  </p>
				  <p>
				      <label class="control-label" for="user-base_email">邮箱:</label>
					  <input id="user-base_email" type="text" name="email" value="${model.email}">
				  </p>
				  <p>
				      <label class="control-label" for="user-base_mobile">手机:</label>
					  <input id="user-base_mobile" type="text" name="mobile" value="${model.mobile}">
				  </p>
				  <p>
				      <label class="control-label" for="user-base_ref"><spring:message code="user.user.input.ref" text="引用"/>:</label>
					  <input id="user-base_ref" type="text" name="ref" value="${model.ref}">
				  </p>
				  <c:forEach items="${userBaseWrapper.userAttrWrappers}" var="item">
					  <p>
					      <label class="control-label" for="user-base_${item.code}">${item.name}</label>
						  <input id="user-base_${item.code}" type="text" name="_user_attr_${item.code}"  class="text" maxlength="50" value="${item.value}">
				       </p>
				  </c:forEach>
				  <p>
				      <button id="submitButton" class="btn btn-default a-submit"><spring:message code='core.input.save' text='保存'/></button>
				      <button type="button" onclick="history.back();" class="btn btn-default a-cancel"><spring:message code='core.input.back' text='返回'/></button>
				  </p>
			 </form>
        </div>
	<!-- end of main -->
	</div>

  </body>

</html>
