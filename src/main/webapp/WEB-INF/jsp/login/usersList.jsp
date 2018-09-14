<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'users.jsp' starting page</title>
    
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
	<script type="text/javascript" src="js/md5.js"></script>
  </head>
  
  <body>
  	<input id="ss" style="width:260px"></input> 
	<div id="mm" style="width:120px"> 
		<div data-options="name:'empno',iconCls:'icon-ok'">员工编号</div> 
		<div data-options="name:'ename'">员工姓名</div> 
	</div>
	<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="clearFun()">清空</a>
	<div id="addTool">
  	  <a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="addFun()">新增</a>  
  	</div> 
    <table id="dg"></table>
    <!-- 新增块 -->
    <div id="addUser"></div>
    <!-- 编辑块 -->
    <div id="dd"></div>
    <script type="text/javascript">
    	$(function(){
    		$('#dg').datagrid({    
			    /* 一个URL从远程站点请求数据。 */   
			    url:'<%=path%>/login/userList', 
			    /* 顶部工具栏的DataGrid面板。 */
			    toolbar: '#addTool',
			    /* 如果为true，则只允许选择一行。 */
			    singleSelect:true,
			    /* 真正的自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动。 */
			    fitColumns:true,
			    /* 是否显示斑马线效果 */ 
			    striped:true,
			    /* 如果为true，则在DataGrid控件底部显示分页工具栏。 */
			    pagination:true,
			    /* 如果为true，则显示一个行号列。 */
			    rownumbers:true,   
			    columns:[[    
			        {field:'empno',title:'员工编号',width:100},    
			        {field:'ename',title:'员工姓名',width:100},    
			        {field:'deptname',title:'部门',width:100},
			        {field:'post',title:'职位',width:100},    
			        {field:'account',title:'登陆账号',width:100},  
			        {field:'action',title:'操作',width:100,
			        	formatter: function(value,row,index){
			        		if (row.empno==100010) {
			        			return "";
							}else{
								return "<a class='btn-edit' style='height:20px' onclick='editFun("+row.empno+")'>编辑</a>"+
								"<a class='btn-del' style='height:20px'  onclick='delFun("+row.empno+")'>删除</a>";
							}
						}
			        },
			    ]],
			    onLoadSuccess:function(date){
					$('.btn-edit').linkbutton({iconCls: 'icon-edit'});
					$('.btn-del').linkbutton({iconCls: 'icon-remove'});
				}      
			});
			$('#ss').searchbox({ 
				searcher:function(value,name){ 
					$('#dg').datagrid('load',{
						name: name,
						value: value
					}); 
				}, 
				menu:'#mm', 
				prompt:'请输入关键字' 
			});  
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
		//新增用户函数
		function addFun(){
			$('#addUser').dialog({    
			    title: '新增用户',    
			    width: 420,    
			    height: 350,    
			    closed: false,    
			    cache: false,    
			    href: '<%=path%>/login/toAdd',    
			    modal: true   
			});   
		}
		//修改用户函数
    	function editFun(empno){
    		$('#dd').dialog({    
			    title: '修改用户',    
			    width: 400,    
			    height: 300,    
			    closed: false,    
			    cache: false,    
			    href: '<%=path%>/login/toEdit?empno='+empno,    
			    modal: true   
			});    
    	}
    	//删除用户函数
    	function delFun(empno){
    		$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
			    if (r){    
			        $.post("login/delete",{empno:empno},function(data){
			        	if (data>0) {
							$.messager.show({
								title:'消息',
								msg:'删除成功！',
								timeout:2000,
								showType:'show'
							});
							$('#dg').datagrid("reload");
						}else{
							$.messager.show({
								title:'消息',
								msg:'删除失败！',
								timeout:2000,
								showType:'show'
							});
						}
			        },"json");    
			    }    
			});  
    	}
    </script>
  </body>
</html>
