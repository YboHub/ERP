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

<title>客户货物退回</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/bootstrapValidator.min.css" rel="stylesheet" />
<script type="text/javascript" src="js/area1.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.min.js"></script>
<style type="text/css">
	td {
		height:20px;
		padding:0px;
	}
	th {
		text-align: center;
	}
	td input {
		border:0px;
		width:100%; 
		height:100%;
		text-align: center;
	}
	select{
		border:0px;
		width:80%; 
		height:100%;
		-webkit-appearance:none; 
	}
</style>
</head>
<body>
<h1 align="center">
	<font color="#38BFC0" size="6em">货物退回</font>
</h1>
<form id="returnForm" method="post" class="form-horizontal container">
	<div class="col-xs-8  col-xs-offset-2">
		<c:forEach items="${editClientList}" var="cl">
			<div class="form-group">
				<label class="col-lg-3 control-label"><font color="black"
					size="3em">订单编号</font> </label>
				<div class="col-lg-8">
					<input type="text" class="form-control" name="rorderno" value = "${cl.orderno}" readonly="readonly"/>
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
						value="${cl.cphone}" readonly="readonly"/>
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-3 control-label"><font color="black"
					size="3em">地址</font> </label>
				<div class="col-lg-8">
					<input type="text" class="form-control" name="carea"
						value="${cl.carea}" readonly="readonly"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label"><font color="black"
					size="3em">业务员</font> </label>
				<div class="col-lg-8">
					<input type="text" class="form-control" name="ename"
						value="${cl.ename}" readonly="readonly"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label"><font color="black"
					size="3em">备注信息</font> </label>
				<div class="col-lg-8" id="rd">
					<textarea class="form-control" name="remark" id="remark">${cl.remark}</textarea>
				</div>
			</div>
		</c:forEach>
	</div>
	<table border="1px" id="tabs" bgcolor="silver" class="table table-condensed table-bordered form-group">
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
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="tb">
		</tbody>
		<tfoot>
			<tr>
				<td colspan='7'>合计￥</td>
				<td colspan='2'>
				<c:forEach items="${editClientList}" var="ec">
					<input id='total' name='mtotal' value='${ec.mtotal}' readonly="readonly"/>
				</c:forEach>
				</td>
			</tr>
		</tfoot>
	</table>
	<div class="col-xs-8 col-xs-offset-2" style="margin-top:25px">
		<div class="form-group" align="center">
			<button type="button" class="btn btn-info" id="refresh">刷新</button>
			<button type="button" class="btn btn-warning" id="goBack">返回</button>
			<button type="button" class="btn btn-danger" id="returnAll">全部退货</button>
		</div>
	</div>
	<div class="modal" id="returnMode" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">   
	    <div class="modal-dialog">  
	        <div class="modal-content">  
	            <div class="modal-header">  
	                <h4 class="modal-title" id="myModalLabel">退回原因</h4>  
	            </div>  
	            <div class="modal-body">
	              	<textarea rows="10" cols="60" id="returnReason" name="returnreason"></textarea>
	            </div>  
	            <div class="modal-footer">  
	                <button type="button" class="btn btn-primary" id="sub">提交</button>  
	                <button type="button" class="btn btn-default" id="close" data-dismiss="modal" aria-hidden="true">关闭</button> 
	            </div>  
	        </div>  
	    </div>  
	</div> 
	<div class="modal" id="successMode" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">   
	    <div class="modal-dialog">  
	        <div class="modal-content">  
	            <div class="modal-header">  
	            	<center>
	                	<h2 class="modal-title" id="myModalLabel">提交成功</h2> 
	                </center> 
	            </div>  
	            <div class="modal-footer">  
	                <button type="button" class="btn btn-info" id="goOrderList">返回订单详情列表</button>  
	                <button type="button" class="btn btn-success" id="goReturnList">前往异常订单列表</button> 
	            </div>  
	        </div>  
	    </div>  
	</div> 
	<div id="success"></div>
	<div id="returnNum"></div>
	<div id="cho"></div>
	<input type="hidden" name="rtype" id="rtype"/>
	<input type="hidden" name="rstate" id="rstate"/>
