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
			    url:'carRecord/datagrid', 
			    toolbar:"#addTools",
			    fitColumns:true,  
			    singleSelect:true,
			    rownumbers:true,
			    pagination:true,     
			    pageList:[5,10,20,40,80,160],    
			    pageSize:5,      
			    columns:[[    
			        {field:'cid',title:'编号',width:80},    
			        {field:'cdate',title:'日期',width:200}, 
			        {field:'ctransportPeople',title:'用车人员',width:200}, 
			        {field:'cphone',title:'电话',width:200},
			        {field:'coutOfTime',title:'出车时间',width:200},
			        {field:'ccause',title:'事由',width:200},
			        {field:'csite',title:'地点',width:200}, 
			        {field:'crunningTime',title:'收车时间',width:200}, 
			        {field:'cbuildingUser',title:'使用单位',width:200},
			        {field:'csignature',title:'确认签字',width:200},
			        /* {field:'action',title:'操作',width:100,
			        	 formatter: function(value,row,index){
							return "<a class='btn-edit' onclick='editFun("+row.ID+")'> 编辑</a><a class='btn-del' onclick='delFun("+row.ID+")'> 删除</a>";
						}  
			        } */ 
			    ]],
			    onLoadSuccess:function(data){
			    	$('.btn-edit').linkbutton({iconCls: 'icon-edit'}); 
			    	$('.btn-del').linkbutton({iconCls: 'icon-clear'}); 
			    }
			        
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
		function addFun(){
			//新增窗口
			$("#addId").dialog({    
			    title: '新增',    
			    width: 600,    
			    height: 400,    
			    closed: false,    
			    cache: false,    
			    href: 'carRecord/toAdd',    
			    modal: true   
			});  
		}
		/* function delFun(id){
			$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
			    if (r){  
			    	//执行删除操作
			    	$.post("maintain/del",{id:id},function(data){
			    		if(data>0){
							$.messager.show({
							title:"消息",
							msg:"删除成功",
							timeout:5000,
							showType:'show'
						});
			    			$("#dg").datagrid("reload");
			    		}else{
			    			$.messager.show({
							title:'消息',
							msg:'删除失败',
							timeout:3000,
							showType:'show'
						});
			    	  }
			    	},"json");  
			    }    
			});  
		} */
		<%-- function editFun(id){
			location.href="<%=path%>/maintain/upd?id="+id;
		} --%>
		
		function clearFun(){
			$("#ss").searchbox('setValue', '');
			$("#dg").datagrid('reload',{
				name:null,
				value:null
			});
		}
		
		$("input[name='starttime']").val(); 
		$("input[name='endtime']").val();
	</script>
  </head>
  <body>
  	 	开始时间:<input class="easyui-datetimebox" id="starttime" name="starttime" style="width:150px" />
		结束时间:<input class="easyui-datetimebox" id="endtime" name="endtime" style="width:150px" /><br/>
  		<input id="ss"></input> 
		<div id="mm" style="width:120px"> 
			<div data-options="name:'cid',iconCls:'icon-ok'">编号</div> 
			<div data-options="name:'ctransportPeople'">用车人员</div>
		</div> 
		<a   class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="clearFun()">清空</a>
  		<div id="addTools">
  			<a class="easyui-linkbutton" data-options="iconCls:'icon-add'"onclick="addFun()" >新增</a>
  		</div>
       <table id="dg" style="height:40%;"></table>  
       <div id="addId"></div>
  </body>
</html>
