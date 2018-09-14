<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script>
	function closeAdd(){
		$("#addId").window('close');  
	}
	function save(){
		$('#formId').form({    
		    url:"mechanicalHelp/save",    
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
        <input class ="easyui-validatebox" type="text" name="mid" data-options="required:true" />   
    </div>   
    <div>   
        <label >车牌号码:</label>   
        <input class ="easyui-validatebox" type="text" name="mlicensenumber" data-options="required:true" />   
    </div> 
    <div>   
        <label >类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型:</label>   
        <input class ="easyui-validatebox" type="text" name="mtype" data-options="required:true" />   
    </div> 
    <div>   
        <label >开始时间:</label>   
        <input id="dt" class ="easyui-datetimebox" type="text" name="mbeginTime" data-options="required:true" />   
    </div> 
    <div>   
        <label >结束时间:</label>   
        <input id="dts" class ="easyui-datetimebox" type="text" name="mendTime" data-options="required:true" />   
    </div> 
    <div>   
        <label >送修司机:</label>   
        <input class ="easyui-validatebox" type="text" name="mmotorman" data-options="required:true" />   
    </div>
    <div>   
        <label >维修人员:</label>   
        <input class ="easyui-validatebox" type="text" name="maccendant" data-options="required:true" />   
    </div>
    <div>   
        <label >故障原因:</label>   
        <input class ="easyui-validatebox" type="text" name="mcause" data-options="required:true" />   
    </div>
    <div>   
        <label >金&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;额:</label>   
        <input class ="easyui-validatebox" type="text" name="msum" data-options="required:true" />   
    </div>
    <div>   
        <label >检验人员:</label>   
        <input class ="easyui-validatebox" type="text" name="midentifier" data-options="required:true" />   
    </div>
    <a id="addbtn"  class ="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="save()">保存</a>
    <a id="closebtn" class ="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="closeAdd()">关闭</a>
</form>  