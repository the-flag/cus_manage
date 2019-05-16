package com.crm.service;

import com.crm.pojo.Access_record;
import com.crm.pojo.Customer;
import com.crm.pojo.FenYe;

public interface Access_recordService {

	FenYe selectrecord(FenYe fenYe);

	int insertAccess_record(Access_record access_record);

	int updateCustomer_view(Customer customer);

}