</form>
</body>
<script type="text/javascript">
	$(function() {
		/*foreach遍历数据*/
		$('#tb').append(
		"<c:set var='e' value='0' />"+ 
		"<c:forEach var='od' items='${editOrderList}' varStatus='no'>"+
			"<c:set var='e' value='${e+1}' />"+	
			"<tr>"+
				"<td width='50px'>${no.count}</td>"+
				"<td width='120px'>"+
					"<input id='pno_${e}' value='${od.pno}' list='pnolist' name='pno'/>"+
					"<datalist id='pnolist'>"+
						"<c:forEach var='nl' items='${pnoList}'>"+
							"<option value='${nl.pno}'>${nl.pno}</option>"+
						"</c:forEach>"+
					"</datalist>"+
				"</td>"+
				"<td>"+
					"<input id='pname_${e}' value='${od.pname}' list='pnamelist' name='pname'/>"+
					"<datalist id='pnamelist'>"+
						"<c:forEach var='nl' items='${pnameList}'>"+
							"<option value='${nl.pname}'>${nl.pname}</option>"+
						"</c:forEach>"+
					"</datalist>"+
				"</td>"+
				"<td width='120px'><select id='sel_${e}' name='psize'><option selected='selected'>${od.psize}</option></select></td>"+
				"<td width='60px'><input name='punit' value='t' value='${od.punit}'/></td>"+
				"<td width='120px'><input id='pprice_${e}' name='pprice' value='${od.pprice}'/></td>"+
				"<td width='120px'><input id='pnum_${e}' name='pnum' value='${od.pnum}'/></td>"+
				"<td><input id='ptprice_${e}' name='msubtotal' value='${od.msubtotal}' readonly='readonly'/></td>"+
				"<td><input id='delBtn_${e}' onclick=sre(${od.id},${e}) type='button' class='btn btn-danger' value='部分退货'/></td>"+
			"</tr>"+
			"<input type='hidden' name='id' value='${od.id}' />"+
		"</c:forEach>"
		);
	});
	$('#refresh').click(function(){
		location.reload();
	});
	/*部分货物退回点击事件*/
	function sre(id,e){
		$('#returnAll').attr('disabled',true);
		$('#rtype').val(16);
		$('#returnNum').dialog({    
		    title: '货物退回',    
		    width: 600,    
		    height: 600,    
		    closed: false,    
		    cache: true,    
		    href: 'order/returnProNum?id='+id,   
		    modal: true   
		});
	}
	$('#goBack').click(function(){
		window.history.go(-1);
	});
	/* 全部退回点击事件 */
	$('#returnAll').click(function() {
		$('input[id^="delBtn"]').each(function(){
			$(this).attr('disabled',true);
		});
		$('#returnMode').show();
		$('#close').click(function(){$('#returnMode').hide();});
		$('#sub').click(function(){
			if (($('#returnReason').val())=='') {
				alert('请输入退货原因');
			} else {
				$('#rtype').val(17);
				$('#returnForm').form({
					url : 'order/saveReturnOrder',
					success : function(data) {
						if (data > 0) {
							$('#returnMode').hide();
							$('#successMode').show();
						} else {
							$.messager.show({
								title : '我的消息',
								msg : '提交失败',
								timeout : 5000,
								showType : 'show'
							});
							$('#returnMode').hide();
						}
					}
				});
				$('#returnForm').submit();
			}
		});
		
	});
	$('#goOrderList').click(function(){
		location.href='<%=path%>/order/toList';
	});
	$('#goReturnList').click(function(){
		location.href='<%=path%>/order/returnOrderList';
	});
</script>
</body>
</html>
