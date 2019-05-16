<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NetWorkTeacher</title>


 <link href="js/demo/EasyUI/themes/gray/easyui.css" rel="stylesheet" />
 <link href="js/demo/EasyUI/themes/icon.css" rel="stylesheet" />
 <script src="js/demo/jquery-1.7.1.min.js"></script>
 <script src="js/demo/EasyUI/jquery.easyui.min.js"></script>
 <script src="js/demo/EasyUI/locale/easyui-lang-zh_CN.js"></script>
 <script src="js/demo/ExportExcelDlg.js"></script>

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
 
 
 



$(function(){
	
	$("#NetWorkTeacherTab").datagrid({
		url:'selectNetWorkTeacher',
		method:'post',
		pagination:true,
		toolbar:'#searchTab',
		queryParams:{
			user_id:${m.user_id}
		}

	});
	
})
   function exportexcel(filter) {
        
        var grid = $("#NetWorkTeacherTab");
        var rows=grid.datagrid("getRows");
        if(filter){
          rows=[rows[0],rows[1]];
        }
        var obj = $.ExportExcelDlg({
            HeadInfo: grid.datagrid("options").columns,
            RowInfo: rows,
            FooterInfo: grid.datagrid("getFooterRows"),
            RowStart: 2,
            ColumStart: 2,
            SheetName: 'sheet名字',
            MainTitle: { Displayname: '主标题', Alignment: 'Center' },
            SecondTitle: { Displayname: '父标题', Alignment: 'Right' },
            SaveName: "js导出excel",
            Swf: 'ExportExcel.swf'
        });
        obj.ExportExcelDlg('open');
    }

 //搜索
   function searchM(){
	   $('#NetWorkTeacherTab').datagrid('load', {    
		   cname:$("#cname").val(),
		   visit:$("#visit").val(),
		   ingate:$("#ingate").val(),
		   minTime:$("#minTime").datebox('getValue'),
		   maxTime:$("#maxTime").datebox('getValue')
		});  

	   
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
//签到	  
function Signin(){
	$.post("updateSignin",{user_id:${m.user_id}},function(data){
		if(data>0){
			$.messager.alert('提示','签到成功');
		}else{
			$.messager.alert('提示','签到失败');
		}
		
	},"json");
	
	
}

function Signback(){
	
	   $.messager.confirm('确认','确认进行签退吗？',function(r){
	    	if(r){
	    		$.post("updateSignback",{user_id:${m.user_id}},function(data){
	            	if(data>0){
	            		$.messager.alert("提示","签退成功！");
	            	}else{
	            		$.messager.alert("提示","签退失败！");
	            	}
	            	
	            },"json");
	    	}
	    })
	    
	
	
}
</script>
<body>
  <table id="NetWorkTeacherTab" class="easyui-datagrid"    
        data-options="fitColumns:true">   
    <thead>   
        <tr>  
            <th data-options="field:'checkbox',width:100,checkbox:true"></th>  
            <th data-options="field:'customer_id',width:100">No</th>
            <th data-options="field:'customer_no',width:100">客户编号</th>
            <th data-options="field:'customer_name',width:100">名字</th>
            <th data-options="field:'customer_age',width:100">年龄</th>
            <th data-options="field:'customer_academic',width:100">学历</th>
            <th data-options="field:'customer_region',width:100">所属地区</th>
            <th data-options="field:'customer_level',width:100">客户等级</th>
            <th data-options="field:'customer_address',width:100">地址</th>
            <th data-options="field:'customer_post',width:100">邮政编码</th>
            <th data-options="field:'customer_status',width:100,formatter:formatterstatus">客户状态</th>
            <th data-options="field:'customer_source',width:100">来源渠道</th>
            <th data-options="field:'customer_qq',width:100">QQ</th>
            <th data-options="field:'customer_course',width:100">课程方向</th>
            <th data-options="field:'customer_onevisit_time',width:100">首次回访时间</th>
            <th data-options="field:'customer_ingate_time',width:100">上门时间</th>
            <th data-options="field:'customer_sex',width:100,formatter:formattersex">性别</th>
            <th data-options="field:'customer_visit',width:100,formatter:formattervisit">是否访问</th>
            <th data-options="field:'customer_ingate',width:100,formatter:formatteringate">是否上门</th>
            <th data-options="field:'customer_create_time',width:100">创建时间</th>
            <th data-options="field:'customer_source',width:100">来源渠道</th>
          
           
            
           
        </tr>   
    </thead>   
</table>  

<div id="searchTab" style="height:50px">
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
         <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="addCumtomer()" data-options="iconCls:'icon-add'">添加</a>
         <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-add" plain="true" onclick="exportexcel(false)">导出全部</a>
         <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-add" plain="true" onclick="exportexcel(true)">导出前两条</a>
         <br/>
         <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="Signin()" data-options="iconCls:'icon-redo'">签到</a>
         <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="Signback()" data-options="iconCls:'icon-undo'">签退</a>  
         
   </form>
 </div>
 
</body>
</html>