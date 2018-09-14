<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script>
	var mid=$("#mid").val();
	$("#selectId").datagrid({  
		    url:'maintains/detailsid?mid='+mid,   
		    fitColumns:true, 
		    singleSelect:true,
		    columns:[[    
				{field:'breakdownnumber',title:'故障单号',width:200,height:50},
				{field:'maintenancetime',title:'维修时间',width:200,height:50},
				{field:'completiontime',title:'完成时间',width:200,height:50},
				{field:'materialcost',title:'材料费用',width:200,height:50},
				{field:'staffcosts',title:'人工费用',width:200,height:50},
				{field:'othercosts',title:'其他费用',width:200,height:50},
				{field:'remark',title:'备注',width:200,height:50},
				{field:'mrepairman',title:'负责人',width:200,height:50},
				]]
  });
</script>
<input type="text" id="mid" value="${mid}"/>
