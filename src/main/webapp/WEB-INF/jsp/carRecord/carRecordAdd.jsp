<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script>
	function closeAdd(){
		$("#addId").window('close');  
	}
	function save(){
		$('#formId').form({    
		    url:"carRecord/save",    
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
		$('#dd').datebox({    
    		required:true   
		}); 
		 
		$('#dt').datetimebox({    
		    required: true,    
		    showSeconds: false   
		}); 
		
		$('#dts').datetimebox({    
		    required: true,    
		    showSeconds: false   
		}); 
</script>

<form id="formId" method="post">   
    <div>   
        <label >编&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:</label>   
        <input class ="easyui-validatebox" type="text" name="cid" data-options="required:true" />   
    </div>   
    <div>   
        <label >日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期:</label>   
        <input id="dd" class ="easyui-datebox" type="text" name="cdate" data-options="required:true" />   
    </div> 
    <div>   
        <label >用车人员:</label>   
        <input class ="easyui-validatebox" type="text" name="ctransportPeople" data-options="required:true" />   
    </div> 
    <div>   
        <label >电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话:</label>   
        <input class ="easyui-validatebox" type="text" name="cphone" data-options="required:true" />   
    </div> 
    <div>   
        <label >出车时间:</label>   
        <input id="dt" class ="easyui-datetimebox" type="text" name="coutOfTime" data-options="required:true" />   
    </div> 
    <div>   
        <label >事&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;由:</label>   
        <input class ="easyui-validatebox" type="text" name="ccause" data-options="required:true" />   
    </div>
    <div>   
        <label >地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点:</label>   
        <input class ="easyui-validatebox" type="text" name="csite" data-options="required:true" />   
    </div>
    <div>   
        <label >收车时间:</label>   
        <input id="dts" class ="easyui-datetimebox" type="text" name="crunningTime" data-options="required:true" />   
    </div>
    <div>   
        <label >使用单位:</label>   
        <input class ="easyui-validatebox" type="text" name="cbuildingUser" data-options="required:true" />   
    </div>
    <div>   
        <label >确认签字:</label>   
        <input class ="easyui-validatebox" type="text" name="csignature" data-options="required:true" />   
    </div>
    <a id="addbtn"  class ="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="save()">保存</a>
    <a id="closebtn"  class ="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="closeAdd()">关闭</a>
</form>  