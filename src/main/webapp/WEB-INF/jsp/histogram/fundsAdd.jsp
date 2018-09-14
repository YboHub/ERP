<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!-- 文本框 -->
	<textarea  id="t1" style="margin:10px 0 0 60px;" cols="70" rows="12" >请输入驳回的原因:
	</textarea>

<!-- form表单 -->
	<div>
		 <a style="margin:10px 0 0 150px;width:90px;height:30px;" id="addbtn"  class="easyui-linkbutton"  onclick="save()">同意</a>
	    <a style="margin:10px 0 0 100px;width:90px;height:30px;" id="closebtn"  class="easyui-linkbutton"  onclick="closeAdd()">驳回</a>
	
	</div>  
	   
	<script>
	 	function closeAdd(){
			$("#addId").window('close');  
		}
	  	function save(){
			    var checkList=$("#dg").datagrid("getChecked");
				var idStr=[];
				for(var i=0;i<checkList.length;i++){
					idStr[i]=checkList[i].fundsid;
					var name=checkList[i].fundsstate;
				}
    		if(name==0){
				$.messager.confirm('确认','确认提交申请吗',function(r){
	    			if(r){
	    				$.post("funds/update",{idStr:idStr},function(data){
	    					if (data>0) {
								$.messager.show({
									title:'我的消息',
									msg:'提交成功',
									timeout:5000,
									showType:'show'
								});
									$("#dg").datagrid("reload");
							} else {
								$.messager.show({
									title:'我的消息',
									msg:'提交失败，联系管理员',
									timeout:5000,
									showType:'show'
								});
							 }
							
	    				},"json");
	    			}
	    		}); 
	    	}else{
	    		$.messager.show({
					title:'提醒',
					msg:'已提交，无需再次提交！',
					timeout:5000,
					showType:'show'
				});
	    	}
 				$("#addId").window('close');  	
		}  
		
		 
	</script>
<!-- 	function save() {
	        $.messager.confirm('温馨提示', '审核后信息无法修改，确定审核吗？', function (r) {
	            if (r)//选择确定或者OK
	            {
	                $.ajax({
	                    type: "POST",
	                    url: "histogram/save",
	                    success: function (data) {
	                        if (data>0) {
	                           /*  window.location.href = "../FreshNewReport/SuccessReport"; */
	                           $.messager.show({
												title:"消息",
												msg:"审核成功",
												timeout:10000,
												showType:'show'
											});
						
										$("#dg").datagrid("reload");
	                        }
	                        else {
	                           /*  $.messager.alert('警告','审核失败，请联系相关人员','info') */
	                           $.messager.show({
												title:"消息",
												msg:"审核失败",
												timeout:10000,
												showType:'show'
											});
	                        }
	                    }
	                });
	            }
	        });
	        $("#addId").window('close');  
	    } -->



 