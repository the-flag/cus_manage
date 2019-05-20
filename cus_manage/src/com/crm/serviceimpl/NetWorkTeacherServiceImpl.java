package com.crm.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.NetWorkTeacherMapper;
import com.crm.pojo.Access_record;
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

	@Override
	public Integer insertTrackInfo(Access_record access_record) {
		// TODO Auto-generated method stub
		return netWorkTeacherMapper.insertTrackInfo(access_record);
	}

	@Override
	public List<Access_record> selectDateLog() {
		// TODO Auto-generated method stub
		return netWorkTeacherMapper.selectDateLog();
	}

}
