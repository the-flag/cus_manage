<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link type="text/css" rel="stylesheet" href="js/jquery-easyui-1.5.3/themes/default/easyui.css"/>
    <link type="text/css" rel="stylesheet" href="js/jquery-easyui-1.5.3/themes/icon.css"/>
    <link type="text/css" rel="stylesheet" href="js/css/main.css">
    <script src="js/jquery-easyui-1.5.3/jquery.min.js"></script>
	<script src="js/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
	<script src="js/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script>

</head>
<body>
<div class="easyui-layout" data-options="fit:true" id="useBox">

    <!--左侧树-->
    <div data-options="region:'east',split:true,title:'角色信息'", style="width: 400px">
        <fieldset id="roleMes">
            <legend>基本信息</legend>
            <form id="roleForm" class="easyui-form">

            <!-- <p><label>角色编号：</label><input type="text" class="inputDisable" disabled="disabled"></p> -->
            <p><label>角色名称：</label>
            	<input id="roleName" name="role_name" type="text" class="easyui-validatebox" data-options="required:true" >
            	<span id="roleNamespan" class="formSpan" name="">*</span>
            </p>
            <p><label class="textarea" id="roleNote" name="role_desc">角色描述：</label><textarea></textarea></p>
            </form>
        </fieldset>
        <fieldset>
            <legend>功能模块</legend>
            <ul id="tree" class="roleTree"></ul>
        </fieldset>
        <div class="forSubmint"> 
        	<a href="#" id="addsave" class="easyui-linkbutton"  iconCls="icon-save" onclick="obj.sum()">保存</a>
        	<a href="#" id="editsave" class="easyui-linkbutton"  iconCls="icon-save" onclick="obj.editsum()">保存</a>
        	<a href="#" class="easyui-linkbutton"  iconCls="icon-redo" >重置</a> </div>

    </div>
    <div data-options="region:'center',split:true">
        <!--表格查询-->
        <div class="tableFind">
            <p><label>角色名称;</label><input type="text" id="part" /><a id="btn" href="javascript:" class="easyui-linkbutton tableFindBut" data-options="iconCls:'icon-search'" onclick="obj.find()">查询</a></p>
        </div>
        <!--表格列表-->
        <div class="tableCon">
            <table id="table" class="tableStyle"></table>
            <div id="tabelBut">
                <div>
                    <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="obj.addBox()">新增</a>
                    <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-edit" onclick="obj.xiugai()">修改</a>
                    <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-remove" onclick="obj.del()">删除</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/role.js"></script>

</body>
</html>