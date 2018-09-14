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
		<div data-options="name:'cnumber'">编号</div>
		
	</div>
	<a class="easyui-linkbutton" data-options="iconCls:'icon-reload'"
		onclick="clearFun()">清空</a>
	<div id="addTools"  data-options="region:'center'">   
		<a class="easyui-linkbutton" data-options="iconCls:'icon-add'" 
			onclick="addFun()">新增</a>
<!-- 		<a class="easyui-linkbutton" data-options="iconCls:'icon-add'"  -->
<!-- 			onclick="ADFu()">新增</a> -->
	</div>
	<table id="dg"></table>
	<div id="add"></div>
	<div id="edit"></div>
	<script type="text/javascript">
		$('#dg').datagrid({                              
		    url:'capacity/datagrid', 
		    toolbar:"#addTools",
		    fitColumns:true,   
			singleSelect:true, 
		    rownumbers:true,
		    pagination:true,
		    pageSize:10,
		    pageList:[10,20,40,60],
		    columns:[[ 
		    	//{field:'we',title:'编号',checkbox:true,width:100},    
		        {field:'cid',title:'编号',hidden:true,width:100},    
		        {field:'cnumber',title:'产品编号',width:100,
		        	formatter:function(value,row,index){
		        		if(value==1){
		        			return "12mm*9m";
		        		}else if(value==2){
		        			return "16mm*9m";
		        		}else{
		        			return "20mm*9m";
		        		}
		        	}
		        },    
		        {field:'cmin',title:'正常产量',width:100},
		        {field:'cmax',title:'最大产量',width:100},
		        {field:'cdan',title:'单位',width:100},
		        {field:'cxian',title:'产线',width:100},
		        {field:'ACTION',title:'操作',width:100,
		        	formatter:function(value,row,index){
		        		return "<a class='btn-edit' style='height:19px' onclick='edi("+row.cid+")'>编辑</a><a class='btn-del' style='height:19px' onclick='del("+row.cid+")'>删除</a>";
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
		/* 新增对话窗口 */
		function addFun(){
			$("#add").dialog({    
			    title: '新增',    
			    width: 400,    
			    height: 300,  
			    closed: false,    
			    cache: false,    
			    href: 'capacity/toAdd',    
			    modal: true  
			     
   
			});  
		}  

		/* 编辑对话窗口 */
    	function edi(cid){
			$("#edit").dialog({    
			    title: '编辑',    
			    width: 400,    
			    height: 250,    
			    closed: false,    
			    cache: false,    
			    href: 'capacity/toEdit?cid='+cid,    
			    modal: true   
			});  
    		<%-- location.href="<%=path%>/emp/toEdit?empno="+empno; --%>
    	}
    	/* 删除对话窗口 */
    	function del(cid){
    		$.messager.confirm('确认','确认删除记录吗',function(r){
    			if(r){
    				$.post("Capacity/delete",{cid:cid},function(data){
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
    	/* 添加保存对话窗口 */
    	function saveAdd(){
    		$("#addForm").form({    
			    url:"capacity/toSave",    
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
    	/* 保存更改对话窗口 */
    	function saveEdit(){
    		$("#editForm").form({    
			    url:"capacity/toUpdate",    
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
