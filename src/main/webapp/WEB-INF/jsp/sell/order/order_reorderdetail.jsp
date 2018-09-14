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
	<div id="returnTool">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-back'"
			onclick="retu()">返回</a>
	</div>
	<table id="dg"></table>
	<input type="hidden" value="${rorderno}" id="rorderno"/>
	<script type="text/javascript">
		var rorderno = $('#rorderno').val();
		$('#dg').datagrid({  
		    url:'order/rorderDetailDatagrid?rorderno='+rorderno, 
		    /* onClickCell:onClickCell,
	   		onAfterEdit:onAfterEdit, */
		    toolbar:"#returnTool",
		    fitColumns:true,  
		    singleSelect:true, 
		    rownumbers:true,
		    columns:[[    
		        {field:'rpno',title:'产品编号',width:100},    
		        {field:'rpname',title:'产品名称',width:100},    
		        {field:'rprice',title:'退回价格',width:100},
		        {field:'rpnum',title:'退货数量',width:200,editor:'text'},
		        {field:'rsubtotal',title:'金额',width:150},
		    ]],
		    onLoadSuccess:function(data){
		    	$('.btn-edit').linkbutton({}); 
		    	$('.btn-del').linkbutton({iconCls: 'icon-clear'}); 
		    } 
		}); 
		/* 返回 */
    	function retu(){
    		window.history.go(-1);
    	}
    	
    	
    </script>
</body>
</html>
