package com.crm.dao;

import java.util.List;

import com.crm.pojo.UserCust;

public interface UserCustMapper {
	/**
	 * 批量添加客户和用户之间的信息
	 * @param custs
	 * @return
	 */
	Integer insertUserCusts(List<UserCust> custs);
}
