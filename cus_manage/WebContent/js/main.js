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

}

//修改密码，保存
function editPass(){
	
}
/*function saveExit() {
        $.messager.confirm('退出确认','你是否退出系统？',function () {

        })

}*/
function saveCanle() {
        $.messager.confirm('注销确认','你是否注销用户？',function () {
        	window.location.href="exitlogin";

        })

}
$(".topText a").click(function () {
        $(this).addClass('textActive').siblings().removeClass('textActive');

})
$("#left01  a").click(function () {
        var testVal=$(this).text();
        var thisUrl=$(this).attr('href');
        var con = '<iframe scrolling="no" frameborder="0"  src="'+thisUrl+'" style="width:100%;height:100%;">';
        $('#con').tabs('add',{
                title: testVal,
                selected: true,
                closable:true,
               content:con
        });

})
$("#con").tabs({
        onSelect:function (tit,ind) {
                if(ind==0){
                        $("#ifDiv").attr('src',"getHome");
                }

        }
})



