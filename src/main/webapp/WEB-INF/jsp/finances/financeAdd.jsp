<%-- <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
  <script type="text/javascript">
	  $(function(){
		  $('#dgg').datagrid({    
			    url:'finances/datagrid',
			    toolbar: '#addTool1',
			    width:550,
				height:300, 
			    fitColumns:true, 
			    singleSelect:true, 
			    rownumbers:true,
			    pagination:true,
			    pageSize:10,
			    pageList:[12,24,36,48,60],
			    columns:[[    
			        
			        {field:'ftime',title:'月份',width:100},
			        {field:'fmoney',title:'月利润(元)',width:100,
			       
			        }
			    ]], 
			}); 
	  });
	  	//清空
		function clearFun(){
			$('#beginTime').datetimebox('clear');
				    	$('#endTime').datetimebox('clear');
		}

/*------------------------------------------- 根据时间查询信息 ------------------------------------*/
		    //格式化日期
			function myformatter(date) {
			    //获取年份
			    var y = date.getFullYear();
			    //获取月份
			    var m = date.getMonth() + 1;
			    return y + '-' + m;
			}
	   		 function searchFun(){
	   		 		$("#search").click(function(){
				     //获取查询框中的内容
				   	var beginTime = $('#beginTime').datetimebox('getValue');
				    var endTime = $('#endTime').datetimebox('getValue');
				   
				    if(beginTime>endTime){
				    				$.messager.alert('提示','开始时间不能大于结束时间','warning');
				    			}else{
				    					//将参数提交 重新加载
				    					$("#dgg").datagrid('load',{
					    					beginTime:beginTime,
					    					endTime:endTime,
					    					
				    				});
				    			}
				   		 });  
	   		 } 
  </script>
	
	<div id="addTool1">
  	  	<a id="btn" style="width:100px;" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="searchFun()">查看利润</a> 
  	</div>
  	
<!-- Form表单 -->
 	<form action="post">
	  	<table id="dg1" border="1px" style="height:60px;width:550px;margin:120px 0 0 0px;">
	  		<div id="addTool">
	  	  	<tr>
	  	  		<td>
	  	  			开始时间：
	  	  			<input id="beginTime" class="easyui-datetimebox"
	  	  				name="beginTime" data-options="showSeconds:true"
	  	  				style="width:180px;height:30px;" />
	  	  		</td>
	  	  		<td>
	  	  			截止时间：
	  	  			<input id="endTime" class="easyui-datetimebox"
	  	  				name="endTime" data-options="showSeconds:true"
	  	  				style="width:180px;height:30px;" />
	  	  		</td>
	  	  	</tr>
	  	  
	  	  <tr>
	  			<td>合计利润：<input id="ss" class="easyui-textbox" style="width:180px"></td>
	  			<td><a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="clearFun()">清空</a></td>
	  		</tr>
	  	</div>
	  	</table>
	  	
<!-- easyui查询框架 -->
  		<table id="dgg" border="1px" style="height:60px;width:550px;margin:120px 0 0 100px;">
	  	</table> 
  	</form> --%>