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
    
    <title>库存表页面</title>
    
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
		    url:'food/datagrid',
		    fitColumns:true, 
		    singleSelect:true, 
		    toolbar: '#addTool',
		    rownumbers:true,
		    pagination:true,
		    pageSize:5,
		    pageList:[5,10,20,30,40,50],
		    columns:[[    
		        {field:'warehousenum',title:'仓库编号',width:100},    
		        {field:'warehousename',title:'仓库名',width:100},
		        {field:'warehousetype',title:'仓库类型',width:100,
		        	formatter: function(value,row,index){
							if (value==1){
								return '原料库';
							} else if (value==2){
								return '成品库';
							}else {
								return '废品库';
							}
						}
		        	
		        },
		        {field:'warehousekeeper',title:'仓库管理员',width:100},
		        {field:'action',title:'操作',width:100,
		              formatter:function(value,row,index){
				        if(row.warehousetype=="1"){
				         var warehousetype1 = "<input type='button' value='原料入库记录' onclick='selRmfd("+row.warehousenum+")'>|<input type='button' value='原料库存总量' onclick='selylzl()'>";
				           return warehousetype1;
				        }else if(row.warehousetype=="2"){
				         var warehousetype2= "<input type='button' value='成品入库记录' onclick='selVpn("+row.warehousenum+")'>|<input type='button' value='成品出库记录' onclick='selCpck()'>|<input type='button' value='库存总量' onclick='selCpckAll()'>";
				         return warehousetype2;
				        } else {
				         var warehousetype3= "<input type='button' value='废品入库记录' onclick='selDow("+row.warehousenum+")'>|<input type='button' value='废品库存总量' onclick='selFpzl()'>";
				         return warehousetype3;
				        }
				            } }
		    ]], 
		   
		    onLoadSuccess:function(date){
				$('.btn-edit').linkbutton({iconCls: 'icon-more'});
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
 
	function clearFun(){
		//searchbox设置为空
		$("#ss").searchbox('setValue', '');
		//刷新列表
		$("#dg").datagrid('reload',{
			name:null,
			value:null
		});
	}
	/* 成品入库记录 */
	function selVpn(warehousenum){
		location.href="<%=path%>/inventory/selVpn?warehousenum="+warehousenum;
	}
	/* 原料入库记录 */
	function selRmfd(warehousenum){
		location.href="<%=path%>/inventory/selRmfd?warehousenum="+warehousenum;
	}
	/* 废品入库记录  */
	function selDow(warehousenum){
		location.href="<%=path%>/inventory/selDow?warehousenum="+warehousenum;
	}
	/* 出库记录 */
	function selCpck(id){
		location.href="<%=path%>/inventory/cpck";
	}
	/* 成品库存总量 */
	function selCpckAll(id){
		location.href="<%=path%>/inventory/cpkcAll";
	}
	/* 原料库存总量 */
	function selylzl(){
		location.href="<%=path%>/inventory/ylzlAll";
	}
	/* 废品库存总量  */
	function selFpzl(){
		location.href="<%=path%>/inventory/fpzlAll";
	}
  </script>
  <body>
  	<input id="ss"></input> 
	<div id="mm" style="width:120px"> 
	<div data-options="name:'warehousenum'">仓库编号</div> 
	<div data-options="name:'warehousename',iconCls:'icon-ok'">仓库名</div> 
	</div> 
	<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="clearFun()">清空</a>  
  	<table id="dg"></table>  
     <div id="updateId"></div>
  </body>
  
</html>

