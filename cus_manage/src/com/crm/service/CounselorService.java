package com.crm.service;

import java.util.List;

import com.crm.pojo.Customer;
import com.crm.pojo.FenYe;

public interface CounselorService {
	/**
	 * ����ǲ�ѯ����ѯʦ��ѧ��
	 * @param fenye
	 * @return
	 */
	FenYe selectCounselor(FenYe fenye);
 
		/**
		 * ������޸�
		 * @param customer
		 * @return
		 */
	int updateCustomer(Customer customer);

	


}
