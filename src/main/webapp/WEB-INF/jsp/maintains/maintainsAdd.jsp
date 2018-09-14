<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	
	function closeAdd(){
		$("#addId").window('close');  
	}
	
	function save(){
	
		var v = document.getElementById("toadd").getElementsByTagName("input");
	    var sum = 0;
	    for (var i=0;i<v.length ;i++ )
	    {
	        sum += (!v[i].value ? 0 : parseFloat(v[i].value));
	    }
	    document.getElementById("result").value = sum;
		
		$('#formId').form({    
		    url:"maintains/save",    
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
	
</script>

<form id="formId" method="post">   
    <div>   
        <label >维修编号:</label>  
        <select  name="breakdownnumber"  style="width:153px;" >
        	<option>==维修的订单==</option>
	        <c:forEach items="${list}" var="obj">
	       		 <option value="${obj.breakdownnumber}">${obj.breakdownnumber}</option>
	        </c:forEach>
		</select> 
    </div><br/>
    
    <div>   
        <label >维修时间:</label>   
        <input class="easyui-datetimebox" type="text" name="maintenancetime" data-options="required:true,showSeconds:true" />   
    </div><br/>
      
      <div>   
        <label >结束时间:</label>   
        <input class="easyui-datetimebox" type="text" name="completiontime" data-options="required:true,showSeconds:true" />   
    </div><br/>
    <div id="toadd">
	    <div>   
	        <label >耗材费用:</label>   
	        <input class="easyui-validatebox" type="text"  name="materialcost" data-options="required:true"/>(元)   
	    </div><br/>
	      
	    <div>   
	        <label >人工费用:</label>   
	        <input class="easyui-validatebox" type="text" name="staffcosts"  data-options="required:true"/> (元)  
	    </div><br/>
	     <div>   
	        <label >其他费用:</label>   
	        <input class="easyui-validatebox" type="text" name="othercosts"  data-options="required:true"/> (元)  
	    </div><br/>
	</div>
	<div>   
	    <input class="easyui-validatebox" type="hidden" id="result" name="sum"  data-options="required:true" />   
	 </div>
	<div>   
	        <label >负者人:</label>   
	        <input class="easyui-validatebox" type="text" name="mrepairman"  data-options="required:true"/>  
	    </div><br/>
 	 <div>   
        <label >备&nbsp;&nbsp;&nbsp;&nbsp;注:</label>   
        <input class="easyui-textbox" data-options="multiline:true" name="remark" style="width:153px;height:80px">   
    </div>
    
    &nbsp;<a id="addbtn"  class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="save()">保存</a>
    &nbsp;&nbsp;&nbsp;
    <a id="closebtn"  class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="closeAdd()">关闭</a>
</form>