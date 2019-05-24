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
	shezhidongtai();
	$("#NetWorkTeacherTab").datagrid({
		url:'selectNetWorkTeacher',
		method:'post',
		pagination:true,
		toolbar:'#searchTab',
		queryParams:{
			userw_id:${m.user_id}
		}

	});
	
	
})

 $(function(){
	$.post("selectUserstatus",{user_id:${m.user_id}},function(data){
		alert("员工状态"+data.user_status);
		if(data.user_status!=1){
			$.messager.confirm('提示','今天还没有签到呢！',function(r){
				if(r){

					$.post("updateSignin",{user_id:${m.user_id}},function(data){
						if(data>0){
							$.messager.alert('提示','签到成功');
						}else{
							$.messager.alert('提示','签到失败');
						}
						
					},"json");
				
				}
			});
		}
		
		
	},"json");
}); 
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

//签退
function Signback(){
	
	$.post("selectUserstatus",{user_id:${m.user_id}},function(data){
		if(data.user_status!=1){
			$.messager.alert('提示','不能重复签退呢！');
		}else{
			var myDate = new Date();
			alert(myDate.toLocaleDateString());
			   $.messager.confirm('确认','确认进行签退吗？',function(r){
			    	if(r){
			    		$.post("updateSignback",{user_id:${m.user_id},s:myDate.toLocaleDateString()},function(data){
			            	if(data>0){
			            		$.messager.alert("提示","签退成功！");
			            		$("#NetWorkTeacherTab").datagrid("reload");
			            	}else{
			            		$.messager.alert("提示","签退失败！");
			            	}
			            	
			            },"json");
			    	}
			    });
			
		}
		
		
	},"json");
		
		    
	
	
	
	
}
//添加
function addCumtomer(){
	  $("#Addwin").window("open"); 
}

function addcustomer(){
	   alert("sfs");
	   $.messager.confirm('确认','确认添加？',function(r){
		   if(r){   
			   $.post("insertCustomer",{      
				   customer_no:$("#customer_no").val(),
				   customer_name:$("#customer_name").val(),
				   customer_age:$("#customer_age").val(),
				   customer_status:$("#customer_status").val(),
				   customer_region:$("#customer_region").val(),
				   customer_post:$("#customer_post").val(),
				   customer_address:$("#customer_address").val(),
				   customer_phone:$("#customer_phone").val(),
				   customer_qq:$("#customer_qq").val(),
				   customer_sex:$("#customer_sex").val(),
				   customer_academic:$("#customer_academic").val(),
				   customer_source:$("#customer_source").val(),
				   customer_course:$("#customer_course").val(),
				   customer_level:$("#customer_level").val(),
				   userw_id:${m.user_id},
				   user_id:${m.user_id}
			              },function(data){
			            	  if(data>0){
			            		  $.messager.alert('提示','添加成功');
			            		  $("#Addwin").window("close");
			            		  $("#NetWorkTeacherTab").datagrid("reload");
			            	  }
			              },"json");
		   }
		   
	   });

}
//添加中的重置
function resetForm(){
	   
	   $("#MangerFrom").form('reset');
}


//跟踪	
//打开跟踪信息窗口
function CustomerTrack(index){
   
	$("#AddTrackwin").window("open");
}
function TrackSave(){
	var data=$("#NetWorkTeacherTab").datagrid("getSelected");
	var myDate = new Date();//回访时间（当前时间）
	var record_lasttime = new Date(($("#record_lasttime").combobox('getValue')).replace(/-/g,"/"));//下次跟踪时间
	var record_time=new Date((myDate.toLocaleDateString()).replace(/-/g,"/"));;
	alert(record_lasttime);
	if(record_lasttime>record_time){
		alert("成功");
		$.post("insertTrackInfo",{
			       user_id:${m.user_id},
			       customer_id:data.customer_id,
			       record_status:$("#record_status").val(),
			       record_time:myDate.toLocaleDateString(),
			       record_lasttime:$("#record_lasttime").combobox('getValue'),
			       record_condition:$("#record_condition").val(),
			       record_remark:$("#record_remark").val(),
			       record_content:$("#record_content").val()
			
		          },function(data){
		        	  if(data>0){
		        		  $.messager.alert('提示','添加跟踪信息成功!');
		        		  $("#AddTrackwin").window("close");
		        	  }else{
		        		  $.messager.alert('提示','失败!');
		        	  }
		        	  
		        	  
		          },"json");
		
	}else{
		$.messager.alert('提示','请合理规划下次跟踪的时间');
	}
	
	
}
//格式化操作行
function formattercaozuo(value,row,index){
	return "<a  href='javascript:void(0)' class='easyui-linkbutton' onclick='CustomerTrack("+index+")'>跟踪</a>   <a  href='javascript:void(0)' class='easyui-linkbutton' onclick='datelog("+index+")'>日志</a>";
}
//查看日志信息
function datelog(index){
	alert("数据");
	var data=$("#NetWorkTeacherTab").datagrid("getData");
	   var row=data.rows[index];
	   alert(row.customer_id);
		$("#datelogId").datagrid({
			url:'selectDateLog',
			method:'post',
			pagination:true,
			queryParams:{
				customer_id:row.customer_id
			}
		});
	$("#datelogwin").window("open");
}
//导出excel
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

