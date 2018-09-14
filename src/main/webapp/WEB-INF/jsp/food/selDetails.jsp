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
    <title>成品详情页面</title>
    
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
  </head>
  <script type="text/javascript">
  $(function(){
  	var id=$("#xq").val();
	  $('#dg').datagrid({    
		    url:'stock/datagrid1?id='+id,
		    fitColumns:true, 
		    singleSelect:true, 
		    toolbar: '#addTool',
		    rownumbers:true,
		    pagination:true,
		    pageSize:5,
		    pageList:[5,10,20,30,40,50],
		    columns:[[    
		        {field:'productionnum',title:'生产编号',width:100},    
		        {field:'pname',title:'产品名称',width:100},
		        {field:'psize',title:'产品规格',width:100},
		        {field:'inventoryunit',title:'入库量(吨)',width:100},
		        {field:'audittime',title:'审核时间',width:100},
		        {field:'remark',title:'审核备注',width:100},
		        {field:'protime',title:'生产时间',width:100},
		        {field:'verifyman',title:'核实人',width:100}
		    ]], 
		});
		$('#ss').searchbox({ 
			searcher:function(value,name){ 
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
		$("#ss").searchbox('setValue', '');
		//刷新列表
		$("#dg").datagrid('reload',{
			name:null,
			value:null
		});
	}
	/* 返回上一级 */
	function fanhui(){
		window.history.go(-1);
		}
  </script>
  <body>
  	<input id="xq" type="hidden" value="${id}"/>
  	<input id="ss"></input>
	<div id="mm" style="width:120px"> 
	<div data-options="name:'rkdh'">入库单号</div> 
	<div data-options="name:'materialtype',iconCls:'icon-ok'">原料类型</div> 
	</div> 
	<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="clearFun()">清空</a>  
  	<table id="dg"></table>  
  	<input type="button" value="返回" onclick="fanhui()">
  </body>
  
</html>

