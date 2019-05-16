package com.crm.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.NetWorkTeacherMapper;
import com.crm.pojo.FenYe;
import com.crm.service.NetWorkTeacherService;
@Service
public class NetWorkTeacherServiceImpl implements NetWorkTeacherService {
	@Autowired
    private NetWorkTeacherMapper netWorkTeacherMapper;
	
	public FenYe selectNetWorkTeacher(FenYe fenye) {
		// TODO Auto-generated method stub
		fenye.setTotal(netWorkTeacherMapper.selectCustomerCount(fenye));
		fenye.setRows(netWorkTeacherMapper.selectCustomer(fenye));
		return fenye;
	}

}
