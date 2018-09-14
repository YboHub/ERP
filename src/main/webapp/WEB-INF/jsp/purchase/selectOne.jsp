<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 
  
  <body>
 	<table id="dgone"></table>
    <script type="text/javascript">
		$('#dgone').datagrid({    
		    url:'datagridProdaction', 
		    fitColumns:true,   
		    rownumbers:true,
		    columns:[[ 
		        {field:'pname',title:'所需材料',width:50},    
		        {field:'shu',title:'需求数量',width:50},
		        {field:'weightOne',title:'仓库剩余量/T',width:50},
		        {field:'shuone',title:'建议购买数量/T',width:50,
		        	formatter:function(value,row,index){
		        		if(value<=0){
		        			return "0";
		        		}else{
		        			return value;
		        		}
		         }
		        },
		    ]],
		    onLoadSuccess:function(data){
		    	$('.btn-edit').linkbutton({iconCls: 'icon-edit'}); 
		    	$('.btn-del').linkbutton({iconCls: 'icon-clear'}); 
		    } 
		}); 
  </script>
    		
  </body>
  
  
</html>
