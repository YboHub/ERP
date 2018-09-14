<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'market.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <link rel="stylesheet" type="text/css" href="css/css.css" />
  <link rel="stylesheet" type="text/css" href="css/manhuaDate.1.0.css">
	<!--注意加载顺序-->
  <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">   
  <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">   
  <script type="text/javascript" src="easyui/jquery-1.8.3.min.js"></script>   
  <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
  <!--汉化js-->
  <script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>
  <script type="text/javascript" src="layer/layer.js"></script> 
  </head>
  <script type="text/javascript">
  $(function(){
	  $('#dg').datagrid({    
		    url:'market/datagrid',
		    fitColumns:true, 
		    singleSelect:true,
		    rownumbers:true,
		    pagination:true,
		    pageSize:5,
		    pageList:[5,10,20,30,40,50],
		    columns:[[    
				{field:'id',title:'审批编号',hidden:true},    
				{field:'rorderno',title:'订单编号',width:200,height:50},
				{field:'rpno',title:'退回产品编号',width:200,height:50},
				{field:'rpname',title:'退回产品名称',width:200,height:50},
				{field:'rprice',title:'退回产品价格',width:200,height:50},
				{field:'rpnum',title:'退回数量',width:200,height:50},
				{field:'rsubtotal',title:'退回总额',width:200,height:50},
				{field:'rtype',title:'退货类型',width:200,height:50,
					formatter:function(value,row,index){
		        		if (value==16) {
							return "部分退回";
						} else if (value==17) {
							return "全部退回";
						}
		        	} 
				},
				{field:'rordertime',title:'退回时间',width:200,height:50,
					formatter:function(value,row,index){
						var date = new Date(value);
                        var y = date.getFullYear();
                        var m = date.getMonth() + 1;
                        var d = date.getDate();
                        var h = date.getHours();
                        var MM=date.getMinutes();
                        var ss=date.getSeconds();
                        return   y +'-'+ (m < 10 ? ('0' + m) : m) +'-'+ (d < 10 ? ('0' + d) : d)+ ' ' + h + ':' + (MM < 10 ? ('0' + MM) : MM) + ':' + (ss < 10 ? ('0' + ss) : ss);

					}
				},
				{field:'returnreason',title:'退货原因',width:200,height:50},
				{field:'states',title:'退货状态',width:200,height:50},
				{field:'action',title:'详情',width:200,height:50,
					formatter: function(value,row,index){    
						return "<a style='height:20px' class='btn-audit' onclick='audit("+row.id+")'>审核</a>";
					}
				}
		    ]], 
		     onLoadSuccess:function(date){
				$('.btn-audit').linkbutton({iconCls: 'icon-ok'});
			}  
		}); 
		
		$('#ss').searchbox({
			width:240, 
			searcher:function(value,name){ 
				//alert(value + "," + name);
				$('#dg').datagrid('load',{
					name: name,
					value: value
				}); 
			}, 
			menu:'#mm', 
			prompt:'请输入关键字' 
		});  	  
  });
  //审核
  	function audit(id){
  		$('#cc').dialog({    
		    title: '审核',    
		    width: 420,    
		    height: 280,    
		    closed: false,    
		    cache: false,    
		    href: 'market/tomarket?id='+id,    
		    modal: true
		});    
  	}
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
  </script>
  <body>
    <input id="ss"></input> 
	<div id="mm" style="width:120px"> 
	<div data-options="name:'rorderno',iconCls:'icon-edit'">查询订单号</div> 
	</div> 
	<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="clearFun()">清空</a>
  	<table id="dg"></table>  	
	<div id="cc"></div> 
  </body>
</html>
