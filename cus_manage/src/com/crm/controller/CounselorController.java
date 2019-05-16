package com.crm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.pojo.Customer;
import com.crm.pojo.FenYe;
import com.crm.service.CounselorService;



@Controller
public class CounselorController {
	@Autowired
	private CounselorService counselorService;
	@Autowired
	private FenYe fenye;
	
	@RequestMapping(value="selectCounselor",method=RequestMethod.POST)
	@ResponseBody
	public FenYe selectCounselor(int page,int rows,FenYe fenye) {
		
		fenye.setPage((page-1)*rows);
		fenye.setRow(rows);
		return counselorService.selectCounselor(fenye);
		
		
		
	}
	/**
	 * ������޸�
	 * @param customer
	 * @return
	 */
	@RequestMapping(value = "UpdateCounselor")
	@ResponseBody
	public int UpdateStu(Customer customer) {
		
		return counselorService.updateCustomer(customer);
	}
	
	@RequestMapping(value="/CounselorList")
	
	public String CounselorList() {
		
		return "CounselorList";
	}
	
    @RequestMapping(value="/access_record")
	
	public String access_record() {
		
		return "access_record";
	}
	
    @RequestMapping(value="/getCustomer1",method=RequestMethod.GET)
    public String getCustomer1() {
    	return "CounselorList";
    }
	


}
