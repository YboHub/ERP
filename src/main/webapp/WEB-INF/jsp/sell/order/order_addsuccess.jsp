<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
  	<div align="center">
  		<h1>订单已成功保存</h1>
	    <button id="look" class="btn btn-default">查看订单</button>
	    <button id="add" class="btn btn-info">添加订单</button>
    </div>
	<script type="text/javascript">
		$('#look').click(function(){
			location.href='order/toList';
		});
		$('#add').click(function(){
			location.href='order/toAdd';
		});
	</script>
