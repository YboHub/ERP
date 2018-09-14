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
		<div data-options="name:'pnumber'">编号</div>
		<div data-options="name:'dnumber'">产品编号</div>
		
	</div>
	<a class="easyui-linkbutton" data-options="iconCls:'icon-reload'"
		onclick="clearFun()">清空</a>
	<div id="addTools"  data-options="region:'center'">   
<!-- 		<a class="easyui-linkbutton" data-options="iconCls:'icon-add'"  -->
<!-- 			onclick="addFun()">新增</a> -->
 		<a class="easyui-linkbutton" data-options="iconCls:'icon-clear'" 
			onclick="ADFu()">删除</a> 
		<a class="easyui-linkbutton" data-options="iconCls:'icon-edit'" 
			onclick="UpdFun()">编辑</a>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-tip'" 
			onclick="ShengFun()">开始生产</a>
			<a class="easyui-linkbutton" data-options="iconCls:'icon-tip'" 
			onclick="jieshu()">结束生产</a>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-tip'" 
			onclick="fanhui()">返回</a>
	</div>
	<table id="dg"></table>
	<div id="add"></div>
	<div id="edit"></div>
	<div id="acc"></div>
	<script type="text/javascript">
		$('#dg').datagrid({                              
		    url:'plan/datagrid', 
		    toolbar:"#addTools",
		    fitColumns:true,   
			//singleSelect:true, 
		    rownumbers:true,
		    pagination:true,
		    pageSize:10,
		    pageList:[10,20,40,60],
		    columns:[[ 
		    	{field:'we',title:'编号',checkbox:true,width:100},    
		        {field:'pid',title:'编号',width:100,hidden:true},    
		        {field:'pnumber',title:'计划编号',width:100},  
		        {field:'dnumber',title:'产品编号',width:100},    
		        {field:'person',title:'计划人',width:100},
		        {field:'ptime',title:'提交时间',width:100,
		        	formatter:function(value){
		        			var date =new Date(value);
		        		 	var y = date.getFullYear();
						    var m = date.getMonth() + 1;
						    var d = date.getDate();
						    var h = date.getHours();
						    var MM = date.getMinutes();
						    var ss = date.getSeconds();
						    return   y +'-'+ (m < 10 ? ('0' + m) : m) +'-'+ (d < 10 ? ('0' + d) : d)+ ' ' + (h<10 ?  ('0'+h):h) + ':' + (MM < 10 ? ('0' + MM) : MM) + ':' + (ss<10? ('0'+ss):ss);

		        	}
		        }, 
		        {field:'pnum',title:'实际所需天数',width:100,
		        	formatter:function(value,row,index){
		        		if(value==0){
		        			return 1;
		        		}else{
		        			return value;
		        		}
		        	}
		        },
		        {field:'pchang',title:'预计生产天数',width:100},
		        {field:'pbegin',title:'预计开始时间',width:100},
		        {field:'pend',title:'预计结束时间',width:100},
		        {field:'states',title:'审核状态',width:100},
		        {field:'pyi',title:'意见',width:100},
		        {field:'pzhi',title:'采购状态',hidden:true,width:100},
		        {field:'ACTION',title:'操作',width:100,
		        	formatter:function(value,row,index){
		        		return	"<a class='btn-del' style='height:19px' onclick='select(\""+row.dnumber+"\")'>详情</a><a class='btn-edit' style='height:19px' onclick='del(\""+row.dnumber+"\")'>生产记录</a>";
		        	}
		        }  
		    ]],
		    onLoadSuccess:function(data){
		    	$('.btn-edit').linkbutton({iconCls: 'icon-tip'}); 
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
			    width: 500,    
			    height: 300,  
			    closed: false,    
			    cache: false,    
			    href: 'plan/toAdd',    
			    modal: true  
   			});  
		}  
		/* 删除对话窗口*/
		function ADFu(){
 			var checkList=$("#dg").datagrid("getChecked");
			var idStr=[];
			for(var i=0;i<checkList.length;i++){
				idStr[i]=checkList[i].pid;
			var name=checkList[i].states;
			}
			if(name!="审核通过"){
				$.messager.confirm("删除","你确定删除吗?",function(t){
				if(t){
					$.post("plan/delete",{idStr:idStr},function(data){
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
			}else{
				alert("已经通过审核,不能删除");
			}
			
 		}

 		/*开始 生产*/
		function ShengFun(){
 			var checkList=$("#dg").datagrid("getChecked");
			for(var i=0;i<checkList.length;i++){
				pid=checkList[i].pid;
 				var name=checkList[i].states;
 				var names=checkList[i].pzhi;
			}
			if(checkList.length==1){
				if(name=="审核通过"){
					if(names==2){
						$.post("plan/up",{pid:pid},function(data){
							if (data>0) {
									$.messager.show({
										title:'我的消息',
										msg:'开始生产成功',
										timeout:5000,
										showType:'show'
		 							});
		 								$("#dg").datagrid("reload");
								} else {
		 							$.messager.show({
		 								title:'我的消息',
		 								msg:'生产成功，联系厂家',
										timeout:5000,
										showType:'show'
		 							});
		 						}				
							},"json");
					}else{
						alert("筹备材料中");
					}
				}else{
					alert("审核未通过");
				}
			}else {
				alert("只能选择一个");
			}
			
 		}
 		
 		/*结束 生产*/
		function jieshu(){
 			var checkList=$("#dg").datagrid("getChecked");
			for(var i=0;i<checkList.length;i++){
				pid=checkList[i].pid;			
 				var name=checkList[i].states;
 				var names=checkList[i].pzhi;
 				var dnumber=checkList[i].dnumber;
			}
			if(checkList.length==1){
				if(name=="生产中"){
					if(names==2){
						$.post("plan/toselect",{dnumber:dnumber},function(data){
								if(data!=1){
									alert("生产数量不足");
								}else{
									alert("生产成功");
									location.href="<%=path%>/plan/toList";
								}
						},"json");
				}else{
					alert("筹备材料中");
				}  
			}else{
			alert("不能结束生产");
			}	
		}else{
			alert("只能选择一个");
		}
			
 		}
		/* 编辑对话窗口 */
    	function UpdFun(){
    	var checkList=$("#dg").datagrid("getChecked");
			for(var i=0;i<checkList.length;i++){
				pid=checkList[i].pid;
 				var name=checkList[i].states;
			}
			if(checkList.length==1&&name!="审核通过"){
			$("#edit").dialog({
			    title: '编辑',    
			    width: 400,    
			    height: 250,    
			    closed: false,    
			    cache: false,    
			    href: 'plan/toEdit?pid='+pid,    
			    modal: true   
			});  
			}else{
				alert("只能编辑一行或者已通过不能修改");
			}
    		
    	}
    	
    	/* 添加保存对话窗口 */
    	function saveAdd(){
    		$("#addForm").form({    
			    url:"plan/toSave",    
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
			    url:"plan/toUpdate",    
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
		//跳转路径    	
    	function fanhui(){
    		$(function(){
				location.href="<%=path%>/orderinfo/toList";
				});
    		}
    	function select(dnumber){
			$("#add").dialog({    
			    title: '编辑',    
			    width: 750,    
			    height: 300,    
			    closed: false,    
			    cache: false,    
			    href: 'plan/todel?dnumber='+dnumber,    
			    modal: true   
			});  
    	}
    		function del(dnumber){
    			location.href="proRecord/toList?dnumber="+dnumber;
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
