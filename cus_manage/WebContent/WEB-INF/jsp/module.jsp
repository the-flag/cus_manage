<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <title>模块管理</title>

    <link type="text/css" rel="stylesheet" href="js/jquery-easyui-1.5.3/themes/default/easyui.css"/>
    <link type="text/css" rel="stylesheet" href="js/jquery-easyui-1.5.3/themes/icon.css"/>
    <link type="text/css" rel="stylesheet" href="js/css/main.css">
    <script src="js/jquery-easyui-1.5.3/jquery.min.js"></script>
	<script src="js/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
	<script src="js/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script>

</head>
<body onload="init()">
<div class="easyui-layout" data-options="fit:true" id="useBox">
    <!--左侧树-->
    <div data-options="region:'west',split:true,title:'部门管理'", style="width:50%">
        <ul id="tree"></ul>
    </div>
    <div data-options="region:'center',split:true">
       <form id="formBox">
           <div class="formDiv01">
               <label>模块编号：</label><input type="text" name="module_id" id="partId" class="easyui-validatebox" data-options="readonly:true"><span class="formSpan">*</span>
           </div>
           <div class="formDiv01">
               <label>模块名称：</label><input type="text" name="module_name" id="partName" class="easyui-validatebox" data-options="required:true"><span id="partNameSpan" class="formSpan">*</span>
           </div>
           <div class="formDiv01">
               <label>上级模块：</label><input type="text" name="module_parent_id" id="parentPart"><span class="formSpan"></span>
           </div>
           <div class="formDiv01">
               <label>模块访问路径：</label><input type="text" name="module_path" id="module_path"><span class="formSpan"></span>
           </div>
           <div class="formDiv01">
               <label>模块权重：</label><input type="text" name="module_weight" id="module_weight" ><span class="formSpan"></span>
           </div>
           
           <!-- <div class="formDiv01">
               <label>部门负责人：</label><input type="text" id="partPer" ><span class="formSpan"></span>
           </div>
           <div class="formDiv01">
           	<label>部门邮箱地址：</label><input type="text" id="partEmail" class="easyui-validatebox" data-options="validType:'email'" ><span class="formSpan"></span>
       		</div>
           <div class="formDiv01">
               <label>联系电话：</label><input type="text" class="easyui-validatebox" id="partTele" data-options="validType:'length[7,11]'" ><span class="formSpan"></span>
           </div>
           <div class="formDiv01">
               <label class="textarea">部门简介：</label><textarea id="note"></textarea></span>
           </div> -->
           <div class="forSubmint"><a href="#" class="easyui-linkbutton" id="save" style="display: none" iconCls="icon-save" onclick="saveForm()">保存</a> <a href="#" class="easyui-linkbutton"  iconCls="icon-edit" id="edit" onclick="editForm()">修改</a><a href="#" class="easyui-linkbutton"  iconCls="icon-cancel" >取消</a> </div>
       </form>
        <div class="formFoot">
            <p><span>注意事项：</span></p>
            <p>1,该界面为详情界面，当新增的时候，模块编号为自动生成，其中模块名称为必填写项</p>
            <p>2,该界面为详情界面，当新增的时候，模块编号为自动生成，其中模块名称为必填写项</p>
            <p>3,该界面为详情界面，当新增的时候，模块编号为自动生成，其中模块名称为必填写项</p>
        </div>

    </div>
</div>
<div id="mean" class="easyui-menu treemenu" >
    <div data-options="iconCls:'icon-add'" onclick="addPart()">新增模块</div>
    <div data-options="iconCls:'icon-edit'" onclick="editForm()">修改模块</div>
    <div data-options="iconCls:'icon-cancel'" onclick="delPart()">删除模块</div>
</div>
<script src="js/part.js"></script>

</body>
</html>