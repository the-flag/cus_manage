package com.crm.dao;

import java.util.List;

import com.crm.pojo.Customer;
import com.crm.pojo.FenYe;

public interface CounselorMapper {
	
	
	
	/**
	      *   ��ѯ������
	 * @param fenye
	 * @return
	 */
	Integer selectCounselorCount(FenYe fenye);
	/**
	 * ��������ҳ
	 * @param fenye
	 * @return
	 */
	List<Customer> selectCounselor(FenYe fenye);
	/**
	 * ������޸�
	 * @param customer
	 * @return
	 */
	int updateCounselor(Customer customer);
	
	

}
