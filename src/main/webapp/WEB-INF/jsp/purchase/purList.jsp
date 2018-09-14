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

<title>采购计划</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="easyui/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>
</head>

<body>
	<input id="ss"></input>
	<div id="mm" style="width:120px">
		<div data-options="name:'orderid'">订单编号</div>
		<div data-options="name:'caozuoname'">申请人</div>
	</div>
	<a class="easyui-linkbutton" data-options="iconCls:'icon-reload'"
		onclick="clearFun()">清空</a>
	<div id="addTools">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-add'"
			onclick="addFun()">新增申请单</a>
		<a class='btn-edit' data-options="iconCls:'icon-edit'" 
		onclick="edi()">提交审核</a>	
		<a class='btn-del' data-options="iconCls:'icon-dele'" 
		 onclick="del()">删除</a>
		<a class="easyui-linkbutton" onclick="selectFun()">未提交</a>	
		<a class="easyui-linkbutton" onclick="selectFunOne()">质检未通过</a>	
		<a class="easyui-linkbutton" onclick="selectFunTwo()">未通过审核</a>		
	</div>
	 
	<table id="dg"></table>
	<div id="add"></div>
	<div id="detail"></div>
	<div id="detailOne"></div>
	<div id="updatedetalisONe"></div>
	<div id="edit"></div>
	<div id="editone"></div>
	<script type="text/javascript">
		$('#dg').datagrid({    
		    url:'datagrid', 
		    toolbar:"#addTools",
		    fitColumns:true,   
		    rownumbers:true,
		    pagination:true,
		    pageSize:10,
		    pageList:[5,10,20,40,60],
		    columns:[[ 
		    	{field:'weare',title:'',checkbox:true},
		        {field:'id',title:'',hidden:true,width:100},
		        {field:'orderid',title:'订单编号',width:100},    
		        {field:'caozuoname',title:'申请人',width:100},
		        {field:'apptime',title:'时间',width:100,
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
		        {field:'money',title:'预算额￥',width:100},
		        {field:'states',title:'申请单状态',width:100,
		        	 formatter:function(value,row,index){
		        		if (value==35) {
							return "待提交";
						} if(value==11){
							return "审核未通过";
						}if(value==14){
						    return "质检未通过";
						} if(value==15){
							return "已拨款，等待购买";
						}if(value==20){
							return "已购买";
						}else {
							return "已提交";
						}
		        	}
		        },
		        {field:'reason',title:'备注',width:100},
		        {field:'Action',title:'操作',width:100,
		        	formatter:function(value,row,index){
		        		if(row.states==35){
		        			return "<a class='btn-edit1' style='height:22px' onclick='details("+row.orderid+")'>编辑</a>";
		        		}if(row.states==14){/*质检未通过   审核未通过*/
		        			return "<a class='btn-tip' style='height:22px' onclick='detailreturn("+row.orderid+")'>异常详情</a><a class='btn-edit' style='height:22px' onclick='detailOk("+row.orderid+")'>处理完成</a><a class='btn-tip' style='height:22px' onclick='detailOne("+row.orderid+")'>详情</a>";
		        		}if(row.states==11){
		        			return "<a class='btn-edit1' style='height:22px' onclick='details("+row.orderid+")'>编辑</a>";
		        		}
		        		if(row.states==15){
		        			return "<a class='btn-edit' style='height:22px' onclick='detailToBuy("+row.orderid+")'>购买</a>";
		        		}
		        		else{
		        			return "<a class='btn-tip' style='height:22px' onclick='detailOne("+row.orderid+")'>详情</a>";
		        		}
		        	}
		        }  
		    ]],
		    onLoadSuccess:function(data){
		    	$('.btn-edit').linkbutton({iconCls: 'icon-ok'});
		    	$('.btn-edit1').linkbutton({iconCls: 'icon-edit'});  
		    	$('.btn-del').linkbutton({iconCls: 'icon-clear'}); 
		    	$('.btn-tip').linkbutton({iconCls: 'icon-tip'}); 
		    } 
		}); 
		//查询框
	   $('#ss').searchbox({ 
			searcher:function(value,name){ 
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
		/*未提交查询*/
		function selectFun(){
			$("#ss").searchbox('setValue', '');
			//刷新列表
			$("#dg").datagrid('reload',{
				name:'states',
				value:35
			});
		}
		/*质检未通过查询*/
		function selectFunOne(){
			$("#ss").searchbox('setValue', '');
			//刷新列表
			$("#dg").datagrid('reload',{
				name:'states',
				value:14
			});
		}
		/*审核未通过查询*/
		function selectFunTwo(){
			$("#ss").searchbox('setValue', '');
			//刷新列表
			$("#dg").datagrid('reload',{   
				name:'states',
				value:11
			});
		}
		/* 新增跳转 */
		function addFun(){
			location.href="<%=path%>/toAdd";
		} 

		 /*详情修改（添加）*/
		 function UpdateOne(){
				$.messager.progress();	// 显示进度条
				$('#myForm').form('submit', {
				url:'insertPur',
				onSubmit: function(){
					var isValid = $(this).form('validate');
					if (!isValid){
						$.messager.progress('close');	// 如果表单是无效的则隐藏进度条
					}
					return isValid;	// 返回false终止表单提交
				},
			success: function(){
				$.messager.progress('close'); // 如果提交成功则隐藏进度条
				$.messager.show({
						title:'消息',
						msg:'已提交',
						timeout:5000,
						showType:'slide'
					});
				$(function(){
					location.href="<%=path%>/toListOne";
				});
				
			}
			
		});
		 }
		/*详情编辑*/
		function details(orderid){
			$("#detail").dialog({    
			    title: '详情',    
			    width: 880,    
			    height: 300,    
			    closed: false,    
			    cache: false,    
			    href: 'Upedit?orderid='+orderid,    
			    modal: true   
			});  
		}
		/*异常材料查询*/
		function detailreturn(orderid){
			$("#detail").dialog({    
			    title: '详情',    
			    width: 880,    
			    height: 300,    
			    closed: false,    
			    cache: false,    
			    href: 'UpeditReturn?orderid='+orderid,    
			    modal: true   
			});  
		}
		/*详情*/
		function detailOne(orderid){
			$("#detailOne").dialog({    
			    title: '详情',    
			    width: 710,    
			    height: 230,    
			    closed: false,    
			    cache: false,    
			    href: 'UpeditOne?orderid='+orderid,    
			    modal: true   
			});
		}
		/*详情框修改页面*/
		function editone(id){
			$("#editone").dialog({    
			    title: '详情修改',    
			    width: 550,    
			    height: 300,    
			    closed: false,    
			    cache: false,    
			    href: 'editone?id='+id,    
			    modal: true   
			});  
		}
		/*详情框修改页面*//*框内修改*/
		function updatedetalisONe(id){
			$("#updatedetalisONe").dialog({    
			    title: '详情修改',    
			    width: 400,    
			    height: 260,    
			    closed: false,    
			    cache: false,    
			    href: 'updatedetalisONe?id='+id,    
			    modal: true   
			});  
		}
		/* 提交申请订单 */
    	function edi(){
	    	var checkList=$("#dg").datagrid("getChecked");
				var idStr=[];
				for(var i=0;i<checkList.length;i++){
					idStr[i]=checkList[i].id;
					var name=checkList[i].states;
				}
			if(name==null){
				$.messager.show({
					title:'我的消息',
					msg:'请至少选择一项',
					timeout:5000,
					showType:'show'
				});
			}else{
	    		if(name!=4){
					$.messager.confirm('确认','确认提交申请吗',function(r){
		    			if(r){
		    				$.post("edi",{idStr:idStr},function(data){
		    					if (data>0) {
									$.messager.show({
										title:'我的消息',
										msg:'提交成功',
										timeout:5000,
										showType:'show'
									});
										$("#dg").datagrid("reload");
								} else {
									$.messager.show({
										title:'我的消息',
										msg:'提交失败，联系管理员',
										timeout:5000,
										showType:'show'
									});
								 }
		    				},"json");
		    			}
		    		}); 
		    	}else{
		    		$.messager.show({
						title:'提醒',
						msg:'已提交，无需再次提交！',
						timeout:5000,
						showType:'show'
					});
		    	}
		    }
    }
    
    
    /* 把订单状态改成已购买 */
    	function detailToBuy(orderid){
			$.messager.confirm('确认','确认购买吗',function(r){
    			if(r){
    				$.post("detailToBuy",{orderid:orderid},function(data){
    					if (data>0) {
							$.messager.show({
								title:'我的消息',
								msg:'已购买',
								timeout:5000,
								showType:'show'
							});
								$("#dg").datagrid("reload");
						} else {
							$.messager.show({
								title:'我的消息',
								msg:'购买失败，联系管理员',
								timeout:5000,
								showType:'show'
							});
						 }
    				},"json");
    			}
    		}); 
    }
     /* 把质检未通过订单状态改成已购买 */
    	function detailOk(id){
			$.messager.confirm('确认','确认处理完成了吗',function(r){
    			if(r){
    				$.post("detailOk",{orderid:orderid},function(data){
    					if (data>0) {
							$.messager.show({
								title:'我的消息',
								msg:'已购买',
								timeout:5000,
								showType:'show'
							});
								$("#dg").datagrid("reload");
						} else {
							$.messager.show({
								title:'我的消息',
								msg:'购买失败，联系管理员',
								timeout:5000,
								showType:'show'
							});
						 }
    				},"json");
    			}
    		}); 
    }
    
    	/* 删除对话窗口 */
    	function del(){
    		var checkList=$("#dg").datagrid("getChecked");
			var idStr=[];
			for(var i=0;i<checkList.length;i++){
				idStr[i]=checkList[i].id;
			var name=checkList[i].states;
			}
			if(name==null){
				$.messager.show({
					title:'提醒',
					msg:'请至少选择一项',
					timeout:5000,
					showType:'show'
				});
			}else{
				if(name==5){
	    		$.messager.confirm('确认','确认删除记录吗',function(r){
	    			if(r){
	    				$.post("deleteOne",{idStr:idStr},function(data){
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
	    			$.messager.show({
						title:'提醒',
						msg:'该条记录不能删除！！',
						timeout:1000,
						showType:'show'
					});
	    		}
		   }		
    	}
    	/*退货*/
    	function delONe(id){
    		$.messager.confirm('确认','确认删除记录吗',function(r){
    			if(r){
    				$.post("deletetwo",{id:id},function(data){
    					if (data>0) {
							$.messager.show({
								title:'我的消息',
								msg:'删除成功',
								timeout:5000,
								showType:'show'
							});
								$('#detail').window('close'); // close a window  
    							$('#detail').window('open');  // open a window    
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
    	/*退货+查询+插入其他表*/
    	function delONeReturn(id){
    		$.messager.confirm('确认','确认退货吗',function(r){
    			if(r){
    				$.post("deletetwoReturn",{id:id},function(data){
    					if (data>0) {
							$.messager.show({
								title:'我的消息',
								msg:'退货成功',
								timeout:5000,
								showType:'show'
							});
								$('#detail').window('close'); // close a window  
    							$('#detail').window('open');  // open a window    
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
			    url:"purchase/toSave",    
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
			    url:"purchase/toUpdate",    
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
    	/* 保存更改对话窗口 */
    	function saveDetalisEdit(){
    		$("#editDateDatelisForm").form({    
			    url:"toUpdateDetalis",    
			    onSubmit: function(){    
			        var isVali = $("#editDateDatelisForm").form("validate");
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
						$("#updatedetalisONe").window('close');  // close a window  
						$('#detail').window('close'); // close a window 
						$("#dg").datagrid("reload"); 
						$('#detail').window('open');  // open a window    
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
			$('#editDateDatelisForm').submit(); 
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
