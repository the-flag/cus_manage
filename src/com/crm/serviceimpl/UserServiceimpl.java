package com.crm.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.UserMapper;
import com.crm.pojo.User;
import com.crm.service.UserService;
@Service
public class UserServiceimpl implements UserService {
	@Autowired
	private UserMapper usermapper;
	@Override
	public List<User> selectUser() {
		// TODO Auto-generated method stub
		return usermapper.selectUser();
	}

}
