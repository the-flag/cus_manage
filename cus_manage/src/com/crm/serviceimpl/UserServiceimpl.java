package com.crm.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.UserMapper;
import com.crm.pojo.FenYe;
import com.crm.pojo.Module;
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
	@Override
	public User selectUserByAccount(User user) {
		// TODO Auto-generated method stub
		return usermapper.selectUserByAccount(user);
	}
	@Override
	public User selectUserByUuid(String uuid) {
		// TODO Auto-generated method stub
		return usermapper.selectUserByUuid(uuid);
	}
	@Override
	public Integer updateUser(User user) {
		// TODO Auto-generated method stub
		return usermapper.updateUser(user);
	}
	@Override
	public List<Module> selectUserPermById(Integer user_id) {
		// TODO Auto-generated method stub
		return usermapper.selectUserPermById(user_id);
	}
	@Override
	public FenYe selectUsersByFenYe(FenYe fenYe) {
		// TODO Auto-generated method stub
		Integer selectUserCountByFenYe = usermapper.selectUserCountByFenYe(fenYe);
		List<User> selectUsersByFenYe = usermapper.selectUsersByFenYe(fenYe);
		fenYe.setRows(selectUsersByFenYe);
		fenYe.setTotal(selectUserCountByFenYe);
		return fenYe;
	}

}
