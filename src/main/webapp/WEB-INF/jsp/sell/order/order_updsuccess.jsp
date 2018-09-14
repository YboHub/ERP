<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
  	<div align="center">
  		<h1>订单已成功更改</h1>
	    <button id="look" class="btn btn-default">返回订单列表</button>
	    <button id="add" class="btn btn-info">留在当前页面</button>
    </div>
	<script type="text/javascript">
		$('#look').click(function(){
			location.href='order/toList';
		});
		$('#add').click(function(){
			location.reload();
		});
	</script>
