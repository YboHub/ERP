<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'proRecordList.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">   
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">   
	<script type="text/javascript" src="easyui/jquery-1.8.3.min.js"></script>   
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>  
	<script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>

  </head>
  
  <body>
  	<input id="ss" style="width:260px"></input> 
	<div id="mm" style="width:120px"> 
		<div data-options="name:'productionnum',iconCls:'icon-ok'">生产编号</div> 
		<div data-options="name:'goodstype'">产品类型</div> 
	</div>
	<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="clearFun()">清空</a> 
	<div id="tb" style="height:auto">
		<span>订单编号：${dnumber}</span>
		<a href="proRecord/proAdd?dnumber=${dnumber}" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="goback()">返回</a>
	</div>
	<!--  
		一个URL从远程站点请求数据。  
		顶部工具栏的DataGrid面板。toolbar: '#tb', 
	         如果为true，则只允许选择一行。singleSelect:true,
	         真正的自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动。fitColumns:true,
	         是否显示斑马线效果 striped:true,
	         如果为true，则在DataGrid控件底部显示分页工具栏。pagination:true,
	         如果为true，则显示一个行号列。 rownumbers:true,
	-->
	<table id="dg"></table>  
	
    <input id="dnumber" type="hidden" value="${dnumber}"/>
    <script type="text/javascript">
    	$(function(){
    		var dnumber=$("#dnumber").val();
    		$('#dg').datagrid({    
			    /* 一个URL从远程站点请求数据。 */   
			    url:'<%=path%>/proRecord/proList?dnumber='+dnumber, 
			    /* 顶部工具栏的DataGrid面板。 */
			    toolbar: '#tb',
			    /* 如果为true，则只允许选择一行。 */
			    singleSelect:true,
			    /* 真正的自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动。 */
			    fitColumns:true,
			    /* 是否显示斑马线效果 */ 
			    striped:true,
			    /* 如果为true，则在DataGrid控件底部显示分页工具栏。 */
			    pagination:true,
			    /* 如果为true，则显示一个行号列。 */
			    rownumbers:true,
			    onClickRow: 'onClickRow',
			    columns:[[    
			        {field:'productionnum',title:'生产编号',width:100}, 
			        {field:'cxian',title:'生产线',width:100},    
			        {field:'goodstype',title:'产品类型',width:100},    
			        {field:'inventoryunit',title:'重量',width:100},
			        {field:'protime',title:'生产时间',width:100},
			    ]]
			    
			         
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
		//返回  
		function goback(){
			location.href="plan/toList";
		}
    </script>  
  </body>
</html>
