package com.edu.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edu.entity.Admin;
import com.edu.entity.Customer;
import com.edu.service.AdminService;
import com.edu.service.CustomerService;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(value = "/login")
	public ModelAndView myLogin(ModelAndView mv) {
		mv.setViewName("login");
		return mv;
	}
	@RequestMapping(value = "/register")
	public ModelAndView myRegister(ModelAndView mv) {
		mv.setViewName("register");
		return mv;
	}
	@RequestMapping(value = "/main")
	public ModelAndView myMain(ModelAndView mv) {
		mv.setViewName("main");
		return mv;
	}
	@RequestMapping(value = "/adinformation")
	public ModelAndView myIdinformation(ModelAndView mv) {
		List<Admin> admins=adminService.SelectAllAdmins();
		for(Admin admin: admins) {
			if(admin.getAdstatus().equals("1")) {
				mv.addObject("admin", admin);
				mv.setViewName("customer");
				break;
			}
		}
		mv.setViewName("information");
		return mv;
	}
	
	@RequestMapping(value = "/adminlogin")
	public ModelAndView adminLogin(@RequestParam("adname") String adname, @RequestParam("adpassword") String adpassword, ModelAndView mv) {
		List<Admin> admins=adminService.SelectAllAdmins();
		boolean checkok=false;
		for(Admin admin: admins) {
			Admin ad = new Admin();
			ad.setAdid(admin.getAdid());
			ad.setAdstatus("0");
			adminService.UpdateAdmin(ad);
		}
		for(Admin admin: admins) {
			if(admin.getAdname().equals(adname)&&admin.getAdpassword().equals(adpassword)) {
				Admin ad = new Admin();
				ad.setAdid(admin.getAdid());
				ad.setAdstatus("1");
				adminService.UpdateAdmin(ad);
				checkok=true;
			}
		}
		if(checkok==true) {
			List<Customer> customers = customerService.SelectAllCustomers();
			mv.addObject("customers", customers);
			mv.setViewName("customer");
		}
		else {
			mv.setViewName("login");
		}
		return mv;
	}
	
	@RequestMapping(value = "/adminregister")
	public ModelAndView adminRegister(@RequestParam("adid") int adid, @RequestParam("adname") String adname, @RequestParam("adpassword") String adpassword, ModelAndView mv) {
		Admin ad=new Admin();
		ad.setAdname(adname);
		ad.setAdpassword(adpassword);
		ad.setAdid(adid);
		ad.setAdstatus("0");
		adminService.InsertAdmin(ad);
		mv.setViewName("login");
		return mv;
	}
}
