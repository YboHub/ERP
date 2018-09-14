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
		<div data-options="name:'mnumber'">编号</div>
		<div data-options="name:'pnumber'">姓名</div>
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
		    url:'material/datagrid', 
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
		        {field:'mzhuang',title:'审核状态',width:100,
		        	formatter:function(value,row,index){
		        		if(row.mzhuang==1){
		        			return "审核通过";
		        		}else if(row.mzhuang==2){
		        			return "审核不通过";
		        		} else{
		        			return "待审核";
		        		}
		        	}
		        },
		        {field:'mperson',title:'审核人',width:100},
		        {field:'mshi',title:'审核时间',width:100 },
		        {field:'myi',title:'审核意见',width:100},
		        {field:'ACTION',title:'操作',width:100,
		        	formatter:function(value,row,index){
		        		if(row.mzhuang==3){
		        			return "<a class='btn-edit' style='height:19px' onclick='edi("+row.mid+")'>审核</a>";
		        		}else{
		        			return "";
		        		}
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
		function edi(mid){
			$("#add").dialog({    
			    title: '新增',    
			    width: 400,    
			    height: 300,  
			    closed: false,    
			    cache: false,    
			    href: 'material/toAdd?mid='+mid,    
			    modal: true  
			     
   
			});  
		}  
		
    	/* 添加保存对话窗口 */
    	function saveAdd(){
    		$("#addForm").form({    
			    url:"/toSave",    
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
