<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'roleAdd.jsp' starting page</title>
    
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
    <form id="ffm">
    	<div  style="margin: 10px">   
		     <label>部门:</label>
		     <select id="addDeptno"  name="deptno" style="width:200px;" onchange="changeDept()">
		     	<option value='-1' selected>---请选择---</option>  
		     	<c:forEach items="${deptList}" var="dept">
		     		<option value="${dept.deptno}">${dept.deptname}</option>
		     	</c:forEach> 
			 </select> 
		 </div>
		 <div  style="margin: 10px">   
		     <label>职位:</label>
		     <input id="addPost" class="easyui-validatebox" type="text" name="post"  data-options="required:true" /> 
		 </div>
    </form>
  </body>
</html>
