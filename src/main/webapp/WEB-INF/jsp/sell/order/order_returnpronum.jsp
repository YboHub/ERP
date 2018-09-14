<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <form id="returnProInfo" method="post" class="form-horizontal">
	<div class="col-xs-8  col-xs-offset-2  container">
		<div class="form-group">
			<label class="col-lg-4 control-label"><font color="black"
				size="3em">订单编号</font> </label>
			<div class="col-lg-8">
				<input type="text" class="form-control" name="rorderno" id="rorderno" value="${ropInfo.orderno}" readonly="readonly"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-lg-4 control-label"><font color="black"
				size="3em">货物编号</font> </label>
			<div class="col-lg-8">
				<input type="text" class="form-control" name="rpno" id="rpno" value="${ropInfo.pno}" readonly="readonly"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-lg-4 control-label"><font color="black"
				size="3em">货物名称</font> </label>
			<div class="col-lg-8">
				<input type="text" class="form-control" name="rpname" id="rpname" value="${ropInfo.pname}" readonly="readonly"/>
			</div>
		</div>
		<c:set var="rpnum" value="${ropInfo.pnum}"></c:set>
		<div class="form-group">
			<label class="col-lg-4 control-label"><font color="black"
				size="3em">退回数量</font> </label>
			<div class="col-lg-8">
				<input type="text" class="form-control" name="rpnum" id="rpnum" value="${ropInfo.pnum}" onblur="countRsubtotal()"/>
			</div>
		</div>

		<div class="form-group">
			<label class="col-lg-4 control-label"><font color="black"
				size="3em">单价</font> </label>
			<div class="col-lg-8">
				<input type="text" class="form-control" name="rprice" id="rprice" value="${ropInfo.pprice}"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-lg-4 control-label"><font color="black"
				size="3em">退还金额</font> </label>
			<div class="col-lg-8">
				<input type="text" class="form-control" name="rsubtotal" id="rsubtotal"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-lg-4 control-label"><font color="black"
				size="3em">客户退回原因</font> </label>
			<div class="col-lg-8" id="rd">
				<textarea class="form-control" name="returnreason" id="returnreason"></textarea>
			</div>
		</div>
		<div class="col-lg-8 col-lg-offset-2" style="margin-top:25px">
			<div class="form-group" align="center">
				<button type="button" class="btn btn-primary" id="ros" onclick="returnOrderSave()">保存</button>
			</div>
		</div>
	</div>
	<input type="hidden" value="${ropInfo.id}" name="opid" id="opid"/>
	<input type="hidden" value="16" name="rtype"/>
</form>
<script type="text/javascript">
	function countRsubtotal(){
		$.post('order/returnedQuantity',{opid:$('#opid').val()},function(data){
			var rpnum = ${rpnum};
			var surplus = rpnum - data;
			console.log(surplus);
			if ($('#rpnum').val()>(surplus)) {
				console.log('error');
				$.messager.alert('错误提示','退货数量已超过订单货物数量','info');
				$('#rpnum').val('');
			} else {
				$('#rsubtotal').val(
					parseFloat($('#rpnum').val()*$('#rprice').val()).toFixed(2)
				);
			}
		});
	}
	$(function() {
		$('#rsubtotal').val(
			parseFloat($('#rpnum').val()*$('#rprice').val()).toFixed(2)
		);
		$('#returnProInfo').bootstrapValidator({
			message : 'This value is not valid',
			/* feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			}, */
			fields : {
				rpnum : {
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
				rprice : {
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
				rsubtotal : {
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
				returnreason : {
					validators : {
						regexp : {
							regexp : /^[^%&',;=?$\x22]+$/,
							message : '不能输入此类字符'
						}
					}
				},
			}
		});
	});
	/* 保存 */
	function returnOrderSave(){
		countRsubtotal();
		$('#returnProInfo').data('bootstrapValidator').validate();//启用验证
		var flag1 = $('#returnProInfo').data('bootstrapValidator').isValid();//验证是否通过true/false
		/* 添加保存对话窗口 */
		if (flag1 == true) {
			$('#returnProInfo').form({
				url : 'order/saveReturnOrder',
				success : function(data){
					if (data > 0) {
						$.messager.show({
							title : '我的消息',
							msg : '保存成功',
							timeout : 5000,
							showType : 'show'
						});
						$('#returnNum').window('close');
					} else {
						$.messager.show({
							title : '我的消息',
							msg : '保存失败，请检查输入是否有误',
							timeout : 5000,
							showType : 'show'
						});
					}
				}
			});
			$('#returnProInfo').submit();
		} else {
			$.messager.show({
				title : '我的消息',
				msg : '保存失败，请检查输入是否有误',
				timeout : 5000,
				showType : 'show'
			});
		}
	}
</script>
