package com.crm.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.RoleMapper;
import com.crm.dao.RoleModuleMapper;
import com.crm.pojo.FenYe;
import com.crm.pojo.Role;
import com.crm.pojo.RoleModule;
import com.crm.service.RoleModuleService;
import com.crm.service.RoleService;

@Service
public class RoleServiceimpl implements RoleService {
	
	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private RoleModuleService roleModuleService;
	@Autowired
	private RoleModule roleModule;
	@Override
	public List<Role> selectRole() {
		// TODO Auto-generated method stub
		return roleMapper.selectRole();
	}
	@Override
	public FenYe selectRolesAndTotal(FenYe fenYe) {
		// TODO Auto-generated method stub
		List<Role> selectRolesByFenYe = roleMapper.selectRolesByFenYe(fenYe);
		Integer selectRoleCountByFenYe = roleMapper.selectRoleCountByFenYe(fenYe);
		fenYe.setRows(selectRolesByFenYe);
		fenYe.setTotal(selectRoleCountByFenYe);
		
		return fenYe;
	}
	@Override
	public Integer insertRole(Role role,String module_ids)throws Exception {
		// TODO Auto-generated method stub
		roleMapper.insertRole(role);
		if(role.getRole_id()>0) {
			roleModule.setRole_id(role.getRole_id());
			System.out.println(module_ids+":ssssssssssssssssssssssssss");
			String[] split = module_ids.split(",");
			for(String s:split) {
				if(s!=null && !"".equals(s)) {
					System.out.println(Integer.parseInt(s));
					roleModule.setModule_id(Integer.parseInt(s));
					System.out.println("添加！！！！！！！！！！！！！！！！！");
					try {
						roleModuleService.insertRoleModule(roleModule);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
		return 1;
	}
	@Override
	public Integer selectRoleByRoleName(String role_name) {
		// TODO Auto-generated method stub
		return roleMapper.selectRoleByRoleName(role_name);
	}

}
