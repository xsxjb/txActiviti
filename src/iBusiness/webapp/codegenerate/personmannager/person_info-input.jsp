<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>人事档案管理编辑</title>
    <%@include file="/common/center.jsp"%>
  </head>
  <body>
    <script type="text/javascript">
		$(function() {
		    $("#cgForm").validate({
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
    <div class="panel panel-default col-lg-12"> 
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">人事档案管理编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="person_info-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                        <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-name">姓名:</label>
                          <div class="col-lg-3">   <input id="code-name" type="text" name="name" value="${model.name}" class="text required" > 
                          </div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-gender">性别:</label>
                          <div class="col-lg-3">    <select id="code-gender" name="gender" class="form-control required" >          <option value="" >请选择</option>        <c:forEach items="${genderItems}" var="item">          <option value="${item.key}" ${item.key==model.gender? 'selected':''} >${item.value}</option>        </c:forEach>    </select></div>
                          
                          <label class="col-lg-2 control-label" for="code-birth">出生日期:</label>
                          <div class="col-lg-3">  <div class="input-append datepicker date">  <span class="add-on">    <input id="code-birth" type="text" name="birth" value="${model.birth}" class="text required" readonly >  </span>  </div></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-birthplace">出生地:</label>
                          <div class="col-lg-3">   <input id="code-birthplace" type="text" name="birthplace" value="${model.birthplace}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-politicsstatus">政治面貌:</label>
                          <div class="col-lg-3">    <select id="code-politicsstatus" name="politicsstatus" class="form-control required" >          <option value="" >请选择</option>        <c:forEach items="${politicsstatusItems}" var="item">          <option value="${item.key}" ${item.key==model.politicsstatus? 'selected':''} >${item.value}</option>        </c:forEach>    </select></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-idcard">身份证号:</label>
                          <div class="col-lg-3">   <input id="code-idcard" type="text" name="idcard" value="${model.idcard}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-maritalstatus">婚姻状况:</label>
                          <div class="col-lg-3">    <select id="code-maritalstatus" name="maritalstatus" class="form-control required" >          <option value="" >请选择</option>        <c:forEach items="${maritalstatusItems}" var="item">          <option value="${item.key}" ${item.key==model.maritalstatus? 'selected':''} >${item.value}</option>        </c:forEach>    </select></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-culturestandard">文化程度:</label>
                          <div class="col-lg-3">    <select id="code-culturestandard" name="culturestandard" class="form-control required" >          <option value="" >请选择</option>        <c:forEach items="${culturestandardItems}" var="item">          <option value="${item.key}" ${item.key==model.culturestandard? 'selected':''} >${item.value}</option>        </c:forEach>    </select></div>
                          
                          <label class="col-lg-2 control-label" for="code-graduateschool">毕业学校:</label>
                          <div class="col-lg-3">   <input id="code-graduateschool" type="text" name="graduateschool" value="${model.graduateschool}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-major">所学专业:</label>
                          <div class="col-lg-3">   <input id="code-major" type="text" name="major" value="${model.major}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-graduatedate">毕业时间:</label>
                          <div class="col-lg-3">  <div class="input-append datepicker date">  <span class="add-on">    <input id="code-graduatedate" type="text" name="graduatedate" value="${model.graduatedate}" class="text required" readonly >  </span>  </div></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-phone">联系电话:</label>
                          <div class="col-lg-3">  <input id="code-phone" type="text" name="phone" value="${model.phone}" class="text number required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-address">家庭住址:</label>
                          <div class="col-lg-3">   <input id="code-address" type="text" name="address" value="${model.address}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-tel">家庭电话:</label>
                          <div class="col-lg-3">   <input id="code-tel" type="text" name="tel" value="${model.tel}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-hkadr">户口所在地:</label>
                          <div class="col-lg-3">   <input id="code-hkadr" type="text" name="hkadr" value="${model.hkadr}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-zipcode">邮政编码:</label>
                          <div class="col-lg-3">  <input id="code-zipcode" type="text" name="zipcode" value="${model.zipcode}" class="text number required" ></div>
                          
                          
                          <label class="col-lg-2 control-label" for="code-post">职务:</label>
                          <div class="col-lg-3">   <input id="code-post" type="text" name="post" value="${model.post}" class="text required" ></div>
                          </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-posttitle">职称:</label>
                          <div class="col-lg-3">   <input id="code-posttitle" type="text" name="posttitle" value="${model.posttitle}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-enterdate">入职时间:</label>
                          <div class="col-lg-3">  <div class="input-append datetimepicker date">  <span class="add-on">    <input data-format="yyyy-MM-dd hh:mm:ss" type="text" name="enterdate" value="${model.enterdate}" class="text required" maxlength="20" readonly >  </span>  </div></div>
                          
                          <label class="col-lg-2 control-label" for="code-fulldate">转正时间:</label>
                          <div class="col-lg-3">  <div class="input-append datetimepicker date">  <span class="add-on">    <input data-format="yyyy-MM-dd hh:mm:ss" type="text" name="fulldate" value="${model.fulldate}" class="text required" maxlength="20" readonly >  </span>  </div></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-leavedate">离职时间:</label>
                          <div class="col-lg-3">  <div class="input-append datetimepicker date">  <span class="add-on">    <input data-format="yyyy-MM-dd hh:mm:ss" type="text" name="leavedate" value="${model.leavedate}" class="text required" maxlength="20" readonly >  </span>  </div></div>
                          </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-treatment">待遇:</label>
                          <div class="col-lg-3">  <input id="code-treatment" type="text" name="treatment" value="${model.treatment}" class="text number required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-originalworkunit">原工作单位:</label>
                          <div class="col-lg-3">   <input id="code-originalworkunit" type="text" name="originalworkunit" value="${model.originalworkunit}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-bondsman">担保人:</label>
                          <div class="col-lg-3">   <input id="code-bondsman" type="text" name="bondsman" value="${model.bondsman}" class="text required" ></div>
                          </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-remark">备注:</label>
                          <div class="col-lg-6">    <textarea class="form-control required" id="code-remark" name="remark" rows="1" >${model.remark}</textarea></div>
                          
                            </div>
                  
                  <div class="form-group">
	                  <div class="col-lg-10 col-lg-offset-2">
	                      <button id="submitButton" class="btn btn-primary btn-sm a-submit"><span class="glyphicon glyphicon-floppy-save"></span>保存</button>
	                      <button type="button" onclick="location.href='person_info-list.do'" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-log-out"></span> 关闭</button>
	                  </div>
                  </div>
                </form>
        </div>
    </div>
    <!-- end of main -->
  </body>
</html>
