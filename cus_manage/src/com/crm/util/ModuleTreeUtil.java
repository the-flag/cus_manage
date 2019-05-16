package com.crm.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.crm.pojo.Module;
import com.mysql.jdbc.StringUtils;

@Component
public class ModuleTreeUtil {
	public static List<EasyUITreeJson> listGetStree(List<Module> list,List<Integer> module_ids){
		List<EasyUITreeJson> treeList = new ArrayList<EasyUITreeJson>();
		for(Module m:list) {
				treeList.add(getModule(m,module_ids));
		}
		return treeList;
	}
	/*
	 * 封装数据 --- 把从数据库里查询的数据封装成EasyUITreeJson集合
	 * */
	public static EasyUITreeJson getModule(Module module,List<Integer> module_ids) {
		EasyUITreeJson json=new EasyUITreeJson();
		
		json.setId(module.getModule_id());
		json.setText(module.getModule_name());
		json.setUrl(module.getModule_path());
		/*json.setState("closed");
		json.setChecked(false);*/
		json.setWeight(module.getModule_weight());
		json.setParentId(module.getModule_parent_id());
		if(module_ids!=null){
			if(module.getModule_parent_id()!=0) {
				for(Integer i:module_ids) {
					if(module.getModule_id()==i) {
						json.setChecked(true);
					}
				}
			}
		}
		return json;
	}
	
	/**
	 * 封装数据 --把EasyUITreeJson集合封装成符合easyui Tree控件的json格式
	 * @param list
	 * @return
	 */
	public static List<EasyUITreeJson> listToTree(List<EasyUITreeJson> list) {
        //用递归找子。
        List<EasyUITreeJson> treeList = new ArrayList<EasyUITreeJson>();
        for (EasyUITreeJson tree : list) {
            if (tree.getParentId() == 0) {
                treeList.add(findChildren(tree, list));
            }
        }
        return treeList;
    }
	/**
	 * 递归方法 ---找出当前节点的所有子节点
	 * */
    private static EasyUITreeJson findChildren(EasyUITreeJson tree, List<EasyUITreeJson> list) {
        for (EasyUITreeJson node : list) {
            if (node.getParentId() == tree.getId()) {
                if (tree.getChildren() == null) {
                    tree.setChildren(new ArrayList<EasyUITreeJson>());
                }
                tree.getChildren().add(findChildren(node, list));
            }
        }
        return tree;
    }
}
