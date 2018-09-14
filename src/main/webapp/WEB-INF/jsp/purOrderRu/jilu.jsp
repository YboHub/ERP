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

<title>My JSP 'empList.jsp' starting page</title>

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
	<input id="ss"></input>
	<div id="mm" style="width:120px">
		<div data-options="name:'materialnum'">订单号</div>
	</div>
	<a class="easyui-linkbutton" data-options="iconCls:'icon-reload'"
		onclick="clearFun()">清空</a>
	<table id="dg"></table>

	<script type="text/javascript">
		$('#dg').datagrid({                              
		    url:'purOrderRu/data', 
		    toolbar:"#addTools",
		    fitColumns:true,   
			singleSelect:true, 
		    rownumbers:true,
		    pagination:true,
		    pageSize:10,
		    pageList:[10,20,40,60],
		    columns:[[ 
		        {field:'id',title:'编号',width:100,hidden:true},    
		        {field:'materialnum',title:'订单号',width:100},  
		        {field:'materialtype',title:'原料类型',width:100},    
		        {field:'materialname',title:'原料名称',width:100},
		        {field:'inventoryunit',title:'数量',width:100},
		        {field:'addtime',title:'入库时间',width:100,
		        	formatter:function(value){
		        			var date =new Date(value);
		        		 	var y = date.getFullYear();
						    var m = date.getMonth() + 1;
						    var d = date.getDate();
						    var h = date.getHours();
						    var MM = date.getMinutes();
						    var ss = date.getSeconds();
						    return   y +'-'+ (m < 10 ? ('0' + m) : m) +'-'+ (d < 10 ? ('0' + d) : d)+ ' ' + h + ':' + (MM < 10 ? ('0' + MM) : MM) + ':' + (ss < 10 ? ('0' + ss) : ss);
		        	}
		        },
		        {field:'name',title:'入库人',width:100},
		    ]],
		   
		}); 
		
		//查询框
	    $('#ss').searchbox({ 
			searcher:function(value,name){ 
				//alert(value + "," + name);
				//将参数出传递到后台，得到列表数据  刷新
		        $("#dg").datagrid('load', {    
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
			$("#ss").searchbox('setValue', '');
			//刷新列表
			$("#dg").datagrid('reload',{
				name:null,
				value:null
			});
		}
    	
    </script>
</body>
</html>
