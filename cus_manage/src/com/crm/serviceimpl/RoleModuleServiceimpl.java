package com.crm.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.RoleModuleMapper;
import com.crm.pojo.RoleModule;
import com.crm.service.RoleModuleService;
@Service
public class RoleModuleServiceimpl implements RoleModuleService {
	@Autowired
	private RoleModuleMapper moduleMapper;
	@Override
	public Integer insertRoleModule(RoleModule roleModule) throws Exception {
		// TODO Auto-generated method stub
		return moduleMapper.insertRoleModule(roleModule);
	}

}
