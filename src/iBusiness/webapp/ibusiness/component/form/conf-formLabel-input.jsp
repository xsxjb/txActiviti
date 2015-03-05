<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "table");%>
<%pageContext.setAttribute("currentMenu", "serviceModule");%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>编辑表单组件</title>
    <%@include file="/common/center.jsp"%>
    <script type="text/javascript">
	    // 设置值
		function defailtChange(str){
			$("#form-fcDefault").val($("#form-fcDefault").val() + str);
		}
    </script>
  </head>
  <body>
    <%@include file="/ibusiness/component/manage/header-manage.jsp"%>
    
    <div class="col-lg-1"></div>
    <!-- start of main -->
    <div class="panel panel-default col-lg-10"> 
        <div class="panel-heading"><h4 class="panel-title glyphicon glyphicon-paperclip">编辑表单组件</h4></div>
        <div class="panel-body">
                <form id="formLabelForm" method="post" action="conf-formLabel-save.do" class="form-horizontal">
                    <c:if test="${model != null}">
                        <input type="hidden" name="formName" value="${model.formName}">
                        <input type="hidden" name="formColumn" value="${model.formColumn}">
                        <input type="hidden" name="packageName" value="${model.packageName}">
                        <input type="hidden" name="tableName" value="${model.tableName}">
                        <input type="hidden" name="tableColumn" value="${model.tableColumn}">
                    </c:if>
                    
                      <div class="form-group">
                          <label class="control-label col-lg-2" for="form-column">字段:</label>
                          <div class="col-lg-3">
                              <label id="form-column" >${model.formColumn}</label>
                          </div>
                          <label class="control-label col-lg-2" for="form-column-title">显示标题:</label>
                          <div class="col-lg-3">
                              <input id="form-column-title" type="text" name="formColumnTitle" value="${model.formColumnTitle}"  class="text required" >
                          </div>
                      </div>
                      <div class="form-group">
                          <label class="control-label col-lg-2" for="form-fcType">组件类型:</label>
                          <div class="col-lg-2">
                          <script type="text/javascript">
								function setConfSelectInfo(str) {
									if ("" == $('#form-confSelectInfo').attr('value') || null==$('#form-confSelectInfo').attr('value')) {
										if ("6" == str) {
											$('#form-confSelectInfo').attr('value', "[{\"key\":\"1\",\"value\":\"男\"},{\"key\":\"2\",\"value\":\"女\"}]");
										} else if ("7" == str) {
											$('#form-confSelectInfo').attr('value', "[{\"sql\":\"select id vKey, name vValue from ib_job_title\"}]");
										} else if ("10" == str) {
											$('#form-confSelectInfo').attr('value', "{\"jsplist\":[{\"inputKey\":\"目标属性名\",\"inputValue\":\"查询属性名\",\"inputTitle\":\"标题名称\"},{\"inputKey\":\"materialmodel\",\"inputValue\":\"model\",\"inputTitle\":\"规格型号\"}],\"className\":\"com.codegenerate.productmanage.service.MaterialsService\",\"queryTitle\":\"查询标题名\",\"queryName\":\"查询对象\"}");
										} else if ("11" == str) {
											$('#form-confSelectInfo').attr('value', "{\"pathName\":\"存储地址\"}");
										}
									} else {
										if ("1" == str || "2" == str || "3" == str || "4" == str || "5" == str || "8" == str || "9" == str) {
											$('#form-confSelectInfo').attr('value', "");
										}
									}
								}
							</script>
                              <select id="form-fcType" name="fcType"  class="form-control" onChange="setConfSelectInfo(this.value);" >
                                    <option value="1" ${model.fcType==1 ? 'selected' : ''}>单行</option>
                                    <option value="2" ${model.fcType==2 ? 'selected' : ''}>多行</option>
                                    <option value="3" ${model.fcType==3 ? 'selected' : ''}>日期</option>
                                    <option value="4" ${model.fcType==4 ? 'selected' : ''}>时间</option>
                                    <option value="5" ${model.fcType==5 ? 'selected' : ''}>数值</option>
                                    <option value="6" ${model.fcType==6 ? 'selected' : ''}>下拉列表</option>
                                    <option value="7" ${model.fcType==7 ? 'selected' : ''}>下拉数据字典</option>
                                    <option value="8" ${model.fcType==8 ? 'selected' : ''}>单选按钮</option>
                                    <option value="9" ${model.fcType==9 ? 'selected' : ''}>多选按钮</option>
                                    <option value="10" ${model.fcType==10 ? 'selected' : ''}>选择带出</option>
                                    <option value="11" ${model.fcType==11 ? 'selected' : ''}>附件上传组件</option>
                               </select>
                           </div>
                      </div>
                      <div class="form-group">
                          <div class="col-lg-1"></div>
                          <div class="col-lg-11">
                          <label class="control-label" for="form-confSelectInfo">
                          
                          <p class="text-left">
              *组件类型:选择组件类型后如果下面框中内容为空,会自动在框中提示参数写法,如果已有内容则不提示。<br/>
                  1.输入范围Check：{"maxlength":"30","minlength":"2"}<br/>
                  2.设置下拉列表固定值：[{"key":"1","value":"男"},{"key":"2","value":"女"}]<br/>
                  3.设置数据字典值：是一句SQL文,只能返回名字为vKey,和vValue两个返回值。<br/>
                  4.选择带出值：inputKey:目标属性名  inputValue:查询属性名  inputTitle:显示标题 <br/>
                               className:service名及全路径 queryTitle:查询标题名  queryName:查询对象<br/>
                  5.单附件上传组件：{"pathName":"存储文件夹名"}<br/>
                          </p>
                     
                          </label>
                          </div>
                          <div class="col-lg-1"></div>
                          <div class="col-lg-9">
                              <textarea id="form-confSelectInfo" class="form-control" rows="4" name="confSelectInfo"  >${model.confSelectInfo}</textarea>
                          </div>
                      </div>
                      <div class="form-group">
                          <label class="control-label col-lg-2" for="form-fcWidth">录入宽度:</label>
                          <div class="col-lg-3">
                              <input id="form-fcWidth" type="text" name="fcWidth" value="${model.fcWidth}"  class="text required" >
                          </div>
                          <label class="control-label col-lg-2" for="form-fcHeight">录入高度:</label>
                          <div class="col-lg-3">
                              <input id="form-fcHeight" type="text" name="fcHeight" value="${model.fcHeight}"  class="text required" >
                          </div>
                      </div>
                      <div class="form-group">
                          <label class="col-lg-2 control-label " for="form-fcDisplay">是否显示:</label>
                          <div class="col-lg-2">
                              <select id="form-fcDisplay" name="fcDisplay"  class="form-control">
                                    <option value="1" ${model.fcDisplay==1 ? 'selected' : ''}>是</option>
                                    <option value="2" ${model.fcDisplay==2 ? 'selected' : ''}>否</option>
                               </select>
                           </div>
                          <label class="col-lg-2 control-label" for="form-fcEdit">是否编辑:</label>
                          <div class="col-lg-2">
                              <select id="form-fcEdit" name="fcEdit"  class="form-control">
                                    <option value="1" ${model.fcEdit==1 ? 'selected' : ''}>是</option>
                                    <option value="2" ${model.fcEdit==2 ? 'selected' : ''}>否</option>
                               </select>
                          </div>
                      </div>
                      <div class="form-group">
                          <label class="col-lg-2 control-label" for="form-fcEdit">是否查询字段:</label>
                          <div class="col-lg-2">
                              <select id="form-fcQuery" name="fcQuery"  class="form-control">
                                    <option value="1" ${model.fcQuery==1 ? 'selected' : ''}>是</option>
                                    <option value="2" ${model.fcQuery==2 ? 'selected' : ''}>否</option>
                               </select>
                          </div>
                          <label class="col-lg-2 control-label " for="form-fcMust">必须输入:</label>
                          <div class="col-lg-2">
                              <select id="form-fcMust" name="fcMust"  class="form-control">
                                    <option value="1" ${model.fcMust==1 ? 'selected' : ''}>是</option>
                                    <option value="2" ${model.fcMust==2 ? 'selected' : ''}>否</option>
                               </select>
                           </div>
                      </div>
                      <div class="form-group">
                          <label class="control-label col-lg-2" for="form-fcDefault">默认值:</label>
                          <div class="input-group col-lg-4">
						      <input id="form-fcDefault" type="text" name="fcDefault" value="${model.fcDefault}" class="form-control">
						      <div class="input-group-btn">
						        <button type="button" class="btn btn-primary dropdown-toggle btn-sm" data-toggle="dropdown">公式<span class="caret"></span></button>
						        <ul class="dropdown-menu dropdown-menu-right">
						          <li><a href="#" onClick="defailtChange('@currentDate')" >当前日期时间</a></li>
						          <li><a href="#" onClick="defailtChange('@currentDateToStr')" >当前日期时间字符串</a></li>
						          <li><a href="#" onClick="defailtChange('@userName')" >当前用户</a></li>
						          <li class="divider"></li>
						          <li><a href="#" onClick="defailtChange('@autoId')" >自增长ID</a></li>
						        </ul>
						      </div>
						  </div>
                      </div>
                      <div class="form-group">
                          <label class="control-label col-lg-2" for="form-columnNo">排序:</label>
                          <div class="col-lg-3">
                              <input id="form-fcWidth" type="text" name="columnNo" value="${model.columnNo}"  class="text required" >
                          </div>
                      </div>
                  <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-2">
                      <button id="submitButton" class="btn btn-primary a-submit"><spring:message code='core.input.save' text='保存'/></button>
                      <button type="button" onclick="history.back();" class="btn btn-primary a-cancel"><spring:message code='core.input.back' text='返回'/></button>
                    </div>
                  </div>
                </form>
        </div>
      </div>
    <!-- end of main -->
  </body>
</html>
