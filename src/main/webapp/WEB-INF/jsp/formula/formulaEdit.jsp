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
		<c:forEach items="${editList}" var="formula">
		<input name="pid" type="hidden" value="${formula.pid}"/>
		<div>
		<label for="sal">型号:</label> 
		<input class="easyui-validatebox" type="text" name="ptype" value="${formula.pid}" data-options="required:true" />
	</div>
	<div>
		<label for="sal">产品编号:</label> 
		<input class="easyui-validatebox" type="text" name="pnumber"  value="${formula.pnumber}" data-options="required:true" />
	</div>
	<div>
		<label for="sal">原料名称:</label> 
		<input class="easyui-validatebox" type="text" name="pname" value="${formula.pname}" data-options="required:true" />
	</div>
	
	<div>
		<label for="sal">原料规格:</label> 
		<input class="easyui-validatebox" type="text" name="pgui" value="${formula.pgui}" data-options="required:true" />
	</div>
	<div>
		<label for="sal">原料数量:</label> 
		<input class="easyui-validatebox" type="text" name="pshu"  value="${formula.pshu}" data-options="required:true" />
	</div>
	<div>
		<label for="sal">单位:</label> 
		<input class="easyui-validatebox" type="text" name="pdan"  value="${formula.pdan}" data-options="required:true" />
	</div>
		</c:forEach>
		<a id="updatebtn" class="easyui-linkbutton"
			data-options="iconCls:'icon-save'" onclick="saveEdit()">保存</a> <a
			id="closebtn" class="easyui-linkbutton"
			data-options="iconCls:'icon-clear'" onclick="closeEdit()">关闭</a>
	</form>
  </body>
</html>
