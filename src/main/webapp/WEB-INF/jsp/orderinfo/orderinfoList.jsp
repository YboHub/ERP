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
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">  

</head>

<body>
	
	<input id="ss"></input> 
	<div id="mm" style="width:120px"> 
	<div data-options="name:'orderno'">编号</div> 
	
	</div> 
	<a class="easyui-linkbutton" data-options="iconCls:'icon-reload'"
		onclick="clearFun()">清空</a>
	<div id="addTools"  data-options="region:'center'">   
		
		<a class="easyui-linkbutton" data-options="iconCls:'icon-add'" 
			onclick="zhuanFun()">计划</a>
	</div>
	<table id="dg"></table>
	<div id="add"></div>
	<div id="edit"></div>
	<script type="text/javascript">
		$('#dg').datagrid({                              
		    url:'orderinfo/datagrid', 
		    toolbar:"#addTools",
		    fitColumns:true,   
			singleSelect:true, 
		    rownumbers:true,
		    pagination:true,
		    pageSize:10,
		    pageList:[10,20,40,60],
		    columns:[[ 
		    	//{field:'we',title:'编号',checkbox:true,width:100},    
		        {field:'id',hidden:true,title:'编号',width:100},    
		        {field:'orderno',title:'产品编号',width:100},    
		        {field:'ordertime',title:'下单时间',width:100,
		        	formatter:function(value){
		        			var date =new Date(value);
		        		 	var y = date.getFullYear();
						    var m = date.getMonth() + 1;
						    var d = date.getDate();
						    var h = date.getHours();
						    var MM = date.getMinutes();
						    var ss = date.getSeconds();
						    return   y +'-'+ (m < 10 ? ('0' + m) : m) +'-'+ (d < 10 ? ('0' + d) : d)+ ' ' + h + ':' + (MM < 10 ? ('0' + MM) : MM) + ':' + (ss < 10 ? ('0' + ss) : ss);
		        	}
		        },
		        {field:'pname',title:'类型',width:100},
		        {field:'zhuang',title:'状态',hidden:true,width:100},
		        {field:'ACTION',title:'操作',width:100,
		        	formatter:function(value,row,index){
		        		if(row.zhuang==1){
		        			return "<a class='btn-edit' style='height:19px' onclick='edl("+row.id+")'>制定生产计划</a><a class='btn-del' style='height:19px' onclick='de(\""+row.orderno+"\")'>详情</a>";
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
		//产生生产计划
		function edl(id){
			$("#edit").dialog({    
			    title: '编辑',    
			    width: 700,    
			    height: 600,    
			    closed: false,    
			    cache: false,    
			    href: 'orderinfo/toEdit?id='+id,       
			    modal: true   
			});  
    		<%-- location.href="<%=path%>/emp/toEdit?empno="+empno; --%>
    	}
    	
    	
		function saveEdit(pnumber){
    		$("#editForm").form({    
			    url:"orderinfo/toAdd",    
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
							msg:'计划制定成功',
							timeout:3000,
							showType:'show'
						});
						$("#edit").window('close');  // close a window  
						$("#dg").datagrid("reload");
						
						$(function(){
							location.href="<%=path%>/plan/toList";
						});
					} else {
						$.messager.show({
							title:'我的消息',
							msg:'计划制定失败，联系管理员',
							timeout:3000,
							showType:'show'
						});
					}    
			    }    
			});    
			// submit the form    
			$('#editForm').submit(); 
    	}
    	
    	function de(orderno){
			$("#add").dialog({    
			    title: '编辑',    
			    width: 750,    
			    height: 300,    
			    closed: false,    
			    cache: false,    
			    href: 'orderinfo/todel?orderno='+orderno,    
			    modal: true   
			});  
    	}
    	function zhuanFun(){
    		$(function(){
				location.href="<%=path%>/plan/toList";
				});
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
