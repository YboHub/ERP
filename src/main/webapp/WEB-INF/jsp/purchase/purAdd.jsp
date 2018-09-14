<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新增申请单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/css.css" />
	<link rel="stylesheet" href="easyui/themes/default/easyui.css" type="text/css"></link>
	<link rel="stylesheet" href="easyui/themes/icon.css" type="text/css"></link>
	<script type="text/javascript" src="easyui/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>
	<style type="text/css">
	*{margin:0;padding:0;}
	#add{height: 31px;width: 97px;color: white;background-color: #1f9fba;font-size: 16px;border-radius: 7px;border: 0;position: relative;top: 0;left: 10px;}
	#sb{height: 31px;width: 75px;color: white;background-color: #1f9fba;font-size: 16px;border-radius: 7px;position: relative;left:105px;;border: 0;top: 0;}
	#delete{height: 31px;width: 75px;color: white;background-color: #1f9fba;font-size: 16px;border-radius: 7px;;border: 0;position: relative;left: -140px;top: 0;}
	#selectONe{height: 31px;width: 75px;color: white;background-color: #1f9fba;font-size: 16px;border-radius: 7px;border: 0;position: relative;top: 70px;left: 300px;}
	#s_cargoDetail{padding-top:20px;}
	.ddd{border:0;}
	.ddd td{width:200px;padding:10px 0 0 10px;border:0;}
	.head{margin-left: 22px;margin-bottom: 40px;margin-top: -55px;}
	.head span{color: #1567c3cc;margin: 35px auto auto 14px;display: block;font-size: 18px;}
	#updateDiv_tt{border:0px;}
	#updateDiv{padding:10px 0 0 20px;}
	#cargoCanKao{float:right;display:inline;}
	.panel-tool{right:25px;}
</style>
  </head>
  
  <body>
  	<!-- 货物详情 -->
	<div id="search" >
		<input type="button" id="add" value="添加采购货物" />	
		<input type="button" id="sb" value="提交表单" />
		<input type="button" id="selectONe" onclick="selectONe()" value="生产计划"/>
		<input type="button" id="delete" value="删除"/>
		<table id="cargoCanKao" style="display:none"></table>
		<form id="s_cargoDetail" method="post">
			<div class="head">
				<span>申请单编号<input id="serialnum" readonly="readonly" name="orderid" value="${gen}"></span><br>
				<span>申请单备注<input id="title" class="easyui-validatebox" data-options="required:true" name="reason"></span>
			</div>	
		<table class="ddd" id="ddd">
			<tr>
				<th>物品名称</th>
				<th>型号</th>
				<th>供货商</th>
				<th>单价</th>
				<th>购买重量</th>
				<th>总价</th>
			</tr>
     </table>
		</form>
	</div>
  <div id="selectONeP"></div>
  <script type="text/javascript">
   //点击添加选择货物行事件
		$(function(){
			var i = -1;
		 	$("#add").click(function(){
			i++;
				$("#ddd").append(
			"<tr><td><input id='goodsname"+i+"' name='goodsname' required='true' /></td>" 
          
			+" <td><input id='goodstype"+i+"' name='types' required='true'/></td> "  
           
        	+" <td><input id='company"+i+"' name='company' required='true'/></td>" 
        	
        	+" <td><input id='price"+i+"' name='price' required='true' readonly/>￥/T</td>"
        	+" <td><input id='weights"+i+"' name='weights' required='true'/>T</td>"
        	
        	+" <td><input id='money"+i+"' name='money' data-options='min:0,precision:2' readonly/>￥</div></td></tr>");
			
				$('#goodsname'+i).combobox({  
				    url:'getBMName',    
				    valueField:'goodsname',    
				    textField:'goodsname', 
				    width:130,
				    onChange: function(newValue, oldValue){
				    	var curIndex = this.id.replace("goodsname","");
				    	var url = 'getSpecificate?goodsname='+newValue;
				    	$('#goodstype'+curIndex).combobox('clear'); 
				    	$('#goodstype'+curIndex).combobox('reload',url);
				    	$('#company'+curIndex).combobox('clear');
				    	$('#price'+curIndex).combobox('clear');
				    }
				}); 
				$('#goodstype'+i).combobox({ 
					valueField:'goodstype',
					textField:'goodstype',
					width:100,
					//数据加载成功时 直接在显示框中显示 类型
					onLoadSuccess:function(){
						$(this).combobox('setValue',$(this).combobox('getData')[0].goodstype);
					},
					onChange: function(newValue, oldValue){  
						 var curIndex = this.id.replace("goodstype",""); 
				         var url = 'a'+$('#goodstype'+curIndex).combobox('options').url+'&goodstype='+newValue;
				         $('#company'+curIndex).combobox('reload', url); 
				          }
				});
				
				$('#company'+i).combobox({ 
					valueField:'company',
					textField:'company',
					width:130,
					onChange: function(newValue, oldValue){
						var curIndex = this.id.replace("company",""); 
						var url = 'a'+$('#company'+curIndex).combobox('options').url+'&company='+newValue;
        				$('#price'+curIndex).combobox('reload', url);
					}
				});
				$('#price'+i).combobox({ 
					valueField:'price',
					textField:'price',
					width:100,
					//数据加载成功后 直接在显示框中显示 报价
					onLoadSuccess:function(){
						$(this).combobox('setValue',$(this).combobox('getData')[0].price);
					},
					//输入框中值改变
					onChange: function(newValue, oldValue){
					 var curIndex = this.id.replace("price","");
					 var b = newValue*$('#weights'+curIndex).numberspinner('getValue');
					 $('#money'+curIndex).numberbox('setValue', b);
					}
					
				});
				$('#weights'+i).numberspinner({    
				    min:0,    
				    precision:2,
				    width:100,
				    onChange:function(newValue,oldValue){
				    var curIndex = this.id.replace("weights",""); 
				    var a = $('#price'+curIndex).combobox('getValue');
			        var b = a*newValue;
			        $('#money'+curIndex).numberbox('setValue', b);
				    }
				});  
				$('#money'+i).numberbox({
					min:0,    
				    precision:2,
				    width:100
				});
			});
			/*删除按钮事件*/
			$('#delete').click(function(){
				if($("#ddd tr").length == 1){
					$.messager.alert('警告','不能删除'); 
				}else{
					i--;
					$("#ddd tr:last").remove();
				}
			});
			/* 提交按钮的点击事件 */ 
			$('#sb').click(function(){
				$.messager.progress();	// 显示进度条
				$('#s_cargoDetail').form('submit', {
				url:'insertCargo',
				onSubmit: function(){
					var isValid = $(this).form('validate');
					if (!isValid){
						$.messager.progress('close');	// 如果表单是无效的则隐藏进度条
					}
					return isValid;	// 返回false终止表单提交
				},
			success: function(){
				$.messager.progress('close'); // 如果提交成功则隐藏进度条
				$.messager.show({
						title:'消息',
						msg:'已提交',
						timeout:5000,
						showType:'slide'
					});
				$(function(){
					location.href="<%=path%>/toListOne";
				});
				
			}
		});		
	});
}); 
/*生产计划详情*/
function selectONe(){
			$("#selectONeP").dialog({    
			    title: '生产计划详情',    
			    width: 880,    
			    height: 400,    
			    closed: false,    
			    cache: false,    
			    href: 'selectPurdaction',    
			    modal: true   
			});  
		}
  </script>
   
  </body>
</html>
