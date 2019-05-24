<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>客户跟进</title>
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/default/easyui.css">   
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/icon.css">   
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>   
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>  
<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
<style type="text/css">
 .datagrid-btable .datagrid-cell{padding:6px 4px;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;}  
</style>  
</head>
<script type="text/javascript">
$(function(){
	$("#followtab").datagrid({
	  url:'selectAccess_recordInfo',
	  method:'post',
	  pagination:true,
	  toolbar:"#searchTab"
	});
	
	
});

//搜索
function searchA(){
	   $('#followtab').datagrid('load', {    
		   cname:$("#cname").val(),
		   uteacher:$("#uteacher").val(),
		   record_status:$("#record_status").val(),
		   minTime:$("#minTime").datebox('getValue'),
		   maxTime:$("#maxTime").datebox('getValue')
		});  

}   


function formattercustomername(value,row,index){
	return row.customer.customer_name;
}

function formatterusername(value,row,index){
	return row.user.user_name;
}

function formattercaozuo(value,row,index){
	return "<a href='javascript:void(0)' onclick='chakan("+index+")'>查看</a>";
}
function formatterhidden(value,row,index){  
    return '<span title='+value+'>'+value+'</span>'  
 }  
function chakan(index){
	   var data=$("#followtab").datagrid("getData");
	   var row=data.rows[index];
	   $("#record_condition").val(row.record_condition);
	   
	   var str = $('#record_condition').val();
	   $('#record_condition').val(str.replace(/(.{25})(.*)/g,'$1...'));
	   $("#GZwin").window("open");
}

</script>
<body>
     <table id="followtab" class="easyui-datagrid" data-options="fitColumns:true,singleSelect:true">   
    <thead>   
        <tr>
            <th data-options="field:'record_id',width:80">编号</th>
            <th data-options="field:'record_content',width:80">谈论话题</th> 
            <th data-options="field:'customer.customer_name',width:80,formatter:formattercustomername">学生名称</th> 
             <th data-options="field:'user.user_name',width:80,formatter:formatterusername">跟踪者</th> 
              <th data-options="field:'record_time',width:80">跟踪开始时间</th> 
               <th data-options="field:'record_endtime',width:80">跟踪结束时间</th> 
                <th data-options="field:'record_condition',width:80,formatter:formatterhidden">回访情况</th> 
                 <th data-options="field:'record_status',width:80">跟踪方式</th> 
                 <th data-options="field:'ss',width:80,formatter:formattercaozuo">操作</th>   
           
        </tr>   
    </thead>   
</table>  
   <div id="searchTab">
   <form>
         <label for="name">客户名字</label>   
         <input type="text" name="name" id="cname" /> 
         <label for="name">跟踪者</label>   
         <input type="text" name="name" id="uteacher" /> 
         <label for="name">跟踪方式</label>  
         <select id="record_status" > 
         <option value="">--请选择--</option>  
         <option value="电话">电话</option>   
         <option value="面谈">面谈</option>   
         </select>  
         <label for="name">跟踪开始时间</label>   
         <input type="text"  class= "easyui-datebox" id="minTime" /> 
         <label for="name">跟踪开始时间</label>
         <input type="text"  class= "easyui-datebox" id="maxTime"/>    
         <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="searchA()" data-options="iconCls:'icon-search'">搜索</a>
 </div>
 
 <div id="GZwin" class="easyui-dialog" title="Add Access_record" style="width:400px;height:200px"   
        data-options="iconCls:'icon-save',modal:true,closed:true,draggable:true">
       <form class="easyui-form" id="ChaFrom"> 
         <label for="name">交谈情况</label>
          <input type="text" name="record_condition" id="record_condition" style="width:350px;height:30px;"  />
   
       </form>
 </div>
</body>
</html>