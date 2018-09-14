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
  </head>
  <script type="text/javascript">
  $(function(){
	  $('#dg').datagrid({    
		    url:'dept/datagrid',
		    fitColumns:true, 
		    singleSelect:true, 
		    toolbar: '#addTool',
		    rownumbers:true,
		    pagination:true,
		    pageSize:10,
		    pageList:[10,20,30,40,50],
		      
		    columns:[[    
		        {field:'deptno',title:'部门编号',width:100},
		        {field:'deptname',title:'部门名称',width:100},
		        {field:'tel',title:'部门电话',width:100},
		        {field:'site',title:'部门地址',width:100},
		        {field:'remark',title:'备注',width:100},
		        {field:'action',title:'操作',width:100,
		        	formatter: function(value,row,index){
						return "<a class='btn-edit' onclick='editFun("+row.id+")' style='height:18px'>编辑</a>|<a class='btn-edit' onclick='delFun("+row.deptno+','+row.id+")' style='height:18px'>删除</a>";
					}
		        }
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
		//新增部门窗口
		$("#addId").dialog({
			title:'新增',
			width: 600,
			height: 400,
			closed: false,
			cache: false,
			href: 'dept/toAdd',
			modal: true
		});
	}
	
	function addpositionFun(){
		//新增职位窗口
		$("#addpositionId").dialog({
			title:'新增',
			width: 600,
			height: 400,
			closed: false,
			cache: false,
			href: 'dept/toAddposition',
			modal: true
		});
	}
	function editFun(id){
		//修改窗口
		$("#updateId").dialog({
			title:'修改',
			width: 600,
			height: 400,
			closed: false,
			cache: false,
			href: "dept/toUpdate?id="+id,
			modal: true
		});
	}
	
	
	//删除
		function delFun(deptno,id){
			$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
			    if (r){    
			        //执行删除操作
			       	$.post("dept/delete",{deptno:deptno,id:id},function(data){
			       		 if(data==false){
			       			$.messager.show({
								title:"消息",
								msg:"删除成功",
								timeout:10000,
								showType:'show'
							});
			       			 $("#dg").datagrid("reload");
			       		}else{
			       			$.messager.show({
								title:"消息",
								msg:"此部门还有人员,不能进行删除",
								timeout:4000,
								showType:'show'
							});
			       		} 
			       	},"json");   
			    }    
			});
		}
	
	//固定电话的正则正则验证
	$(function(){
		   $.extend($.fn.validatebox.defaults.rules, {
		       areacode : {// 验证用户名
		           validator : function(value) {
		               return /\d{3}-\d{8}|\d{4}-\d{7}/gi.test(value);
		           },
		           message : '电话号码不正确，区号-电话号码 的数字'
		       }
		   });
		  });
  </script>
  <body>
  	<input id="ss"></input> 
	<div id="mm" style="width:120px"> 
	<div data-options="name:'deptname',iconCls:'icon-ok'">部门名称</div> 
	<div data-options="name:'deptno'">部门编号</div> 
	</div> 
	<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="clearFun()">清空</a>  
	
  	<div id="addTool">
  	  <a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="addFun()">新增部门</a>  
  	  <a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="addpositionFun()">新增职位</a>  
  	</div>
  	
  	<table id="dg"></table>  
    <div id="addId"></div>
    <div id="addpositionId"></div>
     <div id="updateId"></div>
  </body>
  
</html>

