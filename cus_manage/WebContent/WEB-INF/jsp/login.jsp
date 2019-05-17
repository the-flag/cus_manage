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
</script>
</head>
<body>
	<dl class="admin_login">
		<dt>
			<strong>CRM管理系统登录页面</strong> <em>Management System</em>
			<br/>
			<span style="font-size: 14px;color: red;">${key}</span>
		</dt>
		<form action="loginValidation" method="POST">
		<dd class="user_icon">
			<input type="text" placeholder="账号" class="login_txtbx" name="user_account"/>
		</dd>
		<dd class="pwd_icon">
			<input type="password" placeholder="密码" class="login_txtbx" name="user_password" />
		</dd>
		<dd class="val_icon">
			<div class="checkcode">
				<input type="text" id="J_codetext" placeholder="验证码" maxlength="4" class="login_txtbx" name="yanzhengma">
				<!-- <canvas class="J_codeimg" id="myCanvas" onclick="createCode()">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas> -->
			</div>
			<img class="J_codeimg" src="loginCheckCode" alt="" width="98" height="36" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'">
			<input type="button" value="验证码核验" class="ver_btn" onClick="validate();">
		</dd>
		<dd>
			<input id="checkbox" type="checkbox" name="remember"  value="1"><span style="color:#f4f4f4">下次自动登陆</span><br/>
		</dd>
		<dd>
			<input type="submit" value="立即登陆" class="submit_btn" />
		</dd>
		</form>
		<dd>
			<p>天上人间—个人原创</p>
			<p>京B2-8998988-1</p>
		</dd>
	</dl>
</body>
</html>