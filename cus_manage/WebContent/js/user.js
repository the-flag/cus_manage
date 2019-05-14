/**
 * Created by Administrator on 2017/11/8.
 */
// 加载树
$(function () {

        $("#tree").tree({
                url:'js/json/userTree.json',
                method:"get",
                onClick:function (node) {
                        var nodes=$(this).tree('isLeaf',node.target);
                        var partId;
                        if(nodes==false){
                                return ;
                        }
                        else{
                                partId=node.domId;
                               $.ajax({
                                       type:'get',
                                       url:"js/json/user.json"+partId,
                                       dataType:'json',
                                       success:function (data) {
                                               var tableTata=data.data;
                                               $("#table").datagrid('load',tableTata);

                                       }
                               })


                        }

                }
        })
        // 加载表格
        $("#table").datagrid({
                title:"数据列表",
                iconCls:"icon-left02",
                url:'showUserTab',
                method:"post",
                fitColumns:true,
                striped:true,
                pagination:true,
                pageSize:10,
                width:'100%',
                rownumbers:true,
                pageList:[10,20],
                pageNumber:1,
                nowrap:true,
                height:'auto',
                sortName:'id',
                checkOnSelect:false,
                sortOrder:'asc',
                toolbar: '#tabelBut',
                columns:[[
                        {
                                checkbox:true,
                                field:'no',
                                width:100,
                                align:'center'
                        },
                        {
                                field:'user_id',
                                title:'编号',
                                width:100,
                                align:'center',
                                hidden:true

                        },
                       /* {
                                field:'user_name',
                                title:'用户名',
                                width:80,
                                align:'center'
                        },*/
                        {
                                field:'title',
                                title:'角色',
                                width:100,
                                align:'center'
                        },
                        {
                                field:'user_sex',
                                title:'姓别',
                                width:60,
                                align:'center',
                                formatter:function (val,row) {
                                        if(val==0){
                                                return '<div style="color: green">男</div>';
                                        }
                                        else{
                                                return '<div style="color: red">女</div>';
                                        }
                                }
                        },
                        {
                            field:'user_email',
                            title:'邮箱',
                            width:100,
                            align:'center'
                        },
                        {
                            field:'user_phone',
                            title:'联系电话',
                            width:100,
                            align:'center'
                        },
                        {
                                field:'user_creat_time',
                                title:'创建时间',
                                width:100,
                                align:'center'
                        },
                        {
                                field:'time',
                                title:'入职时间',
                                width:100,
                                align:'center'
                        },
                        {
                            field:'user_is_lock',
                            title:'是否锁定',
                            width:100,
                            align:'center',
                            formatter:function (val,row) {
                                    if(val==0){
                                            return '<div style="color: green">锁定</div>';
                                    }
                                    else{
                                            return '<div style="color: red">正常</div>';
                                    }
                            }
                        },
                        {
                                field:"opr",
                                title:'操作',
                                width:150,
                                align:'center',
                                formatter:function (val,row) {
                                        e = '<a  id="add" data-id="98" class=" operA"  onclick="obj.edit(\'' + row.id + '\')">编辑</a> ';
                                        d = '<a  id="add" data-id="98" class=" operA01"  onclick="obj.delOne(\'' + row.id + '\')">删除</a> ';
                                        czmm = '<a  id="add" data-id="98" class=" operA01"  onclick="obj.delOne(\'' + row.id + '\')">重置密码</a> ';
                                        jssz = '<a  id="add" data-id="98" class=" operA01"  onclick="obj.delOne(\'' + row.id + '\')">角色设置</a> ';
                                        return e+d+czmm+jssz;
                                }
                        }
                ]]
        })

})

// 加载部门下拉框
$("#part").combotree({
        url:'js/json/userTree.json',
        method:"get",
        height:26,
        width:166,
        checkbox:true,
    onLoadSuccess:function(node,data){
        $("#part").combotree('setValue',data[0].id);
    },
    onSelect:function () {
            var t = $("#part").combotree('tree'); // 得到树对象
            var n = t.tree('getSelected');
            $("#part").combotree('setValue',n.text)
        }

})

//添加用户--提交表单

function addUserForm(){
	
	$('#ff').form('submit', {
		url:"",
		onSubmit: function(){
			var isValid = $(this).form('validate');
			if (!isValid){
				$.messager.progress('close');	// 如果表单是无效的则隐藏进度条
			}
			return isValid;	// 返回false终止表单提交
		},
		success: function(){
			$.messager.progress('close');	// 如果提交成功则隐藏进度条
		}
	});

}

