<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'qualityrecord.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <link rel="stylesheet" type="text/css" href="css/css.css" />
  <link rel="stylesheet" type="text/css" href="css/manhuaDate.1.0.css">
	<!--注意加载顺序-->
  <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">   
  <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">   
  <script type="text/javascript" src="easyui/jquery-1.8.3.min.js"></script>   
  <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
  <!--汉化js-->
  <script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>
  <script type="text/javascript" src="layer/layer.js"></script> 
  </head>
  <script type="text/javascript">
  		$(function(){
	  $('#dg').datagrid({    
		    url:'ischeck/quality',
		    fitColumns:true, 
		    singleSelect:true,
		    rownumbers:true,
		    pagination:true,
		    pageSize:5,
		    pageList:[5,10,20,30,40,50],
		    columns:[[
		    	{field:'id',title:'单号',hidden:true},
		    	{field:'orderid',title:'采购单号',width:200,height:50},
		    	{field:'goodsname',title:'材料',width:200,height:50},  
				{field:'types',title:'采购类型',width:200,height:50},
				{field:'weights',title:'重量',width:200,height:50},
				{field:'states',title:'状态',width:200,height:50,
					formatter:function(value,row,index){
		        		if (value==14) {
							return "质检不合格";
						} else{
							return "质检合格";
						}
		        	} 
				},
				{field:'time',title:'质检时间',width:200,height:50,
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
				{field:'reason',title:'质检原因',width:200,height:50},
				{field:'qualityname',title:'质检人',width:200,height:50},
			]]
		}); 
		
		$('#ss').searchbox({
			width:240, 
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
	
  </script>
  <body>
    <input id="ss"></input> 
	<div id="mm" style="width:120px"> 
	<div data-options="name:'orderid',iconCls:'icon-edit'">查询订单号</div>
	<div data-options="name:'qualityname'">查询质检人</div> 
	</div> 
	<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="clearFun()">清空</a>
  	<table id="dg"></table>  
  </body>
</html>
