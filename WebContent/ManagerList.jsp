<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
   $(function(){
	   $("#managerTab").datagrid({
		 url:'selectManager',
		 method:'post',
		 pagination:true,
		 toolbar:"#searchTab"
	   })
	   
   })
   //咨询师
   function formatteruser_name(value,row,index){
	   return row.user.user_name;
   }
   //格式化性别
   function formattersex(value,row,index){
	   return row.customer_sex==1?'男':'女';
   }
   //是否访问
   function formattervisit(value,row,index){
	   alert(row.customer_visit);
	   return row.customer_visit==1?'是':'否'; 
   }
   //是否上门
   function formatteringate(value,row,index){
	   return row.customer_ingate==1?'是':'否'; 
   }
</script>
<body>
  <table id="managerTab" class="easyui-datagrid"    
        data-options="fitColumns:true,singleSelect:true">   
    <thead>   
        <tr>   
            <th data-options="field:'customer_id',width:100">No</th>
            <th data-options="field:'customer_no',width:100">客户编号</th>
            <th data-options="field:'customer_name',width:100">名字</th>
            <th data-options="field:'customer_age',width:100">年龄</th>
            <th data-options="field:'customer_sex',width:100,formatter:formattersex">性别</th>
            <th data-options="field:'customer_visit',width:100,formatter:formattervisit">是否访问</th>
            <th data-options="field:'customer_ingate',width:100,formatter:formatteringate">是否上门</th>
            <th data-options="field:'customer_create_time',width:100">创建时间</th>
            <th data-options="field:'customer_source',width:100">来源渠道</th>
            <th data-options="field:'user.user_name',width:100,formatter:formatteruser_name">咨询师</th>
           
            
           
        </tr>   
    </thead>   
</table>  
 <div id="searchTab">
   <form>
         <label for="name">名字</label>   
         <input type="text" name="name" id="" /> 
         <label for="name">咨询师</label>   
         <input type="text" name="name" id="" /> 
         <label for="name">是否访问</label>   
         <input type="text" name="name" id="" /> 
         <label for="name">是否上门</label>   
         <input type="text" name="name" id="" /> 
         <label for="name">上门时间min</label>   
         <input type="text" name="name" id="" /> 
         <label for="name">上门时间max</label>   
         <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="searchM()" data-options="iconCls:'icon-search'">搜索</a>  
         
   </form>
 </div>
</body>
</html>