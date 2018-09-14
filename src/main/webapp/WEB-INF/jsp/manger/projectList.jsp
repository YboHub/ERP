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
    
    <title>My JSP 'projectList.jsp' starting page</title>
    
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
	  $('#dg').datagrid({    
		    url:'manger/datagrid',
		    fitColumns:true, 
		    singleSelect:true, 
		    toolbar: '#addTool',
		    rownumbers:true,
		    pagination:true,
		    pageSize:5,
		    pageList:[5,10,20,30,40,50],
		      
		    columns:[[    
		        {field:'pnumber',title:'计划编号',width:100},
		        {field:'dnumber',title:'订单号',width:100},
		        {field:'person',title:'计划人',width:100},
		        {field:'ptime',title:'提交时间',width:100,
		        	formatter:function(value){
		        			var date =new Date(value);
		        		 	var y = date.getFullYear();
						    var m = date.getMonth() + 1;
						    var d = date.getDate();
						    var h = date.getHours();
						    var MM = date.getMinutes();
						    var ss = date.getSeconds();
						    return   y +'-'+ (m < 10 ? ('0' + m) : m) +'-'+ (d < 10 ? ('0' + d) : d)+ ' ' + h + ':' + (MM < 10 ? ('0' + MM) : MM) + ':' + ss;
		        	}
		        },
		        {field:'pnum',title:'实际生产天数',width:100},
		        {field:'pchang',title:'预计生产时间长',width:100},
		        {field:'pbegin',title:'预计开始时间',width:100},
		        {field:'pend',title:'预计结束时间',width:100},
		        {field:'states',title:'审核状态',width:100},
		        {field:'pyi',title:'审核意见',width:100},        
		         {field:'action',title:'操作',width:100,
		        	formatter:function(value,row,index){
		        		if(row.states=="待审核"){
		        			return "<a class='btn-edit' style='height:19px' onclick='editFun("+row.pid+")'>审核</a>";
		        		}else{
		        			return "";
		        		}
		        	}
		        },
		     ]], 
		    onLoadSuccess:function(date){
				$('.btn-edit').linkbutton({iconCls: 'icon-edit'});
				$('.btn-del').linkbutton({iconCls: 'icon-remove'});
			}   
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
  
  
  
  function editFun(pid){
		//修改窗口
		$("#updateId").dialog({
			title:'修改',
			width: 400,
			height: 250,
			closed: false,
			cache: false,
			href: "manger/toEdit?pid="+pid,
			modal: true
		});
	}
  
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
	
	//查询待审核
	function searchone(){
		$("#ss").searchbox('setValue', '');
		//刷新列表
		$("#dg").datagrid('reload',{
			name:'pzh',
			value:4
		});
	}
	
	//查询审核未通过
	function searchtwo(){
		$("#ss").searchbox('setValue', '');
		//刷新列表
		$("#dg").datagrid('reload',{
			name:'pzh',
			value:1
		});
	}
	
	//审核通过
	function searchthree(){
		$("#ss").searchbox('setValue', '');
		//刷新列表
		$("#dg").datagrid('reload',{
			name:'pzh',
			value:2
		});
	}
	
  </script>
  <body>
  	<input id="ss"></input> 
	<div id="mm" style="width:120px"> 
		<div data-options="name:'pzh',iconCls:'icon-ok'">订单编号</div> 
		<div data-options="name:'pid'">编号</div> 
	</div>
	<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="clearFun()">清空</a> 
	 
  	<div id="addTool">
  	  <a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="searchone()">待审核</a>
  	  <a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="searchtwo()">审核未通过</a>
  	  <a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="searchthree()">审核通过</a>  
  	</div>
  	<table id="dg"></table>
  	<div id="updateId"></div> 
  </body>
  
</html>

