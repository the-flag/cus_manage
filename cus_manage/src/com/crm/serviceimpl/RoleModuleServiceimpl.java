package com.crm.serviceimpl;

import java.util.List;

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
	public Integer insertRoleModule(List<RoleModule> list) throws Exception {
		// TODO Auto-generated method stub
		return moduleMapper.insertRoleModule(list);
	}
	@Override
	public Integer deleteRoleModuleByRoleId(Integer role_id) {
		// TODO Auto-generated method stub
		return moduleMapper.deleteRoleModuleByRoleId(role_id);
	}

}
