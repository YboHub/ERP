<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script>
	var orderid=$("#orderid").val();
	$('#dd').datagrid({    
		    url:'purchase/detailsid?orderid='+orderid,
		    fitColumns:true, 
		    singleSelect:true,
		    columns:[[    
				{field:'orderid',title:'采购单号',width:200,height:50},
				{field:'goodsname',title:'商品名称',width:200,height:50},
				{field:'types',title:'商品类型',width:200,height:50},
				{field:'company',title:'供应商',width:200,height:50},
				{field:'weights',title:'重量（吨）',width:200,height:50},
				{field:'price',title:'单价',width:200,height:50},
				{field:'money',title:'总价',width:200,height:50},
				]]
  });
</script>
<input type="text" id="orderid" value="${sid}"/>
