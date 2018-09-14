<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

  <!-- 成品入库界面 -->
  <script>
	function closeAdd1(){
		$("#updateId").window('close');  
	}
	
	function saveEdit(){
		$('#updateById').form({    
		    url:"stock/saveProInc", 
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
						msg:"入库成功",
						timeout:3000,
						showType:'show',
						style:{
						right:'',
						top:document.body.scrollTop+document.documentElement.scrollTop,
						bottom:''
							}
					});
					$("#proIncomingId").window('close');
					$("#dg").datagrid("reload");
	       		}else{
	       			$.messager.show({
						title:"消息",
						msg:"入库失败，请联系管理员",
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
		<input name="goodstype" type="hidden" value="${editList[0].goodstype}"/>
		<div>
			<label for="rkdh">入库单号:</label> <input class="easyui-validatebox"
			readonly="readonly"	type="text" name="rkdh" value="${editList[0].rkdh}" data-options="required:true,validType:'vername'" />
		</div>
		<div>
			<label for="pname">产品类型:</label> <input class="easyui-validatebox"
		readonly="readonly"	type="text" name="pname" value="${editList[0].pname}" data-options="required:true,validType:'vername'" />
		</div>
		<div>
			<label for="psize">产品规格:</label> <input class="easyui-validatebox" id="psize"
			readonly="readonly"	type="text" name="psize" value="${editList[0].psize}" data-options="required:true,validType:'vername'" />
		</div>
		<div>
			<label for="inventoryunit">入库数量:</label> <input class="easyui-validatebox"
		readonly="readonly"	type="text" name="inventoryunit" value="${editList[0].inventoryunit}" data-options="required:true,validType:'vername'" />
		</div>
		<div>
			<label for="verifyman">审核人:</label> <input class="easyui-validatebox"
		readonly="readonly"	type="text" name="verifyman" value="${verifyman}" data-options="required:true,validType:'vername'" />
		</div>
		<div>
			<label for="addtime">入库时间:</label> <input class="easyui-validatebox"
			type="date" name="addtime" value="${editList[0].addtime}" data-options="required:true,validType:'vername'" />
		</div>
		<input type="hidden" name="auditstatus"/>
		<a id="updatebtn" class="easyui-linkbutton"data-options="iconCls:'icon-save'" onclick="saveEdit()">入库</a> 
		<a id="closebtn" class="easyui-linkbutton"data-options="iconCls:'icon-clear'" onclick="closeEdit()">关闭</a>
</form> 
