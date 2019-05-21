package com.crm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.pojo.Customer;
import com.crm.pojo.User;
import com.crm.pojo.UserCust;
import com.crm.service.UserCustService;
import com.crm.service.UserService;
import com.crm.util.DistributionCustomer;

@Controller
public class UserCustController {
	@Autowired
	 private UserCustService userCustService;
	@Autowired
	 private UserService userService;
	
	@RequestMapping(value="/distributionCustomer",method=RequestMethod.POST)
	@ResponseBody
	/**
	 * 为选中的客户自动分配咨询师
	 * @param customers 客户集合
	 * @return
	 */
	public Integer distributionCustomer(List<Customer> customers) {
		List<User> selectUser = userService.selectUser();
		List<UserCust> distribution = DistributionCustomer.distribution(selectUser, customers);
		Integer insertUserCusts = userCustService.insertUserCusts(distribution);
		return insertUserCusts;
	}	
}
