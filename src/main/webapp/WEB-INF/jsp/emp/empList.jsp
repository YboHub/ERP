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
    
    <title>My JSP 'deptList.jsp' starting page</title>
    
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
		    url:'emp/datagrid',
		    fitColumns:true, 
		    singleSelect:true, 
		    toolbar: '#addTool',
		    rownumbers:true,
		    pagination:true,
		    pageSize:10,
		    pageList:[10,20,30,40,50],
		      
		    columns:[[    
		        {field:'empno',title:'工号',width:100},    
		        {field:'ename',title:'姓名',width:100},    
		        {field:'sex',title:'性别',width:100,
		        	/* formatter:function(value,row,index){
		        		if (value==0) {
							return "男";
						} else {
							return "女";
						}
		        	} */
		        },
		        {field:'birthday',title:'出生年月',width:100},
		        {field:'tell',title:'手机号码',width:100},
		        {field:'address',title:'住址',width:200},
		        {field:'hiredate',title:'入职时间',width:100},
		        {field:'deptname',title:'所在部门',width:100},
		        {field:'post',title:'职位',width:100},
		        {field:'remark',title:'备注',width:100},
		        {field:'state',title:'在职状态',width:100,
			        formatter:function(value,row,index){
			        		if (value==0) {
								return "在职";
							} else {
								return "离职";
							}
			        	}
		        },
		        {field:'action',title:'操作',width:100,
		        	formatter:function(value,row,index){
		        		if (row.id==20) {
								return "无法无天";
							} else {
								return "<a class='btn-edit' style='height:19px' onclick='editFun("+row.id+")'>编辑</a>";
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
			title:'新增',
			width: 400,
			height: 550,
			closed: false,
			cache: false,
			href: 'emp/toAdd',
			modal: true
		});
	}
	function editFun(id){
		//修改窗口
		$("#updateId").dialog({
			title:'修改',
			width: 400,
			height: 550,
			closed: false,
			cache: false,
			href: "emp/toEdit?id="+id,
			modal: true
		});
	}
	
	//固定电话的正则正则验证
	$(function(){
		   $.extend($.fn.validatebox.defaults.rules, {
		       areacode : {// 验证用户名
		           validator : function(value) {
		               return /1[3|5|7|8|]\d{9}/gi.test(value);
		           },
		           message : '电话号码不正确'
		       }
		   });
		  });
	
		  
  </script>
  <body>
  	<input id="ss"></input> 
	<div id="mm" style="width:120px"> 
	<div data-options="name:'ename',iconCls:'icon-ok'">姓名</div> 
	<div data-options="name:'empno'">工号</div> 
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