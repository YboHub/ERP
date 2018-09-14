<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<form id="addForm" method="post">
	<div>
		<label for="warehousenum">仓库编号:</label> 
		<input class="easyui-validatebox" type="text" name="warehousenum" data-options="required:true,validType:'areacode'" id="warehousenum" onblur="chakan()"/>
	</div><span id="num" style="color: red;"></span><br/>
	<div>
		<label for="warehousename">仓库名称:</label> 
		<input class="easyui-validatebox" type="text" name="warehousename" data-options="required:true,validType:'vername'" />
	</div>
	<div>   
        <label >仓库类型:</label>  
        <select  name="warehousetype"  style="width:153px;">
	       		 <option value="1">原料库</option>
	       		 <option value="2">成品库</option>
	       		 <option value="3">废品库</option>
		</select> 
    	</div><br/> 
	<div>
		<label for="warehousekeeper">仓库管理员:</label> 
		<input class="easyui-validatebox" type="text" name="warehousekeeper" data-options="required:true,validType:'vername'" />
	</div>
	<a id="addbtn" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="saveAdd()">保存</a> 
	<a id="closebtn" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="closeAdd()">关闭</a>
</form>
<script type="text/javascript">
</script>
