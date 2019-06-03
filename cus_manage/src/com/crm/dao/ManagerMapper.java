package com.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.crm.pojo.Access_record;
import com.crm.pojo.Customer;
import com.crm.pojo.CustomerTrackParameters;
import com.crm.pojo.FenYe;
import com.crm.pojo.Sign;
import com.crm.pojo.User;

public interface ManagerMapper {
	//查询客户信息总条数
	Integer selectManagerCount(FenYe fenye);
	//多条件分页查询客户的基本信息(已分配)
	List<Customer> selectManager(FenYe fenye);
	
	
	//查询客户信息总条数
	Integer selectManagerCount1(FenYe fenye);
	//多条件分页查询客户的基本信息(未分配)
	List<Customer> selectManager1(FenYe fenye);
		
	//添加客户
	Integer insertCustomer(Customer customer);
	//查询员工信息总条数
	Integer selectUserCount(FenYe fenye);
	//多条件分页查询员工的信息
	List<User> selectUserSigninOrback(FenYe fenye);
	//签退
	Integer  updateUserStatus(List<String> s);
	//签到
	Integer updateUserSignin(int id);
	//获取当天已签到的咨询师
	List<User> selectUserReferTeacher();
	//对客户进行跟踪
	Integer  updateCustomerTrack(CustomerTrackParameters customerTrackParameters);
    //修改客户的基本信息
	Integer UpdateCustomer(Customer customer);
	//增加签到信息统计
	Integer  insertSignInfo(int user_id);
	//获取员工签退的时间
	Integer updateSignInfo(@Param("user_id")int user_id,@Param("s")String s);
	//获取员工的状态
	User selectUserStatus(int user_id);
	//客户跟进情况
	List<Access_record> selectAccess_recordInfo(FenYe fenye); 
	//客户跟进信息的数量
    Integer selectCountAccess_record(FenYe fenye); 
    //修改员工权重
    Integer updateweight(User user);
    
}
