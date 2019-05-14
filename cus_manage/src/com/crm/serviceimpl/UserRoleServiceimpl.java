package com.crm.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.UserRoleMapper;
import com.crm.pojo.UserRole;
import com.crm.service.UserRoleService;
@Service
public class UserRoleServiceimpl implements UserRoleService {
	@Autowired
	private UserRoleMapper userRoleMapper;
	@Override
	public Integer insertUserRole(UserRole userRole) throws Exception{
		// TODO Auto-generated method stub
		return userRoleMapper.insertUserRole(userRole);
	}
	@Override
	public Integer deleteUserRoles(String user_ids) throws Exception {
		// TODO Auto-generated method stub
		return userRoleMapper.deleteUserRoles(user_ids);
	}

}
