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
		    url:'maintains/datagrid',
		    fitColumns:true, 
		    singleSelect:true, 
		    toolbar: '#addTool',
		    rownumbers:true,
		    pagination:true,
		    pageSize:10,
		    pageList:[10,20,30,40,50],
		      
		    columns:[[ 
		        {field:'breakdownnumber',title:'故障单号',width:100}, 
		        {field:'maintenancetime',title:'维修时间',width:100},   
		        {field:'completiontime',title:'完成时间',width:100},    
		        {field:'sum',title:'维修费用(元)',width:100},
		        {field:'action',title:'操作',width:50,
		        	formatter:function(value,row,index){
		        		return "<a class='btn-edit' style='height:19px' onclick='selectFun("+row.mid+")'>详情</a>";
		        	}
		        },
		    ]], 
		    onLoadSuccess:function(date){
				$('.btn-edit').linkbutton({iconCls: 'icon-tip'});
			},
			   
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
		$("#ss").searchbox('setValue', '');
		//刷新列表
		$("#dg").datagrid('reload',{
			name:null,
			value:null
		});
	}
	
	function addFun(){
		//新增窗口
		$("#addId").dialog({
			title:'添加设备                                                                                                                                                                                                                                                                                            ',
			width: 400,
			height: 300,
			closed: false,
			cache: false,
			href: 'maintains/toAdd',
			modal: true
		});
	}
	
	
	//详情
  	function selectFun(mid){
  		$("#selectId").dialog({    
		    title: '详情',    
		    width: 1000,    
		    height: 200,    
		    closed: false,    
		    cache: false,    
		    href: 'maintains/toselect?mid='+mid,    
		    modal: true
		});    
  	}
		
	
  </script>
  <body>
  	<input id="ss"></input> 
	<div id="mm" style="width:120px"> 
	<div data-options="name:'breakdownnumber',iconCls:'icon-ok'">故障单号</div> 
	</div> 
	<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="clearFun()">清空</a>  
	
  	<div id="addTool">
  	  <a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="addFun()">新增</a>  
  	</div>
  
  	<table id="dg"></table>  
    <div id="addId"></div>
     <div id="selectId"></div>
  </body>
</html>