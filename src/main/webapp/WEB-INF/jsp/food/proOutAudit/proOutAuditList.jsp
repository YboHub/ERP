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
    <title>成品出库审核界面</title>
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
		    url:'proOutAudit/datagrid',
		    fitColumns:true,
		    //singleSelect:true, 
		    toolbar: '#addTool',
		    rownumbers:true,
		    pagination:true,
		    pageSize:5,
		    pageList:[5,10,20,30,40,50],
		    columns:[[
		        {field:'orderno',title:'订单编号',width:100},
		        {field:'pname',title:'产品名称',width:100},
		        {field:'states',title:'审核状态',width:100,
		        	formatter: function(value,row,index){
		      			if(row.statess==4){
		      				return "待审核";
		      			}else if(row.statess==1){
		      				return "审核不合格";
		      			}else{
		      				return "审核通过";
		      			}
		      		}
		        },
		        {field:'action',title:'查看详情',width:100,
		        	formatter: function(value,row,index){
			        	if(row.statess==4){
							return "<input type='button' onclick='selOutDetails(\""+row.orderno+"\")' style='height:18px,width:40px' value='点击查看详情'/>&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' onclick='outInventory("+row.id+")' style='height:25px' value='点击审核'>";
						}else{
							return "<input type='button' onclick='selOutDetails(\""+row.orderno+"\")' style='height:18px,width:40px' value='点击查看详情'/>";
						}
					}
		        }
		    ]],
		}); 
		$('#ss').searchbox({
			searcher:function(value,name){ 
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
	/* 成品审核详情页面 */
	
	function selOutDetails(orderno){
		location.href="<%=path%>/proOut/selOutDetails?orderno="+orderno;
	}
	function outInventory(id){
		//出库窗口
		$("#proOutId").dialog({
			title:'成品出库审核',
			width: 250,
			height: 250,
			closed: false,
			cache: false,
			href: "proOutAudit/proOutAuditV?id="+id,
			modal: true
		});
	}
	function closeEdit(){
		$("#proOutId").window('close');  
	}
  </script>
  <body>
  	<input id="ss"></input>
	<div id="mm" style="width:120px"> 
	<div data-options="name:'orderno',iconCls:'icon-ok'">订单编号</div> 
	</div>
	<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="clearFun()">清空</a> 
  	<table id="dg"></table>  
     <div id="proOutId"></div>
  </body>
</html>

