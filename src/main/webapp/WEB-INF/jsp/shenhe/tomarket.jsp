<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	function save(){
		$('#updateById').form({    
		    url:"market/toUpdate",    
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
						msg:"审核通过",
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
						msg:"审核失败，请联系管理员",
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
		    url:"market/tooUpdate",    
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
						msg:"审核失败，请联系管理员",
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
		 <input type="hidden" name="rorderno" value="${list[0].rorderno}"/>
		 <input type="hidden" name="rpno" value="${list[0].rpno}"/>
		 <input type="hidden" name="rpname" value="${list[0].rpname}"/>
		 <input type="hidden" name="rprice" value="${list[0].rprice}"/>
		 <input type="hidden" name="rpnum" value="${list[0].rpnum}"/>
		 <input type="hidden" name="rsubtotal" value="${list[0].rsubtotal}"/>
		 <input type="hidden" name="rtype" value="${list[0].rtype}"/>
		 <input type="hidden" name="rordertime" value="${list[0].rordertime}"/>
		 <input type="hidden" name="returnreason" value="${list[0].returnreason}"/>
		 <input type="hidden" name="rstate" value="${list[0].rstate}"/>
	</div>
	<div>   
        <label >&nbsp;&nbsp;审核意见:</label>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <textarea class="easyui-validatebox"  data-options="required:true" rows="20" cols="20" style="width:300px;height:180px;left:70px;top:20px" name="reason"></textarea>
        <!-- <input class="easyui-textbox" data-options="multiline:true" name="reason" style="width:300px;height:180px;left:70px;top:20px"/>    -->
    </div><br/>
	 <a id="addbtn"  class="easyui-linkbutton" data-options="iconCls:'icon-save'" style="position:relative;left:260px;top:10px;" onclick="save()">同意</a>
    
    <a id="closebtn"  class="easyui-linkbutton" data-options="iconCls:'icon-clear'" style="position:relative;left:260px;top:10px;" onclick="closeAdd()">不同意</a>
</form>
