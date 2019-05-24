package com.crm.service;

import java.util.List;

import com.crm.pojo.Customer;
import com.crm.pojo.CustomerTrackParameters;
import com.crm.pojo.FenYe;
import com.crm.pojo.Sign;
import com.crm.pojo.User;

public interface ManagerService {
	//多条件查询
	FenYe selectManager(FenYe fenye);
    //添加客户
	Integer insertCustomer(Customer customer);
	//查询全部员工的状态信息
	FenYe selectUserSigninOrback(FenYe fenye);
	//签退
	Integer updateSignStatus(List<String> datalist);
	//签退
	Integer updateSignIn(int id);
	//查询出所有的咨询师
	List<User> selectUserReferTeacher();
	//对客户进行跟踪
    Integer  updateCustomerTrack(CustomerTrackParameters customerTrackParameters);
    //查询客户的基本信息
    Integer UpdateCustomer(Customer customer);
  /*  增加签到信息统计*/
    Integer insertSignInfo(int user_id);
    Integer updateSignInfo(int user_i,String s);
    
   //查询员工的状态
    User selectUserStatus(int user_id);
    //查询客户跟进情况
    FenYe selectAccess_recordInfo(FenYe fenye);
}
