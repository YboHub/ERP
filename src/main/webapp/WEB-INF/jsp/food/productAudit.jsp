<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

  <!-- 成品审核界面 -->
  <script>
	function closeAdd1(){
		$("#updateId").window('close');  
	}
	
	function saveEdit(){
		$('#updateById').form({    
		    url:"inProAut/passVerification", 
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
					$("#ProductAuditId").window('close');
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
	function reject(){
		var id = $("#idd").val();
		$('#updateById').form({    
		    url:'inProAut/failedPass?id='+id, 
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
		<input name="id" id="idd" type="hidden" value="${editList[0].id}"/>
		<input name="goodstype" value="${editList[0].goodstype}" type="hidden"/>
		<input name="psize" value="${editList[0].psize}" type="hidden"/>
		<input name="pname" value="${editList[0].pname}" type="hidden"/>
		<input name="inventoryunit" value="${editList[0].inventoryunit}" type="hidden"/>
		<input name="audittime" value="${editList[0].audittime}" type="hidden"/>
		<input name="auditstatus" value="${editList[0].auditstatus}" type="hidden"/>
		<input name="verifyman" value="${ename}" type="hidden"/>
		<div>
        <label >备&nbsp;&nbsp;&nbsp;&nbsp;注:</label>   
        <input class="easyui-textbox" data-options="multiline:true" name="remark" style="width:153px;height:80px">   
    </div><br/>
		<input type="hidden" name="auditstatus"/>
		<a id="updatebtn" class="easyui-linkbutton"data-options="iconCls:'icon-save'" onclick="saveEdit()">通过审核</a>
		<a id="updatebtn" class="easyui-linkbutton"data-options="iconCls:'icon-save'" onclick="reject()">驳回</a> 
		<a id="closebtn" class="easyui-linkbutton"data-options="iconCls:'icon-clear'" onclick="closeEdit()">关闭</a>
</form> 
