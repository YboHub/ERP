<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>login</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="css/demo.css" />
	<link rel="stylesheet" href="js/vendor/jgrowl/css/jquery.jgrowl.min.css">
	<!--必要样式-->
	<link rel="stylesheet" type="text/css" href="css/component.css" />
	<style>
		input::-webkit-input-placeholder{
			color:rgba(0, 0, 0, 0.726);
		}
		input::-moz-placeholder{   /* Mozilla Firefox 19+ */
			color:rgba(0, 0, 0, 0.726);
		}
		input:-moz-placeholder{    /* Mozilla Firefox 4 to 18 */
			color:rgba(0, 0, 0, 0.726);
		}
		input:-ms-input-placeholder{  /* Internet Explorer 10-11 */ 
			color:rgba(0, 0, 0, 0.726);
		}
	</style>
  </head>
<body>
	<div class="container demo-1">
		<div class="content">
			<div id="large-header" class="large-header">
				<canvas id="demo-canvas"></canvas>
				<div class="logo_box">
					<h3>MARS HELP</h3>
					<form action="login/vaild" name="f" method="post">
						<div class="input_outer" style="margin-bottom: 0">
							<span class="u_user"></span>
							<input id="ID" name="account" class="text" style="color: #000000 !important" type="text" placeholder="请输入账户">
						</div>
						<div style="color: red;width: 330px;height:30px;line-height:30px">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${msg}
						</<div>
						<div class="input_outer">
							<span class="us_uer"></span>
							<input id="PASSWORD" name="password" class="text" style="color: #000000 !important; position:absolute; z-index:100;"value="" type="password" placeholder="请输入密码">
						</div>
						<div id="LOGIN" class="mb2">
							<input class="act-but" type="submit" value="登陆" style="color:#FFFFFF;width: 330px;height: 46px"/>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div><!-- /container -->
	<script src="js/TweenLite.min.js"></script>
	<script src="js/EasePack.min.js"></script>
	<script src="js/jquery.js"></script>
	<script src="js/rAF.js"></script>
	<script src="js/demo-1.js"></script>
	<script src="js/vendor/jgrowl/jquery.jgrowl.min.js"></script>
	<script src="js/Longin.js"></script>
	 
</body>
</html>