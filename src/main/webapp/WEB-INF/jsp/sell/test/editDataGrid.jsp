<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'editDataGrid.jsp' starting page</title>

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
	This is my JSP page.
	<br>
	<table id="tt"></table>
	<script type="text/javascript">
		$(function(){
    		$('#tt').datagrid({
    			title:'Editable DataGrid',
    			iconCls:'icon-edit',
    			width:660,
    			height:250,
    			singleSelect:true,
    			idField:'itemid',
    			url:'sellProInfo/datagrid',
    			columns:[[
    				{field:'goodsnum',title:'Item ID',width:60},
    				{field:'pname',title:'Product',width:100,
    					formatter:function(value){
    						for(var i=0; i<products.length; i++){
    							if (products[i].productid == value) return products[i].name;
    						}
    						return value;
    					},
    					editor:{
    						type:'combobox',
    						options:{
    							valueField:'pname',
    							textField:'name',
    							/* data:products, */
    							required:true
    						}
    					}
    				},
    				{field:'psize',title:'List Price',width:80,align:'right',editor:{type:'numberbox',options:{precision:1}}},
    				{field:'inventoryunit',title:'Unit Cost',width:80,align:'right',editor:'numberbox'},
    				{field:'warehousenum',title:'Attribute',width:150,editor:'text'},
    				/* {field:'status',title:'Status',width:50,align:'center',
    					editor:{
    						type:'checkbox',
    						options:{
    							on: 'P',
    							off: ''
    						}
    					}
    				}, */
    				{field:'action',title:'Action',width:70,align:'center',
    					formatter:function(value,row,index){
    						if (row.editing){
    							var s = '<a href="#" onclick="saverow(this)">Save</a> ';
    							var c = '<a href="#" onclick="cancelrow(this)">Cancel</a>';
    							return s+c;
    						} else {
    							var e = '<a href="#" onclick="editrow(this)">Edit</a> ';
    							var d = '<a href="#" onclick="deleterow(this)">Delete</a>';
    							return e+d;
    						}
    					}
    				}
    			]],
    			onBeforeEdit:function(index,row){
    				row.editing = true;
    				updateActions(index);
    			},
    			onAfterEdit:function(index,row){
    				row.editing = false;
    				updateActions(index);
    			},
    			onCancelEdit:function(index,row){
    				row.editing = false;
    				updateActions(index);
    			}
    		});
    	});
    	function updateActions(index){
    		$('#tt').datagrid('updateRow',{
    			index: index,
    			row:{}
    		});
    	}
    	function getRowIndex(target){
			var tr = $(target).closest('tr.datagrid-row');
			return parseInt(tr.attr('datagrid-row-index'));
		}
		function editrow(target){
			$('#tt').datagrid('beginEdit', getRowIndex(target));
		}
		function deleterow(target){
			$.messager.confirm('Confirm','Are you sure?',function(r){
				if (r){
					$('#tt').datagrid('deleteRow', getRowIndex(target));
				}
			});
		}
		function saverow(target){
			$('#tt').datagrid('endEdit', getRowIndex(target));
		}
		function cancelrow(target){
			$('#tt').datagrid('cancelEdit', getRowIndex(target));
		}
	</script>
</body>
</html>
