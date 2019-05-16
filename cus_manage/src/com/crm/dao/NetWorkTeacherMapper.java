package com.crm.dao;

import java.util.List;

import com.crm.pojo.Customer;
import com.crm.pojo.FenYe;

public interface NetWorkTeacherMapper {
	Integer  selectCustomerCount(FenYe fenye);
	
	List<Customer> selectCustomer(FenYe fenye);

}
