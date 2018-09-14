<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>出入库详情页面</title>
    
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
	 <script type="text/javascript">
  $(function(){
  	var orderno=$("#xq").val();
	  $('#dg').datagrid({    
		    url:'proOut/datagridOne?orderno='+orderno,
		    fitColumns:true, 
		    singleSelect:true, 
		    toolbar: '#addTool',
		    rownumbers:true,
		    pagination:true,
		    pageSize:5,
		    pageList:[5,10,20,30,40,50],
		    columns:[[    
		        {field:'orderno',title:'订单编号',width:100},    
		        {field:'pprice',title:'产品价格',width:100},
		        {field:'pname',title:'产品名称',width:100},
		        {field:'psize',title:'产品型号',width:100},
		        {field:'pnum',title:'产品数量',width:100},
		        {field:'ordertime',title:'订单创建时间',width:100,
		        	formatter:function(value,row,index){
						var date = new Date(value);
                        var y = date.getFullYear();
                        var m = date.getMonth() + 1;
                        var d = date.getDate();
                        var h = date.getHours();
                        var MM=date.getMinutes();
                        var ss=date.getSeconds();
                        return   y +'-'+ (m < 10 ? ('0' + m) : m) +'-'+ (d < 10 ? ('0' + d) : d)+ ' ' + h + ':' + (MM < 10 ? ('0' + MM) : MM) + ':' + (ss < 10 ? ('0' + ss) : ss);

					}
		        },
		        {field:'cname',title:'客户姓名',width:100},
		        {field:'ename',title:'销售人员标号',width:100},
		        {field:'mtotal',title:'总计金额',width:100}
		    ]], 
		});
  });
	/* 返回上一级 */
	function fanhui(){
		window.history.go(-1);
		}
  </script>
  </head>
  <body>
  	<input id="xq" type="hidden" value="${orderno}"/>
  	<table id="dg"></table>  
  	<input type="button" value="返回" onclick="fanhui()">
  </body>
</html>
