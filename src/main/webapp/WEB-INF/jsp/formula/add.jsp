<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<form id="addForm" method="post" style="margin:10px 10px 10px">
	
	<div>
		<label for="sal">型号:</label> 
		<input class="easyui-validatebox" type="text" name="ptype" data-options="required:true" />
	</div>
	<div>
		<label for="sal">产品编号:</label> 
		<input class="easyui-validatebox" type="text" name="pnumber" data-options="required:true" />
	</div>
	<div>
		<label for="sal">原料名称:</label> 
		<input class="easyui-validatebox" type="text" name="pname" data-options="required:true" />
	</div>
	
	<div>
		<label for="sal">原料规格:</label> 
		<input class="easyui-validatebox" type="text" name="pgui" data-options="required:true" />
	</div>
	<div>
		<label for="sal">原料数量:</label> 
		<input class="easyui-validatebox" type="text" name="pshu" data-options="required:true" />
	</div>
	<a id="addbtn" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="saveAdd()">保存</a> 
	<a id="closebtn" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="closeAdd()">关闭</a>
</form>