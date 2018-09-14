<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<style  type="text/css">
#box_relative {
  position: absolute;
  left: 150px;
  top: 190px;
}
#tableAdd{
	position: absolute;
	top:50px;
	left:50px;
}
</style>
<form id="addForm" method="post" >
	<table align="center" id="tableAdd">
	<tr>
		<td><label for="goodsname">货物名称:</label> </td>
		<td><input class="easyui-validatebox" type="text" name="goodsname" data-options="required:true" type="text" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
	</tr>
	<tr>
		<td><label for="goodstype">材料型号:</label>  </td>
		<td><input class="easyui-validatebox" type="text" name="goodstype" data-options="required:true" /></td>
	</tr>
	<tr>
		<td><label for="company">供货商:</label> </td>
		<td><input class="easyui-validatebox" name="company" data-options="required:true" type="text" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
	</tr>
	<tr>
		<td><label for="price">单价:</label> </td>
		<td><input class="easyui-validatebox" type="text" name="price" data-options="required:true" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')"/>￥/T</td>
	</tr>
	<tr>
		<td><label for="plantime">时间:</label> </td>
		<td><input class="easyui-datetimebox" type="text" name="plantime" data-options="required:true" editable="false"/></td>
	</tr>
	<tr>
		<td><label for="day">有效期:</label> </td>
		<td><input class="easyui-validatebox" type="text" name="day" data-options="required:true" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>天</td>
	</tr>
	<tr id="box_relative">
		<td><a id="addbtn" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="saveAdd()">保存</a></td> 
		<td><a id="closebtn" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="closeAdd()">关闭</a></td>
	</tr>
</table>
</form>
