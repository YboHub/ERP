<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	function closeAdd(){
		$("#addId").window('close');  
	}
	
	function save(){
		$('#formId').form({    
		    url:"emp/save",    
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
	
	function chakan(){
	  			var empno = $("#empno").val();
	  			$.post("emp/chakan",{empno:empno},function(data){
	  			var dd = data.msg;
	  			if(dd.length>0){
	  				$("#num").html(data.msg);
	  				$("#empno").val("");
	  			}	
	  			$("#num").html(data.msg);
	  			});
	  		}
	 //点击部门出现相对应的职业  
	function onDeptno(){
	  		var deptno = $("#selectDept").val();
	  		$.post("emp/onDeptno",{deptno:deptno},function(data){
	  		var postno= data.list;
	  			
	  		var postnoo = "<option value=''>-请选择职位-</option>";
					for(var i=0;i<postno.length;i++){
						postnoo+="<option value="+postno[i].id+">"+postno[i].post+"</option>";
					}
					$("#postno").html(postnoo);	
	  		});
	  	}	
	 
</script>




<form id="formId" method="post">   
    <div>   
        <label >工&nbsp;&nbsp;&nbsp;&nbsp;号:</label>   
        <input class="easyui-validatebox" type="text" name="empno" id="empno" placeholder="请输入工号" data-options="required:true" onblur="chakan()" />
    </div><span id="num" style="color: red;"></span><br/>   
    <div>   
        <label >姓&nbsp;&nbsp;&nbsp;&nbsp;名:</label>   
        <input class="easyui-validatebox" type="text" name="ename" data-options="required:true" placeholder="请输入姓名"/>   
    </div><br/>
    
    <div>   
        <label >性&nbsp;&nbsp;&nbsp;&nbsp;别:</label>  
        <select  name="sex" style="width:153px;" >
        	<option>男</option>
	        <option>女</option>
		</select> 
    </div><br/>
    
    <div>   
        <label >出生日期:</label>   
        <input class="easyui-validatebox" type="date" name="birthday" data-options="required:true" style="width:153px;"/>   
    </div><br/>
     <div>   
        <label >手机号码:</label>   
        <input class="easyui-validatebox" type="text" name="tell" data-options="required:true,validType:'areacode'" placeholder="请输-         +6手机号" />  
    </div><br/>
    
    <div>
		<label >客户区域:</label>
		<div class="col-lg-2 control-label">
			<select id="s_province1" name="address" style="width:70px;"></select>
			<select id="s_city1" name="address" style="width:80px;"></select>
			<select id="s_county1" name="address" style="width:110px;"></select>
		</div>
		<script>
				InitArea1("", "", "");
		</script>
	</div>
	<div class="form-group">
		<div class="col-lg-5">
			<input type="text" class="form-control" name="address" placeholder="详细地址"  style="width:272px;"/>
		</div>
	</div>
    
   <div>   
        <label >入职时间:</label>   
        <input class="easyui-validatebox" type="date" name="hiredate" data-options="required:true" style="width:153px;"/>   
    </div><br/>
    <div>   
        <label >所在部门:</label>  
        <select  name="deptno" onclick="onDeptno()" id="selectDept" style="width:153px;" >
        	<option>==请选择部门==</option>
	        <c:forEach items="${list}" var="obj">
	       		 <option value="${obj.deptno}">${obj.deptname}</option>
	        </c:forEach>
		</select> 
    </div><br/>
    
     <div>
     	<label >职&nbsp;&nbsp;&nbsp;&nbsp;位:</label>
    	<select name="postno" id="postno" style="width:153px;">
		</select>
	</div><br>
    <div>   
        <label >备&nbsp;&nbsp;&nbsp;&nbsp;注:</label>   
        <input class="easyui-textbox" data-options="multiline:true" name="remark" style="width:153px;height:80px">   
    </div><br/>
    
    <a id="addbtn"  class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="save()">保存</a>
    
    <a id="closebtn"  class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="closeAdd()">关闭</a>
</form>  