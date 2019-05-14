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
					<label>用户名;</label><input type="text" id="user" /><label>部门;</label><input
						type="text" id="part" /><a id="btn" href="javascript:"
						class="easyui-linkbutton tableFindBut"
						data-options="iconCls:'icon-search'" onclick="obj.find()">查询</a>
				</p>
			</div>
			<!--表格列表-->
			<div class="tableCon">
				<table id="table" class="tableStyle"></table>
				<div id="tabelBut">
					<div>
						<a href="#" class="easyui-linkbutton" plain="true"
							iconCls="icon-add" onclick="obj.addBox()">新增</a> <a href="#"
							class="easyui-linkbutton" plain="true" iconCls="icon-edit">修改</a>
						<a href="#" class="easyui-linkbutton" plain="true"
							iconCls="icon-remove" onclick="obj.del()">删除</a>
					</div>
					<div>
						<form>
							<label for="name">用户名:</label> 
							<input class="easyui-validatebox" type="text" name="user_name" id="user_name" />
							<label for="name">创建时间:</label> 
							<input type= "text" class="easyui-datebox" name="min_creat_time" id="min_creat_time"></input>~ 
							<input type= "text" class="easyui-datebox" name="max_creat_time" id="max_creat_time"></input>
							<label for="name">是否锁定:</label> 
							<select id="user_is_lock" class="easyui-combobox" name="user_is_lock" style="width:200px;">   
							    <option value="1">否</option>   
							    <option value="2">是</option>   
							</select> 
							<a id="btn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="obj.find()">搜索</a>  
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!--//新增弹出框-->
	<div id="addBox">
		<form id="addForm" method="post">
			<div class="formDiv">
				<label>编号:</label><input type="text" name="id" id="no"
					class="easyui-validatebox" name="name" readonly="readonly"><span
					class="formSpan">*</span>
			</div>
			<div class="formDiv">
				<label>用户名称:</label><input type="text" name="user_name" id="user_name"
					class="easyui-validatebox" name="name" data-options="required:true"><span
					class="formSpan">*</span>
			</div>
			<div class="formDiv">
				<label>用户名称:</label><input type="text" name="user_name" id="user_name"
					class="easyui-validatebox" name="name" data-options="required:true"><span
					class="formSpan">*</span>
			</div>
			<div class="formDiv">
				<label>密码:</label><input type="password" name="pass" id="pass"
					class="easyui-validatebox" name="pass" data-options="required:true"><span
					class="formSpan">*</span>
			</div>
			<div class="formDiv">
				<label>入职时间:</label><input type="text" name="time" id="time"
					class="easyui-datebox" name="time" style="width: 70%; height: 26px">
			</div>
			<div class="formDiv">
				<label>所属部门:</label><input type="text" name="part" id="part01" />
			</div>
			<div class="formDiv">
				<label>所属角色:</label><input id="role" name="title">
			</div>


			<div class="forSubmint">
				<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
					onclick="obj.sum()">提交</a> <a href="#" class="easyui-linkbutton"
					id="res" iconCls="icon-redo" onclick="obj.res()">重置</a> <a
					href="#" class="easyui-linkbutton" id="can" iconCls="icon-cancel"
					onclick="obj.can()">取消</a>
			</div>

		</form>
	</div>
	<script src="js/user.js"></script>
	<script type="text/javascript">
		/* var date1;
		var date2;
		$('#d1').datebox({
		    onSelect: function(date){
		       date1=date;
		       
		    }
		});
		$('#d2').datebox({
		    onSelect: function(date){
		    	date2=date;
		    	if(date1!=null){
		    		
		    	}
		    }
		}); */
	

	</script>
</body>
</html>