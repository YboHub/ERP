<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
  <script type="text/javascript">
  	var id = $('#id').val();
  	$(function(){
	  $('#dgo').datagrid({
		    url:'proBackInFood/datagridTwo?id='+id,
		    fitColumns:true,
		    columns:[[
		        {field:'orderno',title:'订单编号',width:100},    
		        {field:'pno',title:'产品型号',width:100},
		        {field:'kz',title:'库存总量(吨)',width:100},
		        {field:'zl',title:'出库量(吨)',width:100},
		        {field:'sy',title:'入库剩余(吨)',width:100}
		    ]],
		   
		}); 
  });
  function proBackInWarehouse(id){
  	if(confirm("确认入库吗?")){
  		location.href="proBackInFood/proBackInWarehouse?id="+id;
  	}
  }
  </script>
	<input id="id" value="${id}" type="hidden"/>
  	<table id="dgo"></table>
  	<a id="updatebtn" class="easyui-linkbutton"data-options="iconCls:'icon-save'" onclick="proBackInWarehouse(${id})">入库</a> 
	     


