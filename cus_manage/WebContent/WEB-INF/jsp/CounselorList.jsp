<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>咨询师首页</title>
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/default/easyui.css">   
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/icon.css">   
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>   
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>  
<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>  
</head>
<script type="text/javascript">
//展示首页数据
   $(function(){
	  shezhidongtai();
	  into();  
   })
   function into(){
	   $("#managerTab").datagrid({
			 url:'selectCounselor',
			 method:'post',
			 pagination:true,
			 toolbar:"#searchTab"
			 
		   })
}
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
	   return row.customer_visit==1?'是':'否'; 
   }
   //是否上门
   function formatteringate(value,row,index){
	   return row.customer_ingate==1?'是':'否'; 
   }
   
   //这个是操作列
   function formatterCaozuo(value, row, index) {
		return "<a href='javascript:void(0)' onclick='chaKan(" + index
				+ ")'>查看</a>   <a href='javascript:void(0)' onclick='edit("
				+ index
				+ ")'>修改</a>  <a href='javascript:void(0)' onclick='del("
				+ index + ")'>删除</a> <a href='javascript:void(0)' onclick='addgen("
				+ index + ")'>跟踪</a>"
	}
   function del(index){
	   alert("不好意思不可以去删除");
   }
  
   //这个是修改
   function edit(index) {
	 //获取当前行对象
		var arr = $("#managerTab").datagrid("getData");
		var row = arr.rows[index];
	/* 	alert(row.customer_name); */

	
		//填充表单
		$("#edit-frm").form("load", row)
		//打开弹出层
		$("#edit-dialog").dialog("open")

	}
   
  
	//提交修改的数据
	function saveEdit() {
	/* alert($("#customer_zixunremark1").val())	 */
	 	var	 customer_dtime1 = $('#customer_dtime1').datebox('getValue');
	 	var	 customer_onevisit_time1 = $('#customer_onevisit_time1').datebox('getValue');

	 	$.post("UpdateCounselor", {
			customer_id : $("#customer_id1").val(),
			customer_name : $("#customer_name1").val(),//名字
			customer_address : $("#customer_address1").val(),//地址
			
			customer_phone : $("#customer_phone1").val(),//电话
			customer_qq: $("#customer_qq1").val(),//qq
			customer_level : $("#customer_level1").val(),//等级
			customer_academic : $("#customer_academic1").val(),//学历
			customer_post: $("#customer_post1").val(),//邮政编码
			
			customer_ingate: $("#customer_ingate1").val(),//是否上门
		
			customer_dmoney: $("#customer_dmoney1").val(),//订金
		 	customer_dtime:customer_dtime1 ,    //这个是订金时间
			customer_onevisit_time:customer_onevisit_time1 ,    //这个是首次回访时间
			customer_zixunremark:$("#customer_zixunremark1").val()//咨询师备注 
			
	
		}, function(res) {
			if (res > 0) {
				//修改成功
				$("#managerTab").datagrid("reload");
				closeDialog();
				$.messager.alert("提示", "修改成功");
			} else {
				//修改失败
				$.messager.alert("提示", "修改失败");
			}
		}, "json")
	}
   //搜索
   function searchM(){
/* 	alert($("#minTime").datebox('getValue')); */
	   $('#managerTab').datagrid('load', {    
		   cname:$("#cname").val(),
		   uteacher:$("#uteacher").val(),
		   visit:$("#visit").val(),//是否访问
		   
		   ingate:$("#ingate").val(),
		   minTime:$("#minTime").datebox('getValue'),
		   maxTime:$("#maxTime").datebox('getValue')
		});  	   
   }
	function chaKan(index) {
	
		//获取当前行对象
		var arr = $("#managerTab").datagrid("getData");
		var row = arr.rows[index];
	/* 	alert(row.customer_name); */

	
		//填充表单
		$("#look-frm").form("load", row)
		//打开弹出层
		$("#look-dialog").dialog("open")

	}
  
  function suoyougen(){
	  
	 /*  alert('即将进入后续页面'); */
/* 	  window.open('access_record.jsp');//不覆盖 */
	  window.location="access_record";	
  }
   
   
 //这个是查看的关闭
	function closelookDialog() {

		$("#look-dialog").dialog("close");
	}
	function closeDialog() {
		$("#edit-dialog").dialog("close")
		$("edit-frm").Window("clear");
	}

	//这个还是修改的关闭并且删除表中自己想修改但是没保存的数据
	function closeDialog() {
		$("#edit-dialog").dialog("close")
/* 		$("edit-frm").Window("clear"); */
	}
	
	function closeadd() {
		$("#add-dialog").dialog("close")
/* 		$("edit-frm").Window("clear"); */
	}
	//下面点击保存时所执行的方法；
	
 function addgen(index){
	   
	   alert("这是增加");
	   //获取当前行对象
		var arr = $("#managerTab").datagrid("getData");
		var row = arr.rows[index];
	/* 	alert(row.customer_name); */

	
		//填充表单
		$("#add-frm").form("load", row)
		//打开弹出层
		$("#add-dialog").dialog("open")
	/*    //添加

		  $("#add-dialog").window("open");  */
	
	   
   }
   
	function saveAdd() {
		var 	record_time = $('#add-record_time').datebox('getValue');
		 var record_lasttime = $("#add-record_lasttime").datebox('getValue');
		var	 record_endtime = $('#add-record_endtime').datebox('getValue');
	
		/* var v = $('#dd').datebox('getValue');  */
	
		    $.post("insert", {
		    	record_time:record_time,
		  /*   record_time = $('#add-record_time').datebox('getValue'), */
		    record_content : $("#add-record_content").val(),//内容
		    record_address : $("#add-record_address").val(),//地址
		    user_id   : $("#add-user_id ").val(),//咨询师id
		    customer_id   : $("#add-customer_id ").val(),//用户id
		    record_endtime :record_endtime,
/* 		    record_endtime = $('#add-record_endtime').datebox('getValue'), */
		

		    record_condition : $("#add-record_condition").val(),//回访情况
		    record_lasttime:record_lasttime,
		   /*  record_lasttime : $("#add-record_lasttime").datebox('getValue'),//下次交谈时间 */
		  
		    record_status : $("#add-record_status").val(),//回访方式
	
		    record_remark : $("#add-record_remark").val()//备注
			}, function(res) {
			if (res > 0) { 
				//添加成功
				$("#managerTab").datagrid("reload");
				$("#add-dialog").dialog("close")
				$.messager.alert("提示", "添加成功");

			} else {
				//修改失败
				$.messager.alert("提示", "添加失败");
			}
		}, "json")

	}
	
	function shezhidongtai(){
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
				left: e.pageX,
	            top: e.pageY
			});
		};
		$.fn.datagrid.defaults.onHeaderContextMenu = createGridHeaderContextMenu;
		$.fn.treegrid.defaults.onHeaderContextMenu = createGridHeaderContextMenu;
	}

	
