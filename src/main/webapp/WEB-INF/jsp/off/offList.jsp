<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

<title>报价表</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.min.js"></script>
</head>

<body>
	<input id="ss"></input>
	<div id="mm" style="width:220px">
		<div data-options="name:'company'">供货商</div>
		<div data-options="name:'goodsname'">物品名称</div>
	</div>
	<a class="easyui-linkbutton" data-options="iconCls:'icon-reload'"
		onclick="clearFun()">清空</a>
	<div id="addTools">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-add'"
			onclick="addFun()">新增报价表</a>
	</div>
	<table id="dg"></table>
	<div id="add"></div>
	<div id="edit"></div>
	<script type="text/javascript">

		$('#dg').datagrid({    
		    url:'off/datagrid', 
		    toolbar:"#addTools",
		    fitColumns:true,   
		    singleSelect:true, 
		    rownumbers:true,
		    pagination:true,
		    pageSize:10,
		    height:600,
		    pageList:[5,10,20,40,60],
		    columns:[[    
		        {field:'goodsname',title:'货物名称',width:100},    
		        {field:'goodstype',title:'材料型号',width:100},    
		        {field:'company',title:'供货商',width:100},
		        {field:'price',title:'单价￥/T',width:100},
		        {field:'plantime',title:'时间',width:100,
		        	formatter : function(value){
                        var date = new Date(value);
                        var y = date.getFullYear();
                        var m = date.getMonth() + 1;
                        var d = date.getDate();
                        var h= date.getHours();
                        var MM= date.getMinutes();
                        var ss =date.getSeconds();
                        return   y +'-'+ (m < 10 ? ('0' + m) : m) +'-'+ (d < 10 ? ('0' + d) : d)+ ' ' + (h<10 ?  ('0'+h):h) + ':' + (MM < 10 ? ('0' + MM) : MM) + ':' + (ss<10? ('0'+ss):ss);
                    }
		        },
		        {field:'day',title:'有效期（天）',width:100},
		        {field:'ACTION',title:'操作',width:100,
		        	formatter:function(value,row,index){
		        		return "<a class='btn-edit' style='height:19px' onclick='edi("+row.id+")'>编辑</a><a class='btn-del' style='height:19px' onclick='del("+row.id+")'>删除</a>";
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
			searcher:function(company,goodsname){ 
				
				//将参数出传递到后台，得到列表数据  刷新
		        $("#dg").datagrid('load', {    
				    company: company,    
				    goodsname: goodsname  
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
				caozuoname:null,
				orderid:null
			});
		}
		/* 新增对话框 */
		function addFun(){
			$("#add").dialog({    
			    title: '新增报价',    
			    width: 400,    
			    height: 300,    
			    closed: false,    
			    cache: false,    
			    href: 'off/toAdd',    
			    modal: true   
			}); 
		}  
		/* 修改订单对话框 */
    	function edi(id){
				$("#edit").dialog({    
			    title: '编辑',    
			    width: 400,    
			    height: 300,    
			    closed: false,    
			    cache: false,    
			    href: 'off/toEdit?id='+id,    
			    modal: true   
			});  
    	}
    	/* 删除对话窗口 */
    	function del(id){
    		$.messager.confirm('确认','确认删除记录吗',function(r){
    			if(r){
    				$.post("off/delete",{id:id},function(data){
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
			    url:"off/toSave",    
			    onSubmit: function(){    
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
							timeout:5000,
							showType:'show'
						});
						$("#add").window('close');  // close a window  
						$("#dg").datagrid("reload");
					} else {
						$.messager.show({
							title:'我的消息',
							msg:'保存失败，联系管理员',
							timeout:5000,
							showType:'show'
						});
					}    
			    }    
			});    
			$('#addForm').submit(); 
    	}
    	/* 保存更改对话窗口 */
    	function saveEdit(){
    		$("#editForm").form({    
			    url:"off/toUpdate",    
			    onSubmit: function(){    
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
							timeout:5000,
							showType:'show'
						});
						$("#edit").window('close');  // close a window  
						$("#dg").datagrid("reload");
					} else {
						$.messager.show({
							title:'我的消息',
							msg:'更改失败，联系管理员',
							timeout:5000,
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
    	/**时间输入框只能输入时间*/
    
    </script>
</body>
</html>
