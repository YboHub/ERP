<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	function save(){
		$('#updateById').form({    
		    url:"ischeck/toUpdate",    
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
						msg:"质检成功",
						style:{
						right:'',
						top:document.body.scrollTop+document.documentElement.scrollTop,
						bottom:''
							},
						timeout:3000,
						showType:'show'
					});
					$("#cc").window('close');
					$("#dg").datagrid("reload");
	       		}else{
	       			$.messager.show({
						title:"消息",
						msg:"质检失败，请联系管理员",
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
	/* function audit(){
		$("#cc").window('close');
	} */
	function closeAdd(){
		$('#updateById').form({    
		    url:"ischeck/tooUpdate",    
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
						msg:"质检成功",
						style:{
						right:'',
						top:document.body.scrollTop+document.documentElement.scrollTop,
						bottom:''
							},
						timeout:3000,
						showType:'show'
					});
					$("#cc").window('close');
					$("#dg").datagrid("reload");
	       		}else{
	       			$.messager.show({
						title:"消息",
						msg:"质检失败，请联系管理员",
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
	<div>
		 <input type="hidden" name="id" value="${list[0].id}"/>
		 <input type="hidden" name="orderid" value="${list[0].orderid}"/>
		 <input type="hidden" name="types" value="${list[0].types}"/>
		 <input type="hidden" name="weights" value="${list[0].weights}"/>
		 <input type="hidden" name="goodsname" value="${list[0].goodsname}"/>
	</div>
	<div>   
        <label >&nbsp;&nbsp;原因:</label>
        &nbsp;&nbsp;&nbsp;&nbsp;
         <textarea class="easyui-validatebox"  data-options="required:true" rows="20" cols="20" style="width:300px;height:180px;left:70px;top:20px" name="reason"></textarea>
    </div><br/>
	 <a id="addbtn"  class="easyui-linkbutton" data-options="iconCls:'icon-save'" style="position:relative;left:260px;top:10px;" onclick="save()">合格</a>
    
    <a id="closebtn"  class="easyui-linkbutton" data-options="iconCls:'icon-clear'" style="position:relative;left:260px;top:10px;" onclick="closeAdd()">不合格</a>
</form>
