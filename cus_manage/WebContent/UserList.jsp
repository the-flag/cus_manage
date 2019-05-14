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
			
			dongtai();
			init();
			
			alert("sdfsd");
		})
		
	function dongtai(){
	}
	
		function caozuo(value,row,index){
			
			return "<a href='javascript:void(0)' onclick='del("+index+")'>删除</a>";
		}
		function init(){
			$("#userTab").datagrid({
				url:"showUserTab",
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
<script type="text/javascript">
$(function(){

	var createGridHeaderContextMenu = function(e, field) {
		e.preventDefault();
		var grid = $(this);/* grid本身 */
		var headerContextMenu = this.headerContextMenu;/* grid上的列头菜单对象 */
		var okCls = 'tree-checkbox1';// 选中
		var emptyCls = 'tree-checkbox0';// 取消
		if (!headerContextMenu) {
			var tmenu = $('<div style="width:100px;"></div>').appendTo('body');
			var fields = grid.datagrid('getColumnFields');
			for (var i = 0; i < fields.length; i++) {
				var fildOption = grid.datagrid('getColumnOption', fields[i]);
				if (!fildOption.hidden) {
					$('<div iconCls="' + okCls + '" field="' + fields[i] + '"/>')
							.html(fildOption.title).appendTo(tmenu);
				} else {
					$('<div iconCls="' + emptyCls + '" field="' + fields[i] + '"/>')
							.html(fildOption.title).appendTo(tmenu);
				}
			}
			headerContextMenu = this.headerContextMenu = tmenu.menu({
				onClick : function(item) {
					var field = $(item.target).attr('field');
					if (item.iconCls == okCls) {
						grid.datagrid('hideColumn', field);
						$(this).menu('setIcon', {
							target : item.target,
							iconCls : emptyCls
						});
					} else {
						grid.datagrid('showColumn', field);
						$(this).menu('setIcon', {
							target : item.target,
							iconCls : okCls
						});
					}
				}
			});
		}
		headerContextMenu.menu('show', {
			left : e.pageX,
			top : e.pageY
		});
	};
	$.fn.datagrid.defaults.onHeaderContextMenu = createGridHeaderContextMenu;
	$.fn.treegrid.defaults.onHeaderContextMenu = createGridHeaderContextMenu;
	
	
})


</script>
</html>