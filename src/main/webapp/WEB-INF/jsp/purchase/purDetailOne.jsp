<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
   <input value="${orderid}" id="orderid" name="orderid" type="hidden"/>
<table id="dgone"></table>

<script type="text/javascript">
var orderid=$("#orderid").val();
		$('#dgone').datagrid({    
		    url:'UpeditOneo?orderid='+orderid, 
		    rownumbers:true,
		    singleSelect:true, 
		    columns:[[ 
		        {field:'goodsname',title:'货物名称',width:100},
		        {field:'types',title:'货物类型',width:100},    
		        {field:'company',title:'供货商',width:100},
		        {field:'price',title:'单价￥/T',width:100},
		        {field:'weights',title:'购买重量T',width:100},
		        {field:'money',title:'预算额￥',width:100},
		    ]],
		}); 
</script>

	<%-- <form  id="myForm">
		
	  	 <table id="purdetail" class="purdetail" border="1">
	  		<tr>
	  			<th>序号</th>
	  			<th width="130px" class="tdColor"style="text-align:center">货物名称</th>
	  			<th width="100px" class="tdColor"style="text-align:center">物品类型</th>
	  			<th width="130px" class="tdColor"style="text-align:center">供货商</th>
	  			<th width="100px" class="tdColor"style="text-align:center">单价￥</th>
	  			<th width="100px" class="tdColor"style="text-align:center">购买重量T</th>
	  			<th width="100px" class="tdColor"style="text-align:center">总额</th>
	  		</tr>
	  		
	  			<c:forEach items="${purList}" var="obj" varStatus="stat">
					<tr>
						<td style="text-align:center">${stat.count}</td>
		  				<td style="text-align:center">${obj.goodsname}</td>
		  				<td style="text-align:center">${obj.types}</td>
		  				<td style="text-align:center">${obj.company}</td>
		  				<td style="text-align:center">${obj.price}</td>
		  				<td style="text-align:center">${obj.weights}</td>
		  				<td style="text-align:center">${obj.money}</td>
		  				
	  				</tr>
	  			</c:forEach>
	  	 </table>
	</form> --%>


  