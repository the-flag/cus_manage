package com.crm.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.crm.pojo.Module;
import com.mysql.jdbc.StringUtils;

@Component
public class TreeUtil {
	public static List<EasyUITreeJson> listGetStree(List<Module> list){
		List<EasyUITreeJson> treeList = new ArrayList<EasyUITreeJson>();
		for(Module m:list) {
			/*if(m.getModule_id()==0) {*/
				treeList.add(getModule(m));
			
			/*for(Module EasyUITreeJson :list) {
				if(m.getModule_id()==EasyUITreeJson.getModule_parent_id()) {
					
				}
			}*/
		}
		return treeList;
	}
	
	public static EasyUITreeJson getModule(Module module) {
		EasyUITreeJson json=new EasyUITreeJson();
		
		json.setId(module.getModule_id());
		json.setText(module.getModule_name());
		json.setUrl(module.getModule_path());
		/*json.setState("closed");
		json.setChecked(false);*/
		json.setParentId(module.getModule_parent_id());
		return json;
	}
	
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
