/**
 * Created by Administrator on 2017/11/8.
 */
// 加载树
$("#tree").tree({
        url:'getModuleTree',
        method:"post",
        animate:true,
        checkbox:true,
        lines:true,
        dnd:true,
        onContextMenu:function (e,node) {
                e.preventDefault();
                $("#tree").tree('select',node.target);
                $("#mean").menu('show',{
                        left:e.pageX,
                        top:e.pageY
                })
        },
        onClick:function (node) {
              var partId=node.id;
                var partName=node.text;
                var parentName=$("#tree").tree('getParent',node.target);
               
                if(parentName==null){
                	parentName=0;
                }else{
                	parentName=$("#tree").tree('getParent',node.target).text;
                	 module_parent_id=$("#tree").tree('getParent',node.target).parentId;
                }
                $("#partNameSpan").text("");
                var url=node.url;
                var module_weight=node.weight;
                $("#partId").val(partId);
                $("#partName").val(partName);
                $("#parentPart").combotree('setText',parentName);
                $("#parentPart").combotree('setValue',node.parentId);
                $("#module_path").val(url);
                $("#module_weight").val(module_weight);
                
                


        }
})

var module_parent_id;
// 加载模块下拉框

$("#parentPart").combotree({
        url:'getModuleCombotree',
        method:"post",
        width:'70%',
        height:28,
        checkbox:true,
        onSelect:function (node) {
                /*var t = $("#parentPart").combotree('tree'); // 得到树对象
                var n = t.tree('getSelected');*/
                /*$("#parentPart").combotree('setValue',n.text)*/
        	alert(node.id);
        	var data=node.id;
            $("#parentPart").combotree('setValue',data);
        }
})
// 增加模块
function addPart() {
	
        var selectNode=$("#tree").tree("getSelected");
       $("#formBox").form("clear");
        $("#parentPart").combotree('setValue',selectNode.text);
        $("#partper").val("");
        $("#module_path").val("");
        $("#partNameSpan").text("");
        $("#edit").hide();
        $("#save").show();


}
/*//修改模块
function editPart() {
        var selectNode=$("#tree").tree("getSelected");
        var id=parseInt(Math.random()*1000+1);
        $("#partId").val(id);
        $("#parentPart").combotree('setValue',selectNode.text);
        $("#partper").val("");
        $("#module_path").val("");
        
        $("#partEmail").val("");
        $("#partTele").val("");
        $("#note").val("");
        $("#partName").val("");
        $("#edit").hide();
        $("#save").show();


}*/
// 保存模块信息
function saveForm(){
	var none=$("#tree").tree("getSelected");
	alert(none.text);
	 var isLeaf = $('#tree').tree('isLeaf',none.target);
	 if(isLeaf){
		 if(none.url!=null && none.url!=''){
			 $.messager.alert('提示','不能在该节点下添加!');    
			 return ;
		 }
	 }	
	 if($("#formBox").form('validate')){
		 	$.post("insertModule",{
		 		module_id:$("#module_id").val(),
		 		module_name:$("#partName").val(),
		 		module_parent_id:none.id,
		 		module_path:""+$("#module_path").val(),
		 		module_weight:$("#module_weight").val()
		 		
		 	},function(data){
		 		if(data>0){
	                var selectNode=$("#tree").tree('getSelected');
	                $('#tree').tree('reload');
	                
	                $("#edit").show();
	                $("#save").hide();
	                $.messager.show({
	                        title:'提示',
	                        msg:'模块新增成功'
	                });
	                $("#partId").attr('readonly',true).css('background',"#eee");
	    		}else{
	    			$("#partNameSpan").text("模块名称已存在!!");
	    		}
		 	},"json")
	  	}else{
	  		 $.messager.show({
                 title:'提示',
                 msg:'请检查模块名称'
         });
	  	}	
}
// 修改模块
function editForm(){
	var s=$("#parentPart").combotree('getValue');
	 if($("#formBox").form('validate')){
		 var selectNode=$("#tree").tree("getSelected");
		$.post("moduleValidata",{
			module_id:$("#partId").val(),
			module_parent_id:selectNode.parentId,
	 		module_name:$("#partName").val()
		},function(vali){
			if(vali){
				$.post("updateModule",{
			 		module_id:$("#partId").val(),
			 		module_name:$("#partName").val(),
			 		module_parent_id:s,
			 		module_path:$("#module_path").val(),
			 		module_weight:$("#module_weight").val()
			 	},function(data){
			 		if(data>0){
			 			$("#tree").tree("reload");
			             $.messager.show({
			                     title:'提示',
			                     msg:'模块修改成功'
			             });
					}
			 	},"json")
			}else{
				$("#partNameSpan").text("模块名称已存在!!");
			}
			
		},"json")
	 }
}
// 删除模块
function delPart() {
	
	$.messager.confirm('确认','您确认想要删除该节点吗？',function(r){    
	    if (r){    
	    	
	    	var none=$("#tree").tree("getSelected");
	    	alert(none.text);
	    	$.post("deleteModule",{
	    		module_id:none.id
	    	},function(data){
	    		if(data>0){
	    			$("#tree").tree("reload");
	    			$.messager.show({
	                     title:'提示',
	                     msg:'模块删除成功'
	    			});
	    		}else{
	    			$.post("selectRoleByModuleId",{
	    				module_id:none.id
	    			},function(data){
	    				var message="";
	    				if(data!=null){
	    					alert("引用不为空!");
	    					for(var i=0;i<data.length;i++){
	    						alert(data[i].role_name);
	    						message+=data[i].role_name+",";
	    					}
	    					var ts=message.substring(0,message.length-1);
	    					$.messager.show({
	   	                     	title:'提示',
	   	                     	msg:'该模块被'+ts+'角色引用,不可删除!'
	    					});
	    					return;
	    				}
	    				$.messager.show({
   	                     	title:'提示',
   	                     	msg:'该模块删除失败!'
    					});
	    			},"json")
	    			
	    		}
	    	},"json")
	    	return;
	    	
	    	var selectNode=$("#tree").tree('getSelected');
	        $("#tree").tree("remove",selectNode.target);

	    }    
	});  
	
}
// 初始化模块信息
/*function init() {
        var partRoot=$("#tree").tree('getRoot');
        var partId=partRoot.id;
        var partName=partRoot.text;
        $("#partId").val(partId);
        $("#partName").val(partName);
        $("#parentPart").combotree('setValue',partName);

}*/