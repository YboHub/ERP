<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<style type="text/css">
	#pnum{
		position: absolute;
		left: 160px;
		top: 180px;
	}
	#tableone{
		position: absolute;
		left:150px;
		top: 350px;
	}
	
</style>
<form id="editForm" method="post" >
	<c:forEach items="${list}" var="order">
		<div>
			<label for="sal"></label> 
			<input class="easyui-validatebox" type="hidden" name="id" value="${order.id}" data-options="required:true" />
		</div>
		<div>
			<label for="sal"></label> 
			<input class="easyui-validatebox" type="hidden" name="dnumber" value="${order.orderno}" data-options="required:true" />
		</div>	
			
	</c:forEach>
<div>
	<table border="1"  align="center">
		<tr class="text-c">
			<th colspan="6" style="text-align:center; font-size:25px; color:red; font-family:'楷体'">订单信息</th>
		</tr>
		<tr style="line-height:25px">
			<td width="70px" class="tdColor" style="text-align:center">编号</td>
			<td width="100px" class="tdColor" style="text-align:center">产品编号</td>
			<td width="150px" class="tdColor" style="text-align:center">下单时间</td>
			<td width="100px" class="tdColor" style="text-align:center">类型</td>
			<td width="100px" class="tdColor" style="text-align:center">尺寸</td>
			<td width="100px" class="tdColor" style="text-align:center">总量</td>
		<tr>
		<c:forEach items="${orList}" var="list" varStatus="state">
			<tr style="line-height:25px">
				<td style="text-align:center">${state.count}</td>
				<td style="text-align:center">${list.orderno}</td>
				<td style="text-align:center">${list.ordertime}</td>
				<td style="text-align:center">${list.pname}</td>
				<td style="text-align:center">${list.psize}</td>
				<td style="text-align:center">${list.pnum}</td>
			</tr>
		</c:forEach>
	</table>
</div>
<br/>
<div>
	<table border="1" align="center">
		<tr class="text-c">
			<th colspan="5" style="text-align:center; font-size:25px; color:red; font-family:'楷体'">生产能力</th>
		</tr>
		<tr>
			<td width="130px" class="tdColor" style="text-align:center">编号</td>
			<td width="130px" class="tdColor" style="text-align:center">类型</td>
			<td width="130px" class="tdColor" style="text-align:center">正产生产能力</td>
			<td width="130px" class="tdColor" style="text-align:center">最快生产能力</td>
			<td width="130px" class="tdColor" style="text-align:center">单位</td>
		<tr>
		<c:forEach items="${nenglist}" var="lists" varStatus="state">
			<tr>
				<td style="text-align:center">${state.count}</td>
				<td style="text-align:center">${lists.pnumber}</td>
				<td style="text-align:center">${lists.min}</td>
				<td style="text-align:center">${lists.max}</td>
				<td style="text-align:center">${lists.dan}</td>
			</tr>
		</c:forEach>
	</table>
</div>
<div>
<table align="center" id="tableone">
	<tr>
		<td><label for="sal">计划编号:</label></td> 
		<td><input class="easyui-validatebox" type="text" name="pnumber" value="${application}" data-options="required:true" id="num" readonly="readonly"/></td> 
	</tr>
	
	<tr>	
		<td><label for="sal">计划人:</label> </td>
		<td><input class="easyui-validatebox" type="text" name="person" value="${list[0].warehouse}"  data-options="required:true" readonly="readonly" /><td>
	</tr>
	<tr>
		<td><label for="sal">预计生产天数:</label></td> 
		<td><input class="easyui-validatebox" type="text" name="pchang" onkeyup="value=value.replace(/[^\d]/g,'') "  onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" data-options="required:true,showSeconds:true" id="chang"/></td>
	</tr>
	
	<tr>
		<td><label for="sal">预计开始时间:</label> </td>
		<td><input class="easyui-datetimebox" type="text" name="pbegin" data-options="required:true" id="obegintime" onblur="date()"/></td>
	</tr>
	<tr>
		<td><label for="sal">预计结束时间:</label> </td>
		<td><input class="easyui-validatebox" type="text" name="pend" data-options="required:true"  id="end" onclick="del()"/></td>
		<td><label id="endMsg" style="color:red"></label></td>
	</tr>
	<tr id="pnum">
		<td><a id="addbtn" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="saveEdit()">保存</a></td> 
		<td><a id="closebtn" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="closeEdit()">关闭</a></td>
	</tr>
</table>
</div>	
</form>
<script type="text/javascript">
 $("#end").click(function(){
 		var time="${list[0].time}";
 		var startdate = $('#obegintime').datebox('getValue');
 		if(startdate<time){
 			alert("请合理输入开始时间");
 			$('#obegintime').combo('setText','');
 		}	
 	});
		
	function del(){
		$.post("orderinfo/toend",{obegintime:$("#obegintime").datebox('getValue'),chang:$("#chang").val(),num:$("#num").val(),},function(data){
			$("#end").val(data);
		});
	}	
</script>