<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script>
	function closeAdd(){
		$("#addId").window('close');  
	}
	
	function save(){
	
		$('#formId').form({    
		    url:"equipment/save",    
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
	
	//查询机器编号是否存在
	function chakan(){
	  			var equipmentnumber = $("#equipmentnumber").val();
	  			$.post("equipment/chakan",{equipmentnumber:equipmentnumber},function(data){
	  			var dd = data.msg;
	  			if(dd.length>0){
	  				$("#num").html(data.msg);
	  				$("#equipmentnumber").val("");
	  			}	
	  			$("#num").html(data.msg);
	  			});
	  		}
	
</script>




<form id="formId" method="post">   
    <div>   
        <label >机械名称:</label>   
        <input class="easyui-validatebox" type="text" name="equipment"  data-options="required:true"/>
    </div><br/> 
    
    <div>   
        <label >机械类型:</label>   
        <input class="easyui-validatebox" type="text" name="dproduct" data-options="required:true" />   
    </div><br/>
      
      <div>   
        <label >机械价格:</label>   
        <input class="easyui-validatebox" type="text" name="dprice" data-options="required:true" />   
    </div><br/>
      
      <div>   
        <label >机械品牌:</label>   
        <input class="easyui-validatebox" type="text" name="dbrand" data-options="required:true" />   
    </div><br/>
      
    <div>   
        <label >机械编号:</label>   
        <input class="easyui-validatebox" type="text" name="equipmentnumber" value="${danhao}" readonly="readonly" data-options="required:true"/>   
    </div><br/>
    <div>   
        <label >负&nbsp;&nbsp;者&nbsp;人:</label>   
        <input class="easyui-validatebox" type="text" name="dname" data-options="required:true,validType:'areacode'" />   
    </div><br/>
   
       
    &nbsp;<a id="addbtn"  class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="save()">保存</a>
    &nbsp;&nbsp;&nbsp;
    <a id="closebtn"  class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="closeAdd()">关闭</a>
</form>  