package com.crm.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.ModuleMapper;
import com.crm.pojo.Module;
import com.crm.service.ModuleService;
@Service
public class ModuleServiceimpl implements ModuleService {
	@Autowired
	private ModuleMapper moduleMapper;
	@Override
	public List<Module> selectModules() {
		// TODO Auto-generated method stub
		return moduleMapper.selectModules();
	}
	@Override
	public List<Module> selectModulesByRoleId(Integer role_id) {
		// TODO Auto-generated method stub
		return moduleMapper.selectModulesByRoleId(role_id);
	}
	@Override
	public List<Integer> selectModuleByRoleId(Integer role_id) {
		// TODO Auto-generated method stub
		return moduleMapper.selectModuleByRoleId(role_id);
	}

}
