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

<title>My JSP 'order_detail.jsp' starting page</title>

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
<style type="text/css">
tbody td {
	height: 20px;
	padding: 0px;
	text-align: center;
}

th {
	text-align: center;
}

select {
	border: 0px;
	width: 80%;
	height: 100%;
	-webkit-appearance: none;
}
</style>
</head>

<body>
	<h1 align="center">
		<font color="#38BFC0" size="6em">订单详情</font>
	</h1>
	<form id="editForm" method="post" class="form-horizontal container">
		<div class="col-xs-8  col-xs-offset-2">
			<c:forEach items="${editClientList}" var="cl">
				<div class="form-group">
					<label class="col-lg-3 control-label"><font color="black"
						size="3em">订单编号</font> </label>
					<div class="col-lg-8">
						<input type="text" class="form-control" name="orderno"
							value="${cl.orderno}" readonly="readonly"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label"><font color="black"
						size="3em">客户名称</font> </label>
					<div class="col-lg-8">
						<input type="text" class="form-control" name="cname"
							value="${cl.cname}" readonly="readonly"/>
					</div>
				</div>

				<div class="form-group">
					<label class="col-lg-3 control-label"><font color="black"
						size="3em">客户电话</font> </label>
					<div class="col-lg-8">
						<input type="text" class="form-control" name="cphone"
							value="${cl.cphone}" readonly="readonly" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-lg-3 control-label"><font color="black"
						size="3em">地址</font> </label>
					<div class="col-lg-8">
						<input type="text" class="form-control" name="carea"
							value="${cl.carea}" readonly="readonly" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label"><font color="black"
						size="3em">业务员</font> </label>
					<div class="col-lg-8">
						<input type="text" class="form-control" name="ename"
							value="${cl.ename}" readonly="readonly" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label"><font color="black"
						size="3em">备注信息</font> </label>
					<div class="col-lg-8" id="rd">
						<textarea class="form-control" name="remark" id="remark"
							readonly="readonly">${cl.remark}</textarea>
					</div>
				</div>
			</c:forEach>
		</div>
		<table border="1px" id="tabs" bgcolor="silver"
			class="table table-condensed table-bordered form-group">
			<thead>
				<tr>
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
		<div class="col-xs-8 col-xs-offset-2" style="margin-top:25px">
			<div class="form-group" align="center">
				<button type="button" class="btn btn-warning" id="goBack">返回</button>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		$('#goBack').click(function(){
			window.history.go(-1);
		});
	</script>
</body>
</html>
