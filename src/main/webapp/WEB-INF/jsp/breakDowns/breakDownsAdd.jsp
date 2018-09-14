<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	function closeAdd(){
		$("#addId").window('close');  
	}
	function save(){
		$('#formId').form({    
		    url:"breakDowns/save",    
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
		/* 日期插件 */
		$('#dt').datetimebox({    
		    required: true,    
		    showSeconds: false   
		});  
		
		/*查询故障单号是否存在 */
		function chakan(){
	  		var breakdownnumber = $("#breakdownnumber").val();
	  		$.post("breakDowns/chakan",{breakdownnumber:breakdownnumber},function(data){
	  		var dd = data.msg;
	  		if(dd.length>0){
	  			$("#num").html(data.msg);
	  			$("#breakdownnumber").val("");
	  		}	
	  			$("#num").html(data.msg);
	  		});
	  	} 
</script>
<form id="formId" method="post">   
    <div>   
        <label >编&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:</label>   
        <input class ="easyui-validatebox" type="text" name="bid"  data-options="required:true" />   
    </div><br/>   
    <div>   
        <label >故障单号:</label>   
        <input class="easyui-validatebox" type="text" name="breakdownnumber" value="${danhao}" readonly="readonly" data-options="required:true"/>   
    </div><br/>
 	<div>   
        <label >设备单号:</label>  
        <select  name="equipmentnumber"  style="width:173px;" >
        	<option>==请选择维修的机器==</option>
	        <c:forEach items="${list}" var="obj">
	       		 <option value="${obj.equipmentnumber}">${obj.equipmentnumber}</option>
	        </c:forEach>
		</select> 
    </div><br/>
    <div> 
        <label >上报时间:</label>
        <input id="dt" class ="datetimebox" type="text" name="reporttime" data-options="required:true" />   
    </div><br/> 
     <div>   
        <label >故障原因:</label>   
        <input class ="easyui-validatebox" type="text" name="failurecause" data-options="required:true" />   
    </div><br/>
	    <a id="addbtn"  class ="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="save()">保存</a>
	    <a id="closebtn"  class ="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="closeAdd()">关闭</a>
</form>  