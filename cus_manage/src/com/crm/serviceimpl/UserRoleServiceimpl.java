package com.crm.serviceimpl;

import java.util.ArrayList;
import java.util.List;

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
	public Integer insertUserRoles(List<UserRole> list) throws Exception{
		// TODO Auto-generated method stub
		return userRoleMapper.insertUserRoles(list);
	}
	@Override
	public Integer deleteUserRoles(String user_ids) throws Exception {
		// TODO Auto-generated method stub
		String[] split = user_ids.split(",");
		List<Integer> list=new ArrayList<>();
		for(String s:split) {
			if(s!=null && !"".equals(s)) {
				list.add(Integer.parseInt(s));
			}
		}
		return userRoleMapper.deleteUserRoles(list);
	}
	@Override
	public Integer deleteUserRoleByUserIdAndRoleId(UserRole userRole) {
		// TODO Auto-generated method stub
		return userRoleMapper.deleteUserRoleByUserIdAndRoleId(userRole);
	}
	@Override
	public Integer insertUserRole(UserRole userRole) {
		// TODO Auto-generated method stub
		return userRoleMapper.insertUserRole(userRole);
	}

}
