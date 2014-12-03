<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>

  <head>
    <%@include file="/common/meta.jsp"%>
    <title>编辑文章</title>
    <%@include file="/common/center.jsp"%>
	<script type="text/javascript" src="${ctx}/plugin/ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
$(function() {
    $("#cmsArticleForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress" ><div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"> 60% </div></div>');
			form.submit();
        },
        errorClass: 'validate-error'
    });
	var editor = CKEDITOR.replace('cmsArticle_content');
	editor.config.filebrowserImageUploadUrl = "${scopePrefix}/cms/cms-article-uploadImage.do";
})
    </script>
  </head>

  <body>
    <%@include file="/ibusiness/header/header-portal.jsp"%>

    <div class="col-lg-1"></div>
	<!-- start of main -->
	<div class="panel panel-default col-lg-10"> 
        <div class="panel-heading"><h4 class="panel-title">编辑文章</h4></div>
        <div class="panel-body">
			<div class="content content-inner">
					<form id="cmsArticleForm" method="post" action="cms-article-save.do?cmsCatalogId=1" class="form-horizontal">
					  <c:if test="${model != null}">
					  <input type="hidden" name="id" value="${model.id}">
					  </c:if>
					  <div class="form-group">
					    <label class="col-lg-2 control-label" for="cms-article_cmsArticlename">栏目</label>
						<div class="col-lg-3">
					      <select class="form-control required"  id="perm_resc" name="cmsCatalog.id" >
					          <option value="" >请选择...</option>
							  <c:forEach items="${cmsCatalogs}" var="item">
							    <option value="${item.id}" ${model.cmsCatalog.id==item.id ? 'selected' : ''}>${item.name}</option>
							  </c:forEach>
						  </select>
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-lg-2 control-label" for="cms-article_cmsArticlename">标题</label>
						<div class="controls">
						  <input id="cms-article_cmsArticlename" type="text" name="title" value="${model.title}" size="40" class="text required"  maxlength="50">
					    </div>
					  </div>
					<!--
					  <div class="form-group">
					    <label class="col-lg-2 control-label" for="cms-article_cmsArticlename">短标题</label>
						<div class="controls">
						  <input id="cms-article_cmsArticlename" type="text" name="shortTitle" value="${model.shortTitle}" size="40" class="text" minlength="2" maxlength="50">
					    </div>
					  </div>
					  -->
					  <div class="form-group">
					    <label class="col-lg-2 control-label" for="cms-article_cmsArticlename">副标题</label>
						<div class="controls">
						  <input id="cms-article_cmsArticlename" type="text" name="subTitle" value="${model.subTitle}" size="40" class="text"  maxlength="50">
					    </div>
					  </div>
					
					  <div class="form-group">
					    <label class="control-label" for="cms-article_cmsArticlename">内容:</label>
						<div class="controls">
						  <textarea id="cmsArticle_content" name="content" class="text required"  maxlength="50">${model.content}</textarea>
					    </div>
					  </div>
					<!--
					  <div class="form-group">
					    <label class="col-lg-2 control-label" for="cms-article_cmsArticlename">摘要</label>
						<div class="controls">
						  <input id="cms-article_cmsArticlename" type="text" name="summary" value="${model.summary}" size="40" class="text" minlength="2" maxlength="50">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-lg-2 control-label" for="cms-article_cmsArticlename">图标</label>
						<div class="controls">
						  <input id="cms-article_cmsArticlename" type="text" name="logo" value="${model.logo}" size="40" class="text" minlength="2" maxlength="50">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-lg-2 control-label" for="cms-article_cmsArticlename">标签</label>
						<div class="controls">
						  <input id="cms-article_cmsArticlename" type="text" name="tags" value="${model.tags}" size="40" class="text" minlength="2" maxlength="50">
					    </div>
					  </div>
					  -->
					  <div class="form-group">
					    <label class="col-lg-2 control-label" for="cms-article_cmsArticlename">允许评论</label>
						<div class="controls">
						  <input id="cms-article_cmsArticlename" type="checkbox" name="allowComment" value="1" class="text" ${model.allowComment == 1 ? 'checked' : ''}>
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-lg-2 control-label" for="cms-article_cmsArticlename">状态</label>
						<div class="controls">
						  <input id="cms-article_cmsArticlename" type="checkbox" name="status" value="1" class="text" ${model.status == 1 ? 'checked' : ''}>
					    </div>
					  </div>
					
					<!--
					  <div class="form-group">
					    <label class="col-lg-2 control-label" for="cms-article_cmsArticlename">创建时间</label>
						<div class="controls">
						  <input id="cms-article_cmsArticlename" type="text" name="createTime" value="${model.createTime}" class="text">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-lg-2 control-label" for="cms-article_cmsArticlename">发布时间</label>
						<div class="controls">
						  <input id="cms-article_cmsArticlename" type="text" name="publishTime" value="${model.publishTime}" class="text">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-lg-2 control-label" for="cms-article_cmsArticlename">关闭时间</label>
						<div class="controls">
						  <input id="cms-article_cmsArticlename" type="text" name="closeTime" value="${model.closeTime}" class="text">
					    </div>
					  </div>
					-->
					<!-- -->
					  <div class="form-group">
					    <label class="col-lg-2 control-label" for="cms-article_cmsArticlename">类型</label>
						<div class="controls">
						  <input id="cms-article_cmsArticlename" type="text" name="articleType" value="${model.articleType}" class="text">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-lg-2 control-label" for="cms-article_cmsArticlename">置顶</label>
						<div class="controls">
						  <input id="cms-article_cmsArticlename" type="text" name="top" value="${model.top}" class="text">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-lg-2 control-label" for="cms-article_cmsArticlename">权重</label>
						<div class="controls">
						  <input id="cms-article_cmsArticlename" type="text" name="weight" value="${model.weight}" class="text">
					    </div>
					  </div>
					
					  <div class="form-group">
					    <div class="col-lg-10 col-lg-offset-2">
					      <button class="btn btn-default a-submit"><spring:message code='core.input.save' text='保存'/></button>
					      <button type="button" onclick="history.back();" class="btn btn-default a-cancel"><spring:message code='core.input.back' text='返回'/></button>
					    </div>
					  </div>
					</form>
			  </div>
		</div>
	<!-- end of main -->
	</div>
	
  </body>
</html>
