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
		    url:'scrapinventory/datagrid',
		    fitColumns:true, 
		    singleSelect:true, 
		    toolbar: '#addTool',
		    rownumbers:true,
		    pagination:true,
		    pageSize:10,
		    pageList:[10,20,30,40,50],
		      
		    columns:[[    
		        {field:'rkdh',title:'入库单号',width:100},   
		        {field:'goodstype',title:'货物类型',width:100,
		        	formatter:function(value,row,index){
		        		if (value==1) {
							return "12mm*9m";
						} else {
							if(value==2){
								return "16mm*9m";
							}else{
								return "20mm*9m";
							}
						}
		        	}  
		        },
		        {field:'inventoryunit',title:'入库重量',width:100},
		        {field:'audittime',title:'入库时间',width:100},
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
	
	function addFun(){
		//新增窗口
		$("#addId").dialog({
			title:'添加设备                                                                                                                                                                                                                                                                                            ',
			width: 400,
			height: 300,
			closed: false,
			cache: false,
			href: 'scrapinventory/toJian',
			modal: true
		});
	}
	
	function selectScr(){
		location.href='<%=path%>/scrapinventory/toLists';

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
  	  <a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="addFun()">点击出库</a>  
  	</div>
  	
  	<div id="addTool">
  	  <a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="selectScr()">点击查看出库记录</a>  
  	</div>
  
  	<table id="dg"></table>  
    <div id="addId"></div>
     <div id="updateId"></div>
     <div id="selectId"></div>
  </body>
</html>