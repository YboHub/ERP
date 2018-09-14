<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
	<table id="dgOne"></table>
	<input value="${dnumber}" id="dnumber" type="hidden"/>
	<script type="text/javascript">
	var dnumber=$("#dnumber").val();
	
	$('#dgOne').datagrid({ 
	 		url:'plan/dataOne?dnumber='+dnumber, 
		    fitColumns:true,   
		    singleSelect:true, 
		    rownumbers:true,
		    columns:[[    
		       {field:'orderno',title:'产品编号',width:100},    
		        {field:'pname',title:'类型',width:100},
		        {field:'psize',title:'尺寸',width:100},
		        {field:'pnum',title:'总量',width:100},
		     ]],
		      }); 
	</script>
</html>
