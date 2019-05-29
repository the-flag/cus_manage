<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>WDPHP素材源码</title>

    <link type="text/css" rel="stylesheet" href="js/jquery-easyui-1.5.3/themes/default/easyui.css"/>
    <link type="text/css" rel="stylesheet" href="js/jquery-easyui-1.5.3/themes/icon.css"/>
    <link type="text/css" rel="stylesheet" href="js/css/main.css">
	<script src="js/jquery-easyui-1.5.3/jquery.min.js"></script>
	<script src="js/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
	<script src="js/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">

		
		$(function(){
			
			window.onbeforeunload = function (){ 
				$.post("closePage",{
					user_account:"root"
				},function(){
					
				},"json")
			};
			$("#homeTree").tree({    
			    url:'showHomeTree',
			    method:"post",
			    queryParams:{
			    	user_id:${m.user_id }
			    },onSelect: function(node){
					alert(node.text);  // 在用户点击的时候提示
					treeNodeClick(node);
				}
			});  
			
		})
		function treeNodeClick(node){
			var flag = $("#con").tabs('exists', node.text);
	       var isLeaf = $('#homeTree').tree('isLeaf',node.target); //是否是叶子节点
	       if (isLeaf) {//只有叶子节点才会在选项卡中创建选项页（每个选项页对应1个功能）
	    	   var con = '<iframe scrolling="auto" frameborder="0"  src="'+node.url+'" style="width:100%;height:100%;">';
	       		if(!flag) {
	             	/* $('#tt').tabs('add', { //在选项卡中，创建1个选项页
	                	title: re,   //选项卡中，选项页的标题（在同一个选项卡中，选项页需要保持一致）。
	                    closable: true,
	                    content: "<a href='"+low.html+"' target='frameName'>流程图</a>"    //此处做了调整，推荐使用iframe的方式实现
	                }); */
	       			$('#con').tabs('add',{
	                    title: node.text,
	                    selected: true,
	                    closable:true,
	                   content:con
	            	});
	            } else {
	                $("#con").tabs('select', node.text); //直接选中title对应的选项卡
	            }
	       }
		}
		//修改密码，保存
	
		
		function editPass(){
			if(validate()){
				 var editOldPass=$("#editOldPass").val();
				var user_account=$("#user_account").val();
				  var editNewPass=$("#editNewPass").val();
				  var editTowPass=$("#editTowPass").val(); 
				$.post("validationPass",{
					user_password:editOldPass,
					user_account:user_account
				},function(data){
					if(data){
						$.post("updateUserByAccount",{
							user_password:editNewPass,
							user_account:user_account
						},function(i){
							if(i>0){
								$.messager.alert('提示','修改成功');
								closeeditPass();
							}
						},"json")
						
					}
					
				},"json")
			}
			 
		}
		function closeeditPass(){
			$("#myUpdPass").dialog("close");
			$("#myUpdPassForm").form("clear");
		}
		
		function saveCanle() {
	        $.messager.confirm('注销确认','你是否注销用户？',function () {
	        	/* $.post("exitlogin",{
	        		user_account:${m.user_account}
	        	},function(data){
	        		
	        	},"json") */
	        	window.location.href="exitlogin";

	        })
		}

	/* 	
		$(function(){
			
			var userAgent = navigator.userAgent;
			var flag = userAgent.indexOf("Chrome") > -1; 
			alert("是否是谷歌浏览器:"+flag);
			window.onunload = function() {
			    if(flag){
			         console.log('关闭操作');
			    }else {
			         console.log('刷新操作');
			    }
			};
			window.onbeforeunload = function () {
				alert("刷新！！！！");
				if(!flag){
			    	console.log('关闭操作');
			    }else{
			        console.log('刷新操作');
			    }
			};
		}) */
		
	</script>
	
	
</head>
<body onbeforeunload="goodbye">

<div class="easyui-layout" id="mainBox">
    <div data-options="region:'north',split:true" style="height: 80px" class="mainTop">
        <div class="topLogin"><img src="img/logoImg.png"/> <div class="topLongRight">xxxxxx安全管理平台</div></div>
       <!--  <div class="topText">
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
        </div> -->
        <!--<div class="topMean"><i class="i_admin"></i> <a href="#" >管理员</a><span class="spanBlock"></span> </div>-->
         <div href="javascript:void(0)" id="mb" class="easyui-menubutton topMean"
           data-options="menu:'#mm',iconCls:'icon-admin'">${m.user_name }帐号</div>
        <div id="mm" >
            <div data-options="iconCls:'icon-man'"><a href="javascript:void(0)" onclick="openMes()">个人信息</a> </div>
            <div data-options="iconCls:'icon-redo'"><a href="javascript:void(0) "onclick="myUpdPass()">安全设置</a> </div>
            <div data-options="iconCls:'icon-cancel'"><a href="javascript:void(0)" onclick="saveCanle()"> 注销</a> </div>

        </div>
    </div>
    <div data-options="region:'south',split:true" style="height:40px;" class="footStyle">
        版本所有@2017-2018xxxxxxx有很责任公司
    </div>
    <div  data-options="region:'west',title:'功能菜单',split:true,iconCls:'icon-left01'" style="width:200px;">
        <ul id="homeTree"></ul>  
    </div>
    <div data-options="region:'center'" style="padding:5px;background:#eee;">
        <div id="con" fit="true">
            <div title="系统首页" >
               <iframe frameborder="0" width="100%" height="100%" name="frameName" src="getHome" scrolling="auto" id="ifDiv" ></iframe>
            </div>
        </div>

    </div>
</div>
<div id="myMes">
 	<p><label class="diaLable">登录账号：</label><input  class="easyui-validatebox TailInput" disabled="disabled" data-options="required:true" value="${m.user_account}"></p>
	<p><label class="diaLable">用户名：</label><input  class="easyui-validatebox TailInput"  data-options="required:true,novalidate:true" value="${m.user_name}"></p>
    <div class="forSubmint"> <a href="#" class="easyui-linkbutton"  iconCls="icon-save" >保存</a><a href="#" class="easyui-linkbutton"  iconCls="icon-redo" >重置</a> </div>
</div>
<div id="myUpdPass">
	<form id="myUpdPassForm" class="easyui-form">
	<input id="user_account" type="hidden" value="${m.user_account}">
	<p><label class="diaLable"></label><span style="color: red" id="tishi"></span></p>
 	<p><label class="diaLable">旧密码：</label><input id="editOldPass" type="password" class="easyui-validatebox TailInput"  data-options="required:true"><span id="editOldPassSpan"></span></p>
	<p><label class="diaLable">新密码：</label><input id="editNewPass" type="password"  class="easyui-validatebox TailInput"  data-options="required:true"><span id="editNewPassSpan"></span></p>
    <p><label class="diaLable">再次确定密码：</label><input id="editTowPass"  type="password"  class="easyui-validatebox TailInput" data-options="required:true" value=""><span id="editTowPassSpan"></span></p>
    </form>
    <div class="forSubmint"> <a href="javascript:void(0)" class="easyui-linkbutton"  iconCls="icon-save" onclick="editPass()">保存</a><a href="#" class="easyui-linkbutton"  iconCls="icon-redo" onclick="closeeditPass()">取消</a> </div>
</div>


<script src="js/main.js"></script>

</body>
</html>