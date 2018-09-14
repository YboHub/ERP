<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style  type="text/css">
#box_relative {
  position: absolute;
  left: 130px;
  top: 150px;
}
#tableAdd{
	position: absolute;
	top:50px;
	left:50px;
}
</style>

 
    <form id="editForm" method="post">
		<input name="cid" type="hidden" value="${editList[0].cid}"/>
<table id="tableAdd">		
	<tr>
		<td><label for="sal">产品编号:</label> </td>
		<td><input class="easyui-validatebox" type="text" name="cnumber" value="${editList[0].cnumber}" data-options="required:true" /></td>
	</tr>
	<tr>
		<td><label for="sal">最小产量:</label> </td>
		<td><input class="easyui-validatebox" type="text" name="cmin" value="${editList[0].cmin}" data-options="required:true" /></td>
	</tr>
	<tr>
		<td><label for="sal">最大产量:</label> </td>
		<td><input class="easyui-validatebox" type="text" name="cmax" value="${editList[0].cmax}" data-options="required:true" /></td>
	</tr>
	<tr>
		<td><label for="sal">产品单位:</label> </td>
		<td><input class="easyui-validatebox" type="text" name="cdan" value="${editList[0].cdan}" data-options="required:true" /></td>
	</tr>
	<tr>
		<td><label for="sal">产线:</label> </td>
		<td><input class="easyui-validatebox" type="text" name="cxian" value="${editList[0].cxian}" data-options="required:true" /></td>
	</tr>
	<tr id="box_relative">
		<td><a id="updatebtn" class="easyui-linkbutton"
			data-options="iconCls:'icon-save'" onclick="saveEdit()">保存</a></td> 
		<td><a id="closebtn" class="easyui-linkbutton"
			data-options="iconCls:'icon-clear'" onclick="closeEdit()">关闭</a></td>
	</tr>
	</table>		
	</form>


