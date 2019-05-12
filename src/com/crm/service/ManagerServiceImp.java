package com.crm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.ManagerMapper;
import com.crm.pojo.FenYe;
@Service
public class ManagerServiceImp implements ManagerService {
    @Autowired
	private ManagerMapper managerMapper;
	public FenYe selectManager(FenYe fenye) {
		// TODO Auto-generated method stub
		fenye.setTotal(managerMapper.selectManagerCount(fenye));
		fenye.setRows(managerMapper.selectManager(fenye));
		return fenye;
	}

}
