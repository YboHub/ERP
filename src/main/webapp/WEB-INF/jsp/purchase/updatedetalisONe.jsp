<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<form id="editDateDatelisForm" method="post">
	<input name="id" type="hidden" value="${offList[0].id}"/>
	<table 	align="center" id="tableAdd">
	<tr>	
		<td><label for="goodsname">货物名称:</label> </td>
		<td><input class="easyui-validatebox"
				type="text" name="goodsname" value="${offList[0].goodsname}" data-options="required:true" readonly="readonly"/></td>
	</tr>
		<tr>
		<td><label for="goodstype">货物型号:</label></td> 
		<td><input class="easyui-validatebox"
				type="text" name="goodstype" value="${offList[0].types}" data-options="required:true" readonly="readonly"/></td>
		</tr>
		<tr>
			<td><label for="company">供货商:</label> </td>
			<td><input class="easyui-validatebox"
				type="text" name="company" value="${offList[0].company}" data-options="required:true" readonly="readonly"/></td>
		</tr>
		<tr>
			<td><label for="price">单价:</label> </td>
			<td><input class="easyui-validatebox" type="text" name="price" id="price" value="${offList[0].price}" data-options="required:true" readonly="readonly"/></td>
		</tr>
		<tr>
			<td><label for="price">购买重量:</label> </td>
			<td>
	<input onkeyup="value=value.replace(/[^\d]/g,'') " name="weights" id="weights" onblur="subtract()" value="${offList[0].weights}"
	onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/> 		
		</tr>
		<tr>
			<td><label for="money">总额:</label> </td>
			<td><input class="easyui-validatebox" type="text" name="money" id="money" value="${offList[0].money}" data-options="required:true" readonly="readonly"/></td>
		</tr>
	<tr id="box_relative">
		<td><a id="updatebtn" class="easyui-linkbutton"
			data-options="iconCls:'icon-save'" onclick="saveDetalisEdit()">保存</a></td> 
		<td><a id="closebtn" class="easyui-linkbutton"
			data-options="iconCls:'icon-clear'" onclick="closeDetalisEdit()">关闭</a></td>
	</tr>	
	</table>		
	</form>
	<script type="text/javascript">
		function subtract(){
			var x=$("#price").val();
			var y=$("#weights").val();
			var z=x*y;
			$("#money").val(z);
		}	
		/* 保存窗口关闭 */
    	function closeDetalisEdit(){
    		$("#updatedetalisONe").window('close');  // close a window  
    	}
    	
    	
	</script>
