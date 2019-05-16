package com.crm.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.ManagerMapper;
import com.crm.pojo.Customer;
import com.crm.pojo.FenYe;
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

}
