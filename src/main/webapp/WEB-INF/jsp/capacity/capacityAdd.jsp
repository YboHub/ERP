<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<style  type="text/css">
#box_relative {
  position: absolute;
  left: 130px;
  top: 190px;
}
#tableAdd{
	position: absolute;
	top:50px;
	left:50px;
}
</style>
<form id="addForm" method="post" >
<table id="tableAdd">
	<tr>    
		<td><label for="ename">编号:</label> </td>
		<td><input class="easyui-validatebox" type="text" name="cid" data-options="required:true" /></td>
	</tr>
	<tr>
		<td><label for="sal">产品编号:</label> </td>
		<td><input class="easyui-validatebox" type="text" name="cnumber" data-options="required:true" /></td>
	</tr>
	<tr>
		<td><label for="sal">最小产量:</label> </td>
		<td><input class="easyui-validatebox" type="text" name="cmin" data-options="required:true" /></td>
	</tr>
	<tr>
		<td><label for="sal">最大产量:</label> </td>
		<td><input class="easyui-validatebox" type="text" name="cmax" data-options="required:true" /></td>
	</tr>
	<tr>
		<td><label for="sal">产品单位:</label> </td>
		<td><input class="easyui-validatebox" type="text" name="cdan" data-options="required:true" /></td>
	</tr>
	<tr>
		<td><label for="sal">产线:</label> </td>
		<td><input class="easyui-validatebox" type="text" name="cxian" data-options="required:true" /></td>
	</tr>
	
	<tr id="box_relative">
		<td><a id="addbtn" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="saveAdd()">保存</a> </td>
		<td><a id="closebtn" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="closeAdd()">关闭</a></td>
 </tr>
</table>	
</form>