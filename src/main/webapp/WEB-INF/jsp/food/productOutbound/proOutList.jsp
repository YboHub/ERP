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
    <title>成品出库界面</title>
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
		    url:'proOut/datagrid',
		    fitColumns:true,
		    //singleSelect:true, 
		    toolbar: '#addTool',
		    rownumbers:true,
		    pagination:true,
		    pageSize:5,
		    pageList:[5,10,20,30,40,50],
		    columns:[[
		        {field:'orderno',title:'订单编号',width:100},    
		        {field:'pprice',title:'产品价格',width:100},
		        {field:'pname',title:'产品名称',width:100},
		        {field:'pnum',title:'产品量(吨)',width:100},
		        {field:'states',title:'出库状态',width:100},
		        {field:'action',title:'查看详情',width:100,
		        	formatter: function(value,row,index){
			        	if(row.statess==10){
							return "<input type='button' onclick='selOutDetails(\""+row.orderno+"\")' style='height:18px,width:40px' value='点击查看详情'/>&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' onclick='warehoueAllUnit(\""+row.orderno+"\",\""+row.id+"\")' style='height:25px' value='点击出库'>";
						}else{
							return "<input type='button' onclick='selOutDetails(\""+row.orderno+"\")' style='height:18px,width:40px' value='点击查看详情'/>";
						}
					}
		        }
		    ]],
		   
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
	function clearFun(){
		//searchbox设置为空
		$("#ss").searchbox('setValue', '');
		//刷新列表
		$("#dg").datagrid('reload',{
			name:null,
			value:null
		});
	}
	/* 出入库详情页面 */
	
	function selOutDetails(orderno){
		location.href="<%=path%>/proOut/selOutDetails?orderno="+orderno;
	}
 	 function warehoueAllUnit(orderno,id){
		//出库窗口
		$("#proOutId").dialog({
			title:'出库',
			width: 600,
			height: 400,
			closed: false,
			cache: false,
			href: 'proOut/warehoueAllUnit?orderno='+orderno+'&id='+id,
			modal: true
		});
	} 
 function outInventory(id){
		if(confirm("确认出库吗???")){
		  	$.post("proOut/outInventory",{id:id},function(data){
		  		if(data==0){
		  			alert("库存数量不足");
		  			$("#proOutId").window('close');
		  		}else{
		  			alert("出库成功");
		  			location.href="<%=path %>/proOut/toList";
		  		}
		  	});
		 }
	}  
	function closeEdit(){
		$("#proOutId").window('close');  
	}
  </script>
  <body>
  	<input id="ss"></input> 
	<div id="mm" style="width:120px"> 
	<div data-options="name:'orderno'">订单编号</div> 
	</div> 
	<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="clearFun()">清空</a> 
  	<table id="dg"></table>  
     <div id="proOutId"></div>
  </body>
</html>

