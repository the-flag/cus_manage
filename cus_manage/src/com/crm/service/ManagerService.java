package com.crm.service;

import java.util.List;

import com.crm.pojo.Customer;
import com.crm.pojo.FenYe;

public interface ManagerService {
	//多条件查询
	FenYe selectManager(FenYe fenye);
    //添加客户
	Integer insertCustomer(Customer customer);
	//查询员工的状态
	FenYe selectUserSigninOrback(FenYe fenye);
	//签退
	Integer updateSignStatus(List<String> datalist);
	//签退
	Integer updateSignIn(int id);

}
