<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'mangerEdit.jsp' starting page</title>
    
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
    <form id="editForm" method="post">
		<c:forEach items="${editList}" var="plan">
		<input name="pid" type="hidden" value="${plan.pid}"/>
		<div>
		<label for="sal">计划编号:</label> 
		<input class="easyui-validatebox" type="text" name="pnumber" value="${plan.pnumber}" data-options="required:true" />
	</div>
	<div>
		<label for="sal">产品编号:</label> 
		<input class="easyui-validatebox" type="text" name="dnumber" value="${plan.dnumber}" data-options="required:true" />
	</div>
	<div>
		<label for="sal">计划人:</label> 
		<input class="easyui-validatebox" type="text" name="person" value="${plan.person}" data-options="required:true" />
	</div>
	<div>
		<label for="sal">预计生产时长:</label> 
		<input class="easyui-validatebox" type="text" name="pchang" value="${plan.pchang}" data-options="required:true" />
	</div>
	<div>
		<label for="sal">预计开始时间:</label> 
		<input class="easyui-datetimebox" type="text" name="pbegin" value="${plan.pbegin}"  data-options="required:true,showSeconds:true" />
	</div>
	<div>
		<label for="sal">预计结束时间:</label> 
		<input class="easyui-datetimebox" type="text" name="pend" value="${plan.pend}" data-options="required:true,showSeconds:true" />
	</div>
	
		</c:forEach>
		<a id="updatebtn" class="easyui-linkbutton"
			data-options="iconCls:'icon-save'" onclick="saveEdit()">保存</a> <a
			id="closebtn" class="easyui-linkbutton"
			data-options="iconCls:'icon-clear'" onclick="closeEdit()">关闭</a>
	</form>
  </body>
</html>
