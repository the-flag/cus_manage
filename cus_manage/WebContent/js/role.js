/**
 * Created by Administrator on 2017/11/8.



 */


// 加载表格
$("#table").datagrid({
        title:"数据列表",
        iconCls:"icon-left02",
        url:'selectRolesAndTotal',
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
       /* checkOnSelect:false,*/
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
                        field:'role_id',
                        title:'编号',
                        width:100,
                        align:'center'



                },
                {
                        field:'role_name',
                        title:'角色名称',
                        width:100,
                        align:'center'



                },
                {
                        field:'role_desc',
                        title:'角色描述',
                        width:100,
                        align:'center'




                },
                {
                    field:'role_flag',
                    title:'角色描述',
                    width:100,
                    align:'center'




                },
                {
                        field:"opr",
                        title:'操作',
                        width:100,
                        align:'center',
                        formatter:function (val,row) {
                                e = '<a  id="add" data-id="98" class=" operA"  onclick="obj.edit(\'' + row.id + '\')">编辑</a> ';
                                d = '<a  id="add" data-id="98" class=" operA01"  onclick="obj.delOne(\'' + row.id + '\')">删除</a> ';
                                return e+d;

                        }

                }
        ]]
})

// 加载树
$("#tree").tree({
        url:'getModuleTree', // ModuleController
        method:"post",
        checkbox:true,
        lines:true
})
$("#editsave").hide();
$("#addsave").show();
obj={
        // 查询
        find:function () {
                $("#table").datagrid('load',{
                	role_name:$("#part").val()
                })
                $("#part").val("");
        },
        // 添加
        addBox:function () {
                $("#roleForm").form('clear');
                $("#tree").tree({
                    url:'getModuleTree',
                    method:"post",
                    checkbox:true,
                    lines:true
                })
            $("#editsave").hide();
            $("#addsave").show();

        },
        /**
         * 在用户点击一行角色信息的时候触发
         * 在左侧显示对应的角色信息，角色拥有的模块信息
         */
        editForm:function(row){
        	alert(row.role_name);
        	$("#roleForm").form('clear');
        	$("#roleForm").form("load",row);
        	//隐藏保存按钮
        	 $("#addsave").hide();
        	 $("#editsave").show();
            $("#tree").tree({
                url:'getModuleTreeByRoleId',  //ModuleController
                method:"post",
                checkbox:true,
                lines:true,
                queryParams:{
                	role_id:row.role_id
                }
            })
        },
        /**
         * 修改--数据填充
         */
        xiugai:function(){
        	var data=$("#table").datagrid("getSelected");
        	var row=data;
        	alert(row.role_id);
        	alert(row.role_name);
        	$("#roleForm").form('clear');
        	$("#roleForm").form("load",row);
        	//隐藏保存按钮
        	 $("#addsave").hide();
        	 $("#editsave").show();
        	 
            $("#tree").tree({
                url:'getModuleTreeByRoleId',  //ModuleController
                method:"post",
                checkbox:true,
                lines:true,
                queryParams:{
                	role_id:row.role_id
            }
        })
        },
        //修改提交
        editsum:function(){
        	var nodes = $('#tree').tree('getChecked', ['checked','indeterminate']);
        	var data="";
        	for(var i=0;i<nodes.length;i++){
        		data+=","+nodes[i].id
        	}
        	var datas=$("#table").datagrid("getSelections");
        	if(datas.length>1){
        		$.messager.alert('提示','请选择一行');  
        	}
        	var row=datas[0];
    		var role_name=$("#roleName").val();
    		/*$.post("validationRoleName",{
    			role_name:role_name
    		},function(validation){
    			if(validation){*/
    				$.post("updateRoleAndRoleModule",{
    					module_ids:data,
    					role_id:row.role_id,
    					role_name:$("#roleName").val(),
    					role_desc:$("#roleNote").text()
    				},function(data){
    					if(data>0){
    						$("#roleForm").form('clear');
    						$("#tree").tree({
    					        url:'getModuleTree',
    					        method:"post",
    					        checkbox:true,
    					        lines:true
    						})
	                		obj.find();
	                        $.messager.progress('close');
	                	}
    				},"json")
        		/*}else{
        			$("#roleNamespan").text("角色已存在!");
        		}     
    			
    		},"json")*/
        },
        // 编辑
        edit:function (id) {
                var ID;
                $.ajax({
                        url:'js/json/role.json',
                        type:'get'

                })
                $("#roleForm").form('load',{


                });


        },
     // 提交表单
        sum:function () {
	        	var nodes = $('#tree').tree('getChecked', ['checked','indeterminate']);
	        	var data="";
	        	for(var i=0;i<nodes.length;i++){
	        		data+=","+nodes[i].id
	        	}
        		var role_name=$("#roleName").val();
        		$.post("validationRoleName",{
        			role_name:role_name
        		},function(validation){
        			if(validation){
        				$.post("insertRole",{
        					module_ids:data,
        					role_name:$("#roleName").val(),
        					role_desc:$("#roleNote").text()
        				},function(data){
        					if(data>0){
        						$("#roleForm").form('clear');
        						$("#tree").tree("reload");
    	                		obj.find();
    	                        $.messager.progress('close');
    	                	}
        				},"json")
            		}else{
            			$("#roleNamespan").text("角色已存在!");
            		}     
        			
        		},"json")
        },
        // 删除多个
        del:function () {
                var rows=$("#table").datagrid("getSelections");
               if(rows.length>0){
                       $.messager.confirm('确定删除','你确定要删除你选择的记录吗？',function (flg) {
                               if(flg){
                                       var ids=[];
                                       for(i=0;i<rows.length;i++){
                                               ids.push(rows[i].id);

                                       }
                                       var num=ids.length;
                                      $.ajax({
                                              type:'post',
                                              url:"",
                                              data:{
                                                      ids:ids.join(',')
                                              },
                                              beforesend:function () {
                                                      $("#table").datagrid('loading');
                                                      
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
        	role_id=$("#table").datagrid('getSelected').role_id;
                $.messager.confirm('提示信息','是否删除所选择记录',function (flg) {
                        if(flg){
                                $.ajax({
                                        type:'post',
                                        url:'deleteRole',
                                        data:{
                                        	role_id:role_id
                                        },
                                        beforesend:function (data) {
                                        	
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
        width:500,
        height:300,
        closed: true,
        modal:true,
        shadow:true
})