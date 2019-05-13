<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>WDPHP素材源码</title>

    <link type="text/css" rel="stylesheet" href="js/jquery-easyui-1.5.3/themes/default/easyui.css"/>
    <link type="text/css" rel="stylesheet" href="js/jquery-easyui-1.5.3/themes/icon.css"/>
    <link type="text/css" rel="stylesheet" href="css/main.css">

</head>
<body>

<div class="easyui-layout" id="mainBox">
    <div data-options="region:'north',split:true" style="height: 80px" class="mainTop">
        <div class="topLogin"><img src="img/logoImg.png"/> <div class="topLongRight">xxxxxx安全管理平台</div></div>
        <div class="topText">
            <a href="home.html" class="textActive" target="frameName">
                <p style="margin-top: 10px"><img src="img/home.png"/> </p>
                <p style="margin-top: 5px">系统首页</p>
            </a>
            <a href="low.html" target="frameName" >
            <p style="margin-top: 10px"><img src="img/computer.png"/> </p>
            <p style="margin-top: 5px">流程图</p>
        </a>
            <a href="staAnalysis1.html"  target="frameName">
                <p style="margin-top: 10px"><img src="img/ogrn.png"/> </p>
                <p style="margin-top: 5px">统计分析</p>
            </a>
            <a href="sport01.html" target="frameName">
                <p style="margin-top: 10px"><img src="img/action.png"/> </p>
                <p style="margin-top: 5px">报表填写</p>
            </a>
        </div>
        <!--<div class="topMean"><i class="i_admin"></i> <a href="#" >管理员</a><span class="spanBlock"></span> </div>-->
         <div href="javascript:void(0)" id="mb" class="easyui-menubutton topMean"
           data-options="menu:'#mm',iconCls:'icon-admin'">管理员帐号</div>
        <div id="mm" >
            <div data-options="iconCls:'icon-man'"><a href="javascript:void(0)" onclick="openMes()">个人信息</a> </div>
            <div data-options="iconCls:'icon-redo'"><a href="javascript:void(0) "onclick="saveExit()">安全退出</a> </div>
            <div data-options="iconCls:'icon-cancel'"><a href="javascript:void(0)" onclick="saveCanle()"> 注销</a> </div>

        </div>
    </div>
    <div data-options="region:'south',split:true" style="height:40px;" class="footStyle">
        版本所有@2017-2018xxxxxxx有很责任公司
    </div>
    <div  data-options="region:'west',title:'功能菜单',split:true,iconCls:'icon-left01'" style="width:200px;">
        <div id="left01"  class="easyui-accordion" >
            <div title="权限管理" data-options="iconCls:'icon-left05',selected:true" class="mainPanle">
                <p><i class="i_a i_user"></i> <a href="user.html" target="frameName">用户管理</a> </p>
                <p><i class="i_a i_user"></i> <a href="person.html" target="frameName">人员管理</a> </p>
                <p><i class="i_a i_part"></i> <a href="part.html" target="frameName">部门管理</a> </p>
                <p><i class="i_a i_rol"></i> <a href="role.html" target="frameName">角色管理</a> </p>
            </div>
            <div title="表格管理" data-options="iconCls:'icon-remove'" class="mainPanle">
                <p><i class="i_a i_table"></i><a href="table.html" target="frameName">表格管理</a> </p>
                <p><i class="i_a i_table01"></i><a href="table01.html" target="frameName">树表格</a> </p>
                <p><i class="i_a i_neesTable"></i><a href="newTable.html" target="frameName">新闻管理</a> </p>
                <p><i class="i_a i_ph"></i><a href="ph.html" target="frameName">图片管理</a> </p>
            </div>
            <div title="表单管理" data-options="iconCls:'icon-left04'" class="mainPanle">
                <p><i class="i_a i_news"></i><a href="news.html" target="frameName">新闻表单</a> </p>
                <p><i class="i_a i_con"></i><a href="Tail.html" target="frameName">一般表单</a> </p>

            </div>
            <div title="报表管理" data-options="iconCls:'icon-left02'" class="mainPanle">
                <p><i class="i_a i_sport"></i><a href="sport01.html" target="frameName">报表样式一</a> </p>
                <p><i class="i_a i_sport01"></i><a href="sport02.html" target="frameName">报表样式二管理</a> </p>
                <p><i class="i_a i_sport02"></i><a href="sport03.html" target="frameName">报表样式三管理</a> </p>
            </div>
            <div title="统计分析" data-options="iconCls:'icon-left03'" class="mainPanle">
                <p><i class="i_a i_sta"></i><a href="staAnalysis.html" target="frameName">统计分析一</a> </p>
                <p><i class="i_a i_sta"></i><a href="staAnalysis1.html" target="frameName">统计分析二</a> </p>

            </div>
            <div title="流程图" data-options="iconCls:'icon-low'" class="mainPanle">
                <p><i class="i_a i_low"></i><a href="low.html" target="frameName">流程图</a> </p>
                <p><i class="i_a i_low"></i><a href="lowDemo.html" target="frameName">流程图生成器</a> </p>


            </div>
            <div title="地图" data-options="iconCls:'icon-map'" class="mainPanle">
                <p><i class="i_a i_low"></i><a href="map.html" target="frameName">地图界面</a> </p>


            </div>
            <div title="日程管理" data-options="iconCls:'icon-card'" class="mainPanle">
                <p><i class="i_a i_low"></i><a href="calendar.html" target="frameName">日程管理</a> </p>


            </div>

        </div>


    </div>
    <div data-options="region:'center'" style="padding:5px;background:#eee;">
        <div id="con">
            <div title="系统首页" >
               <iframe frameborder="0" width="100%" height="100%" name="frameName" src="home.html" scrolling="auto" id="ifDiv" ></iframe>
            </div>
        </div>

    </div>
</div>
<div id="myMes">

<p><label class="diaLable">用户名：</label><input  class="easyui-validatebox TailInput" disabled="disabled" data-options="required:true,novalidate:true" value="张林海"></p>
   <p><label class="diaLable">登录名称：</label><input  class="easyui-validatebox TailInput" data-options="required:true" value="zhanglinghai"></p>
    <p><label class="diaLable">用户密码：</label><input  type="password" value="123456" class="easyui-validatebox TailInput" data-options="required:true,"></p>
    <p><label class="diaLable">用户角色：</label><input  class="easyui-validatebox TailInput" disabled="disabled" data-options="required:true,novalidate:true" value="管理员"></p>
    <p><label class="diaLable">所属部门：</label><input  class="easyui-validatebox TailInput" disabled="disabled" data-options="required:true,novalidate:true" value="行政部门"></p>
    <p><label class="diaLable areaLabel">描述：</label><textarea class="TailArea01" ></textarea></p>
    <div class="forSubmint"> <a href="#" class="easyui-linkbutton"  iconCls="icon-save" >保存</a><a href="#" class="easyui-linkbutton"  iconCls="icon-redo" >重置</a> </div>
</div>

<script src="js/jquery-easyui-1.5.3/jquery.min.js"></script>
<script src="js/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
<script src="js/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script>
<script src="js/main.js"></script>

</body>
</html>