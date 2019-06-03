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
                sortName:'user_id',
                sortOrder:'asc',
                toolbar: '#tabelBut',
                checkOnSelect:true,
                queryParams:{
                	user_name:$("#user_name").val(),
                    min_creat_time:$('#min_creat_time').datebox('getValue'),
                    max_creat_time:$('#max_creat_time').datebox('getValue'),
                    user_is_lock:$("#user_is_lock").val()
                },
                onLoadSuccess:function(){
                	var data=$("#table").datagrid("getRows");
                	for(var i=0;i<data.length;i++){
                		userislockpinjie(data[i].user_id);
                	}
                	$.parser.parse();
                	
                	
                },
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
                        {
                            field:'user_account',
                            title:'账号',
                            width:100,
                            align:'center',
                            hidden:true

                        },
                        {
                                field:'user_name',
                                title:'用户名',
                                width:80,
                                align:'center'
                        },
                        /*{
                                field:'title',
                                title:'角色',
                                width:100,
                                align:'center'
                        },*/
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
                            formatter:userislock
                        },
                        {
                                field:"opr",
                                title:'操作',
                                width:150,
                                align:'center',
                                formatter:function (val,row,index) {
                                        e = '<a  id="add" data-id="98" class=" operA"  onclick="edit(\'' + index + '\')">编辑</a> ';
                                        d = '<a  id="add" data-id="98" class=" operA01"  onclick="obj.delOne(\'' + row.user_id + '\')">删除</a> ';
                                        czmm = '<a  id="add" data-id="98" class=" operA01"  onclick="obj.resetPass(\'' + index + '\')">重置密码</a> ';
                                        jssz = '<a  id="add" data-id="98" class=" operA01"  onclick="obj.juese(\'' + index + '\')">角色设置</a> ';
                                        return e+d+czmm+jssz;
                                }
                        }
                ]]
        })

})
function userislockpinjie(user_id){
	$("#islock"+user_id+"").switchbutton({ 
	onChange: function(checked){ 
       if(checked){
    	   obj.unlock(user_id);
       }else{
    	   obj.lock(user_id);
       }
     } 
	}) 

}

