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

<title>客户信息</title>

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
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/bootstrapValidator.min.css" rel="stylesheet" />
<script type="text/javascript" src="js/area1.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.min.js"></script>
</head>

<body>
	<input id="ss"></input>
	<div id="mm" style="width:120px">
		<div data-options="name:'orderno'">订单编号</div>
		<div data-options="name:'cname'">客户名称</div>
	</div>
	<a class="easyui-linkbutton" data-options="iconCls:'icon-reload'"
		onclick="clearFun()">清空</a>
	<div id="addTools">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-add'"
			onclick="addFun()">新增</a>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-reload'"
			onclick="dgReload()">刷新</a>
	</div>
	<table id="dg"></table>
	<div id="add"></div>
	<div id="edit"></div>
	<script type="text/javascript">
		$('#dg').datagrid({    
		    url:'order/datagrid', 
		    toolbar:'#addTools',
		    fitColumns:true,   
		    singleSelect:true, 
		    rownumbers:true,
		    pagination:true,
		    pageSize:10,
		    pageList:[10,20,40,60],
		    columns:[[    
		        {field:'orderno',title:'订单编号',width:100},    
		        {field:'cname',title:'客户名称',width:100},    
		        {field:'cphone',title:'客户电话',width:100},
		        {field:'ordertime',title:'下单时间',width:100},
		        {field:'paytype',title:'付款方式',width:100,
		        	formatter:function(value,row,index){
		        		if (value==22||value==24) {
							return "预付定金";
						} else if (value==23){
							return "全款支付";
						}
		        	}
		        },
		        {field:'dpval',title:'预付金额',width:50,
		        	formatter:function(value,row,index){
		        		if (value==''||value==null) {
							return 0;
						}
		        	}
		        },
		        {field:'mtotal',title:'订单总额',width:50},
		        {field:'carea',title:'客户地址',width:150},
		        {field:'ename',title:'业务员',width:100},
		         {field:'statess',title:'订单状态',width:100,
		        	formatter:function(value,row,index){
		        		if (value==9) {
							return "已出库";
						} else if(value==10){
							return "未出库";
						} else if(value==19){
							return "退货处理中";
						} else if(value==21){
							return "已完成";
						}else {
							return "正在处理";
						}
		        	}
		        },
		        {field:'ACTION',title:'操作',width:140,
		        	formatter:function(value,row,index){
			        	if (row.statess==9) {
							return "<a class='btn-dta' style='height:19px' onclick='det(\""+row.orderno+"\")'>查看详情</a>"+
			        		"<a class='btn-pri' style='height:19px' onclick='pri(\""+row.orderno+"\")'>打印</a>"+
			        		"<a class='btn-dta' style='height:19px' onclick='sre(\""+row.orderno+"\")'>客户退货</a>";
						} else if (row.statess==19){
							return "<a class='btn-dta' style='height:19px' onclick='det(\""+row.orderno+"\")'>查看详情</a>"+
			        		"<a class='btn-pri' style='height:19px' onclick='pri(\""+row.orderno+"\")'>打印</a>";
						} else if(row.statess<9||row.statess==10){
			        		return "<a class='btn-edit' style='height:19px' onclick='edi(\""+row.orderno+"\")'>编辑</a>"+
			        		"<a class='btn-dta' style='height:19px' onclick='det(\""+row.orderno+"\")'>查看详情</a>"+
			        		"<a class='btn-pri' style='height:19px' onclick='pri(\""+row.orderno+"\")'>打印</a>";
			        	} else if(row.statess==21){
			        		return "<a class='btn-dta' style='height:19px' onclick='det(\""+row.orderno+"\")'>查看详情</a>"+
			        		"<a class='btn-pri' style='height:19px' onclick='pri(\""+row.orderno+"\")'>打印</a>"+
			        		"<a class='btn-dta' style='height:19px' onclick='sre(\""+row.orderno+"\")'>客户退货</a>";
			        	}
		        	}
		        }
		        /* {field:'ACTION1',title:'货款结算',width:50,
		        	formatter:function(value,row,index){ 
		        		if (row.paytype==22) {
							return "<a class='btn-dta' style='height:19px' onclick='cou(\""+row.orderno+"\")'>结算尾款</a>";
						} else if (row.paytype==24||row.paytype==23) {
						   	return "<a class='btn-dta' style='height:19px'>已结算</a>";
						}
		        	}
		        } */
		    ]],
		    onLoadSuccess:function(data){
		    	$('.btn-edit').linkbutton({iconCls: 'icon-edit'}); 
		    	$('.btn-dta').linkbutton({}); 
		    	$('.btn-pri').linkbutton({iconCls:'icon-print'}); 
		    } 
		}); 
		//查询框
	    $('#ss').searchbox({ 
			searcher:function(value,name){ 
				//alert(value + "," + name);
				//将参数出传递到后台，得到列表数据  刷新
		        $('#dg').datagrid('load', {    
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
			$('#ss').searchbox('setValue', '');
			//刷新列表
			$('#dg').datagrid('reload',{
				name:null,
				value:null
			});
		}
		/* 刷新 */
		function dgReload(){
			$('#dg').datagrid('reload');
		}
		/* 新增对话窗口 */
		function addFun(){
			location.href='<%=path%>/order/toAdd';
		}  
		/* 编辑页面 */
    	function edi(orderno){
    		location.href='<%=path%>/order/toEdit?orderno='+orderno;
    	}
    	/* 详情页面 */
    	function det(orderno){
    		location.href='<%=path%>/order/toDetail?orderno='+orderno;
    	}
    	/* 打印订单 */
    	function pri(orderno){
    		location.href='<%=path%>/order/toPrint?orderno='+orderno;
    	}
    	/* 客户退货 */
    	function sre(orderno){
    		location.href='<%=path%>/order/saleReturn?orderno='+orderno;
    	}
    	/* 尾款计算 */
    	function cou(orderno){
    		var paytype = 24;
    		$.post('order/countFinalPayment',{orderno:orderno,paytype:paytype},function(data){
    			if (data>0) {
		    		$.messager.alert('结算成功','此订单尾款结算成功','info');
		    		$('#dg').datagrid('reload');
				} else {
					$.messager.alert('已结算','此订单尾款已结算，不能重复结算','info');
				}
    		});
    	}
    </script>
</body>
</html>
