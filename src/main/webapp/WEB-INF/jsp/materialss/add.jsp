<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	function save(){
		$('#updateById').form({    
		    url:"material/toUpdate",    
		    onSubmit: function(){    
		        // 做一些验证    
		        var isValid = $("#updateById").form("validate");
		        if(isValid){
		        	return true;
		        }else{
		        	return false;
		        }
		    },    
		    success:function(data){    
		    	if(data>0){
	       			$.messager.show({
							title:'我的消息',
							msg:'保存成功，联系管理员',
							timeout:3000,
							showType:'show'
						});
					$("#add").window('close');
					$("#dg").datagrid("reload");
					
	       		}else{
	       			$.messager.show({
							title:'我的消息',
							msg:'保存失败，联系管理员',
							timeout:3000,
							showType:'show'
						});
	       		}
		    }    
		});    
		$('#updateById').submit();   
	}
	/* function audit(){
		$("#cc").window('close');
	} */
	function closeAdd(){
		$('#updateById').form({    
		    url:"material/tooUpdate",    
		    onSubmit: function(){    
		        // 做一些验证    
		        var isValid = $("#updateById").form("validate");
		        if(isValid){
		        	return true;
		        }else{
		        	return false;
		        }
		    },    
		    success:function(data){    
		    	if(data>0){
	       			$.messager.show({
							title:'我的消息',
							msg:'保存成功，联系管理员',
							timeout:3000,
							showType:'show'
						});
					$("#add").window('close');
					$("#dg").datagrid("reload");
	       		}else{
	       			$.messager.show({
							title:'我的消息',
							msg:'保存失败，联系管理员',
							timeout:3000,
							showType:'show'
						});
	       		}
		    }    
		});    
		$('#updateById').submit();  
	}
	
</script>
<form id="updateById" method="post">
	<div>
		 <input type="hidden" name="mid" value="${list[0].mid}"/>
	</div>
	<div>   
        <label >&nbsp;&nbsp;审核意见:</label>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input class="easyui-textbox" data-options="multiline:true" name="myi" style="width:280px;height:150px;left:70px;top:20px"/>   
    </div><br/>
	<a id="addbtn"  class="easyui-linkbutton" data-options="iconCls:'icon-save'" style="position:relative;left:260px;top:10px;" onclick="save()">同意</a>    
    <a id="closebtn"  class="easyui-linkbutton" data-options="iconCls:'icon-clear'" style="position:relative;left:260px;top:10px;" onclick="closeAdd()">不同意</a>
</form>
