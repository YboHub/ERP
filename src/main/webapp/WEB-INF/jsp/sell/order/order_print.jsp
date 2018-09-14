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

<title>订单打印</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="css/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jQuery.print.js"></script>

<style type="text/css">
#tabs tbody td {
	height: 20px;
	padding: 0px;
	text-align: center;
}

#tabs thead th {
	text-align: center;
}
select {
	border: 0px;
	width: 80%;
	height: 100%;
	-webkit-appearance: none;
}
p{
	display: inline;
}
</style>
</head>

<body>
	<h1 align="center">
		<font color="#38BFC0" size="6em">订单打印</font>
	</h1>
	<form id="form" method="post" class="form-horizontal container">
		<h4 align="center">
			<font color="black" size="6em">销售单</font>
		</h4>
		<table border="0px">
			<c:forEach items="${editClientList}" var="cl">
				<tr>
					<td>订单编号：${cl.orderno}</td>
					<td width="530px"></td>
					<td id="date"></td>
				</tr>
				<tr>
					<td>客户名称：${cl.cname}</td>
					<td width="530px"></td>
					<td>客户电话：${cl.cphone}</td>
				</tr>
				<tr>
					<td>客户地址：${cl.carea}</td>
					<td width="530px"></td>
					<td>备注信息：${cl.remark}</td>
				</tr>
			</c:forEach>
		</table>
		<table border="1px" id="tabs" bgcolor="black"
			class="table table-condensed table-bordered">
			<thead>
				<tr align="center">
					<th>序号</th>
					<th>产品编号</th>
					<th>名称</th>
					<th>规格</th>
					<th>单位</th>
					<th>单价(元)</th>
					<th>数量</th>
					<th>总价</th>
				</tr>
			</thead>
			<tbody id="tb">
				<c:forEach var='od' items='${editOrderList}' varStatus='no'>
					<tr>
						<td width='50px'>${no.count}</td>
						<td width='120px'>${od.pno}</td>
						<td>${od.pname}</td>
						<td width='120px'>${od.psize}</td>
						<td width='60px'>${od.punit}</td>
						<td width='120px'>${od.pprice}</td>
						<td width='120px'>${od.pnum}</td>
						<td>${od.msubtotal}</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan='7'>合计￥</td>
					<td align="center">
						<c:forEach items="${editClientList}" var="ec">
								${ec.mtotal}
						</c:forEach>
					</td>
				</tr>
			</tfoot>
		</table>
			<p>公司电话:16888866888</p><p style="padding-left:600px">公司地址:郑州市金水区杨金路街道</p>
	</form>
	<center>
		<button type="button" class="btn btn-info" id="print">打印</button>
		<button type="button" class="btn btn-warning" id="goBack">返回</button>
	</center>
	<script type="text/javascript">
	$(function(){
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var strDate = date.getDate();
		var hour = date.getHours();
		if (month >= 1 && month <= 9) {
            month = '0' + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = '0' + strDate;
        }
		var currentDate = year+'年'+month+'月'+strDate+'日';
		$('#date').text(currentDate);
		$('#print').trigger('click');
	});
	$('#print').click(function(){
		$('#form').print();
	});
	$('#goBack').click(function(){
		window.history.go(-1);
	});
	</script>
</body>
</html>
