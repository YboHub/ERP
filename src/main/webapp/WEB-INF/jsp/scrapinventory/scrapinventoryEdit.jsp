<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <script>
	function closeAdd(){
		$("#addId").window('close');  
	}
	
	function edit(){
		$('#updateById').form({    
		    url:"scrapinventory/toAdd",    
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
					$("#addId").window('close');
					$("#dg").datagrid("reload");
	       		}else{
	       			$.messager.show({
						title:"消息",
						msg:"修改失败，请联系管理员",
						timeout:2000,
						showType:'show'
					});
	       		}
		    }    
		});    
		$('#updateById').submit();  
	}
	
	
	function jianfa(){
			var y=Number($('#zhong').val());
			var x=Number($('#zhongliang').val());
			var c=Number($('#weight').val());
			if(x<=y){
				var z=y-x;
				var s=x+c;
				$('#jia').val(s);
				$('#jian').val(z);
			}else{
				alert("出库数量不能大于库存量");
				var zhongliang = document.getElementById('zhongliang');
				zhongliang.value = ''; //zhongliang的value设置为空值			
			}
		}
</script>
  
  <form id="updateById" method="post">   
     <div>   
        <input class="easyui-validatebox" type="hidden" name="zid"  data-options="required:true" value="${list[0].zid}"/>  
    </div>
     <div>   
        <input class="easyui-validatebox" type="hidden" name="id"  data-options="required:true" value="4"/>  
    </div>
    
    <div>   
        <input class="easyui-validatebox" type="hidden" id="weight" data-options="required:true" value="${listYuanLiao[0].weight}"/>   
    </div>
    
    <div>   
        <label >仓库剩余总量:</label>   
        <input class="easyui-validatebox" type="text"  id="zhong" data-options="required:true" value="${list[0].zong}"/>   
    </div><br/>
     <div>   
        <label >出库量:</label>   
        <input class="easyui-validatebox" type="text" name="zhongliang" id="zhongliang" data-options="required:true,validType:'areacode'" onblur="jianfa()"/>  
    </div><br/>
    
    <div>   
        <input class="easyui-validatebox" type="hidden" name="weight" id="jia" data-options="required:true"/>  
    </div><br/>
    <div>   
        <input class="easyui-validatebox" type="hidden" name="zong" id="jian" data-options="required:true"/>  
    </div><br/>
     <div>   
        <input class="easyui-validatebox" type="hidden" name="sname"  value="${ename}"/>  
    </div>
    <a id="addbtn"  class="easyui-linkbutton" data-options="iconCls:'icon-save'"  onclick="edit()">保存</a>
    
    <a id="closebtn"  class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="closeAdd()">关闭</a>
</form> 
  
  
  
