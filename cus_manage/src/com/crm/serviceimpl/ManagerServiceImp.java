package com.crm.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.ManagerMapper;
import com.crm.pojo.Customer;
import com.crm.pojo.CustomerTrackParameters;
import com.crm.pojo.FenYe;
import com.crm.pojo.Sign;
import com.crm.pojo.User;
import com.crm.service.ManagerService;
@Service
public class ManagerServiceImp implements ManagerService {
    @Autowired
	private ManagerMapper managerMapper;
	public FenYe selectManager(FenYe fenye) {
		// TODO Auto-generated method stub
		fenye.setTotal(managerMapper.selectManagerCount(fenye));
		fenye.setRows(managerMapper.selectManager(fenye));
		System.out.println(managerMapper.selectManager(fenye));
		return fenye;
	}
	
	public Integer insertCustomer(Customer customer) {
		// TODO Auto-generated method stub
		return managerMapper.insertCustomer(customer);
	}

	
	public FenYe selectUserSigninOrback(FenYe fenye) {
		// TODO Auto-generated method stub
		fenye.setTotal(managerMapper.selectUserCount(fenye));
		fenye.setRows(managerMapper.selectUserSigninOrback(fenye));
		return fenye;
	}


	@Override
	public Integer updateSignStatus(List<String> data) {
		// TODO Auto-generated method stub
		return managerMapper.updateUserStatus(data);
	}

	@Override
	public Integer updateSignIn(int id) {
		// TODO Auto-generated method stub
		return managerMapper.updateUserSignin(id);
	}

	@Override
	public List<User> selectUserReferTeacher() {
		// TODO Auto-generated method stub
		return managerMapper.selectUserReferTeacher() ;
	}

	@Override
	public Integer updateCustomerTrack(CustomerTrackParameters customerTrackParameters) {
		// TODO Auto-generated method stub
		return managerMapper.updateCustomerTrack(customerTrackParameters);
	}

	@Override
	public Integer UpdateCustomer(Customer customer) {
		// TODO Auto-generated method stub
		return managerMapper.UpdateCustomer(customer);
	}

	@Override
	public Integer insertSignInfo(int user_id) {
		// TODO Auto-generated method stub
		return managerMapper.insertSignInfo(user_id);
	}

	@Override
	public Integer updateSignInfo(int user_id,String s) {
		// TODO Auto-generated method stub
		return managerMapper.updateSignInfo(user_id,s);
	}

	@Override
	public User selectUserStatus(int user_id) {
		// TODO Auto-generated method stub
		return managerMapper.selectUserStatus(user_id);
	}

	@Override
	public FenYe selectAccess_recordInfo(FenYe fenye) {
		// TODO Auto-generated method stub
		fenye.setTotal(managerMapper.selectCountAccess_record(fenye));
		fenye.setRows(managerMapper.selectAccess_recordInfo(fenye));
		return fenye;
	}

	@Override
	public Integer updateweight(User user) {
		// TODO Auto-generated method stub
		return managerMapper.updateweight(user);
	}



}
