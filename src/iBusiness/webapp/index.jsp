<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<TITLE>[登录]YTBPM－客户端</TITLE>
		<STYLE type="text/css" media="all">
		@import url("<%=request.getContextPath()%>/css/style_blue.css");
		</STYLE>

		<STYLE type="text/css">
		<!--
		body,table,table tr td {
			margin: 0px;
			padding: 0px;
			font-size: 14px;
			font-family: "微软雅黑", "宋体";
			line-height: 24px;
		}
		
		body {
			background-color: #1267A7;
			background-image: url(<%=request.getContextPath()%>/images/index/loginbj1_021.jpg);
			background-position: center top;
			background-repeat: no-repeat;
		}
		
		.srkbox {
			float: right;
			padding-right: 30px;
			width: 280px;
			height: 195px;
			padding-top: 60px;
			overflow: hidden;
		}
		
		.loginbox {
			background-image: url(<%=request.getContextPath()%>/images/index/loginbox.png);
			height: 294px;
			width: 542px;
			margin-top: 205px;
			margin-right: auto;
			margin-left: auto;
		}
		
		.yhm {
			height: 30px;
			margin-top: 10px;
		}
		
		.searchbg {
			background-image: url(<%=request.getContextPath()%>/images/index/loginsearch_06.jpg);
			height: 24px;
			width: 184px;
			border-top-style: none;
			border-right-style: none;
			border-bottom-style: none;
			border-left-style: none;
			margin: 0px;
			border-top-width: 0px;
			border-right-width: 0px;
			border-bottom-width: 0px;
			border-left-width: 0px;
			line-height: 18px;
			padding-top: 5px;
			padding-right: 0px;
			padding-bottom: 0px;
			padding-left: 10px;
		}
		
		.searchbg1 {
			background-image: url(<%=request.getContextPath()%>/images/index/loginsearch.jpg);
			width: 75px;
		}
		
		.bq {
			clear: both;
			text-align: center;
			font-family: "宋体";
			font-size: 12px;
		}
		-->
		</STYLE>

		<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/js/login.js"></SCRIPT>


		<SCRIPT>
		function createXMLHttpRequest() {
			//表示当前浏览器不是ie,如ns,firefox
			if(window.XMLHttpRequest) {
				xmlHttp = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
		}
		function validate() {
		 var div=document.getElementById("divbid");
		 var field = frmLogin.authcode.value;
		 var flag;
		// var reg=/[^A-Za-z0-9_]{7,10}/g;
			if (field.length != 0) {
			   //创建XMLHttpRequest
				createXMLHttpRequest();
				var url = "codevalidate.jsp?authcode=" + field;
				xmlHttp.open("GET", url, false);
				//方法地址，处理完成后自动调用，回调
				xmlHttp.onreadystatechange=function() { //匿名函数
					if(xmlHttp.readyState == 4) { //Ajax引擎初始化成功
						if (xmlHttp.status == 200) { //http协议成功
							//document.getElementById("divbid").innerHTML =xmlHttp.responseText;
							if(xmlHttp.responseText.indexOf("1")>0) {
								flag = 1;
							}else {
								flag = 0;
								alert("验证码错误，请重新输入");
							}
						}else {
							flag = 0;
							alert("请求失败，错误码=" + xmlHttp.status);
						}
					}
				};
				//将参数发送到Ajax引擎
				xmlHttp.send(null);
				return flag;
			}else {
				alert("验证码不能为空");
				document.frmLogin.authcode.focus();
				return 0;
			}
		}
		function reloadImage(imgurl){
		    var getimagecode=document.getElementById("codeimg");
		    getimagecode.src= imgurl + "?id=" + Math.random();
		}
		</SCRIPT>

		<META name="GENERATOR" content="MSHTML 9.00.8112.16496" />
	</HEAD>
	<BODY onload="onFocus();">
		<FORM method="post" name="frmLogin" action="<%=request.getContextPath()%>/jsp/frame/main.jsp">
			<DIV class="loginbox">
				<DIV class="srkbox">
					<DIV class="yhm">
						用户名：<INPUT class="searchbg" name="userid" type="text" value="1"/>
					</DIV>
					<DIV class="yhm">
						密&emsp;码：<INPUT class="searchbg" name="pwd" type="password" value="1"/>
					</DIV>
					<DIV class="yhm">
						<TABLE border="0" cellSpacing="0" cellPadding="0" width="0">
							<TBODY>
								<TR>
									<TD>
										验证码：
									</TD>
									<TD>
										<INPUT id="authcode" class="searchbg searchbg1" name="authcode" maxLength="4" size="10" type="text" value="1111" />
									</TD>
									<TD>
										<IMG id="codeimg" border="0" name="codeimg" src="<%=request.getContextPath()%>/authcode.jsp" />
									</TD>
									<TD>
										<A href="javascript:reloadImage('<%=request.getContextPath()%>/authcode.jsp')">看不清</A>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
					</DIV>
					<DIV style="height: 35px;" class="yhm">
						<LABEL>
							<INPUT id="loginCommand" onclick="return loginAccount();"
								name="loginCommand" value="提交" src="<%=request.getContextPath()%>/images/index/loginniu_10.jpg"
								type="image" />
						</LABEL>
						<LABEL>
							&nbsp; &nbsp;
							<INPUT id="reset" name="reset" value="重置" src="<%=request.getContextPath()%>/images/index/loginniu_11.jpg" type="image" />
						</LABEL>
					</DIV>
				</DIV>
				<DIV class="bq">
					Copyright (C) 2011 arisesoft. All rights reserved 当前版本V4.0
				</DIV>
			</DIV>
			<INPUT name="cmd" value="Login" type="hidden" />
			<INPUT name="_CACHE_LOGIN_TIME_" value="1381822666794" type="hidden" />
		</FORM>
	</BODY>
</HTML>
