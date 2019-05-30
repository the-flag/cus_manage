<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>后台登录</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="js/css/style.css"
	tppabs="js/css/style.css" />
<style>
body {
	height: 100%;
	background: #16a085;
	overflow: hidden;
}

canvas {
	z-index: -1;
	position: absolute;
}
</style>
<script src="js/jquery.js"></script>
<script src="js/verificationNumbers.js"
	tppabs="js/verificationNumbers.js"></script>
<script src="js/Particleground.js" tppabs="js/Particleground.js"></script>


<link type="text/css" rel="stylesheet" href="js/jquery-easyui-1.5.3/themes/default/easyui.css" />
<link type="text/css" rel="stylesheet" href="js/css/main.css">
<script src="js/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
<script src="js/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script>


<script>
	$(document).ready(function() {
		//粒子背景特效
		$('body').particleground({
			dotColor : '#5cbdaa',
			lineColor : '#5cbdaa'
		});
		//验证码
		/* createCode(); */
		//测试提交，对接程序删除即可
	/* 	$(".submit_btn").click(function() {
			
		}); */
		
	});
	$(function(){
		
		if(getCookie('remember_ticket')!=null && getCookie('remember_ticket')!="" ){
			$('#checkbox').attr('checked', 'checked');
		}
		//遍历获取cookie中的值
		  function getCookie(name){
			  var strcookie = document.cookie;//获取cookie字符串
			  var arrcookie = strcookie.split(";");//分割
			  //遍历匹配
			  for ( var i = 0; i < arrcookie.length; i++) {
				  var arr = arrcookie[i].split("=");
				  if (arr[0] == name){
				  	return arr[1];
					  }
			  }
			 return "";
		 }
		
	})

	  function validate() {
		  var uPattern = /^[a-zA-Z0-9_-]{2,16}$/;
		  var pPattern = /^.*(?=.{6,})(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*? ]).*$/; //密码强度正则，最少6位，包括至少1个大写字母，1个小写字母，1个数字，1个特殊字符
		  var password=$("#user_password").val();
		  var account=$("#user_account").val();
		  var passwordVali=pPattern.test(password);
		  var accountVali=uPattern.test(account);
		  var yanzhengma=$("#J_codetext").val().trim();
		  if(accountVali){
			 if(passwordVali){
				  return true;
			   } else {
				  	$("#tishi").text("密码格式错误!!!");
			     return false;
			   }
			  if(yanzhengma.length!=4){
				   $("#tishi").text("验证码格式!!!");
				     return false;
			   }
			  $("#tishi").text("");
			   return true;
		  }
		  $("#tishi").text("用户名格式错误!!!");
		 
	}
	function submitForm() {
		 if(validate()){ 
		    document.getElementById("myForm").submit();
		 }
	}
