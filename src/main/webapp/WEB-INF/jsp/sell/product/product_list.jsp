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

<title>产品信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/bootstrapValidator.min.css" rel="stylesheet" />
<script type="text/javascript" src="js/area1.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.min.js"></script>
</head>

<body>
	<input id="ss"></input>
	<div id="mm" style="width:120px">
		<div data-options="name:'pno'">货物编号</div>
		<div data-options="name:'pname'">货物名称</div>
	</div>
	<a class="easyui-linkbutton" data-options="iconCls:'icon-reload'"
		onclick="clearFun()">清空</a>
	<table id="dg"></table>
	<script type="text/javascript">
		$('#dg').datagrid({
			url : 'sellProInfo/datagrid',
			onClickCell : onClickCell,
			onAfterEdit : onAfterEdit,
			fitColumns : true,
			singleSelect : true,
			rownumbers : true,
			pagination : true,
			pageSize : 10,
			pageList : [ 10, 20, 40, 60 ],
			columns : [ [ {
				field : 'pno',
				title : '货物编号',
				width : 100
			}, {
				field : 'pname',
				title : '货物名称',
				width : 100
			}, {
				field : 'psize',
				title : '货物类型',
				width : 100
			}, {
				field : 'pprice',
				title : '货物价格',
				width : 100,
				editor : 'text'
			}, {
				field : 'pnum',
				title : '库存数量',
				width : 100
			}, {
				field : 'punit',
				title : '单位',
				width : 100
			}, ] ],
		});
		//查询框
		$('#ss').searchbox({
			searcher : function(value, name) {
				//alert(value + "," + name);
				//将参数出传递到后台，得到列表数据  刷新
				$('#dg').datagrid('load', {
					name : name,
					value : value
				});
			},
			menu : '#mm',
			prompt : '请输入值'
		});
		//清空
		function clearFun() {
			//searchbox设置为空
			$('#ss').searchbox('setValue', '');
			//刷新列表
			$('#dg').datagrid('reload', {
				name : null,
				value : null
			});
		}

		var editIndex = undefined;
		function endEditing() {//该方法用于关闭上一个焦点的editing状态
			if (editIndex == undefined) {
				return true;
			}
			if ($('#dg').datagrid('validateRow', editIndex)) {
				$('#dg').datagrid('endEdit', editIndex);
				editIndex = undefined;
				return true;
			} else {
				return false;
			}
		}
		//点击单元格事件：
		function onClickCell(index, field, value) {
			if (endEditing()) {
				if (field == 'pprice') {
					$(this).datagrid('beginEdit', index);
					var ed = $(this).datagrid('getEditor', {
						index : index,
						field : field
					});
					$(ed.target).focus();
				}
				editIndex = index;
			}
			/* $('#dg').datagrid('onClickRow'); */
		}
		//单元格失去焦点执行的方法
		function onAfterEdit(index, row, changes) {
			var updated = $('#dg').datagrid('getChanges', 'updated');
			if (updated.length < 1) {
				editRow = undefined;
				$('#dg').datagrid('unselectAll');
				return;
			} else {
				// 传值
				submitForm(index, row, changes);
			}
		}

		//提交数据
		function submitForm(index, row, changes) {
			//	alert( row.resultId+"--"+changes.finalResult)daliyResultRate;
			var pno = row.pno;
			var pprice = row.pprice;
			if (pprice == '') {
				$.messager.alert('提醒', '没有录入价格！');
				$('#dg').datagrid('reload');
				return;
			}
			var pprice = changes.pprice;//改变价格
			var r = /^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;//判断输入的是正数
			if (!r.test(pprice)) {
				$.messager.alert('提醒', '请输入正数！');
				return;
			}
			$.ajax({
				type : 'post',
				async : false,
				url : 'sellProInfo/updatePrice',
				data : {
					'pno' : pno,
					'pprice' : pprice
				},
				success : function(data) {
					if (data > 0) {
						//alert("保存成功");
						$('#dg').datagrid('reload');
					}
				}
			});
		}
	</script>
</body>
</html>
