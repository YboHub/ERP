<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


 
  <script type="text/javascript">
  	var orderno = $('#no').val();
  	var id = $('#id').val();
  	$(function(){
	  $('#dgo').datagrid({ 
		    url:'proOutAudit/datagridTwo?orderno='+orderno,
		    fitColumns:true,
		    columns:[[
		        {field:'orderno',title:'订单编号',width:100},    
		        {field:'psize',title:'产品规格',width:100},
		        {field:'pname',title:'产品名称',width:100},
		        {field:'pnum',title:'产品量(吨)',width:100},
		        {field:'mtotal',title:'产品金额',width:100},
		        {field:'proaudittime',title:'审核时间',width:100},
		        {field:'auditremark',title:'审核意见',width:100},
		    ]],
		   
		}); 
  });
	
  </script>
  	<input id="no" value="${orderno}" type="hidden"/>
  	<table id="dgo"></table>
