package com.crm.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.CounselorMapper;
import com.crm.pojo.Customer;
import com.crm.pojo.FenYe;
import com.crm.service.CounselorService;
@Service
public class CounselorServiceImp implements CounselorService{
@Autowired private CounselorMapper counselorMapper;

	public FenYe selectCounselor(FenYe fenye) {
		// TODO Auto-generated method stub
				fenye.setTotal(counselorMapper.selectCounselorCount(fenye));
				fenye.setRows(counselorMapper.selectCounselor(fenye));
				return fenye;
	}

	@Override
	public int updateCustomer(Customer customer) {
		// TODO Auto-generated method stub
		return counselorMapper.updateCounselor(customer);
	}

}