function formatterName(value,row,index){
	return row.customer.customer_name;
}

function formaterrCaoZuo(value,row,index){
	return "<a href='javascript:void(0)' onclick='chakanlog("+index+")'>查看</a>";
}
</script>
<body>
  <table id="NetWorkTeacherTab" class="easyui-datagrid"    
        data-options="fitColumns:true,singleSelect:true">   
    <thead>   
        <tr>  
            <th data-options="field:'checkbox',width:100,checkbox:true"></th>  
            <th data-options="field:'customer_id',width:50">No</th>
            <th data-options="field:'customer_no',width:100">客户编号</th>
            <th data-options="field:'customer_name',width:50">名字</th>
            <th data-options="field:'customer_age',width:50">年龄</th>
           <!--  <th data-options="field:'customer_academic',width:100">学历</th>
            <th data-options="field:'customer_region',width:100">所属地区</th>
            <th data-options="field:'customer_level',width:100">客户等级</th>
            <th data-options="field:'customer_address',width:100">地址</th>
            <th data-options="field:'customer_post',width:100">邮政编码</th> -->
            <th data-options="field:'customer_status',width:100,formatter:formatterstatus">客户状态</th>
           <!--  <th data-options="field:'customer_qq',width:100">QQ</th>
            <th data-options="field:'customer_course',width:100">课程方向</th> -->
            <th data-options="field:'customer_onevisit_time',width:100">首次回访时间</th>
            <th data-options="field:'customer_ingate_time',width:100">上门时间</th>
            <th data-options="field:'customer_sex',width:100,formatter:formattersex">性别</th>
            <th data-options="field:'customer_visit',width:100,formatter:formattervisit">是否访问</th>
            <th data-options="field:'customer_ingate',width:100,formatter:formatteringate">是否上门</th>
            <th data-options="field:'customer_create_time',width:100">创建时间</th>
            <th data-options="field:'customer_source',width:100">来源渠道</th>
            <th data-options="field:'caozuo',width:100,formatter:formattercaozuo">操作</th>
            
          
           
            
           
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
         <a href="javascript:void(0);" id="btnExport" class="easyui-linkbutton" iconCls='icon-print'>导出Excel</a>
         <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="Signback()" data-options="iconCls:'icon-undo'">签退</a>

         
   </form>
 </div>
 <div id="AddTrackwin" class="easyui-dialog" title="Add TrackInfo" style="width:280px;height:400px"   
        data-options="iconCls:'icon-save',modal:true,closed:true,draggable:true"> 
                             <!-- 下次跟踪时间 -->
            <form id="trackform" class="easyui-form">
            <input type="text" name="name" id="record_content" />
           <label for="name">谈论话题</label> 
           <br/>
           <input type="text" name="name" id="record_condition" />
           <label for="name">回访情况</label> 
           <br/>
         
          <input type="text" name="name" id="record_status" />
            <label for="name">跟踪方式</label> 
          <br/>
           
          <input type="text" class= "easyui-datebox"  name="name" id="record_lasttime" />
          <label for="name">下次跟踪时间</label> 
          <br/>
          
          <input type="text" name="name" id="record_remark" />
           <label for="name">备注</label> 
        <center>
                 <a  href="javascript:void(0)" class="easyui-linkbutton" onclick="TrackSave()" data-options="iconCls:'icon-save'">提交</a>
                 <a  href="javascript:void(0)" class="easyui-linkbutton" onclick="TrackReset()" data-options="iconCls:'icon-remove'">重置</a>
        </center>
        </form>
  </div>
  
    <div id="Addwin" class="easyui-dialog" title="Add Customer" style="width:250px;height:400px"   
        data-options="iconCls:'icon-save',modal:true,closed:true,draggable:true">   
         <form id="MangerFrom">
           <label for="name">客户编号</label> 
          <input type="text" name="name" id="customer_no" />
          <br/>
           <label for="name">客户名字</label> 
          <input type="text" name="name" id="customer_name" />
          <br/>
          <label for="name">客户年龄</label>
          <input type="text" name="name" id="customer_age" />
          <br/>
           <label for="name">客户状态</label>
            <select id="customer_status">   
	         <option value="">--请选择--</option>
	         <option value="1">未知</option>   
	         <option value="2">待业</option>
	         <option value="3">在职</option>
	         <option value="4">在读</option>   
         </select>             
          <br/>
          <label for="name">所属地区</label>
          <select id="customer_region">   
	         <option value="">--请选择--</option>
	         <option value="未知">未知</option>   
	         <option value="其它">其它</option>
	         <option value="郑州">郑州</option>
	         <option value="开封">开封</option>   
	         <option value="洛阳">洛阳</option>   
	         <option value="南阳">南阳</option>
	         <option value="漯河">漯河</option>
	         <option value="三门峡">三门峡</option>   
	         <option value="平顶山">平顶山</option>   
	         <option value="周口">周口</option>
	         <option value="驻马店">驻马店</option>
	         <option value="新乡">新乡</option> 
	          <option value="鹤壁">鹤壁</option>
	         <option value="濮阳">濮阳</option> 
	          <option value="安阳">安阳</option>
	         <option value="信阳">信阳</option>   
         </select>         
              
          <br/>
           <label for="name">邮政编码</label> 
          <input type="text" name="name" id="customer_post" />        
          <br/>
           <label for="name">客户地址</label>     
          <input type="text" name="name" id="customer_address" />   
          <br/>
            <label for="name">客户电话</label> 
          <input type="text" name="name" id="customer_phone" />     
          <br/>
          <label for="name">客户QQ</label>     
          <input type="text" name="name" id="customer_qq" />     
          <br/>
           <label for="name">客户性别</label>
             <select id="customer_sex">   
	         <option value="">--请选择--</option>
	         <option value="1">男</option>   
	         <option value="2">女</option>   
         </select>         
          <br/>
          <label for="name">客户学历</label>
          <select id="customer_academic">   
	         <option value="">--请选择--</option>
	         <option value="高中以下">高中以下</option>   
	         <option value="高中">高中</option> 
	         <option value="大专">大专</option>
	         <option value="本科">本科</option> 
	    	 <option value="本科以上">本科以上</option>        
         </select>         
          <br/>
          
           <label for="name">来源渠道</label>
             <select id="customer_source">   
	         <option value="">--请选择--</option>
	         <option value="网络信息">网络信息</option>   
	         <option value="咨询电话">咨询电话</option> 
   	         <option value="促销活动">促销活动</option> 
   	         <option value="上门拜访">上门拜访</option>   
         </select>           
          <br/>
          
          <label for="name">课程方向</label>
           <select id="customer_course">   
	         <option value="">--请选择--</option>
	         <option value="软件开发">软件开发</option>   
	         <option value="软件设计">软件设计</option>
   	         <option value="网络营销">网络营销</option> 
     
         </select>               
          <br/>
          <label for="name">客户等级</label> 
           <select id="customer_level">   
	         <option value="">--请选择--</option>
	         <option value="1">一级</option>   
	         <option value="2">二级</option>   
	          <option value="3">三级</option>   
	         <option value="4">四级</option>   
	          <option value="5">五级</option>   
	         <option value="6">六级</option>  
	         <option value="7">七级</option>   
         </select>           
          <br/>
         </form>
          
    <center>
    <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="addcustomer()" data-options="iconCls:'icon-save'">保存</a>  
    <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="resetForm()" data-options="iconCls:'icon-remoce'">重置</a>  
   </center>
          
          <!-- 
           <label for="name">是否访问</label>   
          <input type="text" name="name" id="customer_visit" /><br/>
           <label for="name">是否上门</label>   
          <input type="text" name="name" id="customer_ingate" /><br/>
           <label for="name">首次回访时间</label>   
          <input type="text" name="name" id="customer_onevisit_time" /><br/>
           <label for="name">上门时间</label>   
          <input type="text" name="name" id="customer_ingate_time" /><br/> -->
