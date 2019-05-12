package com.crm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.pojo.FenYe;
import com.crm.service.ManagerService;
@Controller
public class ManagerController {
	@Autowired
	private ManagerService managerService;
	@Autowired
	private FenYe fenye;
	
	@RequestMapping(value="selectManager",method=RequestMethod.POST)
	@ResponseBody
	public FenYe selectManager(int page,int rows) {
		
		fenye.setPage((page-1)*rows);
		fenye.setRow(rows);
		return managerService.selectManager(fenye);
		
		
		
	}

}
