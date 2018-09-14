<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

  
  <script>
	function closeAdd1(){
		$("#updateId").window('close');  
	}
	
	function saveEdit(){
		$('#updateById').form({    
		    url:"food/saveUpdate", 
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
						showType:'show',
						style:{
						right:'',
						top:document.body.scrollTop+document.documentElement.scrollTop,
						bottom:''
							}
					});
					$("#updateId").window('close');
					$("#dg").datagrid("reload");
	       		}else{
	       			$.messager.show({
						title:"消息",
						msg:"修改失败，请联系管理员",
						style:{
						right:'',
						top:document.body.scrollTop+document.documentElement.scrollTop,
						bottom:''
							},
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
		<input name="id" type="hidden" value="${editList[0].id}"/>
		<div>
			<label for="warehousenum">仓库编号:</label> <input class="easyui-validatebox"
				type="text" name="warehousenum" value="${editList[0].warehousenum}" data-options="required:true,validType:'areacode'" />
		</div>
		<div>
			<label for="warehousename">仓库名称:</label> <input class="easyui-validatebox"
				type="text" name="warehousename" value="${editList[0].warehousename}" data-options="required:true,validType:'vername'" />
		</div>
		<div>   
        <label >仓库类型:</label>  
        <select  name="warehousetype"  style="width:153px;">
	       		 <option value="1">原料库</option>
	       		 <option value="2">成品库</option>
	       		 <option value="3">废品库</option>
		</select> 
    	</div><br/>
		<div>
			<label for="warehousekeeper">仓库管理员:</label> <input class="easyui-validatebox"
				type="text" name="warehousekeeper" value="${editList[0].warehousekeeper}" data-options="required:true,validType:'vername'" />
		</div>
		<a id="updatebtn" class="easyui-linkbutton"
			data-options="iconCls:'icon-save'" onclick="saveEdit()">保存</a> <a
			id="closebtn" class="easyui-linkbutton"
			data-options="iconCls:'icon-clear'" onclick="closeEdit()">关闭</a>
</form> 

  
  