</script>
<body>
  <table id="managerTab" class="easyui-datagrid"    
        data-options="fitColumns:true,singleSelect:false">   
    <thead>   
        <tr>   
        <th data-options="field:'check',checkbox:true"></th>
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
           <th data-options="field:'caozuo',title:'操作',formatter:formatterCaozuo"></th>
            
           
        </tr>   
    </thead>   
</table>  
 <div id="searchTab">
   <form>
         <label for="name">名字</label>   
         <input type="text" name="name" id="cname" /> 
         <label for="name">咨询师</label>   
         <input type="text" name="name" id="uteacher" /> 
         <label for="name">是否访问</label>  
         <select id="visit" > 
         <option value="">--请选择--</option>  
         <option value="1">是</option>   
         <option value="2">否</option>   
         </select>  
         <label for="name">是否上门</label>   
          <select id="ingate">   
         <option value="">--请选择--</option>
         <option value="1">是</option>   
         <option value="2">否</option>   
         </select>         
         <label for="name">创建时间min</label>   
         <input type="text"  class= "easyui-datebox" id="minTime" /> 
         <label for="name">创建时间max</label>
         <input type="text"  class= "easyui-datebox" id="maxTime"/>    
         <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="searchM()" data-options="iconCls:'icon-search'">搜索</a>

          <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="suoyougen()" data-options="iconCls:'icon-add'">所有跟踪日志</a>
         <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="shezhidongtai()" data-options="iconCls:'icon-search'">设置显示隐藏列</a>  
         
			<a href="javascript:void(0);" id="btnExport" class="easyui-linkbutton" iconCls='icon-print'>导出Excel</a>
         
   </form>
 </div>
 
 <!-- 查看的窗口 -->
	<div id="look-dialog" class="easyui-dialog"
		data-options="modal:true,closed:true,resizable:true,title:'查看',
	buttons:[{
				text:'保存',
				handler:function(){
					saveLook();
				}
			},{
				text:'关闭',
				handler:function(){
					closelookDialog();
				}
			}]
	">
		<form id="look-frm" class="easyui-form">
			<table cellpadding="5">
				<!-- <tr>
					<td><label for="name">学生id:</label></td>
					<td><input disabled="disabled" name="sid"
						class="easyui-validatebox" type="text" id="sid1" /></td>
				</tr> -->
				<tr>
					<td><label for="name">学生名字:</label></td>
					<td><input name="customer_name" class="easyui-validatebox" type="text"
						id="look-customer_name" /></td>
				</tr>
			   <tr>
					<td><label for="name">地址:</label></td>
					<td><input name="customer_address" class="easyui-validatebox"
						type="text" id="customer_address" /></td>
				</tr>
				<tr>
					<td><label for="name">电话:</label></td>
					<td><input name="customer_phone" class="easyui-validatebox"
						type="text" id="customer_phone" /></td>
				</tr>
				<tr>
					<td><label for="name">qq:</label></td>
					<td><input name="customer_qq" class="easyui-validatebox"
						type="text" id="customer_qq" /></td>
				</tr>
				<tr>
					<td><label for="name">用户等级:</label></td>
					<td><input name="customer_level" class="easyui-validatebox"
						type="text" id="customer_level" /></td>
				</tr>
				<tr>
					<td><label for="name">学历:</label></td>
					<td><input name="customer_academic" class="easyui-validatebox"
						type="text" id="customer_academic" /></td>
				</tr>
				<tr>
					<td><label for="name">邮政编码:</label></td>
					<td><input name="customer_post" class="easyui-validatebox"
						type="text" id="address" /></td>
				</tr>
				<tr>
					<td><label for="name">订金时间：：</label></td>
					<td><input name="customer_dtime" class="easyui-validatebox"
						type="text" id="customer_dtime" /></td>
				</tr>
					<tr>
					<td><label for="name">是否缴费：：</label></td>
					<td><input name="customer_jiaofei" class="easyui-validatebox"
						type="text" id="customer_jiaofei" /></td>
				</tr>
					<tr>
					<td><label for="name">缴费金额：：</label></td>
					<td><input name="customer_jiaomoney" class="easyui-validatebox"
						type="text" id="customer_jiaomoney" /></td>
				</tr>
				
				</tr>
				<tr>
					<td><label for="name">是否退费：</label></td>
					<td><input name="customer_istui" class="easyui-validatebox"
						type="text" id="customer_istui" /></td>
				</tr>
					<tr>
					<td><label for="name">退费原因：</label></td>
					<td><input name="customer_tuicause" class="easyui-validatebox"
						type="text" id="customer_tuicause" /></td>
				</tr>
				
				
				</tr>
					<tr>
					<td><label for="name">缴费时间：</label></td>
					<td><input name="customer_jiaotime" class="easyui-validatebox"
						type="text" id="customer_jiaotime" /></td>
				</tr>
				
				
				
				<tr>
					<td><label for="name">首次回访时间:</label></td>
					<td><input name="customer_onevisit_time" class="easyui-datebox"
						type="text" id="customer_onevisit_time" /></td>
				</tr>
				<tr>
					<td><label for="name">定金金额：</label></td>
					<td><input name="customer_dmoney" class="easyui-validatebox"
						type="text" id="customer_dmoney" /></td>
				</tr>
				<tr>
					<td><label for="name">订金时间:</label></td>
					<td><input name="customer_dtime" class="easyui-datebox"
						type="text" id="customer_dtime" /></td>
				</tr>
				<tr>
					<td><label for="name">咨询师备注：</label></td>
					<td><input name="customer_zixunremark" class="easyui-validatebox"
						type="text" id="customer_zixunremark" /></td>
				</tr>
						
			</table>
		</form>
	</div>

 <!-- 修改窗口 -->
	<div id="edit-dialog" class="easyui-dialog"
		data-options="modal:true,closed:true,title:'修改',
	buttons:[{
				text:'保存',
				handler:function(){
					saveEdit();
				}
			},{
				text:'关闭',
				handler:function(){
					closeDialog();
				}
			}]
	">
		<form id="edit-frm" class="easyui-form">
			<table cellpadding="5">
				 <tr><td><label for="name">id:</label></td>
					<td><input disabled="disabled" name="customer_id"
						class="easyui-validatebox" type="text" id="customer_id1" /></td>
				</tr>
				<tr>
					<td><label for="name">名字:</label></td>
					<td><input name="customer_name" class="easyui-validatebox" type="text"
						id="customer_name1" /></td>
				</tr>
			   <tr>
					<td><label for="name">地址:</label></td>
					<td><input name="customer_address" class="easyui-validatebox"
						type="text" id="customer_address1" /></td>
				</tr>
				<tr>
					<td><label for="name">电话:</label></td>
					<td><input name="customer_phone" class="easyui-validatebox"
						type="text" id="customer_phone1" /></td>
				</tr>
				<tr>
					<td><label for="name">qq:</label></td>
					<td><input name="customer_qq" class="easyui-validatebox"
						type="text" id="customer_qq1" /></td>
				</tr>
				<tr>
					<td><label for="name">用户等级:</label></td>
					<td><input name="customer_level" class="easyui-validatebox"
						type="text" id="customer_level1" /></td>
				</tr>
				<tr>
					<td><label for="name">学历:</label></td>
					<td><input name="customer_academic" class="easyui-validatebox"
						type="text" id="customer_academic1" /></td>
				</tr>
				<tr>
					<td><label for="name">是否上门:</label></td>
					<!-- <td><input name="customer_ingate" class="easyui-validatebox"
		
						type="text" id="customer_ingate1" /></td> -->
       			<td>
		     	 	 <select id="customer_ingate1" > 
				         <option value="">--请选择--</option>  
				         <option value="1">是</option>   
				         <option value="2">否</option>   
	         		</select>  
		         </td>		
				</tr>
				<tr>
					<td><label for="name">邮政编码:</label></td>
					<td><input name="customer_post" class="easyui-validatebox"
			
					type="text" id="customer_post1" /></td>
				</tr>
				<tr>
					<td><label for="name">首次回访时间:</label></td>
					<td><input name="customer_onevisit_time" class="easyui-datebox"
						type="text" id="customer_onevisit_time1" /></td>
				</tr>
				<tr>
					<td><label for="name">定金金额：</label></td>
					<td><input name="customer_dmoney" class="easyui-validatebox"
						type="text" id="customer_dmoney1" /></td>
				</tr>
				
				<tr>
					<td><label for="name">订金时间:</label></td>
					<td><input name="customer_dtime" class="easyui-datebox"
						type="text" id="customer_dtime1" /></td>
				</tr>
				<tr>
					<td><label for="name">咨询师备注：</label></td>
					<td><input name="customer_zixunremark" class="easyui-validatebox"
						type="text" id="customer_zixunremark1" /></td>
				</tr>
			</table>
		</form>
	</div>
 
