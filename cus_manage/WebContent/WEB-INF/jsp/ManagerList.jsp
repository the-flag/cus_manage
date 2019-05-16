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
		 method:'POST',
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
   //添加
   function addCumtomer(){
	  $("#Addwin").window("open"); 
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
            <th data-options="field:'user.user_name',width:100,formatter:formatteruser_name">咨询师</th>
           
            
           
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
         <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="addCumtomer()" data-options="iconCls:'icon-add'">添加</a>
         <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="testcolumn()" data-options="iconCls:'icon-add'">设置显示隐藏列</a>
         
   </form>
 </div>
 
 <div id="Addwin" class="easyui-dialog" title="Add Customer" style="width:250px;height:400px"   
        data-options="iconCls:'icon-save',modal:true,closed:true,draggable:true">   
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
	         <option value="0">女</option>   
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
           <select id="customer_sex">   
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
          
    <center>
    <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="addcustomer()" data-options="iconCls:'icon-save'">保存</a>  
    <a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="abolish()" data-options="iconCls:'icon-remoce'">取消</a>  
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
</body>
</html>