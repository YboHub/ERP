<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>客户信息</title>

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
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/bootstrapValidator.min.css" rel="stylesheet" />
<script type="text/javascript" src="js/area1.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.min.js"></script>
</head>

<body>
	<input id="ss"></input>
	<div id="mm" style="width:120px">
		<div data-options="name:'cno'">编号</div>
		<div data-options="name:'cname'">姓名</div>
	</div>
	<a class="easyui-linkbutton" data-options="iconCls:'icon-reload'"
		onclick="clearFun()">清空</a>
	<div id="addTools">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-add'"
			onclick="addFun()">新增</a>
	</div>
	<table id="dg"></table>
	<div id="add"></div>
	<div id="edit"></div>
	<script type="text/javascript">
		$('#dg').datagrid({  
			width: $(window).width(),  
		    url:'client/datagrid', 
		    toolbar:'#addTools',
		    fitColumns:true,
		    singleSelect:true, 
		    rownumbers:true,
		    pagination:true,
		    pageSize:10,
		    pageList:[10,20,40,80],
		    columns:[[    
		        {field:'cno',title:'编号',width:100},    
		        {field:'cname',title:'名称',width:200},    
		        {field:'cphone',title:'电话',width:200},
		        {field:'csort',title:'客户类型',width:200},
		        {field:'carea',title:'客户地址',width:280},
		        {field:'business',title:'客户行业',width:200},
		        {field:'ename',title:'业务员',width:150},
		        {field:'ACTION',title:'操作',width:100,
		        	formatter:function(value,row,index){
		        		/* return "<a href='emp/toEdit?empno=+"+row.EMPNO+"'>编辑     </a><a href='emp/toDelete?empno=+"+row.EMPNO+"'>删除</a>"; */
		        		/* return "<input value='编辑' onclick='edi("+row.EMPNO+")' type='button'/><input value='删除' onclick='del("+row.EMPNO+")' type='button'/>"; */
		        		return "<a class='btn-edit' style='height:19px' onclick='edi("+row.id+")'>编辑</a>";
		        	}
		        }  
		    ]],
		    onLoadSuccess:function(data){
		    	$('.btn-edit').linkbutton({iconCls: 'icon-edit'}); 
		    	$('.btn-del').linkbutton({iconCls: 'icon-clear'}); 
		    } 
		}); 
		//查询框
	    $('#ss').searchbox({ 
			searcher:function(value,name){ 
				//alert(value + "," + name);
				//将参数出传递到后台，得到列表数据  刷新
		        $('#dg').datagrid('load', {    
				    name: name,    
				    value: value  
				}); 
			}, 
			menu:'#mm', 
			prompt:'请输入值' 
		});
		//清空
		function clearFun(){
			//searchbox设置为空
			$('#ss').searchbox('setValue', '');
			//刷新列表
			$('#dg').datagrid('reload',{
				name:null,
				value:null
			});
		}
		/* 新增对话窗口 */
		function addFun(){
			$('#add').dialog({    
			    title: '添加客户信息',    
			    width: 1300,    
			    height: 800,    
			    closed: false,    
			    cache: false,    
			    href: 'client/toAdd',    
			    modal: true   
			});  
		}  
		/* 编辑对话窗口 */
    	function edi(id){
			$('#edit').dialog({    
			    title: '更该客户信息',    
			    width: 1300,    
			    height: 800,    
			    closed: false,    
			    cache: false,    
			    href: 'client/toEdit?id='+id,    
			    modal: true   
			});  
    		<%-- location.href="<%=path%>/emp/toEdit?empno="+empno; --%>
    	}
    	
    	
    </script>
</body>
</html>
