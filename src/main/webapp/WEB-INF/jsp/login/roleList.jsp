<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'roleList.jsp' starting page</title>
    
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
	<link rel="stylesheet" href="js/zTree/3.5/zTreeStyle.css" type="text/css">
  	<!-- <script type="text/javascript" src="js/jquery.js"></script> -->
  	<script type="text/javascript" src="js/zTree/3.5/jquery.ztree.core-3.5.js"></script>
  	<script type="text/javascript" src="js/zTree/3.5/jquery.ztree.excheck-3.5.js"></script>
  </head>
  
  <body>
    <input id="ss" style="width:260px"></input> 
	<div id="mm" style="width:120px"> 
		<div data-options="name:'deptno',iconCls:'icon-ok'">部门编号</div> 
		<div data-options="name:'post'">职位</div> 
	</div>
	<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="clearFun()">清空</a>
	<div id="addTool">
  	  <a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="addFun()">新增</a>  
  	</div> 
    <table id="dg" style="width:800px"></table>
    <!-- 授权块 -->
    <div id="accredit"></div>
    <!-- 添加块 -->
    <div id="addRole"></div>
    <!-- 编辑块 -->
    <div id="edit"></div>
    <script type="text/javascript">
    	$(function(){
    		$('#dg').datagrid({    
			    /* 一个URL从远程站点请求数据。 */   
			    url:'<%=path%>/role/roleList', 
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
			    	{field:'deptno',title:'部门编号',width:200},   
			        {field:'deptname',title:'部门',width:200},
			        {field:'id',title:'职位ID',width:200,hidden:true},
			        {field:'post',title:'职位',width:200},    
			        {field:'action',title:'操作',width:200,
			        	formatter: function(value,row,index){
							return "<a class='btn-del' style='height:20px'  onclick='accredit("+row.id+")'>授权</a>"+
							"<a class='btn-edit' style='height:20px' onclick='editFun("+row.id+")'>编辑</a>"+
							"<a class='btn-del' style='height:20px'  onclick='delFun("+row.id+")'>删除</a>";
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
		
		//授权函数
		function accredit(roleid){
			$('#accredit').dialog({    
			    title: '授权',    
			    width: 280,    
			    height: 666,    
			    closed: false,    
			    cache: false,    
			    href: '<%=path%>/role/ztree?roleid='+roleid, 
			    modal: true   
			});   
		}
		//添加函数
		function addFun(){
			$('#addRole').dialog({    
			    title: '新增',    
			    width: 280,    
			    height: 150,    
			    closed: false,    
			    cache: false,    
			    href: '<%=path%>/role/toAdd', 
			    modal: true,
			    buttons:[{
					text:'提交',
					handler:function(){
						if (confirm("您确认提交新增内容么？")) {
							var deptno=$("#addDeptno").val();
							var post=$("#addPost").val();
					    	$('#ffm').form({    
							    url:"role/saveRole?deptno="+deptno+"&post="+post,    
							    onSubmit: function(){ 
							    	if (deptno==-1) {
										alert("请选择部门后在提交！");
										return false;
									}   
							        if (post==null||post=='') {
							        	alert("职位不能为空，请填写修改后的职位！");
										return false;
									}    
							    },    
							    success:function(data){
							        if (data) {
										$.messager.show({
											title:'消息',
											msg:'提交成功！',
											timeout:2000,
											showType:'show'
										});
										$('#addRole').window('close');
										$('#dg').datagrid("reload");
									}else{
										$.messager.show({
											title:'消息',
											msg:'提交失败！',
											timeout:2000,
											showType:'show'
										});
									}   
							    }    
							});    
							// submit the form    
							$('#ffm').submit();  
						}
					}
				},{
					text:'关闭',
					handler:function(){
						$('#edit').window('close');
					}
				}]     
			});   
		}
		//编辑函数
		function editFun(id){
			$('#edit').dialog({    
			    title: '编辑',    
			    width: 280,    
			    height: 130,    
			    closed: false,    
			    cache: false,    
			    href: '<%=path%>/role/editRole?id='+id, 
			    modal: true,
			    buttons:[{
					text:'提交',
					handler:function(){
						if (confirm("您确认提交修改内容么？")) {
							var post=$("#post").val();
					    	$('#ff').form({    
							    url:"role/update?id="+id+"&post="+post,    
							    onSubmit: function(){    
							        if (post==null||post=='') {
							        	alert("职位不能为空，请填写修改后的职位！");
										return false;
									}    
							    },    
							    success:function(data){
							        if (data) {
										$.messager.show({
											title:'消息',
											msg:'修改成功！',
											timeout:2000,
											showType:'show'
										});
										$('#edit').window('close');
										$('#dg').datagrid("reload");
									}else{
										$.messager.show({
											title:'消息',
											msg:'修改失败！',
											timeout:2000,
											showType:'show'
										});
									}   
							    }    
							});    
							// submit the form    
							$('#ff').submit();  
						}
					}
				},{
					text:'关闭',
					handler:function(){
						$('#edit').window('close');
					}
				}]  
			});   
		}
		//删除函数
		function delFun(id){
			$.messager.confirm('确认','您确认想要删除该职位吗？',function(r){    
			    if (r){    
			        $.post("role/delete",{id:id},function(data){
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
			        });    
			    }    
			});
		}
    </script>
  </body>
</html>
