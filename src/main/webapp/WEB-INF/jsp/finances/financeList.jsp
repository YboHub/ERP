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
    
    <title>财务记录JSP页面</title>
    
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
			    url:'finances/datagrid',
			    toolbar: '#addTool',
			    fitColumns:true, 
			    singleSelect:true, 
			    rownumbers:true,
			    pagination:true,
			    pageSize:10,
			    pageList:[10,20,40,80,160],
			    columns:[[    
			        
			        {field:'onum',   title:'订单编号',  width:100},
			        {field:'ftype',  title:'财务类型',  width:100,},
			        {field:'fholder',title:'采购拨款人',width:100},
			        {field:'ftime',  title:'记录时间',  width:100,},
			        {field:'fpayee', title:'收款人',    width:100},
			        {field:'fmoney', title:'金额',      width:100},
			        {field:'fremark',title:'备注',      width:100,
			        	
			        }
			        /* 有些代码是要放在方法体中的,放到类中就会出现上述错误提示,或放到方法体中去 */
			        	/* formatter : function(value){
	                        var date = new Date(value);
	                        var y = date.getFullYear();
	                        var m = date.getMonth() + 1;
	                        var d = date.getDate();
	                        var h= date.getHours();
	                        var f= date.getMinutes();
	                        var s =date.getSeconds();
	                        return y + '-' +m + '-' + d + ' ' + h + ':' +f + ':' + s;
                    	} */
			    ]], 
			}); 
/*------------------------------------------------搜索框-------------------------------------------------------------- */			
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
/*------------------------------------------------- 清空输入框中的信息 --------------------------------------------------*/
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
/*-----------------------------------------------------点击新增的函数 ---------------------------------------------------*/
		function addFun(){
			//新增窗口
			 location.href="<%=path%>/histogram/toList"; 
			/* $("#addId").dialog({
				title:'利润查看',
				/* width:1300,
				height:650, */
				/*maximized : true,
				maximizable : true,
				modal : true,
				closed:false,
				cache:false,
				href:"finances/toList",
				modal:true
			}); */
		}
		
/*------------------------------------------- 根据时间查询信息 ------------------------------------*/
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
			    var endTime   = $('#endTime').datetimebox('getValue');
			   
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
/*---------------------------------------------------------查询面板--------------------------------------------------------*/
		 $('#fin').panel({    
			  width:500,    
			  height:150,    
			  title: 'My Panel',    
			  tools: [{    
			    iconCls:'icon-add',    
			    handler:function(){alert('new')}    
			  },{    
			    iconCls:'icon-save',    
			    handler:function(){alert('save')}    
			  }]    
			});
/*---------------------------------------------- 表单验证--------------------------------------------- */
 		 $('#ss').validatebox({    
		    required: true,    
		    validType: 'number'   
		});  
  </script>
  <body>
  
  <!-- 查询面板 -->
  			<!-- 	collapsed boolean 定义是否在初始化的时候折叠面板。 false 
				minimized boolean 定义是否在初始化的时候最小化面板。 false 
				maximized boolean 定义是否在初始化的时候最大化面板。 false 
				closed boolean 定义是否在初始化的时候关闭面板。 false  -->
				
  <div id="fin" class="easyui-panel" title="温馨提示：请选择相对应的进行查询！！！"     
        style="width:100%;height:150px;padding:10px;background:#fafafa;"   
        data-options="iconCls:'icon-help',closable:true,collapsed:true,   
                collapsible:true,maximizable:true"> 
                
     <form action="post">
 			开始时间：<input id="beginTime" class="easyui-datetimebox" name="beginTime" data-options="showSeconds:true" style="width:180px;height:30px;"/>  <br/>
 			结束时间：<input id="endTime" class="easyui-datetimebox" name="endTime" data-options="showSeconds:true" style="width:180px;height:30px;"/>  <br/>
 	</form>
 	
<!-- 根据表中相关信息进行查询 -->
  	<input id="ss" class="easyui-validatebox" data-options="required:true,validType:'number'" style="width:200px"></input>
	<div id="mm" style="width:120px"> 
		<div data-options="name:'onum'">   订单编号</div> 
		<div data-options="name:'fholder'">拨款人</div> 
		<div data-options="name:'fpayee'"> 收款人</div> 
		<div data-options="name:'ftype'">  财务类型</div> 
		<div data-options="name:'ftime'">  时间</div> 
	</div> 
<!-- 查询和清空按钮 -->
	<a id="search" class="easyui-linkbutton seacle" data-options="iconCls:'icon-search'" onclick="searchFun()">查询</a>
	<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="clearFun()">清空</a>  
	
  	<div id="addTool">
	  	  <!-- <a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="addFun()">新增</a>  -->
	  	  <a id="btn" style="width:100px;" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="addFun()">查看利润</a> 
  	</div> 
  	           
</div> 
 	  	
<!-- financesList页面的内容部分 -->
  	<table id="dg" style="height:500px;"></table> 
  	
  	<div id="addId"></div>
  	
  </body>
</html>
