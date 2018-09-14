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
		    url:'equipment/datagrid',
		    fitColumns:true, 
		    singleSelect:true, 
		    toolbar: '#addTool',
		    rownumbers:true,
		    pagination:true,
		    pageSize:10,
		    pageList:[10,20,30,40,50],
		      
		    columns:[[    
		        {field:'equipment',title:'机械名称',width:100}, 
		        {field:'dproduct',title:'机械类型',width:100},   
		        {field:'equipmentnumber',title:'机械编号',width:100},    
		        {field:'operation',title:'运行状态',width:100,
		        	 formatter:function(value,row,index){
		        		if (value==0) {
							return "运行";
						} else {
							return "停止工作";
						}
		        	} 
		        },
		        {field:'dname',title:'负者人',width:100},
		        {field:'action',title:'操作',width:100,
		        	formatter:function(value,row,index){
		        		if(row.operation==0){
		        			return "<a class='btn-edit' style='height:19px' onclick='editFun("+row.id+")'>点击停止工作</a>";
		        		}else{
		        			return "<a class='btn-edit' style='height:19px' onclick='editFunn("+row.id+")'>点击运行</a>";
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
			href: 'equipment/toAdd',
			modal: true
		});
	}
	
	function editFun(id){
			$.messager.confirm('确认','您确认要机器停止运行吗？',function(r){    
			    if (r){    
			       	$.post("equipment/update",{id:id},function(data){
			       		 if(data==false){
			       			$.messager.show({
								title:"消息",
								msg:"停止失败,请联系工作人员",
								timeout:10000,
								showType:'show'
							});
			       			 $("#dg").datagrid("reload");
			       		}else{
			       			$.messager.show({
								title:"消息",
								msg:"机器以停止",
								timeout:4000,
								showType:'show'
							});
							$("#dg").datagrid("reload");
			       		} 
			       	},"json");   
			    }    
			});
		}
		  
		  
		  function editFunn(id){
			$.messager.confirm('确认','您确认要启动机器吗？',function(r){    
			    if (r){    
			       	$.post("equipment/updatee",{id:id},function(data){
			       		 if(data==false){
			       			$.messager.show({
								title:"消息",
								msg:"运行失败,请联系工作人员",
								timeout:10000,
								showType:'show'
							});
			       			 $("#dg").datagrid("reload");
			       		}else{
			       			$.messager.show({
								title:"消息",
								msg:"机器已启动",
								timeout:4000,
								showType:'show'
							});
							$("#dg").datagrid("reload");
			       		} 
			       	},"json");   
			    }    
			});
		}
  </script>
  <body>
  	<input id="ss"></input> 
	<div id="mm" style="width:120px"> 
	<div data-options="name:'equipments',iconCls:'icon-ok'">机械名称</div> 
	<div data-options="name:'equipmentnumber'">机械编号</div> 
	</div> 
	<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="clearFun()">清空</a>  
	
  	<div id="addTool">
  	  <a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="addFun()">新增</a>  
  	</div>
  
  	<table id="dg"></table>  
    <div id="addId"></div>
     <div id="updateId"></div>
     
  </body>
</html>