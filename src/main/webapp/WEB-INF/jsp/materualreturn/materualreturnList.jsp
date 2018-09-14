<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'equipmentList.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link rel="stylesheet" type="text/css" href="<%=path %>/easyui/themes/default/easyui.css">   
	<link rel="stylesheet" type="text/css" href="<%=path %>/easyui/themes/icon.css">   
	<script type="text/javascript" src="<%=path %>/easyui/jquery-1.8.3.min.js"></script>   
	<script type="text/javascript" src="<%=path %>/easyui/jquery.easyui.min.js"></script>  
	<script type="text/javascript" src="<%=path %>/easyui/easyui-lang-zh_CN.js"></script> 
	<script type="text/javascript" src="js/area1.js"></script> 
  </head>
  <script type="text/javascript">
  $(function(){
	  $('#dg').datagrid({    
		    url:'materualreturn/datagrid',
		    fitColumns:true, 
		    singleSelect:true, 
		    toolbar: '#addTool',
		    rownumbers:true,
		    pagination:true,
		    pageSize:10,
		    pageList:[10,20,30,40,50],
		      
		    columns:[[    
		        {field:'orderid',title:'采购单号',width:100},   
		        {field:'goodsname',title:'材料名',width:100},
		        {field:'types',title:'材料类型',width:100},
		        {field:'company',title:'供货商',width:100},
		        {field:'price',title:'单价',width:100},
		        {field:'weights',title:'重量',width:100},
		        {field:'money',title:'总额',width:100},
		        {field:'reason',title:'退货原因',width:100},
		        {field:'returnname',title:'退货人',width:100},
		    ]], 
		    onLoadSuccess:function(date){
				$('.btn-edit').linkbutton({iconCls: 'icon-edit'});
				$('.btn-del').linkbutton({iconCls: 'icon-remove'});
			}   
		});  
		
		$('#ss').searchbox({ 
			searcher:function(value,name){ 
				//alert(value + "," + name);
				$('#dg').datagrid('load',{
					name: name,
					value: value
				}); 
			}, 
			menu:'#mm', 
			prompt:'请输入关键字' 
		});  
  });
  	//清空
	function clearFun(){
		//searchbox设置为空
		$("#ss").searchbox('setValue', '');s
		//刷新列表
		$("#dg").datagrid('reload',{
			name:null,
			value:null
		});
	}
	
	
  </script>
  <body>
  	<input id="ss"></input> 
	<div id="mm" style="width:120px"> 
	<div data-options="name:'orderid',iconCls:'icon-ok'">采购单号</div> 
	</div> 
	<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="clearFun()">清空</a>  
  	<table id="dg"></table>  
  </body>
</html>