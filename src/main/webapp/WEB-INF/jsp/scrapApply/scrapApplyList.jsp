<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<!--注意加载顺序-->
  <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">   
  <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">   
  <script type="text/javascript" src="easyui/jquery-1.8.3.min.js"></script>   
  <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
  <!--汉化js-->
  <script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#dg").datagrid({    
			    url:'scrapApply/datagrid', 
			    toolbar:"#addTools",
			    fitColumns:true,  
			    singleSelect:true,
			    rownumbers:true,  //行数
			    pagination:true,  //页码  	
			    pageList:[5,10,20,40,80,160],//分页记录数数组   参数,必须前面倍数
			    pageSize:5, //每页记录数     
			    columns:[[    
			        {field:'sid',title:'编号',width:80,halign:'center',hidden:true},    
			        {field:'equipmentnumber',title:'设备单号',width:100,halign:'center'}, 
			        {field:'acceptanceDates',title:'验收日期',width:100,halign:'center'},
			        {field:'price',title:'价格',width:100,halign:'center'},
			        {field:'buyingTime',title:'购入时间',width:100,halign:'center'},
			        {field:'rejectionTime',title:'报废时间',width:100,halign:'center'},
			        {field:'cause',title:'报废原因',width:100,halign:'center'}, 
			        {field:'proposer',title:'申请人',width:100,halign:'center'}, 
			        {field:'appraiser',title:'鉴定人',width:100,halign:'center'}, 
			        {field:'remark',title:'备注',width:100,halign:'center'},
		        	{field:'audit',title:'审核状态',halign:'center',width:100,
		        	formatter:function(value,row,index){
		        		if(row.audit==0){
		        			return "<a class='btn-audit' style='height:19px' onclick='auditFun("+row.sid+")'>审核</a>";
		        		}else{
		        			if(row.audit==1){
		        				return "审核通过";
		        			}else if(row.audit==2){
		        				return "审核未通过";
		        			}else{
		        				return "待审核";
		        			}
		        		}
		        		
		        	}
		        },
		        {field:'action',title:'操作',halign:'center',width:80,
			        	formatter: function(value,row,index){
						return "<a class='btn-edit' onclick='editFun("+row.sid+")'>编辑<a/>";
					}
		        }
			    ]], 
		    onLoadSuccess:function(date){
				$('.btn-audit').linkbutton({iconCls: 'icon-tip'});
				$('.btn-edit').linkbutton({iconCls: 'icon-edit'}); 
			},
			   
		}); 
		
		    $('#ss').searchbox({ 
				searcher:function(value,name){ 
			        $("#dg").datagrid('load', {    
					    name: name,    
					    value: value  
					}); 
				}, 
				menu:'#mm', 
				prompt:'请输入值' 
			}); 
		});
		/*执行新增操作*/
		function addFun(){
			//新增窗口
			$("#addId").dialog({    
			    title: '新增',    
			    width: 600,    
			    height: 400,    
			    closed: false,    
			    cache: false,    
			    href: 'scrapApply/toAdd',    
			    modal: true   
			});  
		}
		/*执行修改操作*/
		function editFun(sid){
		//修改窗口
		$("#updateId").dialog({
			title:'修改',
			width: 600,
			height: 400,
			closed: false,
			cache: false,
			href: "scrapApply/toEdit?sid="+sid,
			modal: true
		});
	}
 
 		function auditFun(sid){
		//修改窗口
		$("#auditId").dialog({
			title:'修改',
			width: 400,
			height: 250,
			closed: false,
			cache: false,
			href: "scrapApply/toAudit?sid="+sid,
			modal: true
		});
	}
	
  	/* 查询待审核 */
	function searchone(){
		$("#ss").searchbox('setValue', '');
		//刷新列表
		$("#dg").datagrid('reload',{
			name:'audit',
			value:0
		});
	}
	
	/* 查询审核未通过 */
	function searchtwo(){
		$("#ss").searchbox('setValue', '');
		//刷新列表
		$("#dg").datagrid('reload',{
			name:'audit',
			value:2
		});
	}
	
	/* 审核通过 */
	function searchthree(){
		$("#ss").searchbox('setValue', '');
		//刷新列表
		$("#dg").datagrid('reload',{
			name:'audit',
			value:1
		});
	}
		
 		
		function clearFun(){
			$("#ss").searchbox('setValue', '');
			$("#dg").datagrid('reload',{
				name:null,
				value:null
			});
		}
	</script>
  </head>
  <body>
  		<input id="ss"></input> 
		<div id="mm" style="width:120px"> 
		    <div data-options="name:'equipmentnumber'">设备单号</div> 
		</div> 
		<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-add'"onclick="addFun()" >新增</a>
		<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="clearFun()">清空</a>
  		<div id="addTools">
  			<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="searchone()">待审核</a>
		  	<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="searchtwo()">审核未通过</a>
		  	<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="searchthree()">审核通过</a>
  		</div>
       <table id="dg" style="height:40%;"></table>  
       	<div id="addId"></div>
       	<div id="updateId"></div>
        <div id="auditId"></div>
        
  </body>
</html>
