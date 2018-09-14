<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <script>
	function closeAdd1(){
		$("#updateId").window('close');  
	}
	
	function edit(){
		$('#updateById').form({    
		    url:"emp/toUpdate",    
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
						showType:'show'
					});
					$("#updateId").window('close');
					$("#dg").datagrid("reload");
	       		}else{
	       			$.messager.show({
						title:"消息",
						msg:"人家是最高权限,无法修改",
						timeout:2000,
						showType:'show'
					});
	       		}
		    }    
		});    
		$('#updateById').submit();  
	}
	
	 //点击部门出现相对应的职业  
	function loadInfo(){
	  		var deptno = $("#upkind").val();
	  		$.post("emp/onDeptno",{deptno:deptno},function(data){
	  		var postnoe= data.list;
	  			
	  		var postnoo = "<option value=''>-请选择职位-</option>";
					for(var i=0;i<postnoe.length;i++){
						postnoo+="<option value="+postnoe[i].id+">"+postnoe[i].post+"</option>";
					}
					$("#dokind").html(postnoo);	
	  		});
	  	} 
	  	
	  	
</script>
  
  <form id="updateById" method="post">   
    <div>   
        <input class="easyui-validatebox" type="hidden" name="id" data-options="required:true" value="${editList[0].id}"/>   
    </div><br/>
    
    <div>   
        <label >工&nbsp;&nbsp;&nbsp;&nbsp;号:</label>   
        <input class="easyui-validatebox" type="text" name="empno" id="empno" data-options="required:true" onblur="chakan()" value="${editList[0].empno}" />
    </div><span id="num" style="color: red;"></span><br/>   
    <div>   
        <label >性&nbsp;&nbsp;&nbsp;&nbsp;名:</label>   
        <input class="easyui-validatebox" type="text" name="ename" data-options="required:true" value="${editList[0].ename}"/>   
    </div><br/>
    <div>   
        <label >性&nbsp;&nbsp;&nbsp;&nbsp;别:</label>  
        <select  name="sex" style="width:153px;" >
        	<option>${editList[0].sex}</option>
        	<option>男</option>
	        <option>女</option>
		</select> 
    </div><br/>
    <div>   
        <label >出生日期:</label>   
        <input class="easyui-validatebox" type="date" name="birthday" data-options="required:true" value="${editList[0].birthday}"/>   
    </div><br/>
     <div>   
        <label >手机号码:</label>   
        <input class="easyui-validatebox" type="text" name="tell" data-options="required:true,validType:'areacode'" value="${editList[0].tell}"/>  
    </div><br/>
   <div>   
        <label >住&nbsp;&nbsp;&nbsp;&nbsp;址:</label>   
        <input class="easyui-validatebox" type="text" name="address" data-options="required:false" value="${editList[0].address}"/>   
    </div><br/>
   <div>   
        <label >入职时间:</label>   
        <input class="easyui-validatebox" type="date" name="hiredate" data-options="required:true" value="${editList[0].hiredate}"/>   
    </div><br/>
    
    <div>   
	     <label>部&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;门:</label>
	     <select id="upkind"  name="deptno" style="width:200px;" onclick="loadInfo()">  
	     	<c:forEach items="${list}" var="dept">
	     		<option value="${dept.deptno}" <c:if test="${editList[0].deptno==dept.deptno}">selected</c:if>>${dept.deptname}</option>
	     	</c:forEach> 
		 </select> 
	 </div><br/>
    
    
     <div>   
	     <label>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位:</label>
	     <select id="dokind"  name="postno" style="width:200px;"> 
	     	<c:forEach items="${positionList}" var="pos">
	     		<option value="${pos.id}" <c:if test="${editList[0].postno==pos.id}">selected</c:if>>${pos.post}</option>
	     	</c:forEach> 
		 </select>
	 </div><br>
    
    
    <div>   
        <label >备&nbsp;&nbsp;&nbsp;&nbsp;注:</label>   
        <input class="easyui-textbox" data-options="multiline:true" name="remark" style="width:153px;height:80px" value="${editList[0].remark}"/>   
    </div><br/>
       
      <div>   
        <label >在职状态:</label>  
        <select  name="state"  style="width:153px;">
	       		 <option value="0">在职</option>
	       		 <option value="1">离职</option>
		</select> 
    </div><br/>  
	
       
    <a id="addbtn"  class="easyui-linkbutton" data-options="iconCls:'icon-save'"  onclick="edit()">保存</a>
    
    <a id="closebtn"  class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="closeAdd1()">关闭</a>
</form> 
  
  
  
