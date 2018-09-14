<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script>
	function closeAdd(){
		$("#addId").window('close');  
	}
	function save(){
		$('#formId').form({    
		    url:"scrapApply/save",    
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
		/* 创建日期插件 */
		$('#dd').datebox({    
		    required:true   
		}); 
		
		$('#dt').datebox({    
		    required:true   
		});
		
		$('#dts').datebox({    
		    required:true   
		});
		
		//查询机器编号是否存在
		function chakan(){
	  			var equipmentnumber = $("#equipmentnumber").val();
	  			$.post("scrapApply/chakan",{equipmentnumber:equipmentnumber},function(data){
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
        <label >编&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:</label>   
        <input class ="easyui-validatebox" type="text" name="sid" data-options="required:true" />   
    </div><br/>   
    <div>   
        <label >设备单号:</label>   
        <input class="easyui-validatebox" type="text" name="equipmentnumber" value="${danhao}" readonly="readonly" data-options="required:true"/>   
    </div><br/>
    <div>   
        <label >验收日期:</label>   
        <input id="dd" class ="easyui-datebox" type="text" name="acceptanceDates" data-options="required:true" />   
    </div><br/> 
    <div>   
        <label >价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格:</label>   
        <input class ="easyui-validatebox" type="text" name="price" data-options="required:true" />   
    </div><br/>
    <div>   
        <label >购入日期:</label>   
        <input id="dt" class ="easyui-datebox" type="text" name="buyingTime" data-options="required:true" />   
    </div><br/> 
    <div>   
        <label >报废日期:</label>   
        <input id="dts" class ="easyui-datebox" type="text" name="rejectionTime" data-options="required:true" />   
    </div><br/> 
    <div>   
        <label >报废原因:</label>   
        <input class ="easyui-validatebox" type="text" name="cause" data-options="required:true" />   
    </div><br/>
    <div>   
        <label >&nbsp;&nbsp;&nbsp;申请人:</label>   
        <input class ="easyui-validatebox" type="text" name="proposer" data-options="required:true" />   
    </div><br/>
    <div>   
        <label >&nbsp;&nbsp;&nbsp;鉴定人:</label>   
        <input class ="easyui-validatebox" type="text" name="appraiser" data-options="required:true" />   
    </div><br/>
    <div>   
        <label >备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</label>   
        <input class ="easyui-validatebox" type="text" name="remark" data-options="required:true" />   
    </div><br/>
    <div>   
        <label >审&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;核:</label>   
        <input class ="easyui-validatebox" type="text" name="audit" data-options="required:true" />   
    </div><br/> 
    <a id="addbtn"  class ="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="save()">保存</a>
    <a id="closebtn"  class ="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="closeAdd()">关闭</a>
</form>  