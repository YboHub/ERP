<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script>
	function closeAdd(){
		$("#addId").window('close');  
	}
	
	function save(){
	
		$('#formId').form({    
		    url:"dept/save",    
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
	
	function chakan(){
	  			var deptno = $("#deptno").val();
	  			$.post("dept/chakan",{deptno:deptno},function(data){
	  			var dd = data.msg;
	  			if(dd.length>0){
	  				$("#num").html(data.msg);
	  				$("#deptno").val("");
	  			}	
	  			$("#num").html(data.msg);
	  			});
	  		}
	  		
	 
</script>




<form id="formId" method="post">   
    <div>   
        <label >部门编号:</label>   
        <input class="easyui-validatebox" type="text" name="deptno" id="deptno" data-options="required:true" onblur="chakan()"/>
    </div><span id="num" style="color: red;"></span><br/>   
    <div>   
        <label >部门名称:</label>   
        <input class="easyui-validatebox" type="text" name="deptname" data-options="required:true" />   
    </div><br/>
    <div>   
        <label >部门电话:</label>   
        <input class="easyui-validatebox" type="text" name="tel" data-options="required:true,validType:'areacode'" />   
    </div><br/>
     <div>   
        <label >部门地址:</label>   
        <input class="easyui-validatebox" type="text" name="site" data-options="required:true" />   
    </div><br/>
     <div>   
        <label >备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</label>   
        <input class="easyui-textbox" data-options="multiline:true" name="remark" style="width:174px;height:80px">   
    </div><br/>
   
       
    <a id="addbtn"  class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="save()">保存</a>
    
    <a id="closebtn"  class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="closeAdd()">关闭</a>
</form>  