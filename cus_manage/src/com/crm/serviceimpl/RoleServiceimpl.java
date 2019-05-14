package com.crm.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.RoleMapper;
import com.crm.pojo.Role;
import com.crm.service.RoleService;

@Service
public class RoleServiceimpl implements RoleService {
	
	@Autowired
	private RoleMapper roleMapper;
	@Override
	public List<Role> selectRole() {
		// TODO Auto-generated method stub
		return roleMapper.selectRole();
	}

}
