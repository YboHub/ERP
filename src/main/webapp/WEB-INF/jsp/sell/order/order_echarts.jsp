<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'echarts.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="easyui/themes/default/easyui.css">	
<link rel="stylesheet" href="easyui/themes/icon.css">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/echarts.common.min.js"></script>
</head>

<body>
	产品编号：<input id="pno" list="pnolist" name="pno"/>
		<datalist id="pnolist">
			<c:forEach var="nl" items="${pnoList}">
				<option value="${nl.pno}">${nl.pno}</option>
			</c:forEach>
		</datalist>
	开始时间：<input class="easyui-datebox" id="starttime" name="starttime" style="width:150px"/>
	结束时间：<input class="easyui-datebox" id="endtime" name="endtime" style="width:150px"/>
    <a id="showCartogram" class="easyui-linkbutton" iconCls="icon-search">查询</a>
	<div id="main" style="width:1400px;height:800px;"></div>
	<script type="text/javascript">
		$(function(){
		
		});
		var pno = null;
		var starttime = null;
		var endtime = null;
		$('#pno').change(function(){
			pno = $('#pno').val();
			$.post('order/toSelectByPno',{pno:pno},function(data){
				if (data==null||data=='') {
					$.messager.alert('提醒','没有此产品');
					pno = $('#pno').val('');
				}
			});
		});
		$('#showCartogram').click(function() {
			pno = $('#pno').val();
			starttime = $('#starttime').datebox('getValue');
			endtime = $('#endtime').datebox('getValue');
			if (pno==null||pno=='') {
				$.messager.alert('提醒','请选择产品编号');
				return;
			} else if (starttime==null||starttime=='') {
				$.messager.alert('提醒','请选择起始时间');
				return;
			} else if (endtime==null||endtime=='') {
				$.messager.alert('提醒','请选择结束时间');
				return;
			}
			if (endtime<starttime) {
				$.messager.alert('提醒','开始时间不能大于结束时间');
				return;
			}
			eCharts();
		});
		function eCharts() {
			// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('main'));
			// 显示标题，图例和空的坐标轴
			myChart.setOption({
				title : {
					text : '销量统计'
				},
				/* 提示框组件  */
				tooltip : {
					trigger : 'axis', //坐标轴触发（柱状图，折线图）
					axisPointer : {
						type : 'cross',
						label : {
							backgroundColor : '#283b56'
						}
					}
				},
				legend : {
					data : [ '销量' ]
				},
				toolbox : {
					show : true,
					feature : {
						dataView : {
							readOnly : false
						},
						magicType : {
							type : [ 'line', 'bar' ]
						},
						restore : {},
						saveAsImage : {}
					}
				},
				dataZoom : {
					show : false,
					start : 0,
					end : 100
				},
				xAxis : {
					data : []
				},
				yAxis : {},
				series : [ 
					{
						name : '销量',
						type : 'bar',
						data : []
					}
				]
			});

			// 异步加载数据
			$.post('order/echartsData',{pno:pno,startTime:starttime,endTime:endtime},function(data) {
				console.log(data);
				var x = [];
				var y = [];
				for ( var i = 0; i < data.length; i++) {
					if (data[i].orderYear!=null) {
						x.push(data[i].orderYear + '年');
					} else if (data[i].orderMonth!=null) {
						x.push(data[i].orderMonth + '月');
					} else {
						x.push(data[i].orderDay + '日');
					}
					y.push(data[i].orderTotal);
				}
				// 填入数据
				myChart.setOption({
					xAxis : {
						data : x
					},
					 series: [{
					 	name : '销量',
				       	data : y
				    }]
				});
			});
		}
	</script>
</body>
</html>
