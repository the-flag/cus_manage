package com.crm.dao;

import java.util.List;

import com.crm.pojo.Customer;
import com.crm.pojo.FenYe;

public interface CounselorMapper {
	
	
	
	/**
	      *   查询总条数
	 * @param fenye
	 * @return
	 */
	Integer selectCounselorCount(FenYe fenye);
	/**
	 * 多条件分页
	 * @param fenye
	 * @return
	 */
	List<Customer> selectCounselor(FenYe fenye);
	/**
	 * 这个是修改
	 * @param customer
	 * @return
	 */
	int updateCounselor(Customer customer);
	
	

}
