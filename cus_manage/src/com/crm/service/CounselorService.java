package com.crm.service;

import java.util.List;

import com.crm.pojo.Customer;
import com.crm.pojo.FenYe;

public interface CounselorService {
	/**
	 * 这个是查询出咨询师的学生
	 * @param fenye
	 * @return
	 */
	FenYe selectCounselor(FenYe fenye);
 
		/**
		 * 这个是修改
		 * @param customer
		 * @return
		 */
	int updateCustomer(Customer customer);

	


}
