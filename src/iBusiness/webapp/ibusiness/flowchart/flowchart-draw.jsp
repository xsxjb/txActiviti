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
    <%@include file="/ibusiness/header/header-portal.jsp"%>
    <div class="row">
	<%@include file="/ibusiness/component/portal/component-leftmenu.jsp"%>
	
		<script type="text/javascript" src="<%=request.getContextPath()%>/plugin/ibusiness/flowchart/js/uuid.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/plugin/ibusiness/flowchart/js/ArrayList.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/plugin/ibusiness/flowchart/js/HashMap.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/plugin/html5/excanvas.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/plugin/ibusiness/flowchart/js/CruciateAuxiliaryLine.js"></script>
		<!--  -->
		<script type="text/javascript" src="<%=request.getContextPath()%>/plugin/ibusiness/flowchart/js/StartNode.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/plugin/ibusiness/flowchart/js/EndNode.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/plugin/ibusiness/flowchart/js/ReviveScene.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/plugin/ibusiness/flowchart/js/Lane.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/plugin/ibusiness/flowchart/js/TaskNode.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/plugin/ibusiness/flowchart/js/Texts.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/plugin/ibusiness/flowchart/js/Pipeline.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/plugin/ibusiness/flowchart/js/CalculatePos.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/plugin/ibusiness/flowchart/js/Line.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/plugin/ibusiness/flowchart/js/eventDraw.js"></script>
		<style type="text/css">
			.tool {height: 30px; float: left; cursor: pointer; padding: 5px; filter: alpha(Opacity = 70); opacity: 0.7; }
		</style>
	<!-- ================================================================================= -->
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
	        <input id="bpmId" type="hidden" name="bpmId" value="${bpmId}">
	        <input id="packageName" type="hidden" name="packageName" value="${packageName}">
	        <!--  -->
	        	<div id="toolCanvas"  style="position: relative; height: 40px; width:1080px; border: 1px solid;">
						<div class="tool"  title="泳道" id="addLane"><img height="30px" width="30px" src="<%=request.getContextPath()%>/plugin/ibusiness/flowchart/img/lanebg.png" /></div>
						<div class="tool"  title="开始" id="StartNode">
							<img height="30px" width="30px" name="startNode" id="startNodeImg" src="<%=request.getContextPath()%>/plugin/ibusiness/flowchart/img/startnode.png" />
						</div>
						<div class="tool"  title="任务节点" id="TaskNode">
							<img height="30px" width="30px" name="taskNode" id="taskNodeImg" src="<%=request.getContextPath()%>/plugin/ibusiness/flowchart/img/tasknode.png" />
						</div>
						<div class="tool"  title="结束" id="EndNode">
							<img height="30px" width="30px" name="endNode" id="endNodeImg" src="<%=request.getContextPath()%>/plugin/ibusiness/flowchart/img/endnode.png" />
						</div>
						<div class="tool"  title="线" id="Pipeline">
							<img height="30px" width="30px" name="line" id="lineImg" src="<%=request.getContextPath()%>/plugin/ibusiness/flowchart/img/waterflow.png" />
						</div>
						<div class="tool"  title="选择" id="select">
							<img height="30px" width="30px" name="select" id="selectImg" src="<%=request.getContextPath()%>/plugin/ibusiness/flowchart/img/select.jpg" />
						</div>
						<!--  -->
						<div  style="height: 30px; float: left; cursor: pointer; padding: 5px; filter: alpha(Opacity = 100); opacity: 1;" >
						    <label class="control-label" for="select_flowname">关联流程:</label>
							<select id="select_flowname" name="flowId" >
							      <option value="" selected>请选择流程:</option>
							</select>
						</div>
						<!--  -->
						<div class="tool"  title="查询" id="search"><img height="30px" width="30px" src="<%=request.getContextPath()%>/plugin/ibusiness/flowchart/img/query.gif" /></div>
						<div class="tool"  title="保存" id="save"><img height="30px" width="30px" src="<%=request.getContextPath()%>/plugin/ibusiness/flowchart/img/save.gif" /></div>
						<div class="tool"  title="删除所有" id="delete"><img height="30px" width="30px"  src="<%=request.getContextPath()%>/plugin/ibusiness/flowchart/img/delete.png" /></div>
						<div style="float: right;padding-top:8px;padding-right:5px">
							<input type="radio" name="animated" id="animated" value="1">显示动画
							<input type="radio" name="animated" id="animated" value="0" checked>不显示动画
							<a href="${scopePrefix}/bpm-process/bpm-process-input.do?packageName=${packageName}&bpmId=${bpmId}" class="btn btn-default btn-sm " >返回</a>
						</div>
					</div>
					<!-- 基础弹出form页面 -->
					<div id ="baseForm"  style="width: 200px;position: absolute; top: 330; left: 400; z-index: 1000; text-align: center; background-color: #CFDFEF; display: none;">
						<table style="width:200px;">
							<tr><td><label >id</label></td><td align="left"><input id ="baseId"  style="width:100px;" type="text" value="" readonly="readonly"> </td></tr>
							<tr><td><label >标题</label></td><td align="left"><input id ="baseTitle"  style="width:100px;" type="text" value=""></td></tr>
							<tr><td><label >x坐标</label></td><td align="left"><input id ="baseX"  style="width:100px;" type="text" disabled/></td></tr>
							<tr><td><label >y坐标</label></td><td align="left"><input id = "baseY"  style="width:100px;" type="text" value="" disabled></td></tr>
							<tr><td>操作</td>
								<td>
									<a href="#" id = "addBase" >确定</a>
									<a href="#" id = "deleteBase" >删除</a>
									<a href="#" onclick="javascript:$('#baseForm').hide(300)">关闭</a>
								</td>
							</tr>
						</table> 
					</div>
					
					<!-- 任务节点出页面 -->
				    <div id="taskNodeDiv" class="modal fade" style="top:20%;" >
				            <div class="modal-dialog">
						    <div class="modal-content">
							      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal"><span >&times;</span><span class="sr-only">Close</span></button>
								        <h4 class="modal-title">设置节点信息</h4>
							      </div>
							      <div class="modal-body">
							          <!-- 表单数据 -->
							      	  <div class="panel panel-primary">
										  <!-- 子表 -->
										  <c:if test="${null != bpmNodeTables}">
										  <c:forEach items="${bpmNodeTables}" var="bpmNodeColums">
											  <div class="panel-heading"><h4 class="panel-title">子表字段设置：</h4></div>
							        		  <div class="panel-body">
								        	      <table class="table table-hover table-bordered" id=“tableModelGrid” >
														<thead>
															<tr>
															    <th>字段</th>
															    <th>显示标题</th>
															    <th class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)">是否显示</th>
															    <th class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems2(this.checked)">是否编辑</th>
																<th width="120">&nbsp;</th>
															</tr>
														</thead>
														<tbody>
														<c:forEach items="${bpmNodeColums}" var="item">
														    <tr>
														        <td>${item.formColumn}</td>
														        <td>${item.formColumnTitle}</td>
														        <td><input type="checkbox" class="selectedItem a-check" name="selectedFcDisplayItem" value="${item.formColumn}" ${item.fcDisplay==1 ? 'checked' : ''}>显示</td>
																<td><input type="checkbox" class="selectedItem2 a-check" name="selectedFcEditItem" value="${item.formColumn}" ${item.fcEdit==1 ? 'checked' : ''}>可编辑</td>
																<td>
														            <a href="conf-formLabel-input.do?packageName=${item.packageName}&formName=${item.formName}&formColumn=${item.formColumn}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
														        </td>
														    </tr>
														  </c:forEach>
														</tbody>
												  </table>
											  </div>
										  </c:forEach>
										  </c:if>
									  </div>
						                
						           </div>
						           <div class="modal-footer">
						                    <button class="btn btn-default btn-sm" data-dismiss="modal" >关闭</button>
						           </div>
					            </div><!-- /.modal-content -->
						  </div><!-- /.modal-dialog -->
				    </div>
					<!-- 任务节点出页面 -->
					<div id ="taskNodeForm"  style="width: 200px;position: absolute; top: 330; left: 400; z-index: 1000; text-align: center; background-color: #CFDFEF; display: none;">
						<table style="width: 200px;">
							<tr><td>id</td><td align="left"><input id ="taskNodeId" type="text" value="" readonly="readonly"> </td></tr>
							<tr><td>名称</td><td align="left"><input id ="taskNodeName" type="text" value=""></td></tr>
							<tr><td>x坐标</td><td align="left"><input id ="taskNodeX" type="text" value="" disabled></td></tr>
							<tr><td>y坐标</td><td align="left"><input id = "taskNodeY" type="text" value="" disabled></td></tr>
							<tr><td>操作</td>
								<td>
									<a href="#" id = "addTaskNode" >确定</a>
									<a href="#" id = "deleteLamp" >删除</a>
									<a href="#" onclick="javascript:$('#taskNodeForm').hide(300)">关闭</a>
								</td>
							</tr>
						</table> 
					</div>
					
					<!-- 画图面板 -->
					<canvas id="canvas" style="border:1px solid #DDDDDD"></canvas>
        	</div>
    </div>
	<!-- end of main -->
		<script type="text/javascript">
			var elements = new ArrayList();
			var canvas = null;
			var ctx = null;
			var width = 1080;
			var height = 500;
			var deviceTyleList = null;
			/**
			 *	页面初始化
			 */
			function init(){
				canvas = document.getElementById("canvas");  
				ctx = canvas.getContext("2d"); 
				//设置场景的大小
				canvas.width = width;
				canvas.height = height;
				
				start();  
				//开启定时器
				setInterval( start,100 );
			}
			/**
			 * 每300毫秒调用这个方法一次
			 */
			function start(){
				if( ctx != null ){
					//清空画板
					ctx.clearRect(0,0,width,height);
					//将背景画板涂白 ctx.fillStyle='#DDDDDD';
					ctx.fillStyle='#FFFFFF';
					ctx.fillRect( 0,0,width,height );	//填充颜色 x y坐标 宽 高
					for(var i=0;i<elements.size();i++){
						var ele = elements.get(i);
						if (null != ele && "{}" != ele) {
							//绘制动画下效果
							ele.animation();
						}
					}
				}
			}
			// 
			init();
		</script>
	
  </body>
</html>
