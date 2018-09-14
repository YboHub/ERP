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
    
    <title>采购拨款管理JSP页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- 加载顺序 -->
	<link rel="stylesheet" type="text/css" href="<%=path %>/easyui/themes/default/easyui.css">   
	<link rel="stylesheet" type="text/css" href="<%=path %>/easyui/themes/icon.css">   
	<script type="text/javascript" src="<%=path %>/easyui/jquery-1.8.3.min.js"></script>   
	<script type="text/javascript" src="<%=path %>/easyui/jquery.easyui.min.js"></script>
<!-- 汉化版 -->  
	<script type="text/javascript" src="<%=path %>/easyui/easyui-lang-zh_CN.js"></script>
  </head>
  <script type="text/javascript">
	  $(function(){
	  
		  $('#dg').datagrid({    
			    url:'funds/datagrid',
			    fitColumns:true, 
			   // singleSelect:true, 
			    rownumbers:true,
			    pagination:true,
			    pageSize:10,
			    pageList:[10,20,40,80,160],
			    columns:[[    
			        {field:'orderid',   title:'采购单号',  width:100},
			        {field:'caozuoname',title:'采购申请人',width:100},
			        {field:'types',     title:'采购类型',  width:100},
			        {field:'allmoney',  title:'采购申请款',width:100},
			        {field:'states',    title:'审核状态',  width:100},
			        {field:'action',    title:'操作',     width:200,height:50,
						formatter: function(value,row,index){    
							return "<a style='height:20px' class='btn-edit' onclick='Xiao("+row.orderid+","+row.allmoney+")'>拨款</a>";
					}
				}
			    ]], 
			    onLoadSuccess:function(date){
					$('.btn-edit').linkbutton({iconCls: 'icon-edit'});
				}   
			}); 
/*-----------------------------------------------------------搜索框------------------------------------------------------ */			
			$('#ss').searchbox({ 
				searcher:function(value,name){ 
					//alert(value + "," + name);
					$('#dg').datagrid('load',{
						name: name,
						value: value
					}); 
				}, 
				menu:'#mm', 
				prompt:'请输入信息' 
			}); 
	  });
/*-------------------------------------------------------清空输入框中的信息------------------------------------------------ */
		function clearFun(){
			//searchbox设置为空
			$("#ss").searchbox('setValue', '');
			//刷新列表
			$("#dg").datagrid('reload',{
				name:null,
				value:null
			});
			$('#beginTime').datetimebox('clear');
				    	$('#endTime').datetimebox('clear');
		}
/*---------------------------------------------------- 财务拨款 ------------------------------------------------------------*/
		function Xiao(orderid,allmoney){
  		$('#cc').dialog({    
		    title: '拨款',    
		    width: 350,    
		    height: 200,    
		    closed: false,    
		    cache: false,    
		    href: 'funds/sel?orderid='+orderid+'&allmoney='+allmoney,    
		    modal: true
		});    
  	}
/*-----------------------------------------------------点击新增窗口的函数 ---------------------------------------------------*/
		function Next(){
			//新增窗口
			$("#addId").dialog({
				title:'审核',
				width:600,
				height:300,
				closed:false,
				cache:false,
				href:'funds/toAdd',
				modal:true
			});
		}
/*-------------------------------------------------------根据时间查询信息 ---------------------------------------------------*/
		    //格式化日期
			function myformatter(date) {
			    //获取年份
			    var y = date.getFullYear();
			    //获取月份
			    var m = date.getMonth() + 1;
			    return y + '-' + m;
			}
	   		function searchFun(){
	   		 		$('#search').click(function(){
				     //获取查询框中的内容
				   	var beginTime = $('#beginTime').datetimebox('getValue');
				    var endTime = $('#endTime').datetimebox('getValue');
				   
				    if(beginTime>endTime){
		    				$.messager.alert('提示','开始时间不能大于结束时间','warning');
		    			}else{
		    					//将参数提交 重新加载
		    					$('#dg').datagrid('load',{
			    					beginTime:beginTime,
			    					endTime:endTime,
		    				});
		    			}
			   		 });  
	   		 } 
	   	 	 function show(){
				   $('#dd').dialog({    
					    title: '采购单详情',    
					    width: 1000,    
					    height: 500, 
					    closed: false,    
					    cache: false,  
					    content:"<iframe scrolling='auto' frameborder='0' src='funds/toList3' style='width:100%; height:100%; display:block;'></iframe>", 
					   /*  属性href，类型string，一个URL，用它加载远程数据并且显示咋面板（panel）里。
					   	     请注意，除非面板（panel）打开，否则内容不会被加载。这对创建一个惰性加载的面板（panel）很有用。 */
					   // href: 'funds/toList3',    
					    modal: true
					});    
				} 
/*---------------------------------------------- 表单验证--------------------------------------------- */
	 		 $('#ss').validatebox({    
			    required: true,    
			    validType: 'number'   
			});      		  
  </script>
  <body>

<!-- 折叠面板 -->
		<!-- 	collapsed boolean 定义是否在初始化的时候折叠面板。     false 
				minimized boolean 定义是否在初始化的时候最小化面板。 false 
				maximized boolean 定义是否在初始化的时候最大化面板。 false 
				closed    boolean 定义是否在初始化的时候关闭面板。     false  -->

	<div id="p" class="easyui-panel" class="easyui-accordion" title="温馨提示：请选择相对应的进行查询！！！"     
	        style="width:100%;height:80px;padding:10px;background:#fafafa;"   
	        data-options="iconCls:'icon-help',closable:true,collapsed:true,    
	                collapsible:true,maximizable:true" > 
	      
	  	<input id="ss" class="easyui-validatebox" data-options="required:true,validType:'number'" style="width:200px"></input>
		<div id="mm" style="width:120px"> 
			<div data-options="name:'r.orderid'">   订单号</div> 
			<div data-options="name:'r.caozuoname'">申请人</div> 
		</div> 
			<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="clearFun()">清空</a>
	</div> 
 	
<!-- financesList页面的内容部分 -->
  	<table id="dg" style="height:500px;">
  	</table> 
  	<div id="addId"></div>
  	
<!-- 新增窗口的div -->
	   <div id="dd"></div>
	   <div id="cc"></div>
  </body>
</html>
