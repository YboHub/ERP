<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

  <script>
	function closeAdd1(){
		$("#updateId").window('close');  
	}
	
	function edit(){
		$('#updateById').form({    
		    url:"dept/updates",    
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
					$("#updateId").window('close');
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
    </div><br/>
    <div>   
        <label >部门编号:</label>   
        <input disabled="disabled" class="easyui-validatebox" type="text" name="deptno" data-options="required:false" value="${list[0].deptno}"/>   
    </div><br/>
    <div>   
        <label >部门名称:</label>   
        <input class="easyui-validatebox" type="text" name="deptname" data-options="required:false" value="${list[0].deptname}"/>   
    </div><br/>     
    <div>   
        <label >部门电话:</label>   
        <input class="easyui-validatebox" type="text" name="tel" data-options="required:false,validType:'areacode'" value="${list[0].tel}"/>   
    </div><br/>  
    <div>   
        <label >部门地址:</label>   
        <input class="easyui-validatebox" type="text" name="site" data-options="required:false" value="${list[0].site}"/>   
    </div><br/>
    <div>   
        <label >备&nbsp;&nbsp;&nbsp;&nbsp;注:</label>   
        <input class="easyui-textbox" data-options="multiline:true" name="remark" value="${list[0].remark}" style="width:153px;height:80px">   
    </div><br/>
       
       
	
       
    <a id="addbtn"  class="easyui-linkbutton" data-options="iconCls:'icon-save'"  onclick="edit()">保存</a>
    
    <a id="closebtn"  class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="closeAdd1()">关闭</a>
</form> 
  
  
  
