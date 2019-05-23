package com.crm.dao;

import java.util.List;

import com.crm.pojo.Access_record;
import com.crm.pojo.Customer;
import com.crm.pojo.FenYe;

public interface NetWorkTeacherMapper {
	Integer  selectCustomerCount(FenYe fenye);
	
	List<Customer> selectCustomer(FenYe fenye);
	//学生信息跟踪
	Integer insertTrackInfo(Access_record access_record);
    List<Access_record> selectDateLog(Access_record access_record);
	
}
