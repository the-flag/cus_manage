package com.crm.controller;


import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.pojo.BarchartOne;
import com.crm.pojo.PiechartOne;
import com.crm.pojo.PiechartOneSelect;
import com.crm.service.CustomerService;
import com.crm.service.UserService;


@Controller
public class HomeController {
	
	@Autowired
	private CustomerService customerService;
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/getHome",method=RequestMethod.GET)
	public String getHome() {
		return "home";
		
	}
	
	
	/**
	 * 跳转咨询经理--统计图管理
	 * @return
	 */
	@RequestMapping(value="/getConsultingManager",method=RequestMethod.GET)
	public String getConsultingManager() {
		return "consultingmanager";
		
	}
	
	/**
	 * 跳转咨询师--统计图管理
	 * @return
	 */
	@RequestMapping(value="/getConsulting",method=RequestMethod.GET)
	public String getConsulting() {
		return "consultant";
		
	}
	
	/**
	 * 跳转网络咨询师--统计图管理
	 * @return
	 */
	@RequestMapping(value="/getNetworkConsultant",method=RequestMethod.GET)
	public String getNetworkConsultant() {
		return "networkconsultant";
		
	}
	
	
	
	
	
	
	
	@RequestMapping(value="/selectCustomerByJiaotimeAndCount",method=RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> selectCustomerByJiaotimeAndCount(){
		Map<String,Object> map=new HashMap<>();
		List<Map<String, Object>> selectCustomerByJiaotimeAndCount = customerService.selectCustomerByJiaotimeAndCount(3);
		
		/*System.out.println("条形图数据："+selectCustomerByJiaotimeAndCount);
		Integer[] data=new Integer[selectCustomerByJiaotimeAndCount.size()];
		String categories[] = new String[selectCustomerByJiaotimeAndCount.size()];
		for(int i=0;i<selectCustomerByJiaotimeAndCount.size();i++) {
			data[i]=selectCustomerByJiaotimeAndCount.get(i).getCount();
			categories[i]=selectCustomerByJiaotimeAndCount.get(i).getYuefen();
		}
		map.put("data", data);
		*/
		
		/*map.put("categories", categories);*/
		return selectCustomerByJiaotimeAndCount;
	}
	
	
	
	@RequestMapping(value="/selectCustomerAndUserCount",method=RequestMethod.POST)
	@ResponseBody
	public List<PiechartOne> selectCustomerAndUserCount(){
		Integer selectCustomerByRoleId = customerService.selectCustomerByRoleId(3);
		Integer selecctUserCountByRoleId = userService.selecctUserCountByRoleId(3);
		List<PiechartOne> data=new ArrayList<>();
		PiechartOne one=new PiechartOne();
		one.setName("客户");
		one.setValue(selectCustomerByRoleId);
		PiechartOne one1=new PiechartOne();
		one1.setName("咨询师");
		one1.setValue(selecctUserCountByRoleId);
		data.add(one);
		data.add(one1);
		
		return data;
	}
	
	
	@RequestMapping(value="/selectUserByUserLoginTime",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectUserByUserLoginTime(){
		Map<String,Object> map=new HashMap<>();
		Map<String,Boolean> select=new HashMap<>();
		
		Integer selectUserByUserLoginTimeAndQiandao = userService.selectUserByUserLoginTimeAndQiandao(); //签到
		Integer selectUserByUserLoginTimeAndChidao = userService.selectUserByUserLoginTimeAndChidao(); //迟到
		Integer selectUserByUserLoginTimeAndWeiqian = userService.selectUserByUserLoginTimeAndWeiqian(); //未签到
		List<PiechartOne> data=new ArrayList<>(); //数据
		select.put("签到", true);
		select.put("未签到", true);
		PiechartOne one1=new PiechartOne();
		one1.setName("签到");
		one1.setValue(selectUserByUserLoginTimeAndQiandao);
		PiechartOne one2=new PiechartOne();
		one2.setName("未签到");
		one2.setValue(selectUserByUserLoginTimeAndWeiqian);
		PiechartOne one3=new PiechartOne();
		one3.setName("迟到");
		one3.setValue(selectUserByUserLoginTimeAndChidao);
		data.add(one1);
		data.add(one2);
		data.add(one3);
		String[] legendData=new String[3];
		legendData[0]="签到";
		legendData[1]="未签到";
		legendData[2]="迟到";
		map.put("selected", select);
		map.put("seriesData", data);
		map.put("legendData", legendData);
		return map;
	}
}