<!--  easyui-dialog -->
 <!-- 新增的窗口 -->
	<div id="add-dialog" class="easyui-dialog"
		data-options="modal:true,closed:true,modal:true,title:'修改',
	buttons:[{
				text:'保存',
				handler:function(){
					saveAdd();
				}
			},{
				text:'关闭',
				handler:function(){
					closeadd();
				}
			}]
	">
		<form id="add-frm" class="easyui-form">
			<table cellpadding="5">
			    <tr>
					<td><label for="name">交谈日期::</label></td>
					<td><input name="record_time" class="easyui-datebox"
						type="text" id="add-record_time" /></td>
				</tr>
			    <tr>
					<td><label for="name">家庭住址:</label></td>
					<td><input name="record_address" class="easyui-validatebox"
						type="text" id="add-record_address" /></td>
				</tr>
				 <tr>
					<td><label for="name">下次交谈日期:</label></td>
					<td><input name="record_lasttime" class="easyui-datebox" type="text"
						id="add-record_lasttime" /></td>
				</tr> 
				<tr>
					<td><label for="name">结束时间:</label></td>
					<td><input name="record_endtime" class="easyui-datebox" type="text"
						id="add-record_endtime" /></td>
				</tr> 
				<tr>
					<td><label for="name">回访情况:</label></td>
					<td><input name="record_condition" class="easyui-validatebox"
						type="text" id="add-record_condition" /></td>
				</tr>
				<tr>
					<td><label for="name">回访方式:</label></td>
					<td><input name="record_status" class="easyui-validatebox"
						type="text" id="add-record_status" /></td>
				</tr>
				<tr>
					<td><label for="name">交谈内容:</label></td>
					<td><input name="record_address" class="easyui-validatebox"
						type="text" id="add-record_content" /></td>
				</tr>
				<tr>
					<td><label for="name">备注:</label></td>
					<td><input name="record_remark" class="easyui-validatebox"
						type="text" id="add-record_remark" /></td>
				</tr>
				<tr>
					<td><label for="name">咨询师id:</label></td>
					<td><input name="user_id" class="easyui-validatebox"
						type="text" id="add-user_id" /></td>
				</tr>
				
				
				<tr><td><label for="name">id:</label></td>
					<td><input disabled="disabled" name="customer_id"
						class="easyui-validatebox" type="text" id="add-customer_id" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
