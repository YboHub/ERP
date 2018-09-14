<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


 
  <script type="text/javascript">
  	var orderno = $('#no').val();
  	var id = $('#id').val();
  	$(function(){
	  $('#dgo').datagrid({ 
		    url:'proOut/datagridTwo?orderno='+orderno,
		    fitColumns:true,
		    columns:[[
		        {field:'orderno',title:'订单编号',width:100},    
		        {field:'psize',title:'产品规格',width:100},
		        {field:'kz',title:'库存总量(吨)',width:100},
		        {field:'zl',title:'出库量(吨)',width:100},
		        {field:'sy',title:'出库剩余(吨)',width:100,
		        	formatter: function(value,row,index){
			        	if(row.sy<0){
							return "库存不足";
							
						}else{
							return value;
							
						}
					}
		        }
		    ]],
		   
		}); 
  });
	
  </script>
  	<input id="no" value="${orderno}" type="hidden"/>
	<input id="id" value="${id}" type="hidden"/>
  	<table id="dgo"></table>
  	<a id="updatebtn" class="easyui-linkbutton"data-options="iconCls:'icon-save'" onclick="outInventory(${id})">出库</a> 
	     


