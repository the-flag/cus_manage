package com.crm.service;

import java.util.List;

import com.crm.pojo.UserCust;

/**
 * 客户和用户中间表
 * @author dell
 *
 */
public interface UserCustService {
	/**
	 * 批量添加客户和用户之间的信息
	 * @param custs
	 * @return
	 */
	Integer insertUserCusts(List<UserCust> custs);
}	
