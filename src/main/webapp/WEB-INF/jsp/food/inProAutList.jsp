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
    
    <title>成品入库质检界面</title>
    
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
  
  <body>
  	<input id="ss"></input>
	<div id="mm" style="width:120px">
	<div data-options="name:'productionnum',iconCls:'icon-ok'">生产编号</div> 
	
	</div>
	<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="clearFun()">清空</a> 
	<div>
		<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="unAudit()">未质检</a>
		<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="notPass()">未通过质检</a>
	</div>
  	<table id="dg"></table>  

 
     <div id="ProductAuditId"></div>
     
     <script type="text/javascript">
  $(function(){
	  $('#dg').datagrid({    
		    url:'inProAut/datagrid',
		    fitColumns:true,
		    //singleSelect:true, 
		    toolbar: '#addTool',
		    rownumbers:true,
		    pagination:true,
		    pageSize:5,
		    pageList:[5,10,20,30,40,50],
		    columns:[[
		        {field:'productionnum',title:'生产编号',width:100},
		        {field:'pname',title:'产品名称',width:100}, 
		        {field:'psize',title:'产品规格',width:100},
		        {field:'pprice',title:'产品单价',width:100},
		      	{field:'auditstatus',title:'审核状态',width:100,
		      		formatter: function(value,row,index){
		      			if(row.auditstatus==20){
		      				return "待质检";
		      			}else if(row.auditstatus==14){
		      				return "质检不合格";
		      			}else{
		      				return "质检通过";
		      			}
		      		}
		      	},
		        {field:'action',title:'查看详情',width:100, 
		        	formatter: function(value,row,index){
			        	if(row.auditstatus==20){
							return "<input type='button' onclick='selDetails("+row.id+")' style='height:18px,width:40px' value='点击查看详情'/>&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' onclick='ProductAudit("+row.id+")' style='height:25px' value='点击质检'>";
						}else{
							return "<input type='button' onclick='selDetails("+row.id+")' style='height:18px,width:40px' value='点击查看详情'/>";
						}
					}
		        }
		    ]], 
		});
		 
		$('#ss').searchbox({ 
			searcher:function(value,name){ 
				$("#dg").datagrid('load',{
					name: name,
					value: value
				}); 
			}, 
			menu:'#mm', 
			prompt:'请输入关键字' 
		});  
		
  });
	function clearFun(){
		//searchbox设置为空
		$("#ss").searchbox('setValue', '');
		//刷新列表
		$("#dg").datagrid('reload',{
			name:null,
			value:null
		});
	}
	/* 未质检 */
	function unAudit(){
		$("#ss").searchbox('setValue', '');
		//刷新列表
		$("#dg").datagrid('reload',{
			name:'auditstatus',
			value:20
		});
	}
	/* 质检未通过 */
	function notPass(){
		//searchbox设置为空
		$("#ss").searchbox('setValue', '');
		//刷新列表
		$("#dg").datagrid('reload',{
			name:'auditstatus',
			value:14
		});
	}
	//查看详情页面
	function selDetails(id){
		location.href="<%=path%>/inProAut/audDetails?id="+id;
	}
	function ProductAudit(id){
		//质检窗口
		$("#ProductAuditId").dialog({
			title:'质检',
			width: 250,
			height: 250,
			closed: false,
			cache: false,
			href: "inProAut/ProductAudit?id="+id,
			modal: true
		});
	}
	function closeEdit(){
		$("#ProductAuditId").window('close');  
	}
  </script>
  </body>
</html>

