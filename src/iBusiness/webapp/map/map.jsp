<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String pathBase = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() ;

%>

  <head>
    <%@include file="/common/meta.jsp"%>
    <title></title>
    
	<style type="text/css">
		<!--
		.STYLE_TITLE {
			color: #000000;
			font-weight: bold;
			font-size: 12px;
			font-family:Arial, Helvetica, sans-serif;
			width:100%;
			text-align:center;
		}
		.STYLE_TIME {
			color: #000000;
		    font-size: 12px;
		}
		-->
	</style>
	<script type="text/javascript">
		function setover(obj) {   
		 obj.style['opacity'] = 0.5;    
		 obj.style['filter'] = 'alpha(opacity=50)';}
		 function setout(obj) {   
		  obj.style['opacity'] = 1;   
		  obj.style['filter'] = 'alpha(opacity=100)';}
	</script>
<link rel="stylesheet" href="<%=basePath%>map/css/theme/default/style.css" type="text/css"/>
<link href="<%=basePath%>map/css/jquery.bigcolorpicker.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/plugin/easyui/themes/gray/easyui.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/plugin/easyui/themes/icon.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/plugin/jquery/jquery.min.js"></script>
<script src="<%=basePath%>map/js/jquery.bigcolorpicker.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/plugin/easyui/jquery.easyui.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/plugin/easyui/easyui-lang-zh_CN.js" type="text/javascript"></script>

<script src="<%=basePath%>map/js/mapFunction.js" type="text/javascript"></script>
<script src="<%=basePath%>map/js/lib/OpenLayers.js" type="text/javascript"></script>

<script src="<%=basePath%>map/js/common.js" type="text/javascript"></script>
<script src="<%=basePath%>map/js/site.js" type="text/javascript"></script>
<script src="<%=basePath%>map/js/point.js" type="text/javascript"></script>
<script src="<%=basePath%>map/js/btRegister.js" type="text/javascript"></script>
<script src="<%=basePath%>map/js/sourceAndStation.js" type="text/javascript"></script>
<script src="<%=basePath%>map/js/querySite.js" type="text/javascript"></script>

<!-- 
 <script src="http://maps.google.com/maps/api/js?v=3&amp;sensor=false"></script>
 --> 
<SCRIPT LANGUAGE="javascript">  
function view360(flag0){   
if('1'==flag0){
 window.open ('<%=pathBase%>/webByBPM/view360/test.html', 'newwindow', 'height=350, width=900, top=200, left=200, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no')     
	 }
 else if('3'==flag0){
	  window.open ('<%=pathBase%>/webByBPM/view360/test3/test3.html', 'newwindow', 'height=350, width=800, top=200, left=200, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no')    
 } else if('4'==flag0){
	  window.open ('<%=pathBase%>/webByBPM/view360/test4/test4.html', 'newwindow', 'height=620, width=800, top=200, left=200, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no')    
 }
 //写成一行     
 
 }   
 </SCRIPT>  
<style type="text/css">
	#id-nav-panel{
		position:absolute;
		top: 8px;
		right:550px;
		z-index: 99;
		background-color: #dedede;
	}
	#dv-level-color{
		position: absolute;
		right: 10px;
		top: 200px;
		width: 80px;
		height:100px;
		background-color: #efefef;
		z-index: 99;
	}
	#dv-tools-color{
	    position:absolute;
		top: 8px;
		right:300px;
		z-index: 99;
		background-color: #efefef;
	}
</style>

