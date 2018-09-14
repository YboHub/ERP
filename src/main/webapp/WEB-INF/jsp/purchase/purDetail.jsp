<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

  <body>
  <div id="addToolsone"  data-options="region:'center'">  
  
  		
   
		<input type="button" id="addOne" onclick="addOne()" class="btn btn-info" value="添加"/>
 		
		<input type="button" id="sub" onclick="UpdateOne()"  class="btn btn-success"  value="保存"/>
		
	</div>
	<form  id="myForm">
		 <input value="${orderid}" id="orderid" name="orderid" type="hidden"/>
		 <input vlaue="" name="states" type="hidden">
	  	 <table id="purdetail" class="purdetail" border="1">
	  		<tr>
	  			<th width="130px" class="tdColor"style="text-align:center">货物名称</th>
	  			<th width="100px" class="tdColor"style="text-align:center">物品类型</th>
	  			<th width="130px" class="tdColor"style="text-align:center">供货商</th>
	  			<th width="100px" class="tdColor"style="text-align:center">单价￥</th>
	  			<th width="100px" class="tdColor"style="text-align:center">购买重量T</th>
	  			<th width="100px" class="tdColor"style="text-align:center">总额</th>
	  			<th width="40px" class="tdColor"style="text-align:center">操作</th>
	  		</tr>
	  		
	  			<c:forEach items="${purList}" var="obj" varStatus="stat">
					<tr>
		  				<td style="text-align:center">${obj.goodsname}</td>
		  				<td style="text-align:center">${obj.types}</td>
		  				<td style="text-align:center">${obj.company}</td>
		  				<td style="text-align:center">${obj.price}</td>
		  				<td style="text-align:center">${obj.weights}</td>
		  				<td style="text-align:center">${obj.money}</td>
		  				<td>
		  					<input type='button' onclick="delONe(${obj.id})" class='btn btn-danger radius' value='删除'>
		  					<input type='button' onclick="updatedetalisONe(${obj.id})" class='btn btn-info radius' value='修改'>
		  				</td>
	  				</tr>
	  			</c:forEach>
	  	 </table>
	</form>
   <script type="text/javascript">
    var orderid=$("#orderid").val();
    var i=1;
   function addOne(){
 	 i++;
   	$("#purdetail").append("<tr>"
   			+"<td><input id='goodsname"+i+"' name='goodsname' required='true' /></td>"
          
			+" <td><input id='goodstype"+i+"' name='types' required='true'/></td> "  
           
        	+" <td><input id='company"+i+"' name='company' required='true'/></td>" 
        	
        	+" <td><input id='price"+i+"' name='price' required='true'/></td>"
        	+" <td><input id='weights"+i+"' name='weights' required='true' value='' /></td>"
        	
        	+" <td><input id='money"+i+"' name='money' data-options='min:0,precision:2' readonly/></td>"
        	+" <input id='weights"+i+"' name='reason' required='true' value='' type='hidden' />"
        	+"<td id='btn"+i+"'style='width:40px;'><input type='button' class='btn btn-danger radius' value='删除'></td></tr>");
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
					//数据加载成功是 直接在显示框中显示 报价
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
				/*删除多余的框*/
		
			$("#btn"+i).click(function(){
				$(this).parent().remove();
  			 });
  			 
  	
  			 
		}

  	
  
	
  // alert(orderid);
 		 /*$(function(){
			$('#purdetail').datagrid({   
		    url:'purdetailone?orderid='+orderid, 
			fitColumns:true, 
			toolbar:"#addToolsone",
		    rownumbers:true,  
		    columns:[[   
		    	{field:'weare',title:'编号',checkbox:true,width:100},
		    	{field:'id',title:'',hidden:true,width:100},  
		        {field:'goodsname',title:'货物名称',width:100},    
		        {field:'types',title:'物品类型',width:100},    
		        {field:'company',title:'供货商',width:100},
		        {field:'weights',title:'购买重量',width:100},
		        {field:'price',title:'单价￥',width:100},
		        {field:'money',title:'总额',width:100},
		    ]],
		    onLoadSuccess:function(data){
		    	$('.btn-edit').linkbutton({iconCls: 'icon-edit'}); 
		    	$('.btn-del').linkbutton({iconCls: 'icon-clear'}); 
		    } 
		}); 
		});*/
		
	
		
 			
 		
		
</script>
</body>
  