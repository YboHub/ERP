<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style>
	#ffm div{
		margin: 5px;
	}
</style>
<form id="ffm" method="post" style="margin: 10px">   
	 <div>   
	     <label>员工编号:</label>   
	     <input id="empno" type="text" name="empno" data-options="required:true" onblur="getUserInfo()"/>   
	 </div>   
	 <div>   
	     <label>员工姓名:</label>
	     <input id="ename" type="text" name="ename" data-options="required:true" readonly="readonly"/>   
	 </div>
	 <div>   
	     <label>部&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;门:</label>
	     <input id="deptname" type="text" name="deptname" data-options="required:true" readonly="readonly"/>   
	 </div>
	 <div>   
	     <label>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位:</label>
	     <input id="post" type="text" name="post" data-options="required:true" readonly="readonly"/>   
	 </div>
	 <div>   
	     <label>登陆账号:</label>   
	     <input id="acc" type="text" name="account" data-options="required:true" onblur="checkAcc()"/>
	     <span id="smacc" style="color: red"></span>
	     <div><span style="color: green;">账号由数字、字母（区分大小写）组成，长度为3~8</span></div>
	 </div>
	 <div>   
	     <label>登陆密码:</label>   
	     <input id="psw" type="password" name="password" data-options="required:true" onblur="checkPsw()"/>
	     <span id="smpsw" style="color: red"></span>
	     <div><span style="color: green;">密码由数字、字母（区分大小写）组成，长度为3~8</span></div>
	 </div>
	 <div>   
	     <label>确认密码:</label>   
	     <input id="pswd" type="password" name="repassword" data-options="required:true" onblur="checkPswd()"/>
	     <span id="smpswd" style="color: red"></span>
	     <div><span style="color: green;">密码与上面输入保持一致</span></div>
	 </div>
    <div>   
        <a class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="saveFun()">保存</a>  
    </div>   
</form> 
<script type="text/javascript">
	//失焦触发查询指定员工信息函数
	function getUserInfo(){
		//获取输入框中的员工编号
		var empno=$("#empno").val();
		var result=false;
		$.ajaxSettings.async=false;
		//通过员工编号获取员工信息
		$.post("login/getEmp",{empno:empno},function(data){
			if (data[0]!=null) {
				//将员工信息填充到输入框
				$("#ename").val(data[0].ename);
				$("#deptname").val(data[0].deptname);
				$("#post").val(data[0].post);
				result=true;
			}else{
				//清空输入框
				$("#ename").val('');
				$("#deptname").val('');
				$("#post").val('');
				alert("没有搜索到该员工！");
				result=false;
			}
		});
		$.ajaxSettings.async=true;
		return result;
	}
	//失焦触发账号验证函数
	function checkAcc(){
		//获取输入框中的账号
		var account=$("#acc").val();
		var patten= /^[0-9a-zA-Z]{3,8}$/;
		var result=false;
		$.ajaxSettings.async=false;
		if (account==null||account=="") {
			$("#smacc").html("账号不能为空！");
			result=false;
		}else{
			if (patten.test(account)) {
				$.post("login/checkAcc",{account:account},function(data){
					if (data[0]!=null) {
						$("#smacc").html("账号已存在，请重新输入！");
						result=false;
					}else{
						$("#smacc").html("");
						result=true;
					}
				});
			}else{
				$("#smacc").html("账号格式输入错误！");
				result=false;
			}
		}
		$.ajaxSettings.async=true;
		return result;
	}
	//失焦触发密码验证函数
	function checkPsw(){
		//获取输入框中的密码
		var password=$("#psw").val();
		var patten= /^[0-9a-zA-Z]{3,8}$/;
		if (password==null||password=="") {
			$("#smpsw").html("密码不能为空!");
			return false;
		}else{
			if (patten.test(password)) {
				$("#smpsw").html("");
				return true;
			}else{
				$("#smpsw").html("密码格式输入错误！");
				return false;
			}
		}
	}
	//失焦触发确认密码验证函数
	function checkPswd(){
		//获取输入框中的密码
		var password=$("#psw").val();
		//获取输入框中的确认密码
		var repassword=$("#pswd").val();
		if (repassword==null||repassword=="") {
			$("#smpswd").html("确认密码不能为空!");
			return false;
		}else{
			if (password==repassword) {
				$("#smpswd").html("");
				return true;
			}else{
				$("#smpswd").html("两次密码输入不一致！");
				return false;
			}
		}
	}
	//点击触发保存函数
	function saveFun(){
		if (confirm("您确认保存么？")) {
			$('#ffm').form({    
			    url:'<%=path%>/login/save',    
			    onSubmit: function(){
			    	//表单验证
					if (!(getUserInfo()&&checkAcc()&&checkPsw()&&checkPswd())) {
						alert("表单数据不合法，请修改后重新提交！");
						return false;
					}
			    },    
			    success:function(data){
			    	if (data) {
						$.messager.show({
							title:'消息',
							msg:'保存成功！',
							timeout:2000,
							showType:'show'
						});
						$('#addUser').window('close');
						$('#dg').datagrid("reload");
					}else{
						$.messager.show({
							title:'消息',
							msg:'保存失败！',
							timeout:2000,
							showType:'show'
						});
					}   
			    }    
			});    
			// 提交表单    
			$('#ffm').submit(); 
		}
	}
</script>