package com.crm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.pojo.FenYe;
import com.crm.pojo.Role;
import com.crm.service.RoleService;


@Controller
public class RoleController {
	@Autowired
	private RoleService roleService;
	@RequestMapping(value="/getRolePage",method=RequestMethod.GET)
	public String getRolePage() {
		return "role";
		
	}
	
	@RequestMapping(value="/getRole",method=RequestMethod.POST)
	@ResponseBody
	public List<Role> getRole() {
		return roleService.selectRole();
		
	}
	
	
	@RequestMapping(value="/getUserRole",method=RequestMethod.POST)
	@ResponseBody
	public List<Role> getUserRole(Integer user_id) {
		return roleService.selectRoleByUserId(user_id);
		
	}
	
	
	@RequestMapping(value="/selectRolesAndTotal",method=RequestMethod.POST)
	@ResponseBody
	public FenYe selectRolesAndTotal(FenYe fenYe,Integer rows,Role role) {
		fenYe.setObject(role);
		fenYe.setRow(rows);
		fenYe.setPage((fenYe.getPage()-1)*rows);
		return roleService.selectRolesAndTotal(fenYe);
	}
	
	/**
	 * 验证角色名称是否重复
	 * @param role
	 * @param module_ids
	 * @return
	 */
	@RequestMapping(value="/validationRoleName",method=RequestMethod.POST)
	@ResponseBody
	public Boolean validationRoleName(String role_name,Integer role_id) {
		Role selectRoleByRoleName = roleService.selectRoleByRoleName(role_name);
		if(selectRoleByRoleName!=null) {
			if(role_id!=null && selectRoleByRoleName.getRole_id()==role_id) {
				return true;
			}
			return false;
		}
		return true;
	}
	@RequestMapping(value="/insertRole",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertRole(Role role,String module_ids) {
		String substring=null;
		if(module_ids!=null && module_ids.length()>2) {
			System.out.println("长度大于1");
			substring = module_ids.substring(1, module_ids.length()-1);
		}
		Integer i=0;
			try {
				 i=roleService.insertRole(role, substring);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return i;
	}
	
	@RequestMapping(value="/updateRoleAndRoleModule",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateRoleAndRoleModule(Role role,String module_ids) {
		String substring=null;
		if(module_ids!=null && module_ids.length()>2) {
			substring = module_ids.substring(1, module_ids.length()-1);
		}
		Integer i=0;
			try {
				i=roleService.updateRole(role,module_ids);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return i;
	}
	
	
	@RequestMapping(value="/deleteRole",method=RequestMethod.POST)
	@ResponseBody
	public Integer deleteRole(Integer role_id) {
		return roleService.deteleRole(role_id);
	}
	
	
	
	
	
}
