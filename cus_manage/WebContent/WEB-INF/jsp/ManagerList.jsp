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
		 url:'selectManager',
		 method:'post',
		 pagination:true,
		 toolbar:"#searchTab"
	   })
	   
   })
   //咨询师
   function formatteruser_nameZ(value,row,index){
	if(row.userw_id!=row.user_id){
       return row.user.user_name;
	}
   }
   
   //网络咨询师
   function formatteruser_nameW(value,row,index){
	if(row.userw_id==row.user_id){
       return row.user.user_name;
	}
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
   	  
   //搜索
   function searchM(){
	   $('#managerTab').datagrid('load', {    
		   cname:$("#cname").val(),
		   uteacher:$("#uteacher").val(),
		   visit:$("#visit").val(),
		   ingate:$("#ingate").val(),
		   minTime:$("#minTime").datebox('getValue'),
		   maxTime:$("#maxTime").datebox('getValue')
		});  

	   
   }
  
   function testcolumn(){
	/*    var row = $('#datagrid').datagrid('getData').rows[index]; */
	   
	   $("#Addcolumn").window("open"); 
	 

   }
   //显示指定列
   function diaplaycolumn(){
	   var s=''; 
	   $('input[name="sname"]:checked').each(function(){  
	     s+=$(this).val()+','; 
	   }); 
	   if (s.length > 0) { 
		    //得到选中的checkbox值序列 
		    s = s.substring(0,s.length - 1);
		   data=s.split(",");
		   alert("111"+data[0]);
		   alert("111"+data[1])
		   for(var i=0;i<data.length;i++){
			   $('#managerTab').datagrid('showColumn', data[i]);
			   
		   }
		   $("#Addcolumn").window("close");
		   $("#managerTab").datagrid("reload");
		 
		} 
	   
   }
   //隐藏指定列
  function nonecolumn(){
	   var s=''; 
	   $('input[name="sname"]:checked').each(function(){  
	     s+=$(this).val()+','; //拿到所有name为sname的复选框且选中的值,然后进行字符串拼接
	   }); 
	   if (s.length > 0) { 
		    //得到选中的checkbox值序列 
		    s = s.substring(0,s.length - 1);
		   data=s.split(",");//调用字符串分割的方法,把字符串最后逗号去掉，然后把这个字符串变成一个数组
		   for(var i=0;i<data.length;i++){
			   $('#managerTab').datagrid('hideColumn', data[i]);//调用easyui中datagrid中的方法进行列的显示或隐藏
			   
		   }
		   $("#Addcolumn").window("close");
		   $("#managerTab").datagrid("reload");
		 
		} 
	  
  }
  //格式化操作列
  function formatterusercaozuo(value,row,index){
	  return "<a href='javascript:void(0)' onclick='chakan("+index+")'>查看</a>  <a href='javascript:void(0)' onclick='删除("+index+")'>删除</a>"
  }
  //查看
  function chakan(index){
	 var data=$("#managerTab").datagrid("getData");
	 var row=data.rows[index];
	 alert(row.customer_sex);
	 $("#ChaFrom").form("load",row);
	 $("#Ucustomer_sex").combobox('setValue',row.customer_sex);
	 $("#Ucustomer_status").combobox('setValue',row.customer_status);
	 $("#Ucustomer_region").combobox('setValue',row.customer_region);
	 $("#Ucustomer_academic").combobox('setValue',row.customer_academic);
	 $("#Ucustomer_source").combobox('setValue',row.customer_source);
	 $("#Ucustomer_course").combobox('setValue',row.customer_course);
	 $("#Ucustomer_level").combobox('setValue',row.customer_level);
	 $("#Ucustomer_visit").combobox('setValue',row.customer_visit);
	 $("#Ucustomer_ingate").combobox('setValue',row.customer_ingate);
	 $("#Ucustomer_jiaofei").combobox('setValue',row.customer_jiaofei);
	 $("#Ucustomer_istui").combobox('setValue',row.customer_istui);
	 $("#Ucustomer_isjinban").combobox('setValue',row.customer_isjinban);
	 $("#btncus").linkbutton("disable");
	 $("#ChaKanWin").window("open");
	  
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
	    $.post("updateCustomerTrack",{s:s,user_id:$("#geTesgt").val()},
	   function(r){
	    	if(r>0){
	    		$.messager.alert('提示','更换咨询师成功');
	    		$("#GZwin").window("close");
	    	}else{
	    		$.messager.alert('提示','更换咨询师失败');
	    	}
	    },"josn");
  }
  //修改
  function editCustomer(){
	 
		var data1=$("#managerTab").datagrid('getSelected');
		var data2=$("#managerTab").datagrid("getData");
		alert(data1.customer_id);
		 var row=data2.rows[data1.customer_id-1];
		 $("#ChaFrom").form("load",row);
		 $("#Ucustomer_sex").combobox('setValue',row.customer_sex);
		 $("#Ucustomer_status").combobox('setValue',row.customer_status);
		 $("#Ucustomer_region").combobox('setValue',row.customer_region);
		 $("#Ucustomer_academic").combobox('setValue',row.customer_academic);
		 $("#Ucustomer_source").combobox('setValue',row.customer_source);
		 $("#Ucustomer_course").combobox('setValue',row.customer_course);
		 $("#Ucustomer_level").combobox('setValue',row.customer_level);
		 $("#Ucustomer_visit").combobox('setValue',row.customer_visit);
		 $("#Ucustomer_ingate").combobox('setValue',row.customer_ingate);
		 $("#Ucustomer_jiaofei").combobox('setValue',row.customer_jiaofei);
		 $("#Ucustomer_istui").combobox('setValue',row.customer_istui);
		 $("#Ucustomer_isjinban").combobox('setValue',row.customer_isjinban);
		 $("#btncus").linkbutton("enable");
		 $("#ChaKanWin").window("open");
	  
  }     
  function updateSave(){
	  $.messager.confirm("确认","确认修改吗",
	function(r){
		if(r){
			  $.post("UpdateCustomer",{
				  customer_id:$("#Ucustomer_id").val(),
				  customer_no:$("#Ucustomer_no").val(),
				  customer_name:$("#Ucustomer_name").val(),
				  customer_academic:$("#Ucustomer_academic").combobox("getValue"),
				  customer_region:$("#Ucustomer_region").combobox("getValue"),
				  customer_post:$("#Ucustomer_post").val(),
				  customer_address:$("#Ucustomer_address").val(),
				  customer_phone:$("#Ucustomer_phone").val(),
				  customer_source:$("#Ucustomer_source").combobox("getValue"),
				  customer_qq:$("#Ucustomer_qq").val(),
				  customer_course:$("#Ucustomer_course").combobox("getValue"),
				  customer_age:$("#Ucustomer_age").val(),
				  customer_level:$("#Ucustomer_level").combobox("getValue"),
				  customer_status:$("#Ucustomer_status").combobox("getValue"),
				  customer_visit:$("#Ucustomer_visit").combobox("getValue"),
				  customer_ingate:$("#Ucustomer_ingate").combobox("getValue"),
				  customer_dmoney:$("#Ucustomer_dmoney").val(),
				  customer_jiaomoney:$("#Ucustomer_jiaomoney").val(),
				  customer_istui:$("#Ucustomer_istui").combobox("getValue"),
				  customer_tuicause:$("#Ucustomer_tuicause").val(),
				  customer_isjinban:$("#Ucustomer_isjinban").combobox("getValue"),
				  customer_zixunremark:$("#Ucustomer_zixunremark").val(),
			              },function(data){
			            	  if(data>0){
			            		  $.messager.alert('提示','修改成功');
			            		  $("#Addcolumn").window("close");
			            		  $("#managerTab").datagrid("reload");
			            	  }else{
			            		  $.messager.alert('提示','修改失败');
			            	  }
			            	
			              },"json");
		     }
	          });
	 
	  
  }
  //测试
  function  autoCustomer(){
	 var  status= $("#autoCustomer").switchbutton("options").checked;
	  alert("师傅师傅说"+status);
  }
</script>
<body>
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
             <th data-options="field:'user.user_nameW',width:100,formatter:formatteruser_nameW">网络咨询师</th>
            <th data-options="field:'user.user_nameZ',width:100,formatter:formatteruser_nameZ">咨询师</th>
            <th data-options="field:'caozuo',width:100,formatter:formatterusercaozuo">操作</th>
            
            
           
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
         <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="testcolumn()" data-options="iconCls:'icon-add'">设置显示隐藏列</a>
         <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="fenpeiCustomer()" data-options="iconCls:'icon-redo'">设置跟踪人员</a>
         <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="editCustomer()" data-options="iconCls:'icon-edit'">编辑</a>
         <a  href="javascript:void(0)"  class="easyui-switchbutton"  id="autoCustomer" data-options="onText:'Yes',offText:'No'">自动分配</a>
          <a  href="javascript:void(0)"  class="easyui-linkbutton" onclick="autoCustomer()"  data-options="iconCls:'icon-remove'">自动分配</a>
   </form>
 </div>
 

 <div id="Addcolumn" class="easyui-dialog" title="Add Customer" style="width:200px;height:400px"   
        data-options="iconCls:'icon-save',modal:true,closed:true,draggable:true">
   
   <input type="checkbox" name="sname" value="customer_id" />
    <label for="name">No</label>
   <br/>
   
   <input type="checkbox" name="sname" value="customer_no" />
   <label for="name">客户编号</label> 
   <br/>
    
   <input type="checkbox" name="sname" value="customer_name" />
   <label for="name">名字</label>
   <br/>

   <input type="checkbox" name="sname" value="customer_age" />
   <label for="name">年龄</label> 
   <br/>
  
   <input type="checkbox" name="sname" value="customer_sex" />
  <label for="name">性别</label>   
   <br/>
 
   <input type="checkbox" name="sname" value="customer_visit" />
    <label for="name">是否访问</label> 
   <br/>
   
   <input type="checkbox" name="sname" value="customer_ingate" />
   <label for="name">是否上门</label>  
   <br/>
   
   <input type="checkbox" name="sname" value="customer_source" />
   <label for="name">来源渠道</label>   
   <br/>
    
    <input type="checkbox" name="sname" value="customer_create_time" />
    <label for="name">创建时间</label>  
    <br/>
   
   <input type="checkbox" name="sname" value="user.user_name" />
   <label for="name">咨询师</label> 
   <br/>
   <center>
    <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="diaplaycolumn()" data-options="iconCls:'icon-save'">显示</a>  
    <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="nonecolumn()" data-options="iconCls:'icon-save'">隐藏</a>  
   </center>
 
 </div>
 <!-- 查看窗口 -->
 <div id="ChaKanWin" class="easyui-dialog" title="CustomerInfo" style="width:680px;height:400px"   
        data-options="iconCls:'icon-save',modal:true,closed:true,draggable:true">   
         <form id="ChaFrom" class="easyuii-form">
           <input type="hidden" name="customer_id" id="Ucustomer_id" class="easyui-textbox"  />
          <label for="name">客户编号</label> 
          <input type="text" name="customer_no" id="Ucustomer_no"   />
     
          <label for="name">客户名字</label> 
          <input type="text" name="customer_name" id="Ucustomer_name"   />
          <label for="name">客户年龄</label>
          <input type="text" name="customer_age" id="Ucustomer_age"   /><br/>
           <label for="name">客户状态</label>
              <select id="Ucustomer_status" class="easyui-combobox">   
	         <option value="">--请选择--</option>
	         <option value="1">未知</option>   
	         <option value="2">待业</option>
	         <option value="3">在职</option>
	         <option value="4">在读</option>   
         </select>   
          <label for="name">所属地区</label>
           <select id="Ucustomer_region" class="easyui-combobox">   
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
           <label for="name">邮政编码</label> 
          <input type="text" name="customer_post" id="Ucustomer_post"   /> <br/>       
         
           <label for="name">客户地址</label>     
          <input type="text" name="customer_address" id="Ucustomer_address"   />   
          
            <label for="name">客户电话</label> 
          <input type="text" name="customer_phone" id="Ucustomer_phone"  />     
          
          <label for="name">客户QQ</label>     
          <input type="text" name="customer_qq" id="Ucustomer_qq"   />  <br/>   
          
           <label for="name">客户性别</label>
            <select class="easyui-combobox" id="Ucustomer_sex">   
	         <option value="">--请选择--</option>
	         <option value="1">男</option>   
	         <option value="2">女</option>   
         </select>         
          
          <label for="name">客户学历</label>
            <select id="Ucustomer_academic" class="easyui-combobox">   
	         <option value="">--请选择--</option>
	         <option value="高中以下">高中以下</option>   
	         <option value="高中">高中</option> 
	         <option value="大专">大专</option>
	         <option value="本科">本科</option> 
	    	 <option value="本科以上">本科以上</option>        
         </select>                     
          
             <label for="name">来源渠道</label>
               <select id="Ucustomer_source" class="easyui-combobox">   
	         <option value="">--请选择--</option>
	         <option value="网络信息">网络信息</option>   
	         <option value="咨询电话">咨询电话</option> 
   	         <option value="促销活动">促销活动</option> 
   	         <option value="上门拜访">上门拜访</option>   
         </select>         
              <br/>      
         
          
          <label for="name">课程方向</label>
           <select id="Ucustomer_course" class="easyui-combobox">   
	         <option value="">--请选择--</option>
	         <option value="软件开发">软件开发</option>   
	         <option value="软件设计">软件设计</option>
   	         <option value="网络营销">网络营销</option> 
     
         </select>            
          
          <label for="name">客户等级</label>
           <select id="Ucustomer_level" class="easyui-combobox">   
	         <option value="">--请选择--</option>
	         <option value="1">一级</option>   
	         <option value="2">二级</option>   
	          <option value="3">三级</option>   
	         <option value="4">四级</option>   
	          <option value="5">五级</option>   
	         <option value="6">六级</option>  
	         <option value="7">七级</option>   
         </select>       
          
            <label for="name">是否访问</label>
             <select id="Ucustomer_visit" class="easyui-combobox">   
	         <option value="">--请选择--</option>
	         <option value="1">是</option>   
	         <option value="2">否</option>
             </select>          
           <label for="name">是否上门</label>
            <select id="Ucustomer_ingate" class="easyui-combobox">   
	         <option value="">--请选择--</option>
	         <option value="1">是</option>   
	         <option value="2">否</option>
             </select>  <br/>  
          
          <label for="name">首次回访时间</label>   
          <input type="text" name="customer_onevisit_time" id="Ucustomer_onevisit_time"  />
           <label for="name">上门时间</label>   
          <input type="text" name="customer_ingate_time" id="Ucustomer_ingate_time"   />
          <label for="name">定金金额</label>   
          <input type="text" name="customer_dmoney" id="Ucustomer_dmoney"  />
          <label for="name">定金时间</label>   
          <input type="text" name="customer_dtime" id="Ucustomer_dtime"  />
          <label for="name">是否缴费</label> 
             <select id="Ucustomer_jiaofei" class="easyui-combobox">   
	         <option value="">--请选择--</option>
	         <option value="1">是</option>   
	         <option value="2">否</option>
             </select>      
          <br/>
          <label for="name">缴费时间</label>   
          <input type="text" name="customer_jiaotime" id="Ucustomer_jiaotime"   />
          <label for="name">缴费金额</label>   
          <input type="text" name="customer_jiaomoney" id="Ucustomer_jiaomoney" />
          <label for="name">是否退费</label>
            <select id="Ucustomer_istui" class="easyui-combobox">   
	         <option value="">--请选择--</option>
	         <option value="1">是</option>   
	         <option value="2">否</option>
             </select>        
          <label for="name">退费原因</label>   
          <input type="text" name="customer_tuicause" id="Ucustomer_tuicause"  />
          <label for="name">是否进班</label> 
          <select id="Ucustomer_isjinban" class="easyui-combobox">   
	         <option value="">--请选择--</option>
	         <option value="1">是</option>   
	         <option value="2">否</option>
             </select>      
            <label for="name">进班时间</label>   
          <input type="text" name="customer_jinbantime" id="Ucustomer_jinbantime"  /><br/>
            <label for="name">进班备注</label>   
          <input type="text" name="customer_jinbanremark" id="Ucustomer_jinbanremark"   />
            <label for="name">咨询师备注</label>   
          <input type="text" name="customer_zixunremark" id="Ucustomer_zixunremark"   /> 
          <center>
         <a id="btncus" href="javascript:void(0)" class="easyui-linkbutton" onclick="updateSave()" data-options="iconCls:'icon-save'">提交</a>    
        </center>
        </form> 
     
</div>  
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