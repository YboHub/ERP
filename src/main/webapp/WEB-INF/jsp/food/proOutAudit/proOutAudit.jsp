<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

  <!-- 成品审核界面 -->
  <script>
	function closeAdd1(){
		$("#updateId").window('close');  
	}
	
	function saveEdit(){
		$('#updateById').form({    
		    url:"proOutAudit/passProOut", 
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
						msg:"审核成功",
						timeout:1000,
						showType:'show',
						style:{
						right:'',
						top:document.body.scrollTop+document.documentElement.scrollTop,
						bottom:''
							}
					});
					$("#proOutId").window('close');
					$("#dg").datagrid("reload");
	       		}else{
	       			$.messager.show({
						title:"消息",
						msg:"审核失败，请联系管理员",
						style:{
						right:'',
						top:document.body.scrollTop+document.documentElement.scrollTop,
						bottom:''
							},
						timeout:1000,
						showType:'show'
					});
	       		}
		    }    
		});    
		$('#updateById').submit();  
	}
	function cprkbh(){
		$('#updateById').form({    
		    url:"proOutAudit/cprkbh", 
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
						msg:"驳回成功",
						timeout:3000,
						showType:'show',
						style:{
						right:'',
						top:document.body.scrollTop+document.documentElement.scrollTop,
						bottom:''
							}
					});
					$("#ProductAuditId").window('close');
					$("#dg").datagrid("reload");
	       		}else{
	       			$.messager.show({
						title:"消息",
						msg:"驳回失败，请联系管理员",
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
		 <input name="id"  value="${editList[0].id}" type="hidden"/>
		<input name="proaudittime" value="${Nowtime}" type="hidden"/>
		<div>
        <label >备&nbsp;&nbsp;&nbsp;&nbsp;注:</label>   
        <input class="easyui-textbox" data-options="multiline:true" name="auditremark" style="width:153px;height:80px">   
    </div><br/>
		<input type="hidden" name="auditstatus"/>
		<a id="updatebtn" class="easyui-linkbutton"data-options="iconCls:'icon-save'" onclick="saveEdit()">通过审核</a>
		<a id="updatebtn" class="easyui-linkbutton"data-options="iconCls:'icon-save'" onclick="cprkbh()">驳回</a> 
		<a id="closebtn" class="easyui-linkbutton"data-options="iconCls:'icon-clear'" onclick="closeEdit()">关闭</a>
</form> 
