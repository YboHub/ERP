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
		<div data-options="name:'mnumber'">材料编号</div>
		<div data-options="name:'pnumber'">产品编号</div>
	</div>
	<a class="easyui-linkbutton" data-options="iconCls:'icon-reload'"
		onclick="clearFun()">清空</a>
	<div id="addTools"  data-options="region:'center'">   
		
	</div>
	<table id="dg"></table>
	<div id="add"></div>
	<div id="edit"></div>
	<script type="text/javascript">
		$('#dg').datagrid({                              
		    url:'materialchu/datagrid', 
		    toolbar:"#addTools",
		    fitColumns:true,   
		    singleSelect:true, 
		    rownumbers:true,
		    pagination:true,
		    pageSize:10,
		    pageList:[10,20,40,60],
		    columns:[[    
		        {field:'mid',title:'编号',hidden:true,width:100},    
		        {field:'mnumber',title:'材料编号',width:100},    
		        {field:'pnumber',title:'产品编号',width:100},
		        {field:'mzhuang',title:'总量',width:100,
		        	formatter:function(value,row,index){
		        		if(row.mzhuang==1){
		        			return "待出库";
		        		}else{
		        			return "已出库";
		        		}
		        	}
		        },
		        {field:'ACTION',title:'操作',width:100,
		        	formatter:function(value,row,index){
		        		return "<a class='btn-edit' style='height:19px' onclick='edi("+row.mid+")'>详情</a><a class='btn-del' style='height:19px' onclick='del("+row.mid+")'>出库</a>";
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
		
		function edi(mid){
			$("#edit").dialog({    
			    title: '编辑',    
			    width: 400,    
			    height: 166,    
			    closed: false,    
			    cache: false,    
			    href: 'materialss/toEdit?mid='+mid,    
			    modal: true   
			});  
    	}
		/* 编辑对话窗口 */
    	function del(mid){
			$.post("materialchu/del",{mid:mid},function(data){
				if(data!=1){
					alert("库存数量不足");
				}else{
					alert("出库成功");
					location.href="<%=path%>/materialchu/toList";
				}
				
			},"json");
    	}
    	
    	/* 添加窗口关闭 */
    	function closeAdd(){
    		$("#add").window('close');  // close a window  
    	}
    	/* 保存窗口关闭 */
    	function closeEdit(){
    		$("#edit").window('close');  // close a window  
    	}
    </script>
</body>
</html>