//加载角色
$('#role').combobox({
        url:'js/json/userTree.json',
        method:"get",
        height:26,
        width:'70%',
        valueField:'id',
        textField:'text'
});
// 加载详情页面部门下拉框
$("#part01").combotree({
    url:'js/json/userTree.json',
    method:"get",
    height:26,
    width:'70%',
    checkbox:true,
    onLoadSuccess:function(node,data){
        $("#part01").combotree('setValue',data[0].id);

    },
    onSelect:function () {
        var t = $("#part01").combotree('tree'); // 得到树对象
        var n = t.tree('getSelected');
        $("#part01").combotree('setValue',n.text)
    }

});
obj={
        // 查询
        find:function () {
                $("#table").datagrid('load',{
                        user_name:$("#user_name").val(),
                        min_creat_time:$('#min_creat_time').datebox('getValue'),
                        max_creat_time:$('#max_creat_time').datebox('getValue'),
                        user_is_lock:$("#user_is_lock").val()
                })
        },
        // 添加
        addBox:function () {
                $("#addBox").dialog({
                        closed: false

                })
                $("#addForm").form('reset');
                $("#can").hide();
                $("#res").show();


        },
        // 编辑
        edit:function (id) {
                var ID;
                $("#res").hide();
                $("#can").show();
                $("#updateBox").dialog({
                        closed: false,
                })
                var row=$("#table").datagrid("getSelected");
                $("#updateForm").form('load',row);
               /* $.ajax({
                        url:'js/json/user.json',
                        type:'get',
                        dataType:'json',
                        success:function (rows) {
                                var data=rows.rows;
                                if(data){
                                        $.each(data,function (index) {
                                               ID=data[index].id;
                                              if(id==ID){
                                                      $("#no").val(ID);
                                                      $("#name").val(data[index].name);
                                                      $("#pass").val(data[index].pass);
                                                      $('#time').datebox('setValue', data[index].time);
                                                      $('#part01').combotree('setValue', data[index].part);
                                                      $('#role').combobox('setValue', data[index].title);

                                              }

                                        })




                                }
                                else{
                                        return false;
                                }

                        }

                })*/



        },
        // 提交表单
        sum:function () {
        		var user_account=$("#adduser_account").val();
        		$.post("validationAccount",{
        			user_account:user_account
        		},function(validation){
        			if(validation){
    	                $('#addForm').form('submit', {
    	                            url:'insertUserAndRole',
    	                            method:"post",
    	                    onSubmit: function(){
    	                        var lag= $(this).form('validate');
    	                           if(lag==true){
    	                        	   
    	                           }
    	                },
    	                success: function(data){
    	                	alert();
    	                	if(data>0){
    	                		$("#addBox").dialog("close");
    	                		obj.find();
    	                        $.messager.progress('close');
    	                	}
    	                }
    	                
    	                });
            		}else{
            			$("#adduser_accountspan").text("账号已存在!");
            		}     
        			
        		},"json")
        		
        },
        // 提交表单
        updatesum:function () {
        		
    	                $('#updateForm').form('submit', {
    	                            url:'updateUserByAccount',
    	                            method:"post",
    	                    onSubmit: function(){
    	                        var lag= $(this).form('validate');
    	                           if(lag==true){
    	                        	   
    	                           }
    	                },
    	                success: function(data){
    	                	alert();
    	                	if(data>0){
    	                		$("#updateBox").dialog("close");
    	                		obj.find();
    	                        $.messager.progress('close');
    	                	}
    	                }
    	                
    	                });
        		
        },
        // 重置表单
        res:function () {
                $("#addForm").form('reset');

        },
        // 取消表单
        can:function () {
                $("#addBox").dialog({
                        closed: true

                })

        },
        // 删除多个
        del:function () {
                var rows=$("#table").datagrid("getSelections");
               if(rows.length>0){
                       $.messager.confirm('确定删除','你确定要删除你选择的记录吗？',function (flg) {
                               if(flg){
                                       var ids=[];
                                       for(i=0;i<rows.length;i++){
                                               ids.push(rows[i].user_id);

                                       }
                                       var num=ids.length;
                                       alert(ids.join(','));
                                      $.ajax({
                                              type:'post',
                                              url:"deleteUsers",
                                              data:{
                                            	  user_ids:ids.join(',')
                                              },
                                              success:function (data) {
                                                      if(data){
                                                              $("#table").datagrid('loaded');
                                                              $("#table").datagrid('load');
                                                              $("#table").datagrid('unselectAll');
                                                              $.messager.show({
                                                                      title:'提示',
                                                                      msg:num+'个用户被删除'
                                                              })

                                                      }
                                                      else{
                                                              $.messager.show({
                                                                      title:'警示信息',
                                                                      msg:"信息删除失败"
                                                              })

                                                      }

                                              }
                                      })
                               }

                       })

               }
               else{
                       $.messager.alert('提示','请选择要删除的记录','info');
               }

        },

        //删除一个
        delOne:function (id) {
                id=$("#table").datagrid('getSelected').id;
                $.messager.confirm('提示信息','是否删除所选择记录',function (flg) {
                        if(flg){
                                $.ajax({
                                        type:'post',
                                        url:'',
                                        data:{
                                                ID:id
                                        },
                                        beforesend:function () {
                                                $("#table").datagrid('loading');

                                        },
                                        success:function (data) {
                                                if(data){
                                                        $("#table").datagrid("loaded");
                                                        $("#table").datagrid("load");
                                                        $("#table").datagrid("unselectRow");
                                                        $.messager.show({
                                                                title:'提示信息',
                                                                msg:"信息删除成功"
                                                        })
                                                }
                                                else{
                                                        $.messager.show({
                                                                title:'警示信息',
                                                                msg:"信息删除失败"
                                                        })

                                                }

                                        }
                                })

                        }

                })


        }
}

// 弹出框加载
$("#addBox").dialog({
        title:"信息内容",
        width:600,
        height:450,
        closed: true,
        modal:true,
        shadow:true
})


// 弹出框加载
$("#updateBox").dialog({
        title:"信息内容",
        width:550,
        height:300,
        closed: true,
        modal:true,
        shadow:true
})