</div>  
 
 
  <div id="datelogwin" class="easyui-dialog" title="look datelog" style="width:600px;height:400px"   
        data-options="iconCls:'icon-save',modal:true,closed:true,draggable:true"> 
        <table id="datelogId" class="easyui-datagrid" style="width:400px;height:250px"   
        data-options="fitColumns:true,singleSelect:true">   
         <thead>   
            <tr>   
            <th data-options="field:'customer.customer_name',width:50,formatter:formatterName">学生名称</th>   
            <th data-options="field:'record_time',width:100">跟踪时间</th>
            <th data-options="field:'record_content',width:100">内容</th>   
            <th data-options="field:'record_lasttime',width:100">下次跟踪时间</th>
            <th data-options="field:'caozuo',width:100,formatter:formaterrCaoZuo">操作</th>   
        </tr>   
        </thead>   
   </table>  
        
 </div>
</body>
<script type="text/javascript">
//这里开始excel导出
	$("#btnExport").click(function() {
	var rows=$("#NetWorkTeacherTab").datagrid("getSelections");
	if(rows.length==0){
		$.messages.alert("提示","请选择你要导出的数据");
	}
	var data = JSON.stringify(rows);
	if (data == '')
		return;

	JSONToCSVConvertor(data, "k数据信息", true);
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