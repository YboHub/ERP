<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>财务结算</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<!-- 加载顺序 -->
	<link rel="stylesheet" type="text/css" href="<%=path %>/easyui/themes/default/easyui.css">   
	<link rel="stylesheet" type="text/css" href="<%=path %>/easyui/themes/icon.css">   
	<script type="text/javascript" src="<%=path %>/easyui/jquery-1.8.3.min.js"></script>   
	<script type="text/javascript" src="<%=path %>/easyui/jquery.easyui.min.js"></script>
<!-- 汉化版 -->  
	<script type="text/javascript" src="<%=path %>/easyui/easyui-lang-zh_CN.js"></script>
  </head>
  
  <body>
  <input id="ss"></input>
	<div id="mm" style="width:220px">
		<div data-options="name:'orderno'">单号</div>
	</div>
	<a class="easyui-linkbutton" data-options="iconCls:'icon-reload'"
		onclick="clearFun()">清空</a>
  
  <table id="dg"></table>
    <script type="text/javascript">
		$('#dg').datagrid({    
		    url:'finace/datagrid', 
		    fitColumns:true,   
		    singleSelect:true, 
		    rownumbers:true,
		    pagination:true,
		    pageSize:10,
		    height:600,
		    pageList:[5,10,20,40,60],
		    columns:[[ 
		   	    {field:'id',       title:'',hidden:true,width:100},       
		        {field:'orderno',  title:'订单编号',     width:100},    
		        {field:'ordertime',title:'下单时间',     width:100,
		        	formatter : function(value){
                        var date = new Date(value);
                        var y = date.getFullYear();
                        var m = date.getMonth() + 1;
                        var d = date.getDate();
                        var h= date.getHours();
                        var MM= date.getMinutes();
                        var ss =date.getSeconds();
                        return   y +'-'+ (m < 10 ? ('0' + m) : m) +'-'+ (d < 10 ? ('0' + d) : d)+ ' ' + (h<10 ?  ('0'+h):h) + ':' + (MM < 10 ? ('0' + MM) : MM) + ':' + (ss<10? ('0'+ss):ss);
                    }
		        },  
		        {field:'mtotal', title:'订单总额￥',       width:100}, 
		        {field:'statess',title:'状态',hidden:true,width:100}, 
		        {field:'states', title:'付款状态',         width:100},
		        {field:'dpval',  title:'定金￥',           width:100,
		        	formatter:function(value,row,index){
		        		if(value==null){
		        			return "0";
		        		}else{
		        		 return value;
		        		}
		        	}
		        },
		        {field:'ACTION',title:'操作',width:100,
		        	formatter:function(value,row,index){
			        	if(row.states=="已收尾款"){
			        		return "";
			        	}else{
			        	   return "<a class='btn-edit' style='height:19px' onclick='settlement("+row.id+")'>结算</a>";
			        	}
		        	}
		        }  
		    ]],
		    onLoadSuccess:function(data){
		    	$('.btn-edit').linkbutton({iconCls: 'icon-edit'}); 
		    	$('.btn-del').linkbutton({iconCls: 'icon-clear'}); 
		    } 
		}); 
		//查询框
	   $('#ss').searchbox({ 
			searcher:function(value,name){ 
				//将参数出传递到后台，得到列表数据  刷新
		        $("#dg").datagrid('load', {    
				    name: name,    
				    value: value  
				}); 
			}, 
			menu:'#mm', 
			prompt:'请输入值' 
		});
		//清空
		function clearFun(){
			//searchbox设置为空
			$("#ss").searchbox('setValue', '');
			//刷新列表
			$("#dg").datagrid('reload',{
				name:null,
				value:null
			});
		}
		
		/*结算*/
	function settlement(id){
		$.messager.confirm('确认','确认结算吗',function(r){
    			if(r){
    				$.post("finace/settlement",{id:id},function(data){
    					if (data>0) {
							$.messager.show({
								title:'我的消息',
								msg:'已结算',
								timeout:5000,
								showType:'show'
							});
								$("#dg").datagrid("reload");
						} else {
							$.messager.show({
								title:'我的消息',
								msg:'结算失败，联系管理员',
								timeout:3000,
								showType:'show'
							});
						 }
    				},"json");
    			}
    		}); 
	}	
	</script>
  </body>
</html>
