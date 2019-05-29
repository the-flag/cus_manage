/**
 * Created by Administrator on 2017/11/8.

 */


/*
 * 自定2019-05-13
 * 
 * */


$("#mainBox").layout({
        fit:true,
        border:false
})
$("#mean").menu('show',{
        left: 200,
        top: 100
})
$("#left01").accordion({
        border:false

})
$("#con").tabs({
        fit:true,
        border:false
})


$("#myUpdPassForm").form("reset");

//修改个人基本信息对话框
$("#myMes").dialog({
        title:"个人信息详情",
        width:400,
        height:420,
        modal:true,
        iconCls:'icon-mes',
        maximizable:true,
        closed: true

})
//修改密码对话框
$("#myUpdPass").dialog({
        title:"安全设置",
        width:400,
        height:420,
        modal:true,
        iconCls:'icon-mes',
        maximizable:true,
        closed: true

})
//修改个人基本信息对话框
function openMes() {
        $("#myMes").dialog({
                closed: false

        })

}
//修改密码对话框
function myUpdPass() {
    $("#myUpdPass").dialog({
            closed: false

    })
    $("#myUpdPassForm").form("reset");
    $("#editNewPassSpan").text("");
    $("#editOldPassSpan").text("");
    $("#editTowPassSpan").text("");
}
$("#editOldPass").change(function(){
	var editOldPass=$("#editOldPass").val();
	var pPattern = /^.*(?=.{6,})(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*? ]).*$/; //密码强度正则，最少6位，包括至少1个大写字母，1个小写字母，1个数字，1个特殊字符
	if(pPattern.test(editOldPass)){
		$("#tishi").text("");
	}else{
		$("#tishi").text("旧密码格式错误!");
	}
});
$("#editNewPass").change(function(){
	var editNewPass=$("#editNewPass").val();
	var pPattern = /^.*(?=.{6,})(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*? ]).*$/; //密码强度正则，最少6位，包括至少1个大写字母，1个小写字母，1个数字，1个特殊字符
	if(pPattern.test(editNewPass)){
		$("#tishi").text("");
	}else{
		$("#tishi").text("新密码格式错误!!!");
	}
});
$("#editTowPass").change(function(){
	var editTowPass=$("#editTowPass").val();
	var editNewPass=$("#editNewPass").val();
	var pPattern = /^.*(?=.{6,})(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*? ]).*$/; //密码强度正则，最少6位，包括至少1个大写字母，1个小写字母，1个数字，1个特殊字符
	if(pPattern.test(editTowPass)){
		if(editNewPass==editTowPass){
			$("#tishi").text("");
		}else{
			$("#tishi").text("两次输入密码不一样!");
		}
	}else{
		$("#tishi").text("新密码格式错误!!!");
	}
});


/*function saveExit() {
        $.messager.confirm('退出确认','你是否退出系统？',function () {

        })

}*/

$(".topText a").click(function () {
        $(this).addClass('textActive').siblings().removeClass('textActive');

})
$("#left01  a").click(function () {
        var testVal=$(this).text();
        var thisUrl=$(this).attr('href');
        var con = '<iframe scrolling="no" frameborder="0"  src="'+thisUrl+'" style="width:100%;height:100%;">';
        $('#con').tabs('add',{
        		fit:true,
                title: testVal,
                selected: true,
                closable:true,
               content:con
        });

})
$("#con").tabs({
		fit:true,
        onSelect:function (tit,ind) {
                if(ind==0){
                        $("#ifDiv").attr('src',"getHome");
                }

        }
        
})

	//数据验证
		function validate() {
		  var editOldPass=$("#editOldPass").val();
		  var editNewPass=$("#editNewPass").val();
		  var editTowPass=$("#editTowPass").val();
		  //pPattern.test(editOldPass) &&
		  var pPattern = /^.*(?=.{6,})(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*? ]).*$/; //密码强度正则，最少6位，包括至少1个大写字母，1个小写字母，1个数字，1个特殊字符
		  if(pPattern.test(editOldPass)){
			  if(pPattern.test(editNewPass) && pPattern.test(editTowPass)){
					  if(editNewPass == editTowPass){
						  return true;
					  }
			  }
				 return false
		  }
		}

