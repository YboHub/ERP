<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script>
	function closeAdd(){
		$("#addId").window('close');  
	}
	function save(){
		$('#formId').form({    
		    url:"vehicle/save",    
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
					$("#addId").window('close');
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
        <label >编&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:</label>   
        <input class ="easyui-validatebox" type="text" name="vid" data-options="required:true" />   
    </div><br/>   
    <div>   
        <label >类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型:</label>   
        <input class ="easyui-validatebox" type="text" name="vtype" data-options="required:true" />   
    </div><br/> 
    <div>   
        <label >车牌号码:</label>   
        <input class ="easyui-validatebox" type="text" name="vlicensenumber" data-options="required:true" />   
    </div><br/> 
    <div>   
        <label >司&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机:</label>   
        <input class ="easyui-validatebox" type="text" name="vmotorman" data-options="required:true" />   
    </div><br/> 
    <a id="addbtn"  class ="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="save()">保存</a>
    <a id="closebtn"  class ="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="closeAdd()">关闭</a>
</form>  