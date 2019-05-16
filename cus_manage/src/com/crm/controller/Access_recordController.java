package com.crm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.pojo.Access_record;
import com.crm.pojo.Customer;
import com.crm.pojo.FenYe;
import com.crm.service.Access_recordService;
import com.crm.service.CounselorService;


@Controller
public class Access_recordController {
@Autowired

private Access_recordService access_recordService;

private CounselorService counselorService;
@Autowired
private FenYe fenYe;


@RequestMapping(value="showAccess_record",method=RequestMethod.POST )
@ResponseBody
public FenYe showAccess_record (int page,int rows,FenYe fenYe) {
	
	fenYe.setPage((page-1)*rows);
	fenYe.setRow(rows);

	return access_recordService.selectrecord(fenYe);
	
}
@RequestMapping(value = "/insert", method = RequestMethod.POST)
@ResponseBody
public int insert(Access_record access_record,Customer customer) {

	System.out.println("this is ���"+access_recordService.insertAccess_record(access_record));
	
	

	 int a=   access_recordService.updateCustomer_view(customer);
	return access_recordService.insertAccess_record(access_record);
}

@RequestMapping(value="/getCustomer2",method=RequestMethod.GET)
public String getSigninorback() {
	return "access_record";
}

}
