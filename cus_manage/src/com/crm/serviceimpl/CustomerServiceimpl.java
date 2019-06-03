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



	@Override
	public List<Map<String, Object>> selectCustomerByJiaotimeAndCountPersonal(Integer user_id) {
		// TODO Auto-generated method stub
		return customerMapper.selectCustomerByJiaotimeAndCountPersonal(user_id);
	}



	@Override
	public Map<String, Object> selectCustomerCountByUserIdDealPersonal(Integer user_id) {
		// TODO Auto-generated method stub
		return customerMapper.selectCustomerCountByUserIdDealPersonal(user_id);
	}



	@Override
	public Map<String, Object> selectCustomerCountByUserIdTrackingPersonal(Integer user_id) {
		// TODO Auto-generated method stub
		return customerMapper.selectCustomerCountByUserIdTrackingPersonal(user_id);
	}



	@Override
	public List<Map<String, Object>> selectCustomerByJiaotimeAndCountUserw_idPersonal(Integer user_id) {
		// TODO Auto-generated method stub
		return customerMapper.selectCustomerByJiaotimeAndCountUserw_idPersonal(user_id);
	}



	@Override
	public Map<String, Object> selectCustomerCountByUserIdDealNetworkconsulting(Integer user_id) {
		// TODO Auto-generated method stub
		return customerMapper.selectCustomerCountByUserIdDealNetworkconsulting(user_id);
	}



	@Override
	public Map<String, Object> selectCustomerCountByUserIdTrackingNetworkconsulting(Integer user_id) {
		// TODO Auto-generated method stub
		return customerMapper.selectCustomerCountByUserIdTrackingNetworkconsulting(user_id);
	}



	


	
}
