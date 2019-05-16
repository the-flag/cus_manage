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
                }
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
// 加载部门下拉框

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
// 增加部门
function addPart() {
	
        var selectNode=$("#tree").tree("getSelected");
        var id=parseInt(Math.random()*1000+1);
        $("#partId").val(id);
        $("#parentPart").combotree('setValue',selectNode.text);
        $("#partper").val("");
        $("#module_path").val("");
        /*$("#partEmail").val("");
        $("#partTele").val("");
        $("#note").val("");
        $("#partName").val("");*/
        $("#edit").hide();
        $("#save").show();


}
/*//修改部门
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
// 保存部门信息
function saveForm(){
	var none=$("#tree").tree("getSelected");
	alert(none.text);
	alert(none.url);
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
		 		module_path:$("#module_path").val(),
		 		module_weight:$("#module_weight").val()
		 	},function(data){
		 		if(data>0){
	                var partName=$("#partName").val();
	                var selectNode=$("#tree").tree('getSelected');
	                $('#tree').tree('append',{
	                        parent:selectNode.target,
	                        data:[{
	                                text:partName,
	                                "iconCls":"icon-reload"
	                        }]
	                });
	                $("#edit").show();
	                $("#save").hide();
	                $.messager.show({
	                        title:'提示',
	                        msg:'部门新增成功'
	                });
	                $("#partId").attr('readonly',true).css('background',"#eee");
	    		}
		 	},"json")
	  	}	
}
// 修改部门
function editForm(){
	var s=$("#parentPart").combotree('getValue');
	 if($("#formBox").form('validate')){
		$.post("updateModule",{
	 		module_id:$("#partId").val(),
	 		module_name:$("#partName").val(),
	 		module_parent_id:s,
	 		module_path:$("#module_path").val(),
	 		module_weight:$("#module_weight").val()
	 	},function(data){
	 		if(data>0){
	 			/* var partName=$("#partName").val();
	             var selectNode=$("#tree").tree('getSelected');
	             $('#tree').tree('update',{
	                     target: selectNode.target,
	                     data:[{
	                             text:partName,
	                     }]
	             });*/
	 			$("#tree").tree("reload");
	             $.messager.show({
	                     title:'提示',
	                     msg:'部门修改成功'
	             });
			}
	 	},"json")
	 }
}
// 删除部门
function delPart() {
        var selectNode=$("#tree").tree('getSelected');
        $("#tree").tree("remove",selectNode.target);


}
// 初始化部门信息
/*function init() {
        var partRoot=$("#tree").tree('getRoot');
        var partId=partRoot.id;
        var partName=partRoot.text;
        $("#partId").val(partId);
        $("#partName").val(partName);
        $("#parentPart").combotree('setValue',partName);

}*/