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
    
    <title>My JSP 'empList.jsp' starting page</title>
    
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
		        	formatter: function(value,row,index){
						return "<a class='btn-edit' onclick='editFun("+row.id+")' style='height:18px'>编辑</a>";
					}
		        }
		    ]], 
		    onLoadSuccess:function(date){
				$('.btn-edit').linkbutton({iconCls: 'icon-edit'});
				$('.btn-del').linkbutton({iconCls: 'icon-remove'});
			}   
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
	
	function saveAdd(){
    		$("#addForm").form({    
			    url:"food/toSave",    
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
							timeout:5000,
							showType:'show',
							style:{
								right:'',
								top:document.body.scrollTop+document.documentElement.scrollTop,
								bottom:''
							}
						});
						$("#addId").window('close');  // close a window  
						$("#dg").datagrid("reload");
					} else {
						$.messager.show({
							title:'我的消息',
							msg:'保存失败，联系管理员',
							timeout:5000,
							showType:'show',
							style:{
								right:'',
								top:document.body.scrollTop+document.documentElement.scrollTop,
								bottom:''
							}
							
						});
					}    
			    }    
			});    
			// submit the form    
			$('#addForm').submit(); 
    	}
	
	//删除
		function delFun(id){
			$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
			    if (r){    
			        //执行删除操作
			       	$.post("food/delete",{id:id},function(data){
			       		if(data>0){
			       			$.messager.show({
								title:"消息",
								msg:"删除成功",
								timeout:10000,
								showType:'show',
								style:{
									right:'',
									top:document.body.scrollTop+document.documentElement.scrollTop,
									bottom:''
										}
							});
			       			 $("#dg").datagrid("reload");
			       		}else{
			       			$.messager.show({
								title:"消息",
								msg:"删除失败，请联系管理员",
								timeout:2000,
								showType:'show',
								style:{
									right:'',
									top:document.body.scrollTop+document.documentElement.scrollTop,
									bottom:''
										}
							});
			       		}
			       	},"json");
			    }    
			});
		}
	
	$(function(){
		   $.extend($.fn.validatebox.defaults.rules, {
		       areacode : {// 验证用户名
		           validator : function(value) {
		               return /^[a-zA-Z0-9]{2,20}$/gi.test(value);
		           },
		           message : '只允许2-20位字母或数字'
		       },
		       vername: {// 验证姓名，可以是中文或英文
                validator: function (value) {
                     return /^[\Α-\￥]+$/i.test(value) | /^[A-Za-z]+$/i.test(value);
                 },
                 message: '请输入中文或英文'
             },
		   });
		  });
	
	
	function chakan(){
	  			var warehousenum = $("#warehousenum").val();
	  			$.post("food/yanzheng",{warehousenum:warehousenum},function(data){
	  			var dd = data.msg;
	  			if(dd.length>0){
	  				$("#num").html(data.msg);
	  				$("#warehousenum").val("");
	  			}	
	  			$("#num").html(data.msg);
	  			});
	  		}	

	
	function addFun(){
		//新增窗口
		$("#addId").dialog({
			title:'新增',
			width: 600,
			height: 400,
			closed: false,
			cache: false,
			href: 'food/toAdd',
			modal: true
		});
	}
	function editFun(id){
		//新增窗口
		$("#updateId").dialog({
			title:'新增',
			width: 600,
			height: 400,
			closed: false,
			cache: false,
			href: 'food/toUpdate?id='+id,
			modal: true
		});
	}
	
	
	function saveEdit(){
    		$("#editForm").form({    
			    url:"food/toUpdate",    
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
							timeout:5000,
							showType:'show'
						});
						$("#updateId").window('close');  // close a window  
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
			// submit the form    
			$('#editForm').submit(); 
    	}
	function closeAdd(){
		$("#addId").window('close');  
	}
	function closeEdit(){
		$("#updateId").window('close');  
	}
  </script>
  <body>
  	<input id="ss"></input> 
	<div id="mm" style="width:120px"> 
	<div data-options="name:'warehousenum'">仓库编号</div> 
	<div data-options="name:'warehousename',iconCls:'icon-ok'">仓库名</div> 
	</div> 
	<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="clearFun()">清空</a>  
	
  	<div id="addTool">
  	  <a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="addFun()">新增</a>  
  	</div>
  
  	<table id="dg"></table>  
    <div id="addId"></div>
     <div id="updateId"></div>
  </body>
  
</html>

