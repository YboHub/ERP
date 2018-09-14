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

<title>异常订单信息</title>

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
		<div data-options="name:'rorderno'">编号</div>
	</div>
	<a class="easyui-linkbutton" data-options="iconCls:'icon-reload'"
		onclick="clearFun()">清空</a>
	<!-- <div id="addTools">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-add'"
			onclick="addFun()">新增</a>
	</div> -->
	<table id="dg"></table>
	<div id="add"></div>
	<div id="edit"></div>
	<script type="text/javascript">
		$('#dg').datagrid({  
		    url:'order/reOrderDatagrid', 
		    /* toolbar:"#addTools", */
		    fitColumns:true,  
		    singleSelect:true, 
		    rownumbers:true,
		    pagination:true,
		    pageSize:10,
		    pageList:[10,20,40,80],
		    columns:[[    
		        {field:'rorderno',title:'订单编号',width:100},    
		        {field:'rtype',title:'退货类型',width:100,
		        	formatter:function(value,row,index){
		        		if (value==16) {
							return "部分退回";
						} else if (value==17) {
							return "全部退回";
						}
		        	} 
		        },    
		        {field:'rordertime',title:'退回时间',width:100},
		        {field:'returnreason',title:'退货原因',width:200},
		        {field:'rstate',title:'退货状态',width:150,
		        	formatter:function(value,row,index){
		        		if (value==18) {
							return "等待审核";
						} else if (value==1){
							return "未通过审核";
						} else if (value==2) {
							return "已通过审核";
						}
						else {
							return "未查询到订单状态";
						}
		        	} 
		        },
		        {field:'ACTION',title:'操作',width:100,
		        	formatter:function(value,row,index){
		        		return "<a class='btn-edit' style='height:19px' onclick='det(\""+row.rorderno+"\")'>查看退回货物详情</a>";
		        	}
		        }  
		    ]],
		    onLoadSuccess:function(data){
		    	$('.btn-edit').linkbutton({}); 
		    	$('.btn-del').linkbutton({iconCls: 'icon-clear'}); 
		    } 
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
		/* 新增对话窗口 */
		/* function addFun(){
			$("#add").dialog({    
			    title: '添加客户信息',    
			    width: 1300,    
			    height: 800,    
			    closed: false,    
			    cache: false,    
			    href: 'client/toAdd',    
			    modal: true   
			});  
		}   */
		/* 编辑对话窗口 */
    	function det(rorderno){
    		location.href="<%=path%>/order/rorderDetailList?rorderno="+rorderno;
    	}
    	
    	
    </script>
</body>
</html>