//这里开始excel导出
	/* $("#btnExport").click(function() {
		var data = JSON.stringify($('#managerTab').datagrid('getData').rows);
		if (data == '')
			return;

		JSONToCSVConvertor(data, "数据信息", true);
	}); */
	   
	$("#btnExport").click(function() {
		var rows=$("#managerTab").datagrid("getSelections");
		if(rows.length==0){
			$.messages.alert("提示","请选择你要导出的数据");
		}
		var data = JSON.stringify(rows);
		if (data == '')
			return;

		JSONToCSVConvertor(data, "数据信息", true);
	});


	function JSONToCSVConvertor(JSONData, ReportTitle, ShowLabel) {
		//如果jsondata不是对象，那么json.parse将分析对象中的json字符串。
		var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData) : JSONData;
		var CSV = '';

		//在第一行拼接标题
		CSV += ReportTitle + '\r\n\n';

		//产生数据标头
		if (ShowLabel) {
			var row = "";
			//此循环将从数组的第一个索引中提取标签
			for ( var index in arrData[0]) {

				//现在将每个值转换为字符串和逗号分隔
				row += index + ',';
			}

			row = row.slice(0, -1);

			//添加带换行符的标签行
			CSV += row + '\r\n';
		}

		//第一个循环是提取每一行
		for (var i = 0; i < arrData.length; i++) {
			var row = "";

			//2nd loop will extract each column and convert it in string comma-seprated
			for ( var index in arrData[i]) {
				row += '"' + arrData[i][index] + '",';
			}

			row.slice(0, row.length - 1);

			//add a line break after each row
			CSV += row + '\r\n';
		}

		if (CSV == '') {
			alert("Invalid data");
			return;
		}

		//Generate a file name
		var fileName = "我的学生_";
		//this will remove the blank-spaces from the title and replace it with an underscore
		fileName += ReportTitle.replace(/ /g, "_");

		//Initialize file format you want csv or xls
		//var uri = 'data:text/csv;charset=utf-8,' + escape(CSV);
		var uri = 'data:text/csv;charset=utf-8,\ufeff' + encodeURI(CSV);

		// Now the little tricky part.
		// you can use either>> window.open(uri);
		// but this will not work in some browsers
		// or you will not get the correct file extension    

		//this trick will generate a temp <a /> tag
		var link = document.createElement("a");
		link.href = uri;

		//set the visibility hidden so it will not effect on your web-layout
		link.style = "visibility:hidden";
		link.download = fileName + ".csv";

		//this part will append the anchor tag and remove it after automatic click
		document.body.appendChild(link);
		link.click();
		document.body.removeChild(link);
	}
	</script>
	
	
	
</html>