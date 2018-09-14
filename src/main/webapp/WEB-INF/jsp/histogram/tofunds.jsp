<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	function save(){
		$('#updateById').form({    
		    url:"funds/toUpdate",    
		    onSubmit: function(){    
		        // 做一些验证    
		        var isValid = $("#updateById").form("validate");
		        if(isValid){
		        	return true;
		        }else{
		        	return false;
		        }
		    },    
		    success:function(data){    
		    	if(data>0){
	       			$.messager.show({
						title:"消息",
						msg:"拨款成功",
						style:{
						right:'',
						top:document.body.scrollTop+document.documentElement.scrollTop,
						bottom:''
							},
						timeout:3000,
						showType:'show'
					});
					$("#cc").window('close');
					$("#dg").datagrid("reload");
	       		}
		    }    
		});    
		$('#updateById').submit();   
	}
	
		$(function(){
		   $.extend($.fn.validatebox.defaults.rules, {
		       areacode : {// 验证用户名
		           validator : function(value) {
		               return check_bank_account(value);
		           },
		           message : '请输入正确的银行卡号'
		       }
		   });
		  });
		function check_bank_account(bankno){
			var isChecked = false;
			var n = /^[10|18|30|35|37|40|41|42|43|44|45|46|47|48|49|50|51|52|53|54|55|56|58|60|62|65|68|69|84|87|88|94|95|98|99]{0,2}\d{14,17}$/.test(bankno);
			if (n) {
				var lastNum=bankno.substr(bankno.length-1,1);//取出最后一位（与luhm进行比较）
				var first15Num=bankno.substr(0,bankno.length-1);//前15或18位
				var newArr=new Array();
				for(var i = first15Num.length-1;i>-1;i--){//前15或18位倒序存进数组
					newArr.push(first15Num.substr(i,1));
				}
				var arrJiShu=new Array(); //奇数位*2的积 <9
				var arrJiShu2=new Array(); //奇数位*2的积 >9
				var arrOuShu=new Array(); //偶数位数组
				for(var j=0;j<newArr.length;j++){
					if((j+1) % 2 == 1){//奇数位
						if (parseInt(newArr[j])*2<9) {
							arrJiShu.push(parseInt(newArr[j])*2);
						} else {
							arrJiShu2.push(parseInt(newArr[j])*2);
						}
					}else{//偶数位
						arrOuShu.push(newArr[j]);
					}
				}
				var jishu_child1=new Array();//奇数位*2 >9 的分割之后的数组个位数
				var jishu_child2=new Array();//奇数位*2 >9 的分割之后的数组十位数
				for(var h=0;h<arrJiShu2.length;h++){
					jishu_child1.push(parseInt(arrJiShu2[h])%10);
					jishu_child2.push(parseInt(arrJiShu2[h])/10);
				}
				var sumJiShu=0; //奇数位*2 < 9 的数组之和
				var sumOuShu=0; //偶数位数组之和
				var sumJiShuChild1=0; //奇数位*2 >9 的分割之后的数组个位数之和
				var sumJiShuChild2=0; //奇数位*2 >9 的分割之后的数组十位数之和
				var sumTotal=0;
				for(var m=0;m<arrJiShu.length;m++){
					sumJiShu=sumJiShu+parseInt(arrJiShu[m]);
				}
				for(var n=0;n<arrOuShu.length;n++){
					sumOuShu=sumOuShu+parseInt(arrOuShu[n]);
				}
				for(var p=0;p<jishu_child1.length;p++){
					sumJiShuChild1=sumJiShuChild1+parseInt(jishu_child1[p]);
					sumJiShuChild2=sumJiShuChild2+parseInt(jishu_child2[p]);
				}
				//计算总和
				sumTotal=parseInt(sumJiShu)+parseInt(sumOuShu)+parseInt(sumJiShuChild1)+parseInt(sumJiShuChild2);
				//计算Luhm值
				var k= parseInt(sumTotal)%10==0?10:parseInt(sumTotal)%10;
				var luhm= 10-k;
				if (lastNum == luhm) {
					isChecked = true;
				}else {
					isChecked = false;
				}
				}else {
					isChecked = false;
				}
				return isChecked;
			}
		
		$(function(){
			   $.extend($.fn.validatebox.defaults.rules,{
			      name: {// 验证姓名，可以是中文或英文
		               validator: function (value) {
		                    return /^[\Α-\￥]+$/i.test(value) | /^\w+[\w\s]+\w+$/i.test(value);
		                },
		                message: '请输入姓名'
		            },
			   });
			});
</script>
<form id="updateById" method="post">
	<div style="text-align:center; padding-top:15px; vertical-align:middel;">
		订单单号：<input name="orderid" type="text" value="${orderid}"/><br/>
		订单价格：<input name="allmoney" value="${allmoney}"/><br/>
		收款账号：<input class="easyui-validatebox" type="text" name="bankcard" data-options="required:true,validType:'areacode'"/><br/>
		收款人&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input  class="easyui-validatebox" type="text" name="payee" data-options="required:true,validType:'name'"/><br/>
		拨款理由：<input  class="easyui-validatebox" type="text" name="reason" data-options="required:true"/><br/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		支付方式：<select id="test" name="paymethod">
					<option value="银行卡">银行卡</option>
			   </select><br/>
	</div>
	 <a id="addbtn"  class="easyui-linkbutton" data-options="iconCls:'icon-save'" style="position:relative;left:260px;top:-5px;" onclick="save()">确定</a>
</form>
