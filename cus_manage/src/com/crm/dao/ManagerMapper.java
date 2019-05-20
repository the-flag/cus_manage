package com.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.crm.pojo.Customer;
import com.crm.pojo.CustomerTrackParameters;
import com.crm.pojo.FenYe;
import com.crm.pojo.User;

public interface ManagerMapper {
	//查询客户信息总条数
	Integer selectManagerCount(FenYe fenye);
	//多条件分页查询客户的基本信息
	List<Customer> selectManager(FenYe fenye);
	//添加客户
	Integer insertCustomer(Customer customer);
	//查询员工信息总条数
	Integer selectUserCount(FenYe fenye);
	//多条件分页查询员工的签到签退状态
	List<User> selectUserSigninOrback(FenYe fenye);
	//签退
	Integer  updateUserStatus(List<String> s);
	//签到
	Integer updateUserSignin(int id);
	//获取所有的咨询师
	List<User> selectUserReferTeacher();
	//对客户进行跟踪
	Integer  updateCustomerTrack(CustomerTrackParameters customerTrackParameters);
    //修改客户的基本信息
	Integer UpdateCustomer(Customer customer);
}
