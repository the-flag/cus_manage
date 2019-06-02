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
	 * 
	 * 查询个人最近六个月份的成交量 如咨询师 、 网络咨询师
	 * 
	 * @param role_id 角色id 咨询师id为 3
	 * @return
	 */
	List<Map<String,Object>> selectCustomerByJiaotimeAndCountPersonal(Integer user_id);
	
	
	
	
	/**
	 * 根据角色id
	 * 查询属于咨询师的客户数量
	 * @return
	 */
	Integer selectCustomerByRoleId(Integer role_id);
	
	/**
	 * 近一个月单个咨询师的客户成交量
	 * @param user_id
	 * @return
	 */
	Map<String, Object> selectCustomerCountByUserIdDealPersonal(Integer user_id);
	
	/**
	 * 单个咨询师的正在跟踪的客户数量
	 * @param user_id
	 * @return
	 */
	Map<String, Object> selectCustomerCountByUserIdTrackingPersonal(Integer user_id);
}
