<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	function closeAdd(){
		$("#addpositionId").window('close');  
	}
	
	function save(){
	
		$('#formId').form({    
		    url:"dept/savePosition",    
		    onSubmit: function(){    
		        // 做一些验证    
		        var isValid = $("#formId").form("validate");
		        if(isValid){
		        	return true;
		        }else{
		        	return false;
		        }
		    },    
		    success:function(data){    
		    	if(data>0){
	       			$.messager.show({
						title:"消息",
						msg:"保存成功",
						timeout:3000,
						showType:'show'
					});
					$("#addpositionId").window('close');
					$("#dg").datagrid("reload");
	       		}else{
	       			$.messager.show({
						title:"消息",
						msg:"保存失败，请联系管理员",
						timeout:2000,
						showType:'show'
					});
	       		}
		    }    
		});    
		$('#formId').submit();  
	}
		  	 
</script>




<form id="formId" method="post">   
  <div>   
        <label >所在部门:</label>  
        <select  name="deptno"  style="width:153px;" >
        	<option>==请选择部门==</option>
	        <c:forEach items="${list}" var="obj">
	       		 <option value="${obj.deptno}">${obj.deptname}</option>
	        </c:forEach>
		</select> 
    </div><br/>
  
 	<div>   
        <label >职&nbsp;&nbsp;&nbsp;&nbsp;位:</label>   
        <input class="easyui-validatebox" type="text" name="post" data-options="required:true" placeholder="请输入职位"/>   
    </div><br/>
 
   
       
    <a id="addbtn"  class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="save()">保存</a>
    
    <a id="closebtn"  class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="closeAdd()">关闭</a>
</form>  