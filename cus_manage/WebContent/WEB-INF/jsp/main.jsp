<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		
	
	
	
	
	
	
	var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串  
	var isOpera = userAgent.indexOf("Opera") > -1; //判断是否Opera浏览器  
	var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera; //判断是否IE浏览器
	var isIE11 = userAgent.indexOf("rv:11.0") > -1; //判断是否是IE11浏览器
	var isEdge = userAgent.indexOf("Edge") > -1 && !isIE; //判断是否IE的Edge浏览器
	if(!isIE && !isEdge && !isIE11) {//兼容chrome和firefox
		var _beforeUnload_time = 0, _gap_time = 0;
		var is_fireFox = navigator.userAgent.indexOf("Firefox")>-1;//是否是火狐浏览器
		window.onunload = function (){
			_gap_time = new Date().getTime() - _beforeUnload_time;
			if(_gap_time <= 5){
				$.post('closePage');//浏览器关闭
			}else{//浏览器刷新
				$.post('closePage');
			}
	 	}
		window.onbeforeunload = function (){ 
			_beforeUnload_time = new Date().getTime();
			if(is_fireFox){//火狐关闭执行
				$.post('closePage');//浏览器关闭
			} 
		};
	}

	
		$(function(){
			
			/* window.onbeforeunload = function (){ 
				$.post("closePage",{
					user_account:"root"
				},function(){
					
				},"json")
			}; */
			
			
			$("#homeTree").tree({    
			    url:'showHomeTree',
			    method:"post",
			    queryParams:{
			    	user_id:${m.user_id }
			    },onSelect: function(node){
					/* alert(node.text); */  // 在用户点击的时候提示
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
								closeeditPass();
								window.location.href="exitlogin";
							}else{
								$.messager.alert('提示','网络发生错误!');
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

		
		
		//签退
		function Signback(){
			
			$.post("selectUserstatus",{user_id:${m.user_id}},function(data){
				if(data.user_status!=1){
					$.messager.alert('提示','不能重复签退呢！');
				}else{
					var myDate = new Date();
					alert(myDate.toLocaleDateString());
					   $.messager.confirm('确认','确认进行签退吗？',function(r){
					    	if(r){
					    		$.post("updateSignback",{user_id:${m.user_id},s:myDate.toLocaleDateString()},function(data){
					            	if(data>0){
					            		$.messager.alert("提示","签退成功！");
					            		$("#NetWorkTeacherTab").datagrid("reload");
					            	}else{
					            		$.messager.alert("提示","签退失败！");
					            	}
					            	
					            },"json");
					    	}
					    });
					
				}
				
				
			},"json");
				
				    
			
			
			
			
		}

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
            <div data-options="iconCls:'icon-undo'"><a href="javascript:void(0)" onclick="Signback()">签退</a> </div>

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
 	<p><label class="diaLable">登录账号：</label><input id="peruser_account" class="easyui-validatebox TailInput" disabled="disabled" data-options="required:true" value="${m.user_account}"></p>
	<p><label class="diaLable">用户名：</label><input	id="peruser_name"  class="easyui-validatebox TailInput"  data-options="required:true,novalidate:true" value="${m.user_name}"><span id="peruser_namespan"></span></p>
	<%-- <p><label class="diaLable">性别：</label>
		<select id="user_is_lock" class="easyui-combobox" id="peruser_sex"  style="width:200px;">   
							<c:choose>
								<c:when test="${m.user_sex}==1">
									<option value="1" selected="selected">男</option>   
								    <option value="2">女</option> 
								</c:when>
								<c:otherwise>
									<option value="1">男</option>   
								    <option value="2" selected="selected">女</option> 
								</c:otherwise>
							</c:choose>
							      
		</select>
		<span id="peruser_sexspan"></span>
	</p>
	<p><label class="diaLable">年龄：</label><input id="peruser_age"  class="easyui-validatebox TailInput"  data-options="required:true,novalidate:true" value="${m.user_age}"><span id="peruser_agespan"></span></p> --%>
	<p><label class="diaLable">邮箱：</label><input id="peruser_email"  class="easyui-validatebox TailInput"  data-options="required:true,novalidate:true" value="${m.user_email}"><span id="peruser_emailspan"></span></p>
		<input id="peruser_vali" type="hidden" value="${m.user_email}">
		<input id="peruser_phonevali" type="hidden" value="${m.user_phone}">
	<p><label class="diaLable">手机号：</label><input id="peruser_phone"  class="easyui-validatebox TailInput"  data-options="required:true,novalidate:true" value="${m.user_phone}"><span id="peruser_phonespan"></span></p>
    <div class="forSubmint"> <a href="#" class="easyui-linkbutton"  iconCls="icon-save" onclick="savePersonalInformation()" >保存</a><a href="#" class="easyui-linkbutton"  iconCls="icon-redo" >重置</a> </div>
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
<script type="text/javascript">
	/* //验证年龄
	function isint1(str)
	{
	 var result=str.match(/^[0-9]$|^([1-9])([0-9]){0,3}$|^120$/);
	 if(result==null) return false;
	 return true;
	} */
	
	function savePersonalInformation(){
		var regex = /^([0-9A-Za-z\-_\.]+)@([0-9a-z]+\.[a-z]{2,3}(\.[a-z]{2})?)$/g; //邮箱
		var reg = /^1[3|4|5|7|8]\d{9}$/; //手机验证
		var peruser_account=$("#peruser_account").val();
		var peruser_name=$("#peruser_name").val();
		/* var peruser_sex=$("#peruser_sex").val();
		alert(peruser_sex);
		var peruser_age=$("#peruser_age").val(); */
		var peruser_email=$("#peruser_email").val();
		var peruser_phone=$("#peruser_phone").val();
		if(peruser_name==null || peruser_name==''){
			$("#peruser_namespan").text("用户名格式错误!!");
			return false;
		}
		var emailvali=false;
		$("#peruser_namespan").text("");
		var user_email=$("#peruser_vali").val();
			
			if(regex.test(peruser_email)){
				if(user_email!=peruser_email){
					$.post("selectUserByEmail",{
						user_email:peruser_email
					},function(validation){
						if(!validation){
							$("#peruser_emailspan").text("此邮箱已存在!");
							emailvali=false;
							return;
			    		}else{
			    			$("#peruser_emailspan").text("");
							emailvali=true;
							return true;
			    		}
					},"json")
				}else{
					emailvali=true;
				}
				
			}else{
				$("#peruser_emailspan").text("邮箱格式错误!!");
				emailvali=false;
				return false;
			}
			var phonevali=false;
			var user_phone=$("#peruser_phonevali").val();
			if(reg.test(peruser_phone)){
				if(user_phone!=peruser_phone){
					$.post("selectUserByPhone",{
						phone:peruser_phone
					},function(validation){
						if(validation){
							alert("手机号重复!");
							$("#peruser_phonespan").text("手机号已存在!");
							phonevali=false;
							return;
			    		}else{
							phonevali=true;
							$("#peruser_phonespan").text("");
			    		}
					},"json")
				}else{
					phonevali=true;
				}
			}else{
				$("#peruser_phonespan").text("手机号格式错误!!");
				phonevali=false;
				return false;
			}
			if(emailvali && phonevali){
				$.post("updateUserByAccount",{
					user_account:peruser_account,
					user_name:peruser_name,
					user_email:peruser_email,
					user_phone:peruser_phone
				},function(data){
					if(data>0){
						 $.messager.alert('提示','修改成功!'); 
						 $("#myMes").dialog({
				                closed: true
				         })
						 window.location.href="getMain";
						 
					}else{
						 $.messager.alert('提示','网络错误!'); 
					}
					
				},"json")
			}
			
		
	}
</script>
</body>
</html>