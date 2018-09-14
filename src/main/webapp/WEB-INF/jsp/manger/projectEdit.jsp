<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <script>
	function closeAdd1(){
		$('#updateById').form({    
		    url:"manger/tooUpdate",    
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
						title:"消息",
						msg:"保存成功",
						timeout:3000,
						showType:'show'
					});
					$("#updateId").window('close');
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
		$('#updateById').submit();   
	}
	
	function edit(){
		$('#updateById').form({    
		    url:"manger/toUpdate",    
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
						title:"消息",
						msg:"保存成功",
						timeout:3000,
						showType:'show'
					});
					$("#updateId").window('close');
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
		$('#updateById').submit();  
	}
	
</script>
  
  <form id="updateById" method="post">   
    <div>   
        <input class="easyui-validatebox" type="hidden" name="pid" data-options="required:true" value="${list[0].pid}"/>   
    </div><br/>
    
    <div>   
        <input class="easyui-validatebox" type="hidden"  data-options="required:true" onblur="chakan()" value="${list[0].pzh}" />
    </div><br/>
    
    <div>   
        <label >&nbsp;&nbsp;审核意见:</label>   
        <input class="easyui-textbox" data-options="multiline:true" name="pyi" style="width:200px;height:120px" value="${list[0].pyi}"/>   
    </div><br/>
    &nbsp;&nbsp;  
    <a id="addbtn"  class="easyui-linkbutton" data-options="iconCls:'icon-save'"  onclick="edit()">同意</a>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a id="closebtn"  class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="closeAdd1()">不同意</a>
</form>
  
  
  
