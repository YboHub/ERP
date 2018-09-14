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
<script type="text/javascript" src="easyui/jquery.datagrid-groupview.js"></script>
</head>
<body>
<input id="ss"></input>
	<div id="mm" style="width:120px">
		<div data-options="name:'pnumber'">编号</div>
	</div>
	<div id="addTools" data-options="region:'center'">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-add'"
			onclick="addFun()">新增配方</a>
	</div>
	<table id="dg"></table>
	<div id="add"></div>
	<div id="edit"></div>
	<script type="text/javascript">
	$(function(){
		$('#dg').datagrid({    
		    url:'formula/datagrid', 
		    toolbar:"#addTools",
		    fitColumns:true,   
		    singleSelect:true, 
		    rownumbers:true,
		    pagination:true,
		    pageSize:20,
		    pageList:[10,20,40,60],
		    columns:[[
		    	{field:'pid',title:'',width:200,hidden:true},    
		        {field:'ptype',title:'型号',width:100},    
		        {field:'pnumber',title:'产品编号',width:100},    
		        {field:'pname',title:'原料名称',width:100},
		        {field:'pgui',title:'原料规格',width:100},
		        {field:'pshu',title:'原料数量',width:100},
		        {field:'pdan',title:'单位',width:100},
		        {field:'ACTION',title:'操作',width:100,
		        	formatter:function(value,row,index){
		        		return "<a class='btn-edit' style='height:19px' onclick='edi("+row.pid+")'>编辑</a><a class='btn-del' style='height:19px' onclick='del("+row.pid+")'>删除</a>";
		        	}
		        }  
		    ]],
		    groupField:'ptype',//设置分组依据的字段
		    view:groupview,//分组视图，此处需要引入groupView.js
		    groupFormatter:function(value,rows){
                   return value + ' - 共有' + rows.length+'种原材料';
            },
		    onLoadSuccess:function(data){
		    	$('.btn-edit').linkbutton({iconCls: 'icon-edit'}); 
		    	$('.btn-del').linkbutton({iconCls: 'icon-clear'}); 
		    	 $('#dg').datagrid('collapseGroup');  //设置group视图默认为折叠
		    } 
		    
		});
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
		function addFun(){
			$("#add").dialog({    
			    title: '新增',    
			    width: 400,    
			    height: 300,  
			    closed: false,    
			    cache: false,    
			    href: 'formula/toAdd',  
			    modal: true  
			});  
		} 
		
    	/* 添加保存对话窗口 */
    	function saveAdd(){
    		$("#addForm").form({    
			    url: "formula/toSave",    
			    onSubmit: function(){    
			        // do some check    
			        var isVali = $("#addForm").form("validate");
			        if (isVali) {
						return true;
					} else {
						return false;
					}
			    },    
			    success:function(data){    
			        if (data>0) {
						$.messager.show({
							title:'我的消息',
							msg:'保存成功',
							timeout:3000,
							showType:'show'
						});
						$("#add").window('close');  // close a window  
						$("#dg").datagrid("reload");
					} else {
						$.messager.show({
							title:'我的消息',
							msg:'保存失败，联系管理员',
							timeout:3000,
							showType:'show'
						});
					}    
			    }    
			});    
			// submit the form    
			$('#addForm').submit(); 
    	}
    	
    	/* 新增原料 */
		function addF(){
			$("#add").dialog({    
			    title: '新增',    
			    width: 400,    
			    height: 300,  
			    closed: false,    
			    cache: false,    
			    href: 'formula/Add',  
			    modal: true  
			});  
		} 
		
		
    	/* 删除对话窗口 */
    	function del(pid){
    		$.messager.confirm('确认','确认删除记录吗',function(r){
    			if(r){
    				$.post("formula/delete",{pid:pid},function(data){
    					if (data>0) {
							$.messager.show({
								title:'我的消息',
								msg:'删除成功',
								timeout:5000,
								showType:'show'
							});
								$("#dg").datagrid("reload");
						} else {
							$.messager.show({
								title:'我的消息',
								msg:'删除失败，联系管理员',
								timeout:5000,
								showType:'show'
							});
						}
    				},"json");
    			}
    		});
    	}
    
    /* 编辑对话窗口 */
    	function edi(pid){
			$("#edit").dialog({    
			    title: '编辑',    
			    width: 400,    
			    height: 250,    
			    closed: false,    
			    cache: false,    
			    href: 'formula/toEdit?pid='+pid,    
			    modal: true   
			});  
    		<%-- location.href="<%=path%>/emp/toEdit?empno="+empno; --%>
    	}
    	
    	/* 保存更改对话窗口 */
    	function saveEdit(){
    		$("#editForm").form({    
			    url:"formula/toUpdate",    
			    onSubmit: function(){    
			        // do some check    
			        var isVali = $("#editForm").form("validate");
			        if (isVali) {
						return true;
					} else {
						return false;
					}
			    },    
			    success:function(data){    
			        if (data>0) {
						$.messager.show({
							title:'我的消息',
							msg:'更改成功',
							timeout:3000,
							showType:'show'
						});
						$("#edit").window('close');  // close a window  
						$("#dg").datagrid("reload");
					} else {
						$.messager.show({
							title:'我的消息',
							msg:'更改失败，联系管理员',
							timeout:3000,
							showType:'show'
						});
					}    
			    }    
			});    
			// submit the form    
			$('#editForm').submit(); 
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