function  userislock(val,row,index) {
         if(val==0){
        	 e = '<a  id="add" style="color: green" data-id="98"  onclick="obj.unlock(\''+index+'\')">解锁</a> ';
           return "<input id=\"islock"+row.user_id+"\"  class=\"easyui-switchbutton\" data-options=\"checked:false,onText:'锁定',offText:'解锁'\" >";;
         }else{
             e = '<a  id="add" style="color: red" data-id="98"  onclick="obj.lock(\'' +index+'\')">锁定</a> ';
             return "<input id=\"islock"+row.user_id+"\" class=\"easyui-switchbutton\" data-options=\"checked:true,onText:'锁定',offText:'解锁'\" >";
         }
}
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
        	var user_is_sort=$("#user_is_sort").val();
        		var user_login_time;
        		if(user_is_sort==0){
        			user_login_time="2019-06-13";
        		}
                $("#table").datagrid('load',{
                        user_name:$("#user_name").val(),
                        min_creat_time:$('#min_creat_time').datebox('getValue'),
                        max_creat_time:$('#max_creat_time').datebox('getValue'),
                        user_is_lock:$("#user_is_lock").val(),
                        user_login_time:user_login_time
                })
        },
        
        //角色编辑
        juese:function(index){
        	var data=$("#table").datagrid("getData");
        	var row=data.rows[index];
        	$("#editRoleBox").dialog({
                closed: false,
        	})
        	/**
        	 * 添加方法
        	 */
        	$("#addUserRole").click(function(){
            	var data=$("#AllRole").datagrid("getSelected");
            	//添加角色时 验证该用户是否是管理员
            	$.post("verifyAdministrator",{
            		user_account:row.user_account,
            		cheshi:"1"
            	},function(vali){
            		if(vali){
		            	$.post("addUserRole",{
		            		user_id:row.user_id,
		            		role_id:data.role_id
		            	},function(data){
		            		if(data>0){
		            			$("#adduser_accountspan").val();
		            			$.messager.alert('提示','添加成功!'); 
		            			obj.refreshRole();
		            			
		            		}else{
		            			$.messager.alert('提示','添加失败!');    
		            		}
		            	},"json")
            		}else{
            			$.messager.alert('提示','没有该权限!');    
            		}            
            	},"json")
        		
        	})
        	/**
        	 * 删除方法
        	 */
        	$("#delUserRole").click(function(){
            	var data=$("#UserRole").datagrid("getSelected");
            	//删除角色时 验证该用户是否是管理员
            	$.post("verifyAdministrator",{
            		user_account:row.user_account,
            		cheshi:"1"
            	},function(vali){
            		if(vali){
		            	$.post("delUserRole",{
		            		user_id:row.user_id,
		            		role_id:data.role_id
		            	},function(data){
		            		if(data>0){
		            			$.messager.alert('提示','删除成功!'); 
		            			obj.refreshRole();
		            		}else{
		            			$.messager.alert('提示','删除失败!');    
		            		}
		            	},"json")
            		}else{
            			$.messager.alert('提示','没有该权限!');    
            		}            
            	},"json")
        		
        		
        	})
        	
        	  // 加载所有角色表格
            $("#AllRole").datagrid({
                    title:"所有角色",
                    iconCls:"icon-left02",
                    url:'getRole',
                    method:"post",
                    fitColumns:true,
                    striped:true,
                    width:'100%',
                    rownumbers:true,
                    nowrap:true,
                    height:'auto',
                    sortName:'role_id',
                    singleSelect:true,
                    checkOnSelect:false,
                    sortOrder:'asc',
                    toolbar: '',
                    columns:[[
                            {
                                    checkbox:true,
                                    field:'no',
                                    width:100,
                                    align:'center'
                            },
                            {
                                    field:'role_id',
                                    title:'编号',
                                    width:100,
                                    align:'center',
                                    hidden:true

                            },
                            {
                                    field:'role_name',
                                    title:'用户名',
                                    width:80,
                                    align:'center'
                            }
                    ]]
            })
            
              // 加载表格
            $("#UserRole").datagrid({
                    title:"当前用户角色",
                    iconCls:"icon-left02",
                    url:'getUserRole',
                    method:"post",
                    fitColumns:true,
                    striped:true,
                    width:'100%',
                    rownumbers:true,
                    nowrap:true,
                    height:'auto',
                    sortName:'role_id',
                    checkOnSelect:false,
                    sortOrder:'asc',
                    toolbar: '',
                    queryParams:{
                    	user_id:row.user_id,
                    },
                    columns:[[
                            {
                                    checkbox:true,
                                    field:'no',
                                    width:100,
                                    align:'center'
                            },
                            {
                                    field:'role_id',
                                    title:'编号',
                                    width:100,
                                    align:'center',
                                    hidden:true

                            },
                            {
                                    field:'role_name',
                                    title:'用户名',
                                    width:80,
                                    align:'center'
                            }
                    ]]
            })
        	//editRoleBox
            
        	
        },
        refreshRole:function(){
        	$("#UserRole").datagrid("load");
        	$("#AllRole").datagrid("load");
        	
        },
        //为当前用户添加角色
        addUserRole:function(){
        	
        },
        //当前用户删除角色
        delUserRole:function(){
        	
        },
       
        //解锁
        unlock:function(index,user_account){
        	$.messager.confirm('确认','您确认想要解锁该用户吗？',function(r){   
        	    if (r){    
        	    	
		            	$.post("updateUserIsLockByUserId",{
		            		user_id:index,
		            		user_is_lock:1
		            	},function(data){
		            		if(data>0){
		            			$.messager.alert('提示','解锁成功!'); 
		            			obj.find();
		            		}else{
		            			$.messager.alert('提示','解锁失败!');    
		            		}
		            	},"json")   
        	    }else{
        	    	$("#islock"+index).switchbutton("reset");
        	    }
        	});  
        },
        //锁定
        lock:function(index){
        	$.messager.confirm('确认','您确认想要锁定该用户吗？',function(r){  
        	    if (r){    
		        	    	$.post("updateUserIsLockByUserId",{
				            		user_id:index,
				            		user_is_lock:0
				            	},function(data){
				            		if(data>0){
				            			$.messager.alert('提示','锁定成功!'); 
				            			obj.find();
				            		}else{
				            			$.messager.alert('提示','锁定失败!');    
				            		}
				            	},"json")
		            	
        	    }else{
                	$("#islock"+index).switchbutton("reset");
                }
        	});  
        },
        // 提交表单
        
        sum:function () {
        			//调用验证函数--
    	                $('#addForm').form('submit', {
    	                            url:'insertUserAndRole',
    	                            method:"post",
    	                    onSubmit: function(){
    	                        var lag= $(this).form('validate');
    	                           if(lag==true){
    	                        	   
    	                        }
    	                },
    	                success: function(data){
    	                	if(data>0){
    	                		$("#addBox").dialog("close");
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
                $("#updateBox").dialog({
                        closed: true

                })

        },
        
        //重置密码
        resetPass:function(index){
        	$.messager.confirm('确认','您确认想要重置密码吗？',function(r){    
        	    if (r){    
        	    	var data=$("#table").datagrid("getData");
                	var row=data.rows[index];
                	if(row!=null){
	                	$.post("verifyAdministrator",{
	                		user_account:row.user_account,
	                		cheshi:"1"
	                	},function(vali){
	                		if(vali){
	    			            	$.post("updatePasswordByUserId",{
	    			            		user_id:row.user_id
	    			            	},function(data){
	    			            		if(data>0){
	    			            			obj.find();
	    			            			$.messager.alert('提示','重置成功!'); 
	    			            		}else{
	    			            			$.messager.alert('提示','重置失败!');    
	    			            		}
	    			            	},"json")   
	                    	}else{
	                    		$.messager.alert('提示','没有该权限!');    
	                    	}
	                	},"json")
        	    	}
                	
        	    }    
        	});  

        	
        },
        //删除一个
        delOne:function (id) {
                $.messager.confirm('提示信息','是否删除所选择记录',function (flg) {
                        if(flg){
                                $.ajax({
                                        type:'post',
                                        url:'deleteUserSingle',
                                        data:{
                                        	user_id:id
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


$("#editRoleBox").dialog({
        title:"角色设置",
        width:550,
        height:300,
        closed: true,
        modal:true,
        shadow:true
})





