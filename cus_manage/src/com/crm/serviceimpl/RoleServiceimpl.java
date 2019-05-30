package com.crm.serviceimpl;

import java.util.ArrayList;
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
	/**
	 * 关联增加 
	 * 添加角色时判断是否存在该角色名称
	 * 同时批量添加角色和模块 
	 */
	@Override
	public Integer insertRole(Role role,String module_ids)throws Exception {
		// TODO Auto-generated method stub
		Integer insertRole = roleMapper.insertRole(role);
		if(insertRole>0) {
			List<RoleModule> list=new ArrayList<>();
			if(module_ids.length()>1) {
				String[] split = module_ids.split(",");
				for(String s:split) {
					if(s!=null && !"".equals(s)) {
						RoleModule module=new RoleModule();
						module.setRole_id(role.getRole_id());
						module.setModule_id(Integer.parseInt(s));
						list.add(module);
						System.out.println("添加！"+module);
					}
				}
			}
			if(list==null) {return 0;}
			try {
				return roleModuleService.insertRoleModule(list);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
	}
	@Override
	public Role selectRoleByRoleName(String role_name) {
		// TODO Auto-generated method stub
		return roleMapper.selectRoleByRoleName(role_name);
	}
	@Override
	public Integer updateRole(Role role,String module_ids) {
		// TODO Auto-generated method stub
		roleMapper.updateRole(role);
		roleModuleService.deleteRoleModuleByRoleId(role.getRole_id());
		roleModule.setRole_id(role.getRole_id()); //重复
		List<RoleModule> list=new ArrayList<>();
		if(module_ids.length()>1) {
			String[] split = module_ids.split(",");
			for(String s:split) {
				if(s!=null && !"".equals(s)) {
					RoleModule module=new RoleModule();
					module.setRole_id(role.getRole_id());
					module.setModule_id(Integer.parseInt(s));
					list.add(module);
				}
			}
		}
		if(list==null) {return 0;}
		try {
			return roleModuleService.insertRoleModule(list);
		} catch (Exception e) {
				// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public Integer deteleRole(Integer role_id) {
		// TODO Auto-generated method stub
		Integer deleteRoleModuleByRoleId = roleModuleService.deleteRoleModuleByRoleId(role_id);
		return roleMapper.deteleRole(role_id);
	}
	@Override
	public List<Role> selectRoleByUserId(Integer user_id) {
		// TODO Auto-generated method stub
		return roleMapper.selectRoleByUserId(user_id);
	}
	@Override
	public List<Role> selectRoleByModuleId(Integer module_id) {
		// TODO Auto-generated method stub
		return roleMapper.selectRoleByModuleId(module_id);
	}

}
