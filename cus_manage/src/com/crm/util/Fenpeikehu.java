package com.crm.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.crm.pojo.Customer;
import com.crm.pojo.User;
import com.crm.pojo.UserCustomer;


public class Fenpeikehu {
	
	/**
	 * 分配函数
	 * @param CusList
	 *            分配总人数列表
	 */
	static List<UserCustomer> distribution(List<User> UserList, List<Customer> CusList) {
		// 取得总人数
		int CusSize = CusList.size();   //客户总人数
		List<UserCustomer> listUser = new ArrayList<UserCustomer>();
			//开始分配
			for (int i = 0; i < CusSize; i++) {
				paixu(UserList);
				UserCustomer cusUser=new UserCustomer();
				cusUser.setUserID(UserList.get(0).getUser_id());
				cusUser.setCusId(CusList.get(i).getCustomer_no());
				listUser.add(cusUser);
				UserList.get(0).setCustomer_num(UserList.get(0).getCustomer_num()+1);
			}
			return listUser;
	}
	
	public static void paixu(List<User> UserList) {
		Collections.sort(UserList, new Comparator<User>() {
			@Override
			public int compare(User o1, User o2) {
				
				if(o1.getCustomer_num()>o2.getCustomer_num()){
	                return 1;
	            }else if(o1.getCustomer_num()<o2.getCustomer_num()){
	                return -1;
	            }else if(o1.getCustomer_num()==o2.getCustomer_num()) {
	            	if(o1.getUser_weight()>o2.getUser_weight()) {
	            		return -1;
	            	}
	            }
	            return 0;
			}
		});
	}

}
