<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>采购拨款记录JSP页面</title>
    
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
		    url:'funds/fundsid',
		    fitColumns:true, 
		    singleSelect:true,
		    rownumbers:true,
		    pagination:true,
		    pageSize:10,
		    pageList:[10,20,30,40,50],
		    columns:[[    
				{field:'id',       title:'审批编号', hidden:true},    
				{field:'orderid',  title:'单号', width:200,height:50},
				{field:'allmoney', title:'拨款金额', width:200,height:50},
				{field:'fundsname',title:'拨款人',   width:200,height:50},
				{field:'time',	   title:'拨款时间',   width:200,height:50,
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
				{field:'paymethod',title:'拨款方式', width:200,height:50},
				{field:'reason',   title:'拨款理由', width:200,height:50},
				{field:'payee',    title:'收款人',   width:200,height:50},
				{field:'bankcard', title:'收款账号', width:200,height:50},
				{field:'states',   title:'状态',     width:200,height:50},
		    ]]
		}); 
/* -------------------------------------------搜索框 -------------------------------------------------*/
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
/*------------------------------------------- 清空输入框中的信息--------------------------------------- */
		function clearFun(){
			//searchbox设置为空
			$("#ss").searchbox('setValue', '');
			//刷新列表
			$("#dg").datagrid('reload',{
				name:null,
				value:null
			});
		}
/*---------------------------------------------- 表单验证--------------------------------------------- */
 		 $('#ss').validatebox({    
		    required: true,    
		    validType: 'number'   
		});
  </script>
  <body>
  	<!-- 查询面板 -->
  		   <!-- collapsed boolean 定义是否在初始化的时候折叠面板。      false 
				minimized boolean 定义是否在初始化的时候最小化面板。  false 
				maximized boolean 定义是否在初始化的时候最大化面板。  false 
				closed    boolean 定义是否在初始化的时候关闭面板。      false -->
				
    <div id="fin" class="easyui-panel" title="温馨提示：请选择相对应的进行查询！！！"     
        style="width:100%;height:80px;padding:10px;background:#fafafa;"   
        data-options="iconCls:'icon-help',closable:true,collapsed:true,   
                collapsible:true,maximizable:true"> 
                
        <!-- 验证的输入框 -->       
	  	<input id="ss" class="easyui-validatebox" data-options="required:true,validType:'number'"></input> 
		<div id="mm" style="width:120px"> 
			<div data-options="name:'orderid',iconCls:'icon-edit'">查询采购单号</div> 
			<div data-options="name:'fundsname'">查询拨款人</div> 
		</div> 
		<!-- 清空按钮 -->
		<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="clearFun()">清空</a>
	</div>
	
  	<table id="dg" style="height:500px;"></table>  	
  	
  </body>
</html>
