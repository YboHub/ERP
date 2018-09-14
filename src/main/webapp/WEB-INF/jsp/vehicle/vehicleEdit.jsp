<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'toAdd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     <form action="<%=path%>/vehicle/edit" method="post">
    	编&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:<input name="vid" value="${vehicleList[0].vid}"/><br/>
    	类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型:<input name="vtype" value="${vehicleList[0].vtype}"/><br/>
    	车牌号码:<input name="vlicensenumber" value="${vehicleList[0].vlicensenumber}"/><br/>
    	司&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机:<input name="vmotorman" value="${vehicleList[0].vmotorman}"/><br/>
    	<input type="submit" value="提交"/>
    </form>
  </body>
</html>
