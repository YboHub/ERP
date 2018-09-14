 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style  type="text/css">
#box_relative {
  position: absolute;
  left: 130px;
  top: 180px;
}
#tableAdd{
	position: absolute;
	top:50px;
	left:50px;
}
</style>

	<form id="editForm" method="post">
	<input name="id" type="hidden" value="${offList[0].id}"/>
	<table 	align="center" id="tableAdd">
	<tr>	
		<td><label for="goodsname">货物名称:</label> </td>
		<td><input class="easyui-validatebox"
				type="text" name="goodsname" value="${offList[0].goodsname}" data-options="required:true" /></td>
	</tr>
		<tr>
		<td><label for="goodstype">货物型号:</label></td> 
		<td><input class="easyui-validatebox"
				type="text" name="goodstype" value="${offList[0].goodstype}" data-options="required:true" /></td>
		</tr>
		<tr>
			<td><label for="company">供货商:</label> </td>
			<td><input class="easyui-validatebox"
				type="text" name="company" value="${offList[0].company}" data-options="required:true" /></td>
		</tr>
		<tr>
			<td><label for="price">单价:</label> </td>
			<td><input class="easyui-validatebox" type="text" name="price" value="${offList[0].price}" data-options="required:true"/></td>
		</tr>
		<tr>
			<td><label for="plantime">时间:</label></td>
			<td> <input class="easyui-datetimebox"
				type="text" name="plantime" value="${offList[0].plantime}" data-options="required:true" /></td>
		</tr>
		<tr>
			<td><label for="day">有效期:</label> </td>
			<td><input class="easyui-validatebox"
				type="text" name="day" value="${offList[0].day}" data-options="required:true" /></td>
	</tr>
	<tr id="box_relative">
		<td><a id="updatebtn" class="easyui-linkbutton"
			data-options="iconCls:'icon-save'" onclick="saveEdit()">保存</a></td> 
		<td><a id="closebtn" class="easyui-linkbutton"
			data-options="iconCls:'icon-clear'" onclick="closeEdit()">关闭</a></td>
	</tr>	
	</table>		
	</form>