</head>
<body>
			<!-- 操作类型(1:添加站点,2:搜索站点,3:添加管道,4:添加机组) -->
			<input type="hidden" id="id-type" value="">
			<!-- 添加站点类型(Z:换热站,X:小区,F:阀门) -->
			<input type="hidden" id="id-site-type" value="f">
			<!-- 添加站点时图片路径临时存放变量 -->
			<input type="hidden" id="id-site-img" value="">
			<!-- 管道(1:默认)、测距(2)、测面判断(3) -->
			<input type="hidden" id="id-line-type" value=""/>
			<!-- 添加图标的时候 保存图标 sn -->
			<input type="hidden" id="point-id-tb-sn" value=""/>
			<!-- 权限控制 -->
			<%
			 String  inforid = request.getParameter("inforid");
			 String  sid = request.getParameter("sid");
			%>
			<input type="hidden" id="inforid" value="<%=inforid %>"/>
			<input type="hidden" id="sid0000" value="<%=sid %>"/>
		
		<div id="id-nav-panel">
			<div id="id-pan-nav" class="easyui-panel" iconCls="icon-ok" title="操作导航" fit="true"  collapsed="true"  collapsible="true" style="width:460px;height:100px;">
				<div id="id-tabs" class="easyui-tabs" fit="true">
					<div title="添加节点" iconCls="icon-add" type="1" >
						<div id="id-dv-tb" style="text-align:center;width:97%;margin-top: 10px;padding:5px;background:#fafafa;">
							
						</div>
					</div>
					<div  title="搜索" iconCls="icon-search" type="2">
							<table width="100%">
							<tr>
								<td align="right">类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型:</td>
								<td align="left">
									<div id ="id-dv-tb1"></div>
								</td>
								<td align="right">名称:</td>
								<td>
									<input type="text" id="id-site-name">
									<a href="#" class="easyui-linkbutton"  id="bt-find" iconCls="icon-search" plain="true">搜索</a>
								</td>
							</tr>
							<tr>
								<td align="right" >
								<!--
									搜索结果:<select id="id-result" onchange="siteChange();" ownerUnitChange() style="width:200px;"></select>
									<select id="id-result" onchange="ownerUnitChange();"  style="width:200px;"></select>
								-->
								搜索结果:
								</td>
								<td colspan="3" ><select id="id-result" onchange="siteChange();"  style="width:200px;"></select>
								</td>
							</tr>
						</table>
					</div>
				
					<div title="测距/面" iconCls="icon-add" type="5">
						<div style="padding: 5px;text-align: center;">
						<table width="70%" align="center">
						<tr>
						<td>
						<img src="images/mouse.png" onmouseover="setover(this)" onmouseout="setout(this)" onclick="recovery()"/>
						</td>
					    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="#" class="easyui-linkbutton" plain="true" id="bt-line-length"iconCls="icon-ok">测距</a>
						</td>
						<td>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="#" class="easyui-linkbutton" plain="true" id="bt-area" iconCls="icon-ok">测面</a>
						</td>
								</tr>
						</table>
						</div>
					</div> 
				</div>
			</div>
		</div>
		
		<div id="dv-tools-color">
		<div id="id-pan-nav" class="easyui-panel" iconCls="icon-ok" title="工具菜单" fit="true" collapsed="true" collapsible="true" style="width:240px;height:100px;">
				<table style="width:100%">
					<tr>
					    <td><div><input name="siteStatus" id="defaultSite" type="radio" value="1" checked="checked" onClick="refreshSites(2)" /></div></td>
						<td>默认图标</td>
					    <td><div><input name="siteStatus" id="initSiteTap" type="radio" value="2" onClick="refreshSites(1)" /></div></td>
						<td>实时图标</td>                                                  
						<td><div><input name="siteStatus" id="mouseSelect" type="radio" value="3" onClick="refreshSites(1)" /> 
						</div></td>
						<td >悬停显示</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- 添加站点窗口 -->
		<div id="id-site-window" style="display:none;">
			<form id="id-form-site">
				<div id="id-tabs-site" class="easyui-tabs" tools="#tab-tools">
					<div title="基本信息">
					<input type="hidden" name="iconTypeId" id="tbtype1"/>
					<input type="hidden" name="heatId" id="fkid1"/>
						<table style="width:100%">
							<tr>
							    <td width="18%" align="right" >编号:</td>
								<td width="35%"><input type="text" name="siteNo" id="site_id1" readonly="readonly"></td>
								<td width="18%" align="right">名称:</td>
								<td width="35%"><input type="text" name="siteName" id="site_name1" readonly="readonly"></td>
								
							</tr>
							<tr>
								<td align="right">经度:</td>
								<td><input type="text" name="longitude" readonly="readonly"></td>
								<td align="right">纬度:</td>
								<td><input type="text" name="latitude" readonly="readonly"></td>
							</tr>
							<tr>
								<td align="right">地址:</td>
								<td colspan="3" >
									<input type="text" name="add"  size="61"  id="site_addr1" readonly="readonly">
								</td>						
							</tr>
								<tr>
								<td align="right">单位:</td>
								<td colspan="3" >
									<input type="text" name="company" size="61" id="site_unit1" readonly="readonly">
								</td>
								
							</tr>
							<tr>
								<td align="right">图标:</td>
								<td >
									<select name="iconId" id="id_site_tbsn"></select>
								</td>
								<td align="right">备注:</td>
								<td ><input type="text" name="remark" value="--"></td>
							</tr>
							
						</table>
					</div>
		
				</div>
				<div id="tab-tools">
					<a href="#" class="easyui-linkbutton" plain="true" id="bt-search-site" iconCls="icon-search">搜索</a>
					<a href="#" class="easyui-linkbutton" plain="true" id="bt-save-site"iconCls="icon-save">保存</a>
					<a href="#" class="easyui-linkbutton" plain="true" id="bt-add-site-cancel" iconCls="icon-cancel">取消</a>
				</div>		
			</form>
		</div>
		
		<!-- 显示客户窗口 -->
		<div id="show-site-window" style="display:none;">
			<form id="show-form-site">
				<div id="show-tabs-site" class="easyui-tabs" tools="#tab-tools-del">
					<div title="基本信息">
					<input type="hidden" name="site_id_to_del" id="site_id_to_del"/>
						<table style="width:100%" border=0 >
							<tr>
								<td width="25%" align="right">名称:</td>
								<td width="35%"><input type="text" name="site_name_del" id="site_name_del" readonly="readonly"></td>
								<td width="18%" align="right" >编号:</td>
								<td width="35%"><input type="text" name="site_id_del" id="site_id_del" readonly="readonly"></td>
							</tr>
							<tr>
								<td align="right">经度:</td>
								<td><input type="text" name="site_jd" id="site_jd_del" readonly="readonly"></td>
								<td align="right">纬度:</td>
								<td><input type="text" name="site_wd" id="site_wd_del" readonly="readonly"></td>
							</tr>
							<tr>
								<td align="right">地址:</td>
								<td colspan="3" >
									<input type="text" name="add"  size="61"  id="site_addr_del" readonly="readonly">
								</td>						
							</tr>
								<tr>
								<td align="right">单位:</td>
								<td colspan="3" >
									<input type="text" name="company" size="61" id="site_unit_del" readonly="readonly">
								</td>
								
							</tr>
							<tr>
								<td align="right">备注:</td>
								<td  colspan="3"><input type="text" name="sitebz" id="site_bz_del" value="--"></td>
							</tr>
							<tr>
								<td  colspan="4"></td>
							</tr>
							<tr>
								<td  colspan="4"><div id="unitInfor" ></div></td>
							</tr>
					 
						</table>
					</div>
					<div title="图片信息">
						<table style="width:100%" border=0>
					    <!-- <tr><td><input type="button"  onClick="view360(1)" value="查看全景信息"><input type="button"  onClick="view360(3)" value="查看环视信息"><input type="button"  onClick="view360(4)" value="查看3D信息"></td></tr>
					    -->
						 <tr><td><div id="imageInfor" ></div></td></tr>
			              </table>
					</div>
				</div>
				<div id="tab-tools-del">
					<a href="#" class="easyui-linkbutton" plain="true" id="bt-delete-site"  iconCls="icon-remove">删除</a>			
					<a href="#" class="easyui-linkbutton" plain="true" id="bt-delete-site-cancel" iconCls="icon-cancel">取消</a>
				</div>
			</form>
		</div>
		
		
		<!-- 添加结点窗口 -->
		<div id="id-point-window" style="display:none;">
			<form id="id-form-point">
				<div id="id-tabs-point" class="easyui-tabs" tools="#tab-tools2">
					<div title="基本信息">
					<!-- <input type="hidden" name="iconId" id="pointIconId"/>-->
						<table style="width:100%">
							<tr>
								<td width="20%" align="right">编号:</td>
								<td width="30%"><input type="text" name="pointId" size="12"  id="site_name2"><font color="red">*</font></td>
								<td width="20%" align="right">名称:</td>
								<td width="30%" align="left" ><input type="text" name="pointName" size="12"  id="site_id2"><font color="red">*</font></td>
							</tr>
							<tr>
								<td align="right">经度:</td>
								<td><input type="text" name="longitude" id="pointLongitude" size="12"  readonly="readonly"></td>
								<td align="right">纬度:</td>
								<td ><input type="text" name="latitude" id="pointLatitude"  size="12"  readonly="readonly"></td>
							</tr>
						</table>
					</div>	
				</div>
				<div id="tab-tools2">
					<a href="#" class="easyui-linkbutton" plain="true" id="bt-save-point" iconCls="icon-save">保存</a>
					<a href="#" class="easyui-linkbutton" plain="true" id="bt-add-point-cancel" iconCls="icon-cancel">取消</a>
				</div>
			</form>
		</div>
		
		<!-- 显示结点窗口 -->
		<div id="show-point-window" style="display:none;">
			<form id="show-form-point">
				<div id="show-tabs-point" class="easyui-tabs" tools="#tab-tools3">
					<div title="基本信息">
					<input type="hidden" id="point_id_to_del"/>
					<table style="width:100%">
							<tr>
								<td width="20%" align="right">名称:</td>
								<td width="30%"><input type="text" size="12" readonly="readonly" id="point_name_del"><font color="red">*</font></td>
								<td width="20%" align="right">编号:</td>
								<td width="30%" align="left" ><input type="text"  readonly="readonly" size="12"  id="point_id_del"><font color="red">*</font></td>
							</tr>
							<tr>
								<td align="right">经度:</td>
								<td><input type="text" id="point_jd_del" size="12"  readonly="readonly"></td>
								<td align="right">纬度:</td>
								<td ><input type="text"  id="point_wd_del" size="12"  readonly="readonly"></td>
							</tr>
							<tr>
								<td align="right">管理单位:</td>
								<td colspan="3">
									<input type="text"  id="point_manage_del" size="12"  readonly="readonly"><font color="red"> *</font>
								</td>
							<tr>
							    <td align="right">换热站/热源:</td>
								<td colspan="3">
								<input type="text"  id="point_unit_del" size="12"  readonly="readonly">
								</td>
							</tr>
						</table>
					</div>	
				</div>
				<div id="tab-tools3">
					<a href="#" class="easyui-linkbutton" plain="true" id="bt-del-point"  iconCls="icon-remove">删除</a>
					<a href="#" class="easyui-linkbutton" plain="true" id="bt-del-point-cancel" iconCls="icon-cancel">取消</a>
				</div>
			</form>
		</div>
		
		<!-- 搜索站点窗口 -->
		<div id="id-window-search-site" style="display:none;">
			<form id="id-form-search-site">
				<div class="easyui-panel">
					标注编号:<input type="text" name="siteCode" size="15" id="id_siteCode">
					标注名称:<input type="text" name="siteName" size="15"  id="id_siteName">
					<a href="#" class="easyui-linkbutton" plain="true" id="bt-search-dim" iconCls="icon-search">搜索</a>
					<a href="#" class="easyui-linkbutton" plain="true" id="bt-search-cancel" iconCls="icon-cancel">取消</a>
				</div>
			</form>
			 <div id="id-grid-site"></div> 
		</div>
		
		<div id="map" class="smallmap" style=" z-index:0;position:relative;background-image:url("+<%=basePath %>+"images/fbg.gif);" ></div>
    
</body>
<script src="<%=basePath%>map/js/control.js" type="text/javascript"></script>
</html>