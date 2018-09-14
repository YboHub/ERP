<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>柱状图利润JSP页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<!-- 清理网站缓存的几种方法 -->
	<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
	<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
	<META HTTP-EQUIV="expires" CONTENT="0">
<!-- 加载顺序 -->
	<link rel="stylesheet" type="text/css" href="<%=path %>/easyui/themes/default/easyui.css">   
	<link rel="stylesheet" type="text/css" href="<%=path %>/easyui/themes/icon.css">   
	<script type="text/javascript" src="<%=path %>/easyui/jquery-1.8.3.min.js"></script>   
	<script type="text/javascript" src="<%=path %>/easyui/jquery.easyui.min.js"></script>
<!-- 汉化版 -->  
	<script type="text/javascript" src="<%=path %>/easyui/easyui-lang-zh_CN.js"></script>
  </head>
  <script type="text/javascript">
	  $(function(){
		  	$("#fei").datagrid({    
			    url:'histogram/datagridO',    
			    columns:[[    
			        {field:'ydate', title:'年份',  width:250},    
			        {field:'ymoney',title:'年利润',width:250},    
			    ]]    
			}); 
			//$("#diss").textbox({disabled:true});//禁用;
			//$("#diss").textbox({disabled:false});//启用
		    $('#dg').datagrid({    
			    url:'histogram/datagrid',
			    toolbar: '#addTool',
			    width:506,
				height:385,
			    fitColumns:true, 
			    singleSelect:true, 
			    rownumbers:true,
			    pagination:true,
			    pageSize:12,
			    pageList:[12,24,48,96,192],
			    columns:[[    
			        {field:'allMonth',title:'月份',     width:100},
			        {field:'promoney',title:'月利润(元)',width:100,
                    }
			    ]], 
			}); 
	    });
/*------------------------------------------- 清空输入框中的值 ----------------------------------*/
		function clearFun(){
			//searchbox设置为空
			$("#ss").searchbox('setValue', '');
			//刷新列表
			$("#dg").datagrid('reload',{
				name:null,
				value:null
			});
			$('#beginTime').datetimebox('clear');
			$('#endTime').datetimebox('clear');
				    	
			$('#beginTime1').datetimebox('clear');
			$('#endTime1').datetimebox('clear');
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
  		 	$('#search').click(function(){
		     //获取查询框中的内容$('#beginTime')获取的是ID
		   	var beginTime = $('#beginTime').datetimebox('getValue');
		    var endTime = $('#endTime').datetimebox('getValue');
		   
		    if(beginTime>endTime){
	    				$.messager.alert('提示','开始时间不能大于结束时间','warning');
	    			}else{
	    					//将参数提交 重新加载
	    					$('#dg').datagrid('load',{
		    					beginTime:beginTime,
		    					endTime:endTime,
	    				});
	    			}
	   		 });  
   		 }
   		 function searchEchars(){
  		 	$("#search1").click(function(){
		    //获取查询框中的内容
		   	var startTime = $('#beginTime1').datetimebox('getValue');
		    var finalTime = $('#endTime1').datetimebox('getValue');
		
		    if(startTime>finalTime){
    				$.messager.alert('提示','开始时间不能大于结束时间','warning');
    			}else{
					location.href="<%=path%>/histogram/toList?startTime="+startTime+"&finalTime="+finalTime;
    			}
		    });  
   		 }      
  </script>

  <body>
  <!-- 折叠面板 -->
		<!-- 	collapsed boolean 定义是否在初始化的时候折叠面板。     false 
				minimized boolean 定义是否在初始化的时候最小化面板。  false 
				maximized boolean 定义是否在初始化的时候最大化面板。  false 
				closed    boolean 定义是否在初始化的时候关闭面板。     false  -->

	<div id="p" class="easyui-panel"  title="温馨提示：请选择相对应的进行查询！！！"     
	        style="width:100%;height:100px;padding:10px;background:#fafafa;"   
	        data-options="iconCls:'icon-help',closable:true,collapsed:true,    
	                collapsible:true,maximizable:true" > 
	      
		<form action="" method="post">
			<span>【利润查询框】</span>
			开始：<input id="beginTime" class="easyui-datetimebox" name="beginTime" data-options="showSeconds:true" style="width:180px;height:30px;"/>
			截止：<input id="endTime" class="easyui-datetimebox" name="endTime" data-options="showSeconds:true" style="width:180px;height:30px;"/>
			&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span>【柱状图查询框】</span>
			开始：<input id="beginTime1"  class="easyui-datetimebox" name="startTime" data-options="showSeconds:true" style="width:180px;height:30px;"/>
			截止：<input id="endTime1" class="easyui-datetimebox" name="finalTime" data-options="showSeconds:true" style="width:180px;height:30px;"/>  
			<!-- 利润合计：<input id="diss" class="easyui-textbox" name="endTime" data-options="showSeconds:true" style="width:180px;height:30px;" readonly="true";/> -->
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
	 	</form>
	      
  	</div>
 	
<!-- 根据表中相关信息进行查询 -->
	<div id="mm" style="width:120px"> 
  	<div id="addTool">
<!-- 查询按钮 -->
  	  	<a id="search" class="easyui-linkbutton seacle" data-options="iconCls:'icon-search'" onclick="searchFun()">查询利润</a>
  	  	<a id="search1" class="easyui-linkbutton seacle" data-options="iconCls:'icon-search'" onclick="searchEchars()">查询Echars</a>
  	  	<a id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="clearFun()">清空</a>
  	  	
<!-- 最常用的返回按钮 -->
  	  	<a id="back" class="easyui-linkbutton seacle"  plain="true" iconCls="icon-back" onclick="window.location.href='finances/toList';">返回</a> 
  	</div>
  	
<!-- financesList页面的内容部分 -->
  	<table id="dg" style="height:500px;">
  	</table> 
  	<div id="addId"></div>
  	
<!-- 总金额 -->
  	<br><hr><span>当前年总利润</span><hr>
  	<table id="fei" style="width:506px;">
	</table>
	                           	
<!-- 统计图开始 -->
		  	<!--Step:1 Prepare a dom for ECharts which (must) has size (width & hight)-->
		    <!--Step:1 为ECharts准备一个具备大小（宽高）的Dom-->
		    <div id="main" style="height:480px;width:700px;margin:-500px 0 0 560px;border:1px solid #ccc;padding:10px;"></div>
		
		    <!--Step:2 Import echarts-all.js-->
		    <!--Step:2 引入Echarts样式echarts-all.js或his/echarts.min.js-->
			    <!-- <script src="dist/echarts-all.js"></script> -->
			    <script src="his/echarts.min.js"></script>
		    
		    <script type="text/javascript">
		        // Step:3 echarts & zrender as a Global Interface by the echarts-plain.js.
		        // Step:3 echarts和zrender被echarts-plain.js写入为全局接口
		        var myChart = echarts.init(document.getElementById('main'));
		        myChart.setOption({
		            tooltip : {
		                trigger: 'axis'
		            },
		            legend: {
		                data:['收入','支出','利润']
		            },
		            toolbox: {
		                show : true,
		                feature : {
		                    mark : {show: true},
		                    dataView : {show: true, readOnly: false},
		                    magicType : {show: true, type: ['line', 'bar']},
		                    restore : {show: true},
		                    saveAsImage : {show: true}
		                }
		            },
		            calculable : true,
		            xAxis : [
		                {
		                    type : 'category',
		                   // data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
		                    data :${monthList}
		                }
		            ],
		            yAxis : [
		                {
		                    type : 'value',
		                    splitArea : {show : true}
		                }
		            ],
		            series : [
		                {
		                    name:'收入',
		                    type:'bar',
		                    //data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
		                    data:${inList}
		                },
		                {
		                    name:'支出',
		                    type:'bar',
		                    //data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
		                    data:${disburseList}
		                },
		                {
		                    name:'利润',
		                    type:'bar',
		                  //  data:[15000, 16000, 20000, 25000, 30000, 35000, 17000, 16000, 15000,14000, 13000, 12000]
		                    data:${profitList}
		                }
		            ]
		        });
		    </script>
	 <!-- 统计图结束 -->
  </body>
</html>
