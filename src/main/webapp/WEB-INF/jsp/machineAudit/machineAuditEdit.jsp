<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <script>
	function closeAdd(){
		$('#updateById').form({    
		    url:"machineAudit/tooUpdate",    
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
						msg:"修改成功",
						timeout:3000,
						showType:'show'
					});
					$("#editId").window('close');
					$("#dg").datagrid("reload");
	       		}else{
	       			$.messager.show({
						title:"消息",
						msg:"修改失败，请联系管理员",
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
		    url:"machineAudit/toUpdate",    
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
						msg:"修改成功",
						timeout:3000,
						showType:'show'
					});
					$("#editId").window('close');
					$("#dg").datagrid("reload");
	       		}else{
	       			$.messager.show({
						title:"消息",
						msg:"修改失败，请联系管理员",
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
        <input class="easyui-validatebox" type="hidden" name="id" data-options="required:true" value="${list[0].id}"/>   
    </div>
     <div>   
        <input class="easyui-validatebox" type="hidden"  name="DisDate" data-options="required:true" value="${stime}"/>   
    </div>
    <div>   
        <input class="easyui-validatebox"   name="DisNum" data-options="required:true" value="${list[0].equipmentnumber}"/>   
    </div>
    <div>   
        <input class="easyui-validatebox"   name="DisMoney" data-options="required:true" value="${list[0].dprice}"/>   
    </div>
    <div>   
        <input class="easyui-validatebox"   data-options="required:true" type="hidden" name="principal" value="${ename}" />
    </div>
    
    <div>   
        <label >&nbsp;&nbsp;审核意见:</label>   
        <input class="easyui-textbox" data-options="multiline:true" name="remark" style="width:200px;height:120px" value="${list[0].remark}"/>   
    </div><br/>
    &nbsp;&nbsp;  
    <a id="addbtn"  class="easyui-linkbutton" data-options="iconCls:'icon-save'"  onclick="edit()">同意</a>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a id="closebtn"  class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="closeAdd()">不同意</a>
</form>
  
  
  
