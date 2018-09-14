<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->


<h1 align="center">
	<font color="#38BFC0" size="6em">更改客户信息</font>
</h1>
<form id="editForm" method="post" class="form-horizontal container">
	<div class="col-xs-8  col-xs-offset-2">
		<c:forEach items="${editList}" var="cli">
			<input type="hidden" name="id" value="${cli.id}" />
			<div class="form-group">
				<label class="col-lg-3 control-label"><font color="black"
					size="3em">客户名称</font> </label>
				<div class="col-lg-8">
					<input type="text" class="form-control" name="cname"
						value="${cli.cname}" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label"><font color="black"
					size="3em">客户类型</font> </label>
				<div class="col-lg-8">
				<select class="form-control" name="csort">
					<option selected="selected" value="${cli.csort}">${cli.csort}</option>
					<option value="个人">个人</option>
					<option value="企业">企业</option>
				</select>
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-3 control-label"><font color="black"
					size="3em">客户电话</font> </label>
				<div class="col-lg-8">
					<input type="text" class="form-control" name="cphone"
						value="${cli.cphone}" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-3 control-label"><font color="black"
					size="3em">从事行业</font> </label>
				<div class="col-lg-8">
					<input type="text" class="form-control" name="business"
						value="${cli.business}" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-3 control-label"><font color="black"
					size="3em">地址</font> </label>
				<div class="col-lg-8">
					<input type="text" class="form-control" name="carea"
						value="${cli.carea}" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label"><font color="black"
					size="3em">业务员</font> </label>
				<div class="col-lg-8">
					<select id="selEname" onchange="sel()" class="form-control">
						<option selected="selected">${cli.ename}</option>
					<c:forEach items="${enameList}" var="el">
						<option value="${el.ename}">${el.ename}</option>
					</c:forEach>
				</select>
				<input type="hidden" id="ename" name="ename" value="${cli.ename}"/>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="col-xs-8 col-xs-offset-2" style="margin-top:25px">
		<div class="form-group" align="center">
			<button type="button" class="btn btn-primary" id="valiEdit">保存</button>
			<button type="button" class="btn btn-warning" id="resetEdit">重置</button>
			<button type="button" class="btn btn-danger" onclick="closeEdit()">关闭</button>
		</div>
	</div>
</form>
</body>
<script type="text/javascript">
	$(function() {
		$('#editForm').bootstrapValidator({
			message : 'This value is not valid',
			fields : {
				cname : {
					message : '姓名验证失败',
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
				post : {
					validators : {
						notEmpty : {
							message : '邮编不能为空'
						},
						regexp : {
							regexp : /^[0-9]{6}$/,
							message : '邮编格式错误'
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
				csort : {
					validators : {
						notEmpty : {
							message : '客户类型不能为空'
						},
						regexp : {
							regexp : /^[\u4E00-\u9FA5A-Za-z]+$/,
							message : '只能输入中文和英文'
						}
					}
				},
				carea : {
					validators : {
						notEmpty : {
							message : '地址不能为空'
						},
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
				business : {
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
	function sel(){
		var ename = $('#selEname option:selected').val();
		$('#ename').val(ename);
	}
	$("#resetEdit").click(function() {
		$("#editForm").data('bootstrapValidator').resetForm(true);
	});
	$("#valiEdit").click(function() {
		$("#editForm").data('bootstrapValidator').validate();//启用验证
		var flag = $("#editForm").data('bootstrapValidator').isValid();//验证是否通过true/false
		if (flag == true) {
			$("#editForm").form({
				url : "client/toUpdate",
				success : function(data) {
					if (data > 0) {
						$.messager.show({
							title : '我的消息',
							msg : '更改成功',
							timeout : 5000,
							showType : 'show'
						});
						$("#edit").window('close'); // close a window  
						$("#dg").datagrid('reload');
					} else {
						$.messager.show({
							title : '我的消息',
							msg : '更改失败，联系管理员',
							timeout : 5000,
							showType : 'show'
						});
					}
				}
			});
			// submit the form    
			$('#editForm').submit();
		} else {
			/* alert("输入有误"); */
		}
	});
	/* 编辑窗口关闭 */
	function closeEdit() {
		$("#edit").window('close'); // close a window  
	}
</script>

