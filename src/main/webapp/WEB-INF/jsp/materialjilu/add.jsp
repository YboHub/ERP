<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<html>
	<table id="dgOne"></table>
	<input value="${mid}" id="mid" type="hidden"/>
	<script type="text/javascript">
	var mid=$("#mid").val();
	$('#dgOne').datagrid({ 
	 		url:'yuanchu/dataOne?mid='+mid, 
		    fitColumns:true,   
		    singleSelect:true, 
		    rownumbers:true,
		    columns:[[        
		        {field:'name',title:'类型',width:100},
		        {field:'zong',title:'总量',width:100},
		     ]],
		     
		      }); 
	</script>
</html>
