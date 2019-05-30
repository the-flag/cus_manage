package com.crm.dao;

import java.util.List;
import java.util.Map;

import com.crm.pojo.BarchartOne;

public interface CustomerMapper {
	/**
	 * 
	 * 查询最近六个月份所有咨询师的总成交量
	 * 
	 * @param role_id 角色id 咨询师id为 3
	 * @return
	 */
	List<Map<String,Object>> selectCustomerByJiaotimeAndCount(Integer role_id);
	
	/**
	 * 根据角色id
	 * 查询属于咨询师的客户数量
	 * @return
	 */
	Integer selectCustomerByRoleId(Integer role_id);
}