</script>
</head>
<body>
	<dl class="admin_login">
		<dt>
			<strong>CRM管理系统登录页面</strong> <em>Management System</em>
			<br/>
			<span id="tishi" style="font-size: 14px;color: red;">${key}</span>
		</dt>
		<form id="myForm" action="loginValidation" method="POST">
		<dd class="user_icon">
			<input type="text" placeholder="账号" class="login_txtbx" name="user_account" id="user_account"/>
		</dd>
		<dd class="pwd_icon">
			<input type="password" placeholder="密码" class="login_txtbx" name="user_password" id="user_password" />
		</dd>
		<dd class="val_icon">
			<div class="checkcode">
				<input type="text" id="J_codetext" placeholder="验证码" maxlength="4" class="login_txtbx" name="yanzhengma" >
				<!-- <canvas class="J_codeimg" id="myCanvas" onclick="createCode()">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas> -->
			</div>
			<img class="J_codeimg" src="loginCheckCode" alt="" width="98" height="36" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'">
			<input type="button" value="验证码核验" class="ver_btn" onClick="validate();">
		</dd>
		<dd>
			<input id="checkbox" type="checkbox" name="remember"  value="1"><span style="color:#f4f4f4">下次自动登陆</span>
			<span style="color:#f4f4f4;"><a id="btn" href="javascript:void(0)"  onclick="updatePass()">忘记密码?</a>  </span>
		
			<br/>
		</dd>
		<dd>
			<input  type="button" value="立即登陆"  class="submit_btn" onclick="submitForm();" />
		</dd>
		</form>
		<dd>
			<p>天上人间—个人原创</p>
			<p>京B2-8998988-1</p>
		</dd>
	</dl>
	
	
	<div id=updateBox class="easyui-dialog" style="width:500px;height:400px;" data-options="iconCls:'icon-save',resizable:true,modal:true,closed: true">
	
		<form id="ff" method="post">   
		    <div>   
		        <input type="text" placeholder="手机号" class="easyui-validatebox" name="user_phone" id="user_phone"/>   
		    </div>   
		    <div>   
		       <input type="text"   placeholder="验证码" maxlength="6" class="login_txtbx" name="user_phone_validata" id="user_phone_validata">
		       <span> <a id="" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="phone_validata()">获取验证码</a> </span>
		    </div>   
		    <div><input  type="button" value="重置密码"  class="submit_btn" onclick="ResetForm();" /></div>
		</form>  
	</div>
	
</body>

<script type="text/javascript">
	function updatePass(){
		$("#ff").form("clear");
		$('#updateBox').dialog({
			title: '重置密码',  
			closed: false
		})
	}
	var user_phone;
	function phone_validata(){
		user_phone=$("#user_phone").val();
		var r = /^[1][3,5,8,7][0-9]{9}$/;
		if(user_phone!=null && user_phone!=""){
		 if (!r.test(user_phone)) {
			 $.messager.alert('警告','手机号码格式不对!'); 
		      return false;
		 }
		}else{
			$.messager.alert('警告','手机号码不能为空!'); 
			return false;
		}
		$.post("selectUserByPhone",{
			phone:user_phone
		},function(data){
			if(data){
				$.post("phoneValidata",{
					phone:user_phone
				},function(datacode){
					if(datacode){
						// 消息将显示在顶部中间
						
						
						$.messager.show({
							title:'我的消息',
							msg:'验证码发送成功,请注意查收!',
							timeout:2000,
							showType:'show',
							style:{
								right:'',
								top:document.body.scrollTop+document.documentElement.scrollTop,
								bottom:''
							}
						});
					}else{
						$.messager.alert('警告','发送失败,网络异常');    
					}
				},"json")
			}else{
				$.messager.alert('警告','未绑定');    

			}
			
		},"json")
	}
	function validata(){
		var user_phone_validata=$("#user_phone_validata").val().trim();
	    if(user_phone_validata.length==0){    
	        alert('对不起，验证码不能为空或者为空格!');//请将“文本框”改成你需要验证的属性名称!   
	        return false;
	    }    
	    var reg=/^[-+]?\d*$/;
	    if(!reg.test(user_phone_validata)){    
            alert("对不起，您输入的整数类型格式不正确!");//请将“整数类型”要换成你要验证的那个属性名称！    
        	return false;
	    }
	    if(user_phone_validata.length!=6){    
	        alert('对不起，验证码不够6位!');//请将“文本框”改成你需要验证的属性名称!   
	        return false;
	    }
	    return true;
	}
	function ResetForm(){
			if(validata()){
				var user_phone_validata=$("#user_phone_validata").val().trim();
				$.post("updatePasswordByUserPhone",{
					validata:user_phone_validata,
					user_phone:user_phone
				},function(data){
					if(data>0){
						$('#updateBox').dialog({
							closed: true
						})
						$.messager.alert('警告','密码重置成功!');
						
						// 消息将显示在顶部中间
					}else{
						$.messager.alert('警告','验证码错误!');    
					}
				},"json")
			}
	}
	
 </script>
</html>