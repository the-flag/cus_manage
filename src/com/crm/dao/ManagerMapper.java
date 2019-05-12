package com.crm.dao;

import java.util.List;

import com.crm.pojo.Customer;
import com.crm.pojo.FenYe;

public interface ManagerMapper {
	//查询总条数
	Integer selectManagerCount(FenYe fenye);
	//多条件分页查询
	List<Customer> selectManager(FenYe fenye);

}
