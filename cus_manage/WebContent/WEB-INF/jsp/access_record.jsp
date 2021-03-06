<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>跟踪----页</title>
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/default/easyui.css">   
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/icon.css">   
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>   
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>  
<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>  
</head>

   <script type="text/javascript">
 //显示隐藏指定列
   var createGridHeaderContextMenu = function(e, field) {
       e.preventDefault();
       var grid = $(this);/* grid本身 */
       var headerContextMenu = this.headerContextMenu;/* grid上的列头菜单对象 */
       if (!headerContextMenu) {
           var tmenu = $('<div style="width:100px;"></div>').appendTo('body');
           var fields = grid.datagrid('getColumnFields');
           for ( var i = 0; i < fields.length; i++) {
               var fildOption = grid.datagrid('getColumnOption', fields[i]);
               if (!fildOption.hidden) {
                   $('<div iconCls="icon-ok" field="' + fields[i] + '"/>').html(fildOption.title).appendTo(tmenu);
               } else {
                   $('<div iconCls="icon-empty" field="' + fields[i] + '"/>').html(fildOption.title).appendTo(tmenu);
               }
           }
           headerContextMenu = this.headerContextMenu = tmenu.menu({
               onClick : function(item) {
                   var field = $(item.target).attr('field');
                   if (item.iconCls == 'icon-ok') {
                       grid.datagrid('hideColumn', field);
                       $(this).menu('setIcon', {
                           target : item.target,
                           iconCls : 'icon-empty'
                       });
                   } else {
                       grid.datagrid('showColumn', field);
                       $(this).menu('setIcon', {
                           target : item.target,
                           iconCls : 'icon-ok'
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
   //展示首页数据
     $(function(){
	   $("#managerTab").datagrid({
		 url:'showAccess_record',
		 method:'post',
		 pagination:true,
		 toolbar:"#searchTab",
		 queryParams:{
				user_id:${m.user_id}
			}
	 
	   });
	   
      })
   //咨询师
   function formatteruser_name(value,row,index){
	   return row.user.user_name;	
   }
    
    
  //这个是客户的名字
    function formatteruser_kehuname(value,row,index){
 	   return row.customer.customer_name;
    }
   
   //这个是操作列
   function formatterCaozuo(value, row, index) {
		return "<a href='javascript:void(0)' onclick='chaKan(" + index
				+ ")'>查看</a>"
	}
   function del(index){
	   alert("不好意思不可以去删除");
   }

   //搜索
   function searchM(){
/* 	 alert($("#record_condition").val()); */

	   $('#managerTab').datagrid('load', {    
		   cname:$("#cname").val(),//名字
		   uteacher:$("#uteacher").val(),//跟踪者   
		   record_condition:$("#record_condition").val(),//回访情况
		   record_status:$("#record_status").val(),//回访方式
		   
		   minTime:$("#minTime1").datebox('getValue'),
		   maxTime:$("#maxTime1").datebox('getValue'),
		   user_id:${m.user_id}
		  
	   })
	   $("#search123").form("clear");

	   
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
/* 	  window.open('access_record.jsp');//不覆盖 */
	  window.location="CounselorList";
  }
   
   
 //这个是查看的关闭
	function closelookDialog() {

		$("#look-dialog").dialog("close");
	}

	//这个还是修改的关闭并且删除表中自己想修改但是没保存的数据
	function closeDialog() {
		$("#edit-dialog").dialog("close")
		$("edit-frm").Window("clear");
	}
</script>
<body>
  <table id="managerTab" class="easyui-datagrid"    
        data-options="fitColumns:true,singleSelect:false">   
    <thead>   
        <tr>   
            <th data-options="field:'check',checkbox:true"></th>
            <th data-options="field:'record_id',width:100">No</th>
            <th data-options="field:'customer.customer_name',width:100,formatter:formatteruser_kehuname">客户</th>

            <th data-options="field:'record_time',width:100">交谈时间</th>
            <th data-options="field:'record_content',width:100">交谈内容</th>
            <th data-options="field:'record_condition',width:100">回访情况</th>
            
            <th data-options="field:'record_status',width:100">回访方式</th>
            <th data-options="field:'record_address',width:100">交谈地址</th>
              
              <th data-options="field:'user_id',width:100">咨询师编号</th>
              
            
            
            <th data-options="field:'user.user_name',width:100,formatter:formatteruser_name">咨询师</th>
           <th data-options="field:'caozuo',title:'操作',formatter:formatterCaozuo"></th>
            
           
        </tr>   
    </thead>   
</table>  
 <div id="searchTab">
 <form id="search123" class="easyui-form">
         <label for="name">名字</label>   
         <input type="text" name="name" id="cname" /> 
         <label for="name">跟踪者</label>   
         <input type="text" name="name" id="uteacher" /> 
       
         <label for="name">上门时间min</label> 
         <input type="text"  class= "easyui-datebox" id="minTime1" /> 
         <label for="name">上门时间max</label>
         <input type="text"  class= "easyui-datebox" id="maxTime1"/> 
          <br/>
          
          <label for="name">回访情况：</label>
         <select id="record_condition" > 
			         <option value="">--请选择--</option>  
			         <option value="上门">很好</option>   
			         <option value="电话">好</option> 
			          <option value="微信">一般</option>   
			         <option value="qq">差</option>  
	     </select> 
         
          <label for="name">回访方式：</label>   
           <select id="record_status" > 
			         <option value="">--请选择--</option>  
			         <option value="上门">上门</option>   
			         <option value="电话">电话</option> 
			          <option value="微信">微信</option>   
			         <option value="qq">qq</option>  
			         </select>   
         
         
         <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="searchM()" data-options="iconCls:'icon-search'">搜索</a>
	
          <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="suoyougen()" data-options="iconCls:'icon-add'">客户页面</a>
        	<a href="javascript:void(0);" id="btnExport" class="easyui-linkbutton" iconCls='icon-print'>导出Excel</a>
   </form>
 </div>
 
 <!-- 查看的窗口 -->
	<div id="look-dialog" class="easyui-dialog"
		data-options="modal:true,closed:true,title:'查看',
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
				<tr>
					<td><label for="name">交谈日期:</label></td>
					<td><input name="record_time" class="easyui-validatebox" type="text"
						id="sname1" /></td>
				</tr>
			   <tr>
					<td><label for="name">交谈内容:</label></td>
					<td><input name="record_content" class="easyui-validatebox"
						type="text" id="address1" /></td>
				</tr>
				
				<tr>
					<td><label for="name">交谈地址:</label></td>
					<td><input name="record_address" class="easyui-validatebox"
						type="text" id="address1" /></td>
				</tr>
				
				<tr>
					<td><label for="name">结束时间:</label></td>
					<td><input name="record_endtime" class="easyui-validatebox"
						type="text" id="address1" /></td>
				</tr>
				<tr>
					<td><label for="name">回访情况</label></td>
					<td><input name="record_condition" class="easyui-validatebox"
						type="text" id="address1" /></td>
				</tr>
				<tr>
					<td><label for="name">回访方式:</label></td>
					<td><input name="record_status" class="easyui-validatebox"
						type="text" id="address1" /></td>
				</tr>
				<tr>
					<td><label for="name">备注:</label></td>
					<td><input name="record_remark" class="easyui-validatebox"
						type="text" id="address1" /></td>
				</tr>
				
				
				
			</table>
		</form>
	</div>
 
 

 
 
</body>

<script type="text/javascript">
//这里开始excel导出
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