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
    
    <title>My JSP 'ztree.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="js/zTree/3.5/zTreeStyle.css" type="text/css">
  	<script type="text/javascript" src="js/jquery.js"></script>
  	<script type="text/javascript" src="js/zTree/3.5/jquery.ztree.core-3.5.js"></script>
  	<script type="text/javascript" src="js/zTree/3.5/jquery.ztree.excheck-3.5.js"></script>
	
  </head>
  
  <body>
  		<%-- 角色:<select id="roleid" name="roleid" onchange="changeRole()" >
  			<c:forEach items="${roleList}" var="role">
  				<option value="${role.id}">${role.post}</option>
  			</c:forEach>
  		</select> --%>
  		<input id="roleid" type="hidden" name="roleid" value="${roleid}"/>
  		<input style="margin: 10px 0 0 10px" type="button" value="授权" onclick="getAllChecked()"/>
  		<br/>
  		<!-- 树样式  -->
  		<ul  id="treeDemo" class="ztree"></ul>
  		
  		
  		<script type="text/javascript">
		var setting = {
			check:{  
				chkboxType:{"Y":"ps","N":"ps"},//勾选checkbox对于父子节点的关联关系  
				chkStyle:"checkbox",
				enable : true   //是否复选框
			},  
			data:{
				simpleData: {
					enable: true
				}
			}
		};

		/*var zNodes =[
			{ id:1, pId:0, name:"随意勾选 1", open:true},
			{ id:11, pId:1, name:"随意勾选 1-1", open:true},
			{ id:111, pId:11, name:"随意勾选 1-1-1"},
			{ id:112, pId:11, name:"随意勾选 1-1-2"},
			{ id:12, pId:1, name:"随意勾选 1-2", open:true},
			{ id:121, pId:12, name:"随意勾选 1-2-1"},
			{ id:122, pId:12, name:"随意勾选 1-2-2"},
			{ id:2, pId:0, name:"随意勾选 2", checked:true, open:true},
			{ id:21, pId:2, name:"随意勾选 2-1"},
			{ id:22, pId:2, name:"随意勾选 2-2", open:true},
			{ id:221, pId:22, name:"随意勾选 2-2-1", checked:true},
			{ id:222, pId:22, name:"随意勾选 2-2-2"},
			{ id:23, pId:2, name:"随意勾选 2-3"}
		];*/
		var zNodes = '${zTreeNodes}';
		zNodes = eval(zNodes);//把字符串数据转化成json对象
	
		//页面加载自动执行
		$(document).ready(function(){
			//初始化树
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			//展开所有节点
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			treeObj.expandAll(true);
		});
		
		
		function getAllChecked(){
			//获取选择的菜单
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			var nodes = treeObj.getCheckedNodes(true);
			
			var ids = "";
			for(var i=0;i<nodes.length;i++){
				ids+=nodes[i].id+",";
			}
			/* location.href="role/save?ids="+ids+"&roleid="+$("#roleid").val(); */
			var roleid=$("#roleid").val();
			$.post("role/save",{ids:ids,roleid:roleid},function(data){
				if (data==nodes.length) {
					alert("授权成功！");
					$('#accredit').window('refresh', '<%=path%>/role/ztree?roleid='+roleid);
				}else{
					alert("授权失败！");
				}
			});
		}
		
		/* //设置角色默认值
		
		$(function(){
			$("#roleid").val('${roleid}');
		});
		//改变角色事件
		function changeRole(){
			var roleid = $("#roleid").val();
			location.href="role/ztree?roleid="+roleid;
		}  */
	</script>
  </body>
</html>
