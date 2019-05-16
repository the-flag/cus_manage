<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet"
	href="js/jquery-easyui-1.5.3/themes/default/easyui.css" />
<link type="text/css" rel="stylesheet"
	href="js/jquery-easyui-1.5.3/themes/icon.css" />
<link type="text/css" rel="stylesheet" href="js/css/main.css">
<script src="js/jquery-easyui-1.5.3/jquery.min.js"></script>
<script src="js/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
<script src="js/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true" id="useBox">
		<!--左侧树-->
		<div data-options="region:'west',split:true,title:'部门管理'"
			style="width: 200px">
			<ul id="tree"></ul>

		</div>
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
							iconCls="icon-add" onclick="obj.addBox()">新增</a>
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
					class="easyui-validatebox"  data-options="required:true"><span id="adduser_accountspan"
					class="formSpan">*</span>
			</div>
			<div class="formDiv">
				<label>密码:</label><input type="password" name="user_password" id="adduser_password"
					class="easyui-validatebox"  data-options="required:true"><span id="adduser_passwordspan"
					class="formSpan">*</span>
			</div>
			<div class="formDiv">
				<label>邮箱:</label>
				<input type="text" id="adduser_email" class="easyui-validatebox" name="user_email" data-options="required:true">
				<span id="adduser_emailspan" class="formSpan">*</span>
			</div>
			<div class="formDiv">
				<label>手机号:</label><input type="text" name="user_phone" id="adduser_phone" id="adduser_phonespan"
					class="easyui-validatebox" data-options="required:true"><span
					class="formSpan">*</span>
			</div>
			<div class="formDiv">
				<label align="right" style="width: 70px;">分配角色：</label>
				<input id="xsry" name="xsry"  style="width: 150px;"  class="easyui-combobox" >
			</div>
				  
	
			<div class="forSubmint">
				<a href="#sum" class="easyui-linkbutton" iconCls="icon-ok"
					onclick="obj.sum()">提交</a> <a href="#" class="easyui-linkbutton"
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
					class="easyui-validatebox"  data-options="required:true,readonly:true"><span id="updateuser_accountspan"
					class="formSpan">*</span>
			</div>
			<div class="formDiv">
				<label>邮箱:</label>
				<input type="text" id="updateuser_email" class="easyui-validatebox" name="user_email" data-options="required:true">
				<span id="updateuser_emailspan" class="formSpan">*</span>
			</div>
			<div class="formDiv">
				<label>手机号:</label><input type="text" name="user_phone" id="updateuser_phone" 
					class="easyui-validatebox" data-options="required:true"><span
					class="formSpan">*</span>
			</div>
			<div class="forSubmint">
				<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
					onclick="obj.updatesum()">提交</a> <a href="#" class="easyui-linkbutton"
					id="res" iconCls="icon-redo" onclick="obj.res()">重置</a> <a
					href="#" class="easyui-linkbutton" id="can" iconCls="icon-cancel"
					onclick="obj.can()">取消</a>
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
				<button class="easyui-linkbutton"  onclick="obj.addUserRole()">>></button> 
				<a href="#" class="easyui-linkbutton"  onclick="obj.delUserRole()"><<</a>
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