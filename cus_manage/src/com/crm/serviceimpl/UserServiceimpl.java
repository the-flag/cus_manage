package com.crm.serviceimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.UserMapper;
import com.crm.dao.UserRoleMapper;
import com.crm.pojo.FenYe;
import com.crm.pojo.Module;
import com.crm.pojo.User;
import com.crm.pojo.UserRole;
import com.crm.service.UserRoleService;
import com.crm.service.UserService;
import com.crm.util.MD5Utils;
@Service
public class UserServiceimpl implements UserService {
	@Autowired
	private UserMapper usermapper;
	@Autowired
	private UserRoleService userRoleService;
	@Autowired
	private UserRole userRole;
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
	/**
	 * 添加用户时
	 * 批量添加用户和角色关联的信息到中间表
	 */
	@Override
	public Integer insertUserAndRole(User user, String roleids) {
		// TODO Auto-generated method stub 
		Integer insertUser = usermapper.insertUser(user);
		if(insertUser>0) {
			userRole.setUser_id(user.getUser_id());
			
			String[] split = roleids.split(",");
			List<UserRole> list=new ArrayList<UserRole>();
			for(String s:split) {
				if(s!=null && !"".equals(s)) {
					UserRole role=new UserRole();
					role.setUser_id(user.getUser_id());
					role.setRole_id(Integer.parseInt(s));
					System.out.println("ssssssss"+role);
					list.add(role);
				}
			}
			try {
				if(!(userRoleService.insertUserRoles(list)>0)) {
					return 0;
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 1;
	}
	@Override
	public Integer deleteUsers(String user_ids) throws Exception {
		// TODO Auto-generated method stub
		Integer deleteUserRoles = userRoleService.deleteUserRoles(user_ids);
		String[] split = user_ids.split(",");
		List<Integer> list=new ArrayList<>();
		for(String s:split) {
			if(s!=null && !"".equals(s)) {
				list.add(Integer.parseInt(s));
			}
		}
		Integer deleteUsers = usermapper.deleteUsers(list);
		return deleteUsers;
	}
	@Override
	public Integer updateUserByAccount(User user) {
		// TODO Auto-generated method stub
		return usermapper.updateUserByAccount(user);
	}
	@Override
	public Integer updatePasswordByUserId(Integer user_id) {
		// TODO Auto-generated method stub
		return usermapper.updatePasswordByUserId(user_id);
	}
	@Override
	public Integer updateUserIsLockByUserId(User user) {
		// TODO Auto-generated method stub
		return usermapper.updateUserIsLockByUserId(user);
	}

}
