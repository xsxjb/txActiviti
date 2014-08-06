<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "user");%>
<%pageContext.setAttribute("currentMenu", "user");%>
<!doctype html>
<html>

  <head>
    <%@include file="/common/meta.jsp"%>
    <title>编辑表列字段信息</title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#tableForm").validate({
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
    <%@include file="/header/table.jsp"%>
    <div class="row-fluid">
	  <%@include file="/menu/table-manage.jsp"%>

	<!-- start of main -->
    <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title">编辑列字段</h4>
		</header>
		<div class="content content-inner">
			<form id="tableForm" method="post" action="conf-table-columns-update.do?tableName=${tableName}" class="form-horizontal">
			  <div class="control-group">
			    <label class="control-label" for="table-columnValue"><spring:message code="user.user.input.username" text="字段名"/></label>
				<div class="controls">
				  <input id="table-columnValue" type="text" name="columnValue" value="${beanInfo.columnValue}" size="40" class="text required" maxlength="50">
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" for="table-columnName">字段标题</label>
				<div class="controls">
				  <input id="table-columnName" type="text" name="columnName" value="${beanInfo.columnName}" size="40" class="text required" >
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" for="table-columnType">字段类型</label>
				<div class="controls">
				  <input id="table-columnType" type="text" name="columnType" value="${beanInfo.columnType}" size="40" class="text required" >
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" for="table-columnSize">长度</label>
				<div class="controls">
				  <input id="table-columnSize" type="text" name="columnSize" value="${beanInfo.columnSize}" size="40" class="text required" >
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" for="table-isNull">允许空</label>
				<div class="controls">
				  <input id="table-isNull" type="text" name="isNull" value="${beanInfo.isNull}">
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" for="table-defaultValue">默认值</label>
				<div class="controls">
				  <input id="table-defaultValue" type="text" name="defaultValue" value="${beanInfo.defaultValue}">
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" for="table-columnNo">字段排序编号</label>
				<div class="controls">
				  <input id="table-columnNo" type="text" name="columnNo" value="${beanInfo.columnNo}">
			    </div>
			  </div>
			  
			  <div class="control-group">
			    <div class="controls">
			      <button id="submitButton" class="btn a-submit"><spring:message code='core.input.save' text='保存'/></button>
			      <button type="button" onclick="history.back();" class="btn a-cancel"><spring:message code='core.input.back' text='返回'/></button>
			    </div>
			  </div>
			</form>
		</div>
      </article>

    </section>
	<!-- end of main -->
	</div>

  </body>

</html>
