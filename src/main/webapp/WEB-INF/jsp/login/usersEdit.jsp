<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<style>
	#ff div{
		margin: 5px;
	}
</style>
<form id="ff" method="post" style="margin: 10px">   
	 <div>   
	     <label>员工编号:</label>   
	     <input class="easyui-validatebox" type="text" name="empno" value="${users.empno}" data-options="required:true" readonly="readonly"/>   
	 </div>   
	 <div>   
	     <label>员工姓名:</label>
	     <input class="easyui-validatebox" type="text" name="ename" value="${users.ename}" data-options="required:true" readonly="readonly"/>   
	 </div>
	 <div>   
	     <label>部&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;门:</label>
	     <select id="upkind"  name="deptno" style="width:200px;" onchange="loadInfo()">  
	     	<c:forEach items="${deptList}" var="dept">
	     		<option value="${dept.deptno}" <c:if test="${users.deptno==dept.deptno}">selected</c:if>>${dept.deptname}</option>
	     	</c:forEach> 
		 </select> 
	 </div>
	 <div>   
	     <label>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位:</label>
	     <select id="dokind"  name="postno" style="width:200px;"> 
	     	<c:forEach items="${positionList}" var="pos">
	     		<option value="${pos.id}" <c:if test="${users.post==pos.post}">selected</c:if>>${pos.post}</option>
	     	</c:forEach> 
		 </select>
	 </div>
	 <div>   
	     <label>登陆账号:</label>   
	     <input id="vv" class="easyui-validatebox" type="text" name="account" value="${users.account}" data-options="required:true" readonly="readonly"/>
	     <span id="smacco" style="color: red"></span>
	     <div><span style="color: green;">账号由数字、字母（区分大小写）组成，长度为3~8</span></div>
	 </div>
    <div>   
        <a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="updateFun()">保存</a>  
    </div>   
</form>  
<script type="text/javascript">
	
 	function updateFun(){
 		if (confirm("您确认修改么？")) {
			$('#ff').form({    
			    url:'<%=path%>/login/update',    
			    onSubmit: function(){
			    	//表单职位验证
					var postno=$("#dokind").val();    
			        if(postno==-1){
			        	alert("请选择正确的职位！");
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
						$('#dd').window('close');
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
			// 提交表单    
			$('#ff').submit(); 
		}
 	};
 	// 部门下拉框改变时触发
	function loadInfo(){
		var deptno = $("#upkind").val();
		$("#dokind option").remove();
		$("#dokind").append("<option value='-1' selected>---请选择---</option>");
		$.ajax({
			url:"<%=path%>/login/getPost",
			type:"post",
			dataType:"json",
			data:{ 'deptno' : deptno  },
			success: function(data,textStatus){
				$.each(data,function(n,value){
					var str = "<option value='"+ value.id +"' >"+ value.post +" </option>";
					$("#dokind").append(str);
				});
			},
			error: function(data){
				alert("服务器出错~");
			}
		});
	}

 	
 </script>

