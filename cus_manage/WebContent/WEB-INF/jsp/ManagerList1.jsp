<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>咨询经理首页</title>
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/default/easyui.css">   
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/icon.css">   
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>   
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>  
<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>  
</head>
<script type="text/javascript">


//展示首页数据
   $(function(){
	   $("#managerTab").datagrid({
		 url:'selectManager1',
		 method:'post',
		 pagination:true,
		 toolbar:"#searchTab",
		 queryParams:{
			 userw_id:${m.user_id}
			}
	   });
	   
   });


   //格式化性别
   function formattersex(value,row,index){
	   return row.customer_sex==1?'男':'女';
   }
   //是否访问
   function formattervisit(value,row,index){
	   return row.customer_visit==1?'是':'否'; 
   }
   //是否上门
   function formatteringate(value,row,index){
	   return row.customer_ingate==1?'是':'否'; 
   }
 //客户状态
   function formatterstatus(value,row,index){
   	if(row.customer_status==1){
   		return "未知";
   	}
   	if(row.customer_status==2){
   		return "待业";
   	}
   	if(row.customer_status=3){
   		return "在职";
   	}
   	if(row.customer_status==4){
   		return "在读";
   	}
   	}

   
  

  
 
  //跟踪
  function fenpeiCustomer(){
	  $("#GZwin").window("open");
	  
  }
  
 
  
  function CustomerTrack(){
	    var s="";
		var data=$("#managerTab").datagrid('getSelections');
		
	    for(var i=0;i<data.length;i++){
	    	s=s+data[i].customer_id+",";
	    }
	    s = s.substring(0,s.length - 1);
	    alert(s);
	    $.post("updateCustomerTrack",{s:s,user_id:$("#geTesgt").val()},function(data){
	    	if(data>0){
	    		$.messager.alert('提示','更换咨询师成功');
	    		$("#managerTab").datagrid("reload");
	    		$("#GZwin").window("close");
	    	}else{
	    		$.messager.alert('提示','更换咨询师失败');
	    	}
	    	
	    },"json");
  }
	    
//搜索
  function searchM(){
	   $('#managerTab').datagrid('load', {    
		   cname:$("#cname").val(),
		   visit:$("#visit").val(),
		   ingate:$("#ingate").val(),
		   minTime:$("#minTime").datebox('getValue'),
		   maxTime:$("#maxTime").datebox('getValue')
		});  

	   
  }

  
</script>
<body>
<div id="searchTab">
   <form>
         <label for="name">名字</label>   
         <input type="text" name="name" id="cname" /> 
         <label for="name">是否访问</label>  
         <select id="visit" > 
         <option value="">--请选择--</option>  
         <option value="1">是</option>   
         <option value="0">否</option>   
         </select>  
         <label for="name">是否上门</label>   
          <select id="ingate">   
         <option value="">--请选择--</option>
         <option value="1">是</option>   
         <option value="0">否</option>   
         </select>         
         <label for="name">上门时间min</label>   
         <input type="text"  class= "easyui-datebox" id="minTime" /> 
         <label for="name">上门时间max</label>
         <input type="text"  class= "easyui-datebox" id="maxTime"/>    
         <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="searchM()" data-options="iconCls:'icon-search'">搜索</a>
         <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="fenpeiCustomer()" data-options="iconCls:'icon-redo'">设置跟踪人员</a>

   </form>
 </div>

  <table id="managerTab" class="easyui-datagrid"    
        data-options="fitColumns:true">   
    <thead>   
        <tr> 
             <th data-options="field:'',width:100,checkbox:true"></th>  
            <th data-options="field:'customer_id',width:20">No</th>
            <th data-options="field:'customer_no',width:50">客户编号</th>
            <th data-options="field:'customer_name',width:50">名字</th>
            <th data-options="field:'customer_age',width:20">年龄</th>
             <th data-options="field:'customer_academic',width:30">学历</th>
            <th data-options="field:'customer_region',width:50">所属地区</th>
            <th data-options="field:'customer_level',width:20">客户等级</th>
            <th data-options="field:'customer_address',width:100">地址</th>
            <th data-options="field:'customer_post',width:50">邮政编码</th>
            <th data-options="field:'customer_status',width:50,formatter:formatterstatus">客户状态</th>
            <th data-options="field:'customer_qq',width:100">QQ</th>
            <th data-options="field:'customer_course',width:50">课程方向</th>
            <th data-options="field:'customer_onevisit_time',width:100">首次回访时间</th>
            <th data-options="field:'customer_ingate_time',width:100">上门时间</th>
            <th data-options="field:'customer_sex',width:30,formatter:formattersex">性别</th>
            <th data-options="field:'customer_visit',width:30,formatter:formattervisit">是否访问</th>
            <th data-options="field:'customer_ingate',width:30,formatter:formatteringate">是否上门</th>
            <th data-options="field:'customer_create_time',width:100">创建时间</th>
            <th data-options="field:'customer_source',width:50">来源渠道</th>
            
            
           
        </tr>   
    </thead>   
</table>  
 

 
 
 
 <!-- 跟踪 -->
 <div id="GZwin" class="easyui-dialog" title="Add Customer" style="width:250px;height:400px"   
        data-options="iconCls:'icon-save',modal:true,closed:true,draggable:true">
        <select id="geTesgt">
        <option value="">--请选择--</option>
        <c:forEach items="${selectUserReferTeacher}" var="surt">
         <option value="${surt.user_id}">${surt.user_name}</option>
        </c:forEach>
        </select>
        <center>
         <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="CustomerTrack()" data-options="iconCls:'icon-save'">提交</a>    
        </center>
 </div>
 
 
</body>
</html>