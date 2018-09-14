<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'proRecordAdd.jsp' starting page</title>
    
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
	<script type="text/javascript" src="easyui/jquery-1.8.3.min.js"></script>   
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>  
	<script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>

  </head>
  
  <body>
  	<div id="tb" style="height:auto">
  		<h3>生产记录新增操作表</h3>
		<div>
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append()">添加</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit()">删除</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="accept()">提交</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="goback()">返回</a>
		</div>
	</div>
	<!--  
		一个URL从远程站点请求数据。  
		顶部工具栏的DataGrid面板。toolbar: '#tb', 
	         如果为true，则只允许选择一行。singleSelect:true,
	         真正的自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动。fitColumns:true,
	         是否显示斑马线效果 striped:true,
	         如果为true，则在DataGrid控件底部显示分页工具栏。pagination:true,
	         如果为true，则显示一个行号列。 rownumbers:true,
	-->
    <table id="dg" class="easyui-datagrid"  
        data-options="fitColumns:true,
        			  singleSelect:false,
        			  striped:true,
        			  rownumbers:true,
        			  toolbar: '#tb',
        			  method: 'get',
        			  selectOnCheck:true,
        			  onClickRow: onClickRow">   
	    <thead>   
	        <tr>
	        	<th data-options="field:'ck',checkbox:true"></th>   
	            <th data-options="field:'goodstype',width:100,editor:{
	            												type:'combobox',
	            												options:{
	            													url:'proRecord/getType',  
								                                    valueField:'id',   
								                                    textField:'goodstype',  
								                                    onSelect: function (data) {  
								                                        var row = $('#dg').datagrid('getSelections');
								                                        for ( var i = 0; i < row.length; i++) {
									                                        var rowIndex = $('#dg').datagrid('getRowIndex',row[i]);
									                                        var thisTarget = $('#dg').datagrid('getEditor', {'index':rowIndex,'field':'goodstype'}).target;  
									                                        var value = thisTarget.combobox('getValue'); 
									                                        var target = $('#dg').datagrid('getEditor', {'index':rowIndex,'field':'cid'}).target;
									                                        var val=target.combobox('getValue');
									                                        if(val > value * 3 || val < value * 3 - 2){
									                                        	target.combobox('clear');
									                                        }  
									                                        var url = 'proRecord/clist?id='+value;  
									                                        target.combobox('reload', url);//联动下拉列表重载  	
								                                        };  
								                                        
								                                    },  
	            													required:true
	            													}
	            												}">产品类型</th>   
	            <th data-options="field:'cid',width:100,
       							editor:{
       									type:'combobox',
								  		options:{
								  				  valueField:'cid',
												  textField:'cxian',
												  url:'proRecord/clist',
										 		  required:true
										 		  }
										}">生产线</th>   
	            <th data-options="field:'inventoryunit',width:100,editor:{type:'numberbox',options:{required:true,precision:1,min:10,max:50}}">重量(范围10-50)t</th>   
	        </tr>   
	    </thead>   
	</table>  
	<input id="dnumber" type="hidden" value="${dnumber}"/>
	<script type="text/javascript">
		$(function(){
			append();
		});
		var editIndex = undefined;
		var dnumber=$("#dnumber").val();
		function onClickRow(index){
			if (editIndex != index){
				if (endEditing()){
					$('#dg').datagrid('selectRow', index)
							.datagrid('beginEdit', index);
					editIndex = index;
				} else {
					$('#dg').datagrid('selectRow', editIndex);
				}
			}
		}
		function append(){
			$('#dg').datagrid('appendRow',{prono:''});
			editIndex = $('#dg').datagrid('getRows').length-1;
			$('#dg').datagrid('selectRow', editIndex)
					.datagrid('beginEdit', editIndex);
		}
		function removeit(){
			var row=$("#dg").datagrid("getSelections");
			if(row.length>0){
				for ( var i = 0; i < row.length; i++) {
					var data=row[i];
					var thisIndex=$('#dg').datagrid('getRowIndex',data);
					$('#dg').datagrid('cancelEdit', editIndex)
						.datagrid('deleteRow', thisIndex);
				}
			}
		}
		//保存按钮,多条数据一起提交
		function accept(){
			var row=$("#dg").datagrid("getSelections");
	        if (confirm("您确定提交数据吗？")) {
				if (row.length>0) {
					/* var prono=[]; */
					var type=[];
					var weight=[];
					var num=[];
					var n=0;
					for ( var i = 0; i < row.length; i++) {
						var data=row[i];
						var thisIndex=$('#dg').datagrid('getRowIndex',data);
						if ($('#dg').datagrid('validateRow', thisIndex)){
							$('#dg').datagrid('endEdit', thisIndex);
							/* prono[i] = row[i].productionnum; */
							type[i] = row[i].goodstype;
							weight[i] = row[i].inventoryunit;
							num[i] = row[i].cid;
							n++;
						}else{
							alert("请完成表格再执行提交！");
							break;
						}
					}
					if(n==row.length){
						
						$.post("proRecord/proSave",{type:type,weight:weight,num:num,dnumber:dnumber}, function(date) {
		                    if(date==1){
		                        removeit();
		                        goback();
		                        $.messager.show({
									title:'消息',
									msg:'提交成功！',
									timeout:2000,
									showType:'show',
									style:{
										right:'',
										top:document.body.scrollTop+document.documentElement.scrollTop,
										bottom:''
									}
								});
		                    }else{
		                    	alert("提交错误了！");
		                    } 
		                });
					}
				}else{
					alert("请选择需要添加的行！");
				}
			}
        	
	    }
	    //返回
		function goback(){
			location.href="proRecord/toList?dnumber="+dnumber;
		}
	</script>
  </body>
</html>
