<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h1 align="center">
	<font color="#38BFC0" size="6em">添加客户信息</font>
</h1>
<form id="addForm" method="post" class="form-horizontal container">
	<div class="col-xs-8  col-xs-offset-2">
		<div class="form-group">
			<label class="col-lg-3 control-label"><font color="black"
				size="3em">客户名称</font> </label>
			<div class="col-lg-8">
				<input type="text" class="form-control" name="cname" id="cname"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-lg-3 control-label"><font color="black"
				size="3em">客户类型</font> </label>
			<div class="col-lg-8">
				<select class="form-control"  name="csort">
					<option selected="selected" value="">选择客户类型</option>
					<option value="个人">个人</option>
					<option value="企业">企业</option>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label class="col-lg-3 control-label"><font color="black"
				size="3em">客户电话</font> </label>
			<div class="col-lg-8">
				<input type="text" class="form-control" name="cphone" />
			</div>
		</div>

		<div class="form-group">
			<label class="col-lg-3 control-label"><font color="black"
				size="3em">从事行业</font> </label>
			<div class="col-lg-8">
				<input type="text" class="form-control" name="business" />
			</div>
		</div>

		<div class="form-group">
			<label class="col-lg-3 control-label"><font color="black"
				size="3em">客户区域</font> </label>
			<div class="col-lg-2 control-label">
				<select class="form-control" id="s_province1" name="province"></select>
			</div>
			<div class="col-lg-2 control-label">
				<select class="form-control" id="s_city1" name="city"></select>
			</div>
			<div class="col-lg-2 control-label">
				<select class="form-control" id="s_county1" name="area" style="width:150px"></select>
			</div>
			<script>
				InitArea1("", "", "");
			</script>
		</div>
		<div class="form-group">
			<label class="col-lg-3 control-label"><font color="black"
				size="3em">详细地址</font> </label>
			<div class="col-lg-8">
				<input type="text" class="form-control" name="address" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-lg-3 control-label"><font color="black"
				size="3em">业务员</font> </label>
			<div class="col-lg-8">
				<select id="selEname" onChange="sel()" class="form-control">
					<option selected="selected" value="">选择业务员</option>
					<c:forEach items="${enameList}" var="el">
						<option value="${el.ename}">${el.ename}</option>
					</c:forEach>
				</select>
				<input type="hidden" id="ename" name="ename" />
			</div>
		</div>
	</div>

	<div class="col-lg-8 col-lg-offset-2" style="margin-top:25px">
		<div class="form-group" align="center">
			<button type="button" class="btn btn-success" id="valiBtn">保存</button>
			<button type="button" class="btn btn-warning" id="resetBtn">重置</button>
			<button type="button" class="btn btn-primary" onclick="closeAdd()">关闭</button>
		</div>
	</div>
</form>
</body>
<script type="text/javascript">
	$(function() {
		$('#addForm').bootstrapValidator({
			message : 'This value is not valid',
			fields : {
				cname : {
					message : '姓名验证失败',
					validators : {
						notEmpty : {
							message : '名称不能为空'
						},
						threshold: 2,		//有二个以上字符发送ajax请求
                        remote:{
                        	message: '此客户已存在',
                        	url: 'client/checkClientName',
                        	delay: 2000,	//两秒发送一次ajax
                        	type: 'post',
                        	data:{
                        		cname:$('#cname').val()
                        	},
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
				address : {
					validators : {
						notEmpty : {
							message : '详细地址不能为空'
						},
					}
				},
				ename : {
					validators : {
						notEmpty : {
							message : '业务员不能为空'
						},
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
	$("#resetBtn").click(function() {
		$("#addForm").data('bootstrapValidator').resetForm(true);
	});
	$("#valiBtn").click(function() {
		$("#addForm").data('bootstrapValidator').validate();//启用验证
		var flag = $("#addForm").data('bootstrapValidator').isValid();//验证是否通过true/false
		/* 添加保存对话窗口 */
		if (flag == true) {
			$("#addForm").form({
				url : 'client/toSave',
				success : function(data) {
					if (data > 0) {
						$.messager.show({
							title : '我的消息',
							msg : '保存成功',
							timeout : 5000,
							showType : 'show'
						});
						$("#add").window('close'); // close a window  
						$("#dg").datagrid('reload');
					} else {
						$.messager.show({
							title : '我的消息',
							msg : '保存失败，联系管理员',
							timeout : 5000,
							showType : 'show'
						});
					}
				}
			});
			// submit the form    
			$('#addForm').submit();
		} else {
			/* alert("输入有误"); */
		}
	});
	/* 添加窗口关闭 */
	function closeAdd() {
		$("#add").window('close'); // close a window  
	}
</script>
