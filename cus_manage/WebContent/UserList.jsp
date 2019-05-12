<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/icon.css">
  		<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/default/easyui.css">
  		<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
  		<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js">    </script>
  		<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
		$(function(){
			init();
			alert("sdfsd");
		})
		function caozuo(value,row,index){
			
			return "<a href='javascript:void(0)' onclick='del("+index+")'>删除</a>";
		}
		function init(){
			$("#userTab").datagrid({
				url:"showuser",
				method:"post",
				pagination:true,
				toolbar:'#usertb'
			});
		}
		function del(index){
			var data=$("#userTab").datagrid("getData");
			
			
			var opts = $("#userTab").datagrid("getColumnFields");
			
		}
	</script>
</head>
<body>
	<table name="center" class="easyui-datagrid" id="userTab" title="用户列表"  data-options="rownumbers:true,singleSelect:true,fit:'true'">
		    <thead>
		        <tr>
		             <th data-options="field:'user_id',width:280,hidden:true">用户ID</th>
		             <th data-options="field:'user_name',width:100">用户名</th>
		             <th data-options="field:'user_password',width:100">密码</th>
		             <th data-options="field:'user_email',width:100,">手机号</th>
		             <th data-options="field:'getcaozuo',width:150,formatter:caozuo">操作</th>
		        </tr>
		    </thead>
		</table>
</body>
</html>