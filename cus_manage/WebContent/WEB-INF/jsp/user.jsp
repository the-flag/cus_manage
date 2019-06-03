<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="js/jquery-easyui-1.5.3/themes/default/easyui.css" />
<link type="text/css" rel="stylesheet" href="js/jquery-easyui-1.5.3/themes/icon.css" />
<link type="text/css" rel="stylesheet" href="js/css/main.css">
<script src="js/jquery-easyui-1.5.3/jquery.min.js"></script>
<script src="js/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
<script src="js/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">

	/* 存储文本框的值---以判断相比上一次是否做出的修改 */
	var account_vali=null;
	var phone_vali=null;
	var email_vali=null;
	
	/* 储存验证的结果 */
	var accountJudge=false;
	var phoneJudge=false;
	var emailJudge=false;
	var passwordJudge=false;
	
	function addBox () {
        $("#addBox").dialog({
                closed: false

        })
        $("#addForm").form('clear');
        $("#can").hide();
        $("#res").show();

	}
	/*
	 * 添加--账号验证
	 * 正则验证+后台验证重复
	 * 
	 * */
	
	function checkAccount(){
		var uPattern = /^[a-zA-Z0-9_-]{2,16}$/;
		var user_account=$("#adduser_account").val().trim();
		if(uPattern.test(user_account)){
			if(account_vali==null || account_vali!=user_account){
				$.post("validationAccount",{
					user_account:user_account
				},function(validation){
					if(!validation){
						$("#adduser_accountspan").text("账号已存在!");
						account_vali=user_account;
						account_vali=null;
						accountJudge=false;
						return false;
		    		}
					account_vali=user_account;
					$("#adduser_accountspan").text("");
					accountJudge=true;
					return true;
				},"json")
			}
			$("#adduser_accountspan").text("");
			return true;
		}else{
			$("#adduser_accountspan").text("格式错误!!");
			accountJudge=false;
			return false;
		}	
	}
	/* 密码-正则验证 */
	function checkPassword(){
		var pPattern = /^.*(?=.{6,})(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*? ]).*$/; //密码强度正则，最少6位，包括至少1个大写字母，1个小写字母，1个数字，1个特殊字符
		var user_password=$("#adduser_password").val().trim();
		if(pPattern.test(user_password)){
			$("#adduser_passwordspan").text("");
			passwordJudge=true;
			return true;
		}else{
			$("#adduser_passwordspan").text("格式错误--最少6位，包括至少1个大写字母，1个小写字母，1个数字，1个特殊字符!!");
			passwordJudge=false;
			return false;
		}
	}
	/* 验证邮箱 */
	function checkEmail(){
		var emailreg = /^\w+((-\w+)|(\.\w+))*\@("@")[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
		var regex = /^([0-9A-Za-z\-_\.]+)@([0-9a-z]+\.[a-z]{2,3}(\.[a-z]{2})?)$/g;
		var user_email=$("#adduser_email").val().trim();
		
		if(regex.test(user_email)){
			$("#adduser_emailspan").text("");
			if(email_vali==null || email_vali!=user_email){
				$.post("selectUserByEmail",{
					user_email:user_email
				},function(validation){
					if(!validation){
						$("#adduser_emailspan").text("此邮箱已存在!");
						email_vali=null;
						emailJudge=false;
						return false;
		    		}
					email_vali=user_email;
					$("#adduser_emailspan").text("");
					emailJudge=true;
					return true;
				},"json")
			}	
			$("#adduser_emailspan").text("");
			return true;
		}else{
			$("#adduser_emailspan").text("邮箱格式错误!!");
			emailJudge=false;
			return false;
		}
		
	}
	function checkPhone(){
		var reg = /^1[3|4|5|7|8]\d{9}$/; //手机验证
		var user_phone=$("#adduser_phone").val().trim();
		if(reg.test(user_phone)){
			$("#adduser_phonespan").text("");
			if(phone_vali==null || phone_vali!=user_phone){
				$.post("selectUserByPhone",{
					phone:user_phone
				},function(validation){
					if(validation){
						$("#adduser_phonespan").text("手机号已存在!");
						phone_vali=null;
						phoneJudge=false;
						return false;
		    		}
					phone_vali=user_phone;
					$("#adduser_phonespan").text("");
					phoneJudge=true;
					return true;
				},"json")
			}
			$("#adduser_phonespan").text("");
			return true;
		}else{
			$("#adduser_phonespan").text("手机号格式错误!!");
			phoneJudge=false;
			return false;
		}
	}
	
	
	
	/* 验证 */
	function validata(){
		if(accountJudge && phoneJudge && emailJudge && passwordJudge){
			alert("验证成功!");
			obj.sum();
		}else{
		}
		
	}
		
	
	var updateemail_vali=null;
	var updatephone_vali=null;
    // 编辑
    function edit (id) {
            var ID;
            $("#res").hide();
            $("#can").show();
            $("#updateBox").dialog({
                    closed: false,
            })
           var data=$("#table").datagrid("getData");
            var row=data.rows[id];
            $("#updateForm").form('load',row);
            
            
            /*$("#updatesum").click(function(){
            	
            })*/
            
           //重置表单
            updateemail_vali=row.user_email;
            updatephone_vali=row.user_phone;
          
            $("#updatares").click(function(){
            	$("#updateForm").form('load',row);
            })
            

    }
    var updateemailJudge=false;
    var updatephoneJudge=false;
    
    /* 验证邮箱 */
	function updatecheckEmail(){
		var emailreg = /^\w+((-\w+)|(\.\w+))*\@("@")[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
		var regex = /^([0-9A-Za-z\-_\.]+)@([0-9a-z]+\.[a-z]{2,3}(\.[a-z]{2})?)$/g;
		var user_email=$("#updateuser_email").val().trim();
		if(regex.test(user_email)){
			$("#updateuser_emailspan").text("");
			if(updateemail_vali!=user_email){
				$.post("selectUserByEmail",{
					user_email:user_email
				},function(validation){
					if(!validation){
						$("#updateuser_emailspan").text("此邮箱已存在!");
						updateemailJudge=false;
						return false;
		    		}
					$("#updateuser_emailspan").text("");
					updateemailJudge=true;
					return true;
				},"json")
			}	
			$("#updateuser_emailspan").text("");
			return true;
		}else{
			$("#updateuser_emailspan").text("邮箱格式错误!!");
			updateemailJudge=false;
			return false;
		}
		
	}
	function updatecheckPhone(){
		var reg = /^1[3|4|5|7|8]\d{9}$/; //手机验证
		var user_phone=$("#updateuser_phone").val().trim();
		if(reg.test(user_phone)){
			$("#updateuser_phonespan").text("");
			if(updatephone_vali!=user_phone){
				$.post("selectUserByPhone",{
					phone:user_phone
				},function(validation){
					if(validation){
						$("#updateuser_phonespan").text("手机号已存在!");
						updatephoneJudge=false;
						return false;
		    		}
					$("#updateuser_phonespan").text("");
					updatephoneJudge=true;
					return true;
				},"json")
			}
			$("#updateuser_phonespan").text("");
			return true;
		}else{
			$("#updateuser_phonespan").text("手机号格式错误!!");
			updatephoneJudge=false;
			return false;
		}
	}
	// 提交表单
    function updatesum () {
    	var updateuser_account=$("#updateuser_account").val();
    	//验证修改的用户是否是管理员
    	$.post("verifyAdministrator",{
    		user_account:updateuser_account,
    		cheshi:"1"
    	},function(vali){
    		if(vali){
    			if(updateemailJudge && updatephoneJudge){
    	          		$('#updateForm').form('submit', {
    	                            url:'updateUserByAccount',
    	                            method:"post",
    	                    onSubmit: function(){
    	                        var lag= $(this).form('validate');
    	                           if(lag==true){
    	                        	   
    	                           }
    	                },
    	                success: function(data){
    	                	if(data>0){
    	                		$("#updateBox").dialog("close");
    	                		obj.find();
    	                        $.messager.progress('close');
    	                	}
    	                }
    	                
    	                });
    			}
    		}else{
    			$.messager.alert('提示','没有该权限!');    
    		}            
    	},"json")
    	
    }
</script>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true" id="useBox">
		<!--左侧树-->
		<!-- <div data-options="region:'west',split:true,title:'部门管理'"
			style="width: 200px">
			<ul id="tree"></ul>

		</div> -->
		<div data-options="region:'center',split:true">
			<!--表格查询-->
			<div class="tableFind">
				<p>
						<form>
							<label for="name">用户名:</label> 
							<input class="easyui-validatebox" type="text" name="user_name" id="user_name" />
							<label for="name">创建时间:</label> 
							<input type= "text" class="easyui-datebox" name="min_creat_time" id="min_creat_time"></input>~ 
							<input type= "text" class="easyui-datebox" name="max_creat_time" id="max_creat_time"></input>
							<label for="name">是否锁定:</label> 
							<select id="user_is_lock" class="easyui-combobox" name="user_is_lock" style="width:200px;">   
							    <option value="1">否</option>   
							    <option value="0">是</option>   
							</select>
							<select id="user_is_sort" class="easyui-combobox" name="user_is_sort" style="width:200px;">   
							    <option value="1">创建时间</option>   
							    <option value="0">最后登录时间</option>   
							</select> 
							<a id="btn" href="javascript:void(0)" class="easyui-linkbutton tableFindBut" data-options="iconCls:'icon-search'" onclick="obj.find()">搜索</a>  
						</form>
				</p>
			</div>
			<!--表格列表-->
			<div class="tableCon">
				<table id="table" class="tableStyle"></table>
				<div id="tabelBut">
					<div>
						<a href="#" class="easyui-linkbutton" plain="true"
							iconCls="icon-add" onclick="addBox()">新增</a>
						<a href="#"
							class="easyui-linkbutton" plain="true" iconCls="icon-edit" onclick="obj.edit()">修改</a>
						<a href="#" class="easyui-linkbutton" plain="true"
							iconCls="icon-remove" onclick="obj.del()">删除</a>
					</div>
					<div>
						

					</div>
				</div>
			</div>
		</div>
	</div>

	<!--//新增弹出框-->
	<div id="addBox">
		<form id="addForm" method="post">
			<div class="formDiv">
				<label>账号:</label>
					<input type="text" name="user_account" id="adduser_account"
					class="easyui-validatebox"  data-options="required:true" onBlur="checkAccount()" onclick="checkAccount()"><span id="adduser_accountspan"
					class="formSpan">*</span>
			</div>
			<div class="formDiv">
				<label>昵称:</label>
					<input type="text" name="user_name" id="adduser_name"
					class="easyui-validatebox"  data-options="required:true"><span id="adduser_namespan"
					class="formSpan">*</span>
			</div>
			<div class="formDiv">
				<label>密码:</label><input type="password" name="user_password" id="adduser_password"
					class="easyui-validatebox"  data-options="required:true" onBlur="checkPassword()" onclick="checkPassword()"><span id="adduser_passwordspan"
					class="formSpan">*</span>
			</div>
			<div class="formDiv">
				<label>邮箱:</label>
				<input type="text" id="adduser_email" class="easyui-validatebox" name="user_email" data-options="required:true" onBlur="checkEmail()" onclick="checkEmail()">
				<span id="adduser_emailspan" class="formSpan">*</span>
			</div>
			<div class="formDiv">
				<label>手机号:</label><input type="text" name="user_phone" id="adduser_phone"
					class="easyui-validatebox" data-options="required:true" onBlur="checkPhone()" onclick="checkPhone()">
					<span id="adduser_phonespan" class="formSpan">*</span>
			</div>
			<div class="formDiv">
				<label align="right" style="width: 70px;">分配角色：</label>
				<input id="xsry" name="xsry"  style="width: 150px;"  class="easyui-combobox" >
				<!-- <a href="#sum" class="easyui-linkbutton" iconCls="icon-ok"
					onclick="validata()">测试</a> -->
			</div>
				  
	
			<div class="forSubmint">
				<a href="#sum" class="easyui-linkbutton" iconCls="icon-ok"
					onclick="validata()">提交</a> <a href="#" class="easyui-linkbutton"
					id="res" iconCls="icon-redo" onclick="obj.res()">重置</a> <a
					href="#" class="easyui-linkbutton" id="can" iconCls="icon-cancel"
					onclick="obj.can()">取消</a>
			</div>

		</form>
	</div>
	
	<!--//修改弹出框-->
	<div id="updateBox">
		<form id="updateForm" method="post">
			<div class="formDiv">
				<label>账号:</label>
					<input type="text" name="user_account" id="updateuser_account"
					class="easyui-validatebox"  data-options="required:true,readonly:true" ><span id="updateuser_accountspan"
					class="formSpan">*</span>
			</div>
			<div class="formDiv">
				<label>邮箱:</label>
				<input type="text" id="updateuser_email" class="easyui-validatebox" name="user_email" data-options="required:true" onBlur="updatecheckEmail()" onclick="updatecheckEmail()">
				<span id="updateuser_emailspan" class="formSpan">*</span>
			</div>
			<input id="peruser_vali" type="hidden" value="${m.user_email}">
			<input id="peruser_phonevali" type="hidden" value="${m.user_phone}">
			<div class="formDiv">
				<label>手机号:</label><input type="text" name="user_phone" id="updateuser_phone"      ，
					class="easyui-validatebox" data-options="required:true" onBlur="updatecheckPhone()" onclick="updatecheckPhone()"><span id="updateuser_phonespan"
					class="formSpan">*</span>
			</div>
			<div class="forSubmint">
				<a href="#" class="easyui-linkbutton" iconCls="icon-ok" id="updatesum" onclick="updatesum()">提交</a>
				<a href="#" class="easyui-linkbutton" id="updatares" iconCls="icon-redo">重置</a>
				<a href="#" class="easyui-linkbutton" id="can" iconCls="icon-cancel" onclick="obj.can()">取消</a>
			</div>

		</form>
	</div>
	<!-- 角色设置 -->
	<div id="editRoleBox">
		<div style="float: left;width:40%">
			<table id="AllRole" class="tableStyle" >
			
			</table>
		</div>
		<div style="float: left; width:20%">
			<center >
				<button id="addUserRole" class="easyui-linkbutton"  >>></button> 
				<button id="delUserRole" class="easyui-linkbutton" >111<<</button>
			</center>
		</div>
		<div style="float: right;width:40%">
			<table id="UserRole" class="tableStyle" >
			
			</table>
		</div>
	
	
	</div>
	<script src="js/user.js"></script>
	<script type="text/javascript">
		$(function(){
			 
			 //初始化多选复选框
			 initCombobox('xsry');//学术荣誉的字典编码是XSRY_CD
		})
		
		//参数：id  控件id   code 字典编码
		function initCombobox(id) {
		    var value = "";
		    //加载下拉框复选框
		    $('#' + id).combobox({
		        url:"getRole",
		        //后台获取下拉框数据的url
		        method: 'post',
		        panelHeight: 200,
		        //设置为固定高度，combobox出现竖直滚动条
		        valueField: 'role_id',
		        textField: 'role_name',
		        multiple: true,
		        formatter: function(row) { //formatter方法就是实现了在每个下拉选项前面增加checkbox框的方法
		            var opts = $(this).combobox('options');
		            return '<input type="checkbox" vlaue="'+row[opts.valueField]+'" class="combobox-checkbox">' + row[opts.textField]
		        },
		        onLoadSuccess: function() { //下拉框数据加载成功调用
		            var opts = $(this).combobox('options');
		            var target = this;
		            var values = $(target).combobox('getValues'); //获取选中的值的values
		            $.map(values,
		            function(value) {
		                var el = opts.finder.getEl(target, value);
		                el.find('input.combobox-checkbox')._propAttr('checked', true);
		            })
		        },
		        onSelect: function(row) { //选中一个选项时调用
		            var opts = $(this).combobox('options');
		            //获取选中的值的values
		            $("#" + id).val($(this).combobox('getValues'));
					
		            //设置选中值所对应的复选框为选中状态
		            var el = opts.finder.getEl(this, row[opts.valueField]);
		            el.find('input.combobox-checkbox')._propAttr('checked', true);
		        },
		        onUnselect: function(row) { //不选中一个选项时调用
		            var opts = $(this).combobox('options');
		            //获取选中的值的values
		            $("#" + id).val($(this).combobox('getValues'));

		            var el = opts.finder.getEl(this, row[opts.valueField]);
		            el.find('input.combobox-checkbox')._propAttr('checked', false);
		        }
		    });
		}
	</script>
</body>
</html>