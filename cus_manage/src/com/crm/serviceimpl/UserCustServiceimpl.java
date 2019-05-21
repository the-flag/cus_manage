package com.crm.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.UserCustMapper;
import com.crm.pojo.UserCust;
import com.crm.service.UserCustService;

@Service
public class UserCustServiceimpl implements UserCustService {

	@Autowired
	private UserCustMapper userCustMapper;
	@Override
	public Integer insertUserCusts(List<UserCust> custs) {
		// TODO Auto-generated method stub
		return userCustMapper.insertUserCusts(custs);
	}

}
