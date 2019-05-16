package com.crm.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.Access_recordMapper;
import com.crm.pojo.Access_record;
import com.crm.pojo.Customer;
import com.crm.pojo.FenYe;
import com.crm.service.Access_recordService;
@Service
public class Access_recordServiceImp implements Access_recordService{

	
	
	@Autowired private Access_recordMapper access_recordMapper;
	@Override
	public FenYe selectrecord(FenYe fenYe) {
		// TODO Auto-generated method stub
		fenYe.setTotal(access_recordMapper.selectRecordCount(fenYe));
		fenYe.setRows(access_recordMapper.selectRecordselor(fenYe));
		return fenYe;
	}
	@Override
	public int insertAccess_record(Access_record access_record) {
		// TODO Auto-generated method stub
	
		
		
		return access_recordMapper.insertAccess_record(access_record);
	}
	@Override
	public int updateCustomer_view(Customer customer) {
		// TODO Auto-generated method stub
		return access_recordMapper.updateCustomer_view(customer);
	}

	

}
