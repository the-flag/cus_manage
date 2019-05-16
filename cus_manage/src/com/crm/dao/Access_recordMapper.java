package com.crm.dao;

import java.util.List;

import com.crm.pojo.Access_record;
import com.crm.pojo.Customer;
import com.crm.pojo.FenYe;

public interface Access_recordMapper {

	
	
	/**
	 * 
	 * @param fenYe
	 * @return
	 */
	Integer selectRecordCount(FenYe fenYe);
	/**
	 * 
	 * @param fenYe
	 * @return
	 */
	List<Access_record> selectRecordselor(FenYe fenYe);
	/**
	 * 这是增加
	 * @param access_record
	 * @return
	 */

	int insertAccess_record(Access_record access_record);
	
	
	int updateCustomer_view(Access_record access_record);
	
	
	int updateCustomer_view(Customer customer);

}
