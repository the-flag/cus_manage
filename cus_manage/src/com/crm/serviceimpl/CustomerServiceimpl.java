package com.crm.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.CustomerMapper;
import com.crm.pojo.BarchartOne;
import com.crm.service.CustomerService;
@Service
public class CustomerServiceimpl implements CustomerService {
	@Autowired
	private CustomerMapper customerMapper;
	
	

	@Override
	public Integer selectCustomerByRoleId(Integer role_id) {
		// TODO Auto-generated method stub
		return customerMapper.selectCustomerByRoleId(role_id);
	}



	@Override
	public List<Map<String, Object>> selectCustomerByJiaotimeAndCount(Integer role_id) {
		// TODO Auto-generated method stub
		return customerMapper.selectCustomerByJiaotimeAndCount(role_id);
	}



	
}
