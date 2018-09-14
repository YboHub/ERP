<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<form id="addForm" method="post" style="margin:10px 10px 10px">
	
	<div>
		<label for="sal">计划编号:</label> 
		<input class="easyui-validatebox" type="text" name="pnumber" data-options="required:true" />
	</div>
	<div>
		<label for="sal">产品编号:</label> 
		<input class="easyui-validatebox" type="text" name="dnumber" data-options="required:true" />
	</div>
	<div>
		<label for="sal">计划人:</label> 
		<input class="easyui-validatebox" type="text" name="person" data-options="required:true" />
	</div>
	
	<div>
		<label for="sal">预计生产时长:</label> 
		<input class="easyui-validatebox" type="text" name="pchang" data-options="required:true" />
	</div>
	<div>
		<label for="sal">预计开始时间:</label> 
		<input class="easyui-datetimebox" type="text" name="pbegin" data-options="required:true,showSeconds:true" />
	</div>
	<div>
		<label for="sal">预计结束时间:</label> 
		<input class="easyui-datetimebox" type="text" name="pend" data-options="required:true,showSeconds:true" />
	</div>
	
	<a id="addbtn" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="saveAdd()">保存</a> 
	<a id="closebtn" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="closeAdd()">关闭</a>
</form>