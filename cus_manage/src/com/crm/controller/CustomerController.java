package com.crm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.pojo.BarchartOne;
import com.crm.service.CustomerService;

@Controller
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(value="/selectCustomerByJiaotimeAndCount",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> selectCustomerByJiaotimeAndCount(){
		Map<String,Object> map=new HashMap<>();
		List<BarchartOne> selectCustomerByJiaotimeAndCount = customerService.selectCustomerByJiaotimeAndCount(3);
		System.out.println("条形图数据："+selectCustomerByJiaotimeAndCount);
		Integer[] data=new Integer[selectCustomerByJiaotimeAndCount.size()];
		String categories[] = new String[selectCustomerByJiaotimeAndCount.size()];
		for(int i=0;i<selectCustomerByJiaotimeAndCount.size();i++) {
			data[i]=selectCustomerByJiaotimeAndCount.get(i).getCount();
			categories[i]=selectCustomerByJiaotimeAndCount.get(i).getYuefen();
		}
		map.put("data", data);
		map.put("categories", categories);
		return map;
	}
}
