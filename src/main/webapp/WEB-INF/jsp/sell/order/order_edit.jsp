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

<title>客户信息</title>

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
	/* table自动排序 */
	tbody {
   		counter-reset:sectioncounter;
	}                      
	.sortId:before {
   		content:counter(sectioncounter); 
   		counter-increment:sectioncounter;
	}
</style>
</head>
<body>
<h1 align="center">
	<font color="#38BFC0" size="6em">更改订单</font>
</h1>
<form id="editForm" method="post" class="form-horizontal container">
	<div class="col-xs-8  col-xs-offset-2">
		<c:forEach items="${editClientList}" var="cl">
			<div class="form-group">
				<label class="col-lg-3 control-label"><font color="black"
					size="3em">订单编号</font> </label>
				<div class="col-lg-8">
					<input type="text" class="form-control" name="orderno" value = "${cl.orderno}" readonly="readonly"/>
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
			<button type="button" class="btn btn-primary" id="valiEdit">保存</button>
			<button type="button" class="btn btn-success" id="addBtn">添加行</button>
			<button type="button" class="btn btn-warning" id="goBack">返回</button>
		</div>
	</div>
	<div id="success"></div>
	<div id="cho"></div>
</form>
</body>
<script type="text/javascript">
	var n = 0;
	$(function() {
		/*foreach遍历数据*/
		$('#tb').append(
		"<c:set var='e' value='0' />"+ 
		"<c:forEach var='od' items='${editOrderList}' varStatus='no'>"+
			"<c:set var='e' value='${e+1}' />"+	
			"<tr>"+
				"<td width='50px' class='sortId'></td>"+
				"<td width='120px'>"+
					"<input id='pno_${e}' value='${od.pno}' onblur='pnoBlur(${e})' list='pnolist' name='pno'/>"+
					"<datalist id='pnolist'>"+
						"<c:forEach var='nl' items='${pnoList}'>"+
							"<option value='${nl.pno}'>${nl.pno}</option>"+
						"</c:forEach>"+
					"</datalist>"+
				"</td>"+
				"<td>"+
					"<input id='pname_${e}' value='${od.pname}' onblur='pnameBlur(${e})' list='pnamelist' name='pname'/>"+
					"<datalist id='pnamelist'>"+
						"<c:forEach var='nl' items='${pnameList}'>"+
							"<option value='${nl.pname}'>${nl.pname}</option>"+
						"</c:forEach>"+
					"</datalist>"+
				"</td>"+
				"<td width='120px'><select id='sel_${e}' name='psize' onChange='selSize(${e})'><option selected='selected'>${od.psize}</option></select></td>"+
				"<td width='60px'><input name='punit' value='t' value='${od.punit}'/></td>"+
				"<td width='120px'><input id='pprice_${e}' name='pprice' value='${od.pprice}'/></td>"+
				"<td width='120px'><input id='pnum_${e}' name='pnum' onblur='countPrice(${e})' value='${od.pnum}'/></td>"+
				"<td><input id='ptprice_${e}' name='msubtotal' value='${od.msubtotal}' readonly='readonly'/></td>"+
				"<td><input id='delBtn_${e}' onclick=dele(${e},${od.id},'${od.orderno}') type='button' class='btn btn-danger' value='删除'/></td>"+
				"<input type='hidden' name='id' value='${od.id}'/>"+
			"</tr>"+
		"</c:forEach>"
		);
		n =	${e};
	});
		/*添加行*/
	$('#addBtn').click(function(){
		n++;
		$('#tb').append(
			"<tr>"+
				"<td width='50px'>"+n+"</td>"+
				"<td width='120px'>"+
					"<input id='pno_"+n+"' onblur='pnoBlur("+n+")' list='pnolist' name='pno'/>"+
					"<datalist id='pnolist'>"+
						"<c:forEach var='nl' items='${pnoList}'>"+
							"<option value='${nl.pno}'>${nl.pno}</option>"+
						"</c:forEach>"+
					"</datalist>"+
				"</td>"+
				"<td>"+
					"<input id='pname_"+n+"' onblur='pnameBlur("+n+")' list='pnamelist' name='pname'/>"+
					"<datalist id='pnamelist'>"+
						"<c:forEach var='nl' items='${pnameList}'>"+
							"<option value='${nl.pname}'>${nl.pname}</option>"+
						"</c:forEach>"+
					"</datalist>"+
				"</td>"+
				"<td width='120px'><select id='sel_"+n+"' name='psize' onChange='selSize("+n+")'></select></td>"+
				"<td width='60px'><input name='punit' value='t'/></td>"+
				"<td width='120px'><input id='pprice_"+n+"' name='pprice'/></td>"+
				"<td width='120px'><input id='pnum_"+n+"' name='pnum' onblur='countPrice("+n+")'/></td>"+
				"<td><input id='ptprice_"+n+"' name='msubtotal' readonly='readonly'/></td>"+
				"<td><input id='delBtn_"+n+"' onclick=del("+n+") type='button' class='btn btn-danger' value='删除'/></td>"+
			"</tr>"
		);
	});
	/*删除行*/
	function dele(e,id,orderno){
		var trl = $('#tabs tr').length;
		if (trl==3) {
			$.messager.confirm('确认对话框', '已是最后一条数据，删除后此订单将被删除，确定删除吗？', function(r){
				if (r){
				    $.post('order/toDeleteOrder',{orderno:orderno},function(data){
						if (data > 0) {
							$('#delBtn_'+e).parent().parent().remove();
							$.messager.show({
								title : '我的消息',
								msg : '删除成功',
								timeout : 5000,
								showType : 'show'
							});
							location.href='order/toList';
						} else {
							$.messager.show({
								title : '我的消息',
								msg : '删除失败，联系管理员',
								timeout : 5000,
								showType : 'show'
							});
						}
					});
				}
			});
		} else {
			$.messager.confirm('确认对话框', '确定删除吗？', function(r){
				if (r){
				    $.post('order/toDelete',{id:id},function(data){
						if (data > 0) {
							$('#delBtn_'+e).parent().parent().remove();
							$.messager.show({
								title : '我的消息',
								msg : '删除成功',
								timeout : 5000,
								showType : 'show'
							});
							var total = 0;
							$('input[id^="ptprice"]').each(function(){
								total+= parseFloat($(this).val())||0;
								parseFloat(total).toFixed(2);
							});
							$('#total').val(total);
						} else {
							$.messager.show({
								title : '我的消息',
								msg : '删除失败，联系管理员',
								timeout : 5000,
								showType : 'show'
							});
						}
					});
				}
			});
		}
	}
	function del(e){
		var trl = $('#tabs tr').length;
		if (trl==3) {
			$.messager.confirm('确认对话框', '已是最后一条数据，删除后此订单将被删除，确定删除吗？', function(r){
				if (r){
				    $.post('order/toDeleteOrder',{orderno:orderno},function(data){
						if (data > 0) {
							$('#delBtn_'+e).parent().parent().remove();
							$.messager.show({
								title : '我的消息',
								msg : '删除成功',
								timeout : 5000,
								showType : 'show'
							});
							location.href='order/toList';
						} else {
							$.messager.show({
								title : '我的消息',
								msg : '删除失败，联系管理员',
								timeout : 5000,
								showType : 'show'
							});
						}
					});
				}
			});
		} else {
			$.messager.confirm('确认对话框', '确定删除吗？', function(r){
				if (r){
					$('#delBtn_'+e).parent().parent().remove();
				}
			});
		}
	}
		
	/* 货物编号失焦事件 */
	function pnoBlur(e){
		/* 判断产品型号在此订单中是否已存在  */
		var pno = $('#pno_'+e).val();
		$('input[id^="pno"]').not('#pno_'+e).each(function(){
			if (pno==$(this).val()) {
				$.messager.alert('已存在','此型号产品在这个订单中已存在','info');
				$('#pno_'+e).val('');
			}
		});
		if (pno!=null&&pno!='') {
			$.post('order/toSelectByPno',{pno:$('#pno_'+e).val()},function(data){
				$('#sel_'+e).empty();
				for (var i=0;i<data.length;i++){
					$('#pname_'+e).val(data[i].pname);
					$('#pprice_'+e).val(data[i].pprice);
					/*select框选项遍历*/
					var option = document.createElement('option');
                    $(option).val(data[i].psize);  
                    $(option).text(data[i].psize);  
					$('#sel_'+e).append(option);
					/*产品变更小计金额计算*/
					if ($('#pnum_'+e).val()!=null&&$('#pnum_'+e).val()!='') {
						countPrice(e);
					}
				}
			});
		}
	}
	/* 货物名称失焦事件 */
	function pnameBlur(e){
		console.log($('#pname_'+e).val());
		if ($('#pname_'+e).val()!=null&&$('#pname_'+e).val()!='') {
			$.post('order/toSelectByPname',{pname:$('#pname_'+e).val()},function(data){
				$('#sel_'+e).empty();
				for (var i=0;i<data.length;i++){
					/*select框选项遍历*/
					var option = document.createElement('option');
                    $(option).val(data[i].psize);  
                    $(option).text(data[i].psize);  
					$('#sel_'+e).append(option);
				}
			});
		}
	}
	/*型号选中失焦事件*/
	function selSize(e){
		var psize = $("#sel_"+e+" option:selected").val();
		console.log(psize);
		$.post('order/toSelectByPsize',{psize:psize},function(data){
			for (var i=0;i<data.length;i++){
				$('#pno_'+e).val(data[i].pno);
				$('#pprice_'+e).val(data[i].pprice);
				/*型号变更小计金额计算*/
				if ($('#pnum_'+e).val()!=null&&$('#pnum_'+e).val()!='') {
					countPrice(e);
				}
			}
		});
	}
	/*数量输入计算金额失焦事件*/
	function countPrice(e){
		var pnum = $('#pnum_'+e).val();
		var pno = $('#pno_'+e).val();
		if (pnum!=''&&pnum!=null&&pno!=''&&pno!=null) {
			$.post('order/selectPnumByPno',{pnum:pnum,pno:pno},function(data){
				if (data<pnum) {
					$('#cho').dialog({    
					    title: '库存不足！',    
					    width: 600,    
					    height: 300,    
					    closed: false,    
					    cache: false,    
					    href: 'order/concon',    
					    modal: true   
					}); 
				}
			});
		}
		if (pnum!=''&&pnum!=null) {
			var price = parseFloat($('#pprice_'+e).val());
			var num = parseFloat(pnum).toFixed(2);
			var count = parseFloat(price*num).toFixed(2);
			$('#ptprice_'+e).val(count);
		}
		/*合计*/
		var total = 0;
		$('input[id^="ptprice"]').each(function(){
			total+= parseFloat($(this).val())||0;
		});
		total =	total.toFixed(2);
		$('#total').val(total);
	}
	/*小计金额改变事件*/
	$(document).on('change','input[id^="ptprice"]',function(){
		var total = 0;
		$('input[id^="ptprice"]').each(function(){
			total+= parseFloat($(this).val())||0;
			parseFloat(total).toFixed(2);
		});
		$('#total').val(total);
	});
	$(function(){
		$('#editForm').bootstrapValidator({
			message : 'This value is not valid',
			/* feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			}, */
			fields : {
				cname : {
					message : '名称验证失败',
					validators : {
						notEmpty : {
							message : '姓名不能为空'
						},
						regexp : {
							regexp : /^[\u4E00-\u9FA5A-Za-z]+$/,
							message : '只能输入中文和英文'
						}
					}
				},
				cphone : {
					validators : {
						notEmpty : {
							message : '请输入手机号码'
						},
						regexp : {
							regexp : /^[1][3,4,5,7,8][0-9]{9}$/,
							message : '手机号码格式错误'
						}
					}
				},
				ename : {
					validators : {
						regexp : {
							regexp : /^[^%&',;=?$\x22]+$/,
							message : '不能输入此类字符'
						}
					}
				},
				pno : {
					validators : {
						notEmpty : {
							message : '请选择产品编号'
						},
						regexp : {
							regexp : /^[1-9]\d*$/,
							message : '不能输入此类字符'
						}
					}
				},
				pname : {
					validators : {
						notEmpty : {
							message : '请选择产品名称'
						},
						regexp : {
							regexp : /^[^%&',;=?$\x22]+$/,
							message : '不能输入此类字符'
						}
					}
				},
				pprice : {
					validators : {
						notEmpty : {
							message : '请输入单价'
						},
						regexp : {
							regexp : /^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/,
							message : '不能输入此类字符'
						}
					}
				},
				pnum : {
					validators : {
						notEmpty : {
							message : '请输入数量'
						},
						regexp : {
							regexp : /^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/,
							message : '不能输入此类字符'
						}
					}
				},
				msubtotal : {
					validators : {
						notEmpty : {
							message : '数据改动，请检查是否有误'
						},
						regexp : {
							regexp : /^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/,
							message : '数据改动，请检查是否有误'
						}
					}
				},
				remark : {
					validators : {
						regexp : {
							regexp : /^[^%&',;=?$\x22]+$/,
							message : '不能输入此类字符'
						}
					}
				},
				carea : {
					validators : {
						notEmpty : {
							message : '请输入客户地址'
						},
						regexp : {
							regexp : /^[^%&',;=?$\x22]+$/,
							message : '不能输入此类字符'
						}
					}
				},
			}
		});
	});
	/*验证*/
	$('#valiEdit').click(function() {
		$('#editForm').data('bootstrapValidator').validate();//启用验证
		var flag = $('#editForm').data('bootstrapValidator').isValid();//验证是否通过true/false
		if (flag == true) {
			$('#editForm').form({
				url : 'order/toUpdate',
				success : function(data) {
					if (data > 0) {
						$('#success').dialog({    
						    title: '保存成功',    
						    width: 600,    
						    height: 300,    
						    closed: false,    
						    cache: false,    
						    href: 'order/updSuccess',    
						    modal: true,
						    onClose : function(){
								location.reload();
							}    
						});
					} else {
						$.messager.show({
							title : '我的消息',
							msg : '更改失败，请检查输入是否有误',
							timeout : 5000,
							showType : 'show'
						});
					}
				}
			});
			// submit the form    
			$('#editForm').submit();
		} else {
			$.messager.show({
				title : '我的消息',
				msg : '保存失败，请检查订单输入是否有误',
				timeout : 5000,
				showType : 'show'
			});
		}
	});
	$('#goBack').click(function(){
		window.history.go(-1);
	});
	function choClose(){
		$('#cho').window('close'); 
	}
</script>
</body>
</html>
