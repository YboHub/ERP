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
		    url:'machineAudit/datagrid',
		    fitColumns:true, 
		    singleSelect:true, 
		    toolbar: '#addTool',
		    rownumbers:true,
		    pagination:true,
		    pageSize:10,
		    pageList:[10,20,30,40,50],
		      
		    columns:[[ 
		    	{field:'equipmentnumber',title:'设备编号',width:100},
		        {field:'dproduct',title:'生产产品',width:100}, 
		        {field:'dprice',title:'设备单价',width:100}, 
		        {field:'dbrand',title:'设备品牌',width:100},   
		        {field:'equipment',title:'设备名称',width:100},    
		        {field:'principal',title:'审核人',width:100},
		        {field:'action',title:'操作',width:50,
		        	formatter:function(value,row,index){
		        		if(row.audit==0){
		        			return "<a class='btn-edit' style='height:19px' onclick='editFun("+row.id+")'>审核</a>";
		        		}else{
		        			if(row.audit==1){
		        				return "审核通过";
		        			}else{
		        				return "审核未通过";
		        			}
		        		}
		        		
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
	
	function editFun(id){
		//修改窗口
		$("#editId").dialog({
			title:'修改',
			width: 400,
			height: 250,
			closed: false,
			cache: false,
			href: "machineAudit/toEdit?id="+id,
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
		    href: 'machineAudit/toselect?id='+id,    
		    modal: true
		});    
  	}
  	
  	//查询待审核
	function searchone(){
		$("#ss").searchbox('setValue', '');
		//刷新列表
		$("#dg").datagrid('reload',{
			name:'audit',
			value:0
		});
	}
	
	//查询审核未通过
	function searchtwo(){
		$("#ss").searchbox('setValue', '');
		//刷新列表
		$("#dg").datagrid('reload',{
			name:'audit',
			value:2
		});
	}
	
	//审核通过
	function searchthree(){
		$("#ss").searchbox('setValue', '');
		//刷新列表
		$("#dg").datagrid('reload',{
			name:'audit',
			value:1
		});
	}
		
	
  </script>
  <body>
  	<input id="ss"></input> 
	<div id="mm" style="width:120px"> 
	<div data-options="name:'rkdh',iconCls:'icon-ok'">入库单号</div> 
	</div> 
	<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="clearFun()">清空</a>  
	
  	<div id="addTool">
  	  <a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="addFun()">新增</a> 
  	   <a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="searchone()">待审核</a>
  	  <a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="searchtwo()">审核未通过</a>
  	  <a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="searchthree()">审核通过</a>   
  	</div>
  
  	<table id="dg"></table>  
    <div id="editId"></div>
     <div id="selectId"></div>
  </body>
</html>