package com.crm.service;

import java.util.List;

import com.crm.pojo.BarchartOne;

public interface CustomerService {
	/**
	 * 
	 * 查询最近六个月份所有咨询师的总成交量
	 * 
	 * @param role_id 角色id 咨询师id为 3
	 * @return
	 */
	List<BarchartOne> selectCustomerByJiaotimeAndCount(Integer role_id);
}
