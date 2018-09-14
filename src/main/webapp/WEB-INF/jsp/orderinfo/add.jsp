<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
	<table id="dgOne"></table>
	<input value="${orderno}" id="orderno" type="hidden"/>
	<script type="text/javascript">
	var orderno=$("#orderno").val();
	
	$('#dgOne').datagrid({ 
	 		url:'orderinfo/dataOne?orderno='+orderno, 
		    fitColumns:true,   
		    singleSelect:true, 
		    rownumbers:true,
		    columns:[[    
		       {field:'orderno',title:'产品编号',width:100},    
		        {field:'ordertime',title:'下单时间',width:100,
		        	formatter:function(value){
		        			var date =new Date(value);
		        		 	var y = date.getFullYear();
						    var m = date.getMonth() + 1;
						    var d = date.getDate();
						    var h = date.getHours();
						    var MM = date.getMinutes();
						    var ss = date.getSeconds();
						    return   y +'-'+ (m < 10 ? ('0' + m) : m) +'-'+ (d < 10 ? ('0' + d) : d)+ ' ' + h + ':' + (MM < 10 ? ('0' + MM) : MM) + ':' + (ss < 10 ? ('0' + ss) : ss);
		        	}
		        },
		        {field:'pname',title:'类型',width:100},
		        {field:'psize',title:'尺寸',width:100},
		        {field:'pnum',title:'总量',width:100},
		     ]],
		      }); 
	</script>
</html>
