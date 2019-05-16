<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Sign in or back</title>
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/default/easyui.css">   
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/icon.css">   
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>   
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>  
<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>  
</head>
<script type="text/javascript">
$(function(){
	$("#UserTab").datagrid({
	 url:'selectUserSign',
	 method:'post',
	 pagination:true,
	 toolbar:'#searchTab'
		
	});
	
	
	
});

//搜索
  function searchM(){
	alert($("#cname").val());
	   $('#UserTab').datagrid('load', {    
		   cname:$("#cname").val(),
		   visit:$("#visit").val(),
		   minTime:$("#minTime").datebox('getValue'),
		   maxTime:$("#maxTime").datebox('getValue'),
		   beginTime:$("#beginTime").datebox('getValue'),
		   endTime:$("#endTime").datebox('getValue')
		});  

	   
   }

function formattersex(value,row,index){
	return row.user_sex==1?'男':'女';
}

function formatterSign(value,row,index){
	return row.user_status==1?'已签到':'已签退';
}

//签退
function SignBack(){
	/* var datas=[];
	var status=[];
	var data=$("#UserTab").datagrid('getSelections');
    for(var i=0;i<data.length;i++){
    	datas.push(data[i].user_id);
    	status.push(data[i].user_status);
    }
    for(var i=0;i<status.length;i++){
    	alert(status[i]);
    } */
     var s='';
	var datas=[];
	var data=$("#UserTab").datagrid('getSelections');
    for(var i=0;i<data.length;i++){
    	datas.push(data[i].user_id);
    }
    for(var i=0;i<datas.length;i++){
    	s+=datas[i]+",";
    }
    s = s.substring(0,s.length - 1);
    alert(s);
    $.messager.confirm('确认','确认进行签退吗？',function(r){
    	if(r){
    		$.post("updateSignstatus",{s:s},function(data){
            	if(data>0){
            		$.messager.alert("提示","签退成功！");
            		$("#UserTab").datagrid("reload");
            	}else{
            		$.messager.alert("提示","签退失败！");
            	}
            	
            },"json");
    	}
    })
    
	
}
</script>
<body>
<table id="UserTab" class="easyui-datagrid"    
        data-options="fitColumns:true">   
    <thead>   
        <tr>
            <th data-options="field:'',width:100,checkbox:true">编号</th>
            <th data-options="field:'user_id',width:100">编号</th>
            <th data-options="field:'user_name',width:100">员工名字</th>
            <th data-options="field:'user_age',width:100">年龄</th>
            <th data-options="field:'user_sex',width:100,formatter:formattersex">性别</th>                    
            <th data-options="field:'user_password',width:100">密码</th>
            <th data-options="field:'user_email',width:100">电子邮箱 </th>
            <th data-options="field:'user_phone',width:100">电话</th>
            <th data-options="field:'user_creat_time',width:100">账号创建时间</th>
            <th data-options="field:'user_login_time',width:100">签到时间</th>
            <th data-options="field:'user_end_time',width:100">签退时间</th>
            <th data-options="field:'user_status',width:100,formatter:formatterSign">签到状态</th>
           
           
            
           
        </tr>   
    </thead>   
</table>  

<div id="searchTab">
   <form>
         <label for="name">名字</label>   
         <input type="text" name="name" id="cname" />  
         <label for="name">签到状态</label>  
         <select id="visit" > 
         <option value="">--请选择--</option>  
         <option value="1">已签到</option>   
         <option value="0">已签退</option>   
         </select>  
        
         <label for="name">签到开始时间</label>   
         <input type="text"  class= "easyui-datebox" id="minTime" /> 
         <label for="name">签到结束时间</label>
         <input type="text"  class= "easyui-datebox" id="maxTime"/>
         
         
          <label for="name">签退开始时间</label>   
         <input type="text"  class= "easyui-datebox" id="beginTime" /> 
         <label for="name">签退结束时间</label>
         <input type="text"  class= "easyui-datebox" id="endTime"/>    
         <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="searchM()" data-options="iconCls:'icon-search'">搜索</a>
         <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="SignBack()" data-options="iconCls:'icon-undo'">签退</a>
         
         
   </form>
 </div>
 
</body>
</html>