package com.edu.controller;

import java.text.Collator;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
@RequestMapping(value = "/customer")
public class CustomerController {

	@Autowired
	private CustomerService customerService;
	@Autowired
	private AdminService adminService;

	//排序
	@RequestMapping(value = "/mycustomersort")
	public ModelAndView customerListSort(@RequestParam("mybook") String mybook, ModelAndView mv) {
		List<Customer> customers = customerService.SelectAllCustomers();
		mv.addObject("customers", customers);
		if (mybook.equals("customerName")) {
			Collections.sort(customers, new Comparator<Customer>() {
				@Override
				public int compare(Customer o1, Customer o2) {
					if (o1 == null || o2 == null) {
						return -1;
					}
					if (o1.getUname().length() > o2.getUname().length()) {
						return 1;
					}
					if (o1.getUname().length() < o2.getUname().length()) {
						return -1;
					}
					if (o1.getUname().compareTo(o2.getUname()) > 0) {
						return 1;
					}
					if (o1.getUname().compareTo(o2.getUname()) < 0) {
						return -1;
					}
					if (o1.getUname().compareTo(o2.getUname()) == 0) {
						return 0;
					}
					return 0;
				}
			});
		} else if (mybook.equals("ownerUser")) {
			Collections.sort(customers, new Comparator<Customer>() {
				@Override
				public int compare(Customer o1, Customer o2) {
					if (o1 == null || o2 == null) {
						return -1;
					}
					if (o1.getPersoncharge().length() > o2.getPersoncharge().length()) {
						return 1;
					}
					if (o1.getPersoncharge().length() < o2.getPersoncharge().length()) {
						return -1;
					}
					if (o1.getPersoncharge().compareTo(o2.getPersoncharge()) > 0) {
						return 1;
					}
					if (o1.getPersoncharge().compareTo(o2.getPersoncharge()) < 0) {
						return -1;
					}
					if (o1.getPersoncharge().compareTo(o2.getPersoncharge()) == 0) {
						return 0;
					}
					return 0;
				}
			});
		} else if (mybook.equals("category")) {
			Collections.sort(customers, new Comparator<Customer>() {
				@Override
				public int compare(Customer o1, Customer o2) {
					if (o1 == null || o2 == null) {
						return -1;
					}
					if (o1.getUtype().length() > o2.getUtype().length()) {
						return 1;
					}
					if (o1.getUtype().length() < o2.getUtype().length()) {
						return -1;
					}
					if (o1.getUtype().compareTo(o2.getUtype()) > 0) {
						return 1;
					}
					if (o1.getUtype().compareTo(o2.getUtype()) < 0) {
						return -1;
					}
					if (o1.getUtype().compareTo(o2.getUtype()) == 0) {
						return 0;
					}
					return 0;
				}
			});
		} else if (mybook.equals("province")) {
			Collections.sort(customers, new Comparator<Customer>() {
				@Override
				public int compare(Customer o1, Customer o2) {
					Collator instance = Collator.getInstance(Locale.CHINA);
					return instance.compare(o1.getUprovince(), o2.getUprovince());
				}
			});
		} else if (mybook.equals("city")) {
			Collections.sort(customers, new Comparator<Customer>() {
				@Override
				public int compare(Customer o1, Customer o2) {
					Collator instance = Collator.getInstance(Locale.CHINA);
					return instance.compare(o1.getUcity(), o2.getUcity());
				}
			});
		} else if (mybook.equals("nextContactDate")) {
			Collections.sort(customers, new Comparator<Customer>() {
				@Override
				public int compare(Customer o1, Customer o2) {
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					try {
						Date dt1 = format.parse(format.format(o1.getNexttime()));
						Date dt2 = format.parse(format.format(o2.getNexttime()));
						if (dt1.getTime() < dt2.getTime()) {
							return 1;
						} else if (dt1.getTime() > dt2.getTime()) {
							return -1;
						} else {
							return 0;
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					return 0;
				}
			});
		} else if (mybook.equals("createDate")) {
			Collections.sort(customers, new Comparator<Customer>() {
				@Override
				public int compare(Customer o1, Customer o2) {
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					try {
						Date dt1 = format.parse(format.format(o1.getCreatetime()));
						Date dt2 = format.parse(format.format(o2.getCreatetime()));
						if (dt1.getTime() < dt2.getTime()) {
							return 1;
						} else if (dt1.getTime() > dt2.getTime()) {
							return -1;
						} else {
							return 0;
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					return 0;
				}
			});
		} else if (mybook.equals("createUser")) {
			Collections.sort(customers, new Comparator<Customer>() {
				@Override
				public int compare(Customer o1, Customer o2) {
					if (o1 == null || o2 == null) {
						return -1;
					}
					if (o1.getUfounder().length() > o2.getUfounder().length()) {
						return 1;
					}
					if (o1.getUfounder().length() < o2.getUfounder().length()) {
						return -1;
					}
					if (o1.getUfounder().compareTo(o2.getUfounder()) > 0) {
						return 1;
					}
					if (o1.getUfounder().compareTo(o2.getUfounder()) < 0) {
						return -1;
					}
					if (o1.getUfounder().compareTo(o2.getUfounder()) == 0) {
						return 0;
					}
					return 0;
				}
			});
		} else if (mybook.equals("assignDate")) {
			Collections.sort(customers, new Comparator<Customer>() {
				@Override
				public int compare(Customer o1, Customer o2) {
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					try {
						Date dt1 = format.parse(format.format(o1.getAllocatetime()));
						Date dt2 = format.parse(format.format(o2.getAllocatetime()));
						if (dt1.getTime() < dt2.getTime()) {
							return 1;
						} else if (dt1.getTime() > dt2.getTime()) {
							return -1;
						} else {
							return 0;
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					return 0;
				}
			});
		} else if (mybook.equals("lastContactDate")) {
			Collections.sort(customers, new Comparator<Customer>() {
				@Override
				public int compare(Customer o1, Customer o2) {
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					try {
						Date dt1 = format.parse(format.format(o1.getLasttime()));
						Date dt2 = format.parse(format.format(o2.getLasttime()));
						if (dt1.getTime() < dt2.getTime()) {
							return 1;
						} else if (dt1.getTime() > dt2.getTime()) {
							return -1;
						} else {
							return 0;
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					return 0;
				}
			});
		} else if (mybook.equals("lastContactUser")) {
			Collections.sort(customers, new Comparator<Customer>() {
				@Override
				public int compare(Customer o1, Customer o2) {
					if (o1 == null || o2 == null) {
						return -1;
					}
					if (o1.getLastperson().length() > o2.getLastperson().length()) {
						return 1;
					}
					if (o1.getLastperson().length() < o2.getLastperson().length()) {
						return -1;
					}
					if (o1.getLastperson().compareTo(o2.getLastperson()) > 0) {
						return 1;
					}
					if (o1.getLastperson().compareTo(o2.getLastperson()) < 0) {
						return -1;
					}
					if (o1.getLastperson().compareTo(o2.getLastperson()) == 0) {
						return 0;
					}
					return 0;
				}
			});
		} else if (mybook.equals("mobilePhone")) {
			Collections.sort(customers, new Comparator<Customer>() {
				@Override
				public int compare(Customer o1, Customer o2) {
					if (o1 == null || o2 == null) {
						return -1;
					}
					if (o1.getUmobile().length() > o2.getUmobile().length()) {
						return 1;
					}
					if (o1.getUmobile().length() < o2.getUmobile().length()) {
						return -1;
					}
					if (o1.getUmobile().compareTo(o2.getUmobile()) > 0) {
						return 1;
					}
					if (o1.getUmobile().compareTo(o2.getUmobile()) < 0) {
						return -1;
					}
					if (o1.getUmobile().compareTo(o2.getUmobile()) == 0) {
						return 0;
					}
					return 0;
				}
			});
		} else if (mybook.equals("customerLandline")) {
			Collections.sort(customers, new Comparator<Customer>() {
				@Override
				public int compare(Customer o1, Customer o2) {
					if (o1 == null || o2 == null) {
						return -1;
					}
					if (o1.getUlandline().length() > o2.getUlandline().length()) {
						return 1;
					}
					if (o1.getUlandline().length() < o2.getUlandline().length()) {
						return -1;
					}
					if (o1.getUlandline().compareTo(o2.getUlandline()) > 0) {
						return 1;
					}
					if (o1.getUlandline().compareTo(o2.getUlandline()) < 0) {
						return -1;
					}
					if (o1.getUlandline().compareTo(o2.getUlandline()) == 0) {
						return 0;
					}
					return 0;
				}
			});
		} else if (mybook.equals("customerMailbox")) {
			Collections.sort(customers, new Comparator<Customer>() {
				@Override
				public int compare(Customer o1, Customer o2) {
					if (o1 == null || o2 == null) {
						return -1;
					}
					if (o1.getUmailbox().length() > o2.getUmailbox().length()) {
						return 1;
					}
					if (o1.getUmailbox().length() < o2.getUmailbox().length()) {
						return -1;
					}
					if (o1.getUmailbox().compareTo(o2.getUmailbox()) > 0) {
						return 1;
					}
					if (o1.getUmailbox().compareTo(o2.getUmailbox()) < 0) {
						return -1;
					}
					if (o1.getUmailbox().compareTo(o2.getUmailbox()) == 0) {
						return 0;
					}
					return 0;
				}
			});
		} else if (mybook.equals("customerQQ")) {
			Collections.sort(customers, new Comparator<Customer>() {
				@Override
				public int compare(Customer o1, Customer o2) {
					if (o1 == null || o2 == null) {
						return -1;
					}
					if (o1.getUqq().length() > o2.getUqq().length()) {
						return 1;
					}
					if (o1.getUqq().length() < o2.getUqq().length()) {
						return -1;
					}
					if (o1.getUqq().compareTo(o2.getUqq()) > 0) {
						return 1;
					}
					if (o1.getUqq().compareTo(o2.getUqq()) < 0) {
						return -1;
					}
					if (o1.getUqq().compareTo(o2.getUqq()) == 0) {
						return 0;
					}
					return 0;
				}
			});
		} else if (mybook.equals("customerWebsite")) {
			Collections.sort(customers, new Comparator<Customer>() {
				@Override
				public int compare(Customer o1, Customer o2) {
					if (o1 == null || o2 == null) {
						return -1;
					}
					if (o1.getUwebsite().length() > o2.getUwebsite().length()) {
						return 1;
					}
					if (o1.getUwebsite().length() < o2.getUwebsite().length()) {
						return -1;
					}
					if (o1.getUwebsite().compareTo(o2.getUwebsite()) > 0) {
						return 1;
					}
					if (o1.getUwebsite().compareTo(o2.getUwebsite()) < 0) {
						return -1;
					}
					if (o1.getUwebsite().compareTo(o2.getUwebsite()) == 0) {
						return 0;
					}
					return 0;
				}
			});
		} else if (mybook.equals("customerAddress")) {
			Collections.sort(customers, new Comparator<Customer>() {
				@Override
				public int compare(Customer o1, Customer o2) {
					if (o1 == null || o2 == null) {
						return -1;
					}
					if (o1.getUaddress().length() > o2.getUaddress().length()) {
						return 1;
					}
					if (o1.getUaddress().length() < o2.getUaddress().length()) {
						return -1;
					}
					if (o1.getUaddress().compareTo(o2.getUaddress()) > 0) {
						return 1;
					}
					if (o1.getUaddress().compareTo(o2.getUaddress()) < 0) {
						return -1;
					}
					if (o1.getUaddress().compareTo(o2.getUaddress()) == 0) {
						return 0;
					}
					return 0;
				}
			});
		} else if (mybook.equals("customerIntroduction")) {
			Collections.sort(customers, new Comparator<Customer>() {
				@Override
				public int compare(Customer o1, Customer o2) {
					if (o1 == null || o2 == null) {
						return -1;
					}
					if (o1.getUintroduction().length() > o2.getUintroduction().length()) {
						return 1;
					}
					if (o1.getUintroduction().length() < o2.getUintroduction().length()) {
						return -1;
					}
					if (o1.getUintroduction().compareTo(o2.getUintroduction()) > 0) {
						return 1;
					}
					if (o1.getUintroduction().compareTo(o2.getUintroduction()) < 0) {
						return -1;
					}
					if (o1.getUintroduction().compareTo(o2.getUintroduction()) == 0) {
						return 0;
					}
					return 0;
				}
			});
		}
		mv.setViewName("customer");
		return mv;
	}

	@RequestMapping(value = "/customerList")
	public ModelAndView customerList(ModelAndView mv) {
		List<Customer> customers = customerService.SelectAllCustomers();
		mv.addObject("customers", customers);
		mv.setViewName("customer");
		return mv;
	}

	//页数
	@RequestMapping(value = "/customerList2")
	public ModelAndView customerList2(@RequestParam("mypagesize") String mypagesize, ModelAndView mv) {
		int intmypagesize = Integer.parseInt(mypagesize);
		intmypagesize = intmypagesize - 1;
		List<Customer> customers = customerService.SelectAllCustomers();
		if (intmypagesize < 0)
			intmypagesize = customers.size();
		List<Customer> customers2 = new ArrayList<Customer>();
		int i = 0;
		for (Customer cus : customers) {
			customers2.add(cus);
			i++;
			if (i > intmypagesize)
				break;
		}
		mv.addObject("customers", customers2);
		mv.setViewName("customer");
		return mv;
	}

	//大标题
	@RequestMapping(value = "/customerList3")
	public ModelAndView customerList3(@RequestParam("mymode") String mymode, ModelAndView mv) {
		List<Customer> customers = customerService.SelectAllCustomers();
		List<Customer> customers2 = new ArrayList<Customer>();
		List<Admin> admins = adminService.SelectAllAdmins();
		String nowperson = "";
		for (Admin admin : admins) {
			if (admin.getAdstatus().equals("1")) {
				nowperson = admin.getAdname();
				break;
			}
		}
		if (mymode.equals("1")) {
			for (Customer cus : customers) {
				if (cus.getPersoncharge().equals(nowperson))
					customers2.add(cus);
			}
		} else if (mymode.equals("2")) {
			for (Customer cus : customers) {
				String[] arr = cus.getUintroduction().split("\\s+");
				if(arr.length<2)
					continue;
				if (arr[1].equals(nowperson))
					customers2.add(cus);
			}
		} else if (mymode.equals("3")) {
			for (Customer cus : customers) {
				String[] arr = cus.getUintroduction().split("\\s+");
				if (arr[0].equals(nowperson))
					customers2.add(cus);
			}
		}
		mv.addObject("customers", customers2);
		mv.addObject("mymode", mymode);
		mv.setViewName("customer");
		return mv;
	}

	//检索
	@RequestMapping(value = "/tosearch")
	public ModelAndView allcustomerSearchedList(@RequestParam("checktype") String checktype,
			@RequestParam("checkvalue") String checkvalue, ModelAndView mv) {
//		System.out.println(checktype+"===="+checkvalue);
		Customer cus = new Customer();
		cus.setUname("null!");
		cus.setUprovince("null!");
		cus.setUcity("null!");
		cus.setUmobile("null!");
		cus.setUlandline("null!");
		cus.setUmailbox("null!");
		cus.setUqq("null!");
		cus.setUwebsite("null!");
		cus.setUaddress("null!");
		cus.setUintroduction("null!");
		if (checktype.equals("uname"))
			cus.setUname(checkvalue);
		else if (checktype.equals("uprovince"))
			cus.setUprovince(checkvalue);
		else if (checktype.equals("ucity"))
			cus.setUcity(checkvalue);
		else if (checktype.equals("umobile"))
			cus.setUmobile(checkvalue);
		else if (checktype.equals("ulandline"))
			cus.setUlandline(checkvalue);
		else if (checktype.equals("umailbox"))
			cus.setUmailbox(checkvalue);
		else if (checktype.equals("uqq"))
			cus.setUqq(checkvalue);
		else if (checktype.equals("uwebsite"))
			cus.setUwebsite(checkvalue);
		else if (checktype.equals("uaddress"))
			cus.setUaddress(checkvalue);
		else if (checktype.equals("uintroduction"))
			cus.setUintroduction(checkvalue);
		List<Customer> customers = customerService.SelectCustomersByParam(cus);
		mv.addObject("customers", customers);
		mv.setViewName("customer");
		return mv;
	}

	//精简搜索
	@RequestMapping(value = "/toallsearch")
	public ModelAndView allcustomerSearchedList2(@RequestParam("ulabel") String ulabel,
			@RequestParam("utype") String utype, @RequestParam("nexttimebg") String nexttimebg,
			@RequestParam("nexttimeed") String nexttimeed, @RequestParam("personcharge") String personcharge, ModelAndView mv) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date datenexttimebg = new Date();
		Date datenexttimeed = new Date();
		try {
			datenexttimebg = formatter.parse(nexttimebg);
			datenexttimeed = formatter.parse(nexttimeed);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		System.out.println(ulabel+" "+utype+" "+nexttimebg+" "+nexttimeed+" "+ufounder);
		List<Customer> customers = customerService.SelectCustomersByParam2(ulabel, utype, datenexttimebg,
				datenexttimeed, personcharge);
		mv.addObject("customers", customers);
		mv.setViewName("customer");
		return mv;
	}

	//高级搜索
	@RequestMapping(value = "/toallsearch2")
	public ModelAndView allcustomerSearchedList3(@RequestParam("ulabel") String ulabel,
			@RequestParam("utype") String utype, @RequestParam("createtimebg") String createtimebg,
			@RequestParam("createtimeed") String createtimeed, @RequestParam("allocatetimebg") String allocatetimebg,
			@RequestParam("allocatetimeed") String allocatetimeed, @RequestParam("nexttimebg") String nexttimebg,
			@RequestParam("nexttimeed") String nexttimeed, @RequestParam("lasttimebg") String lasttimebg,
			@RequestParam("lasttimeed") String lasttimeed, ModelAndView mv) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date datecreatetimebg = new Date();
		Date datecreatetimeed = new Date();
		Date dateallocatetimebg = new Date();
		Date dateallocatetimeed = new Date();
		Date datenexttimebg = new Date();
		Date datenexttimeed = new Date();
		Date datelasttimebg = new Date();
		Date datelasttimeed = new Date();
		try {
			datecreatetimebg = formatter.parse(createtimebg);
			datecreatetimeed = formatter.parse(createtimeed);
			dateallocatetimebg = formatter.parse(allocatetimebg);
			dateallocatetimeed = formatter.parse(allocatetimeed);
			datenexttimebg = formatter.parse(nexttimebg);
			datenexttimeed = formatter.parse(nexttimeed);
			datelasttimebg = formatter.parse(lasttimebg);
			datelasttimeed = formatter.parse(lasttimeed);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<Customer> customers = customerService.SelectCustomersByParam3(ulabel, utype, datecreatetimebg,
				datecreatetimeed, dateallocatetimebg, dateallocatetimeed, datenexttimebg, datenexttimeed,
				datelasttimebg, datelasttimeed);
		mv.addObject("customers", customers);
		mv.setViewName("customer");
		return mv;
	}

	@RequestMapping(value = "/todelete")
	public ModelAndView deptdelete(@RequestParam("uno") int uno, ModelAndView mv) {
		customerService.DeleteCustomer(uno);
		mv.setViewName("redirect:/customer/customerList");
		return mv;
	}

	//删除
	@RequestMapping("/todeleteBatch") // 对应jsp页面中的deleteBatch()请求
	public ModelAndView deleteBatch(int[] unos, ModelAndView mv) {
		for (int i = 0; i < unos.length; i++) {
			customerService.DeleteCustomer(unos[i]);
		}
		mv.setViewName("redirect:/customer/customerList");
		return mv;
	}

	//转移到公海
	@RequestMapping("/totransfercommon") // 对应jsp页面中的deleteBatch()请求
	public ModelAndView mytransfercommon(int[] unos, ModelAndView mv) {
		for (int i = 0; i < unos.length; i++) {
			Customer cus = customerService.SelectCustomerById(unos[i]);
			if (cus.getUlabel().equals("2"))
				continue;
			cus.setUlabel("2");
			customerService.UpdateCustomer(cus);
		}
		mv.setViewName("redirect:/customer/customerList");
		return mv;
	}

	//转移客户
	@RequestMapping("/totransfer")
	public ModelAndView mytotransfer(int[] unos, @RequestParam("personcharge") String personcharge, ModelAndView mv) {
		String nowperson = "";
		List<Admin> admins = adminService.SelectAllAdmins();
		for (Admin admin : admins) {
			if (admin.getAdstatus().equals("1")) {
				nowperson = admin.getAdname();
				break;
			}
		}
		for (int i = 0; i < unos.length; i++) {
			Customer cus = customerService.SelectCustomerById(unos[i]);
			if(!(cus.getLastperson().equals(nowperson)))
				continue;
			if (cus.getPersoncharge().equals(personcharge))
				continue;
			cus.setPersoncharge(personcharge);
			customerService.UpdateCustomer(cus);
		}
		mv.setViewName("redirect:/customer/customerList");
		return mv;
	}

	//成交与否标签
	@RequestMapping("/tochangelabel")
	public ModelAndView mytochangelabel(int[] unos, @RequestParam("ulabel") String ulabel, ModelAndView mv) {
		for (int i = 0; i < unos.length; i++) {
			Customer cus = customerService.SelectCustomerById(unos[i]);
			if (cus.getUlabel().equals("2"))
				continue;
			if (cus.getUlabel().equals(ulabel))
				continue;
			cus.setUlabel(ulabel);
			customerService.UpdateCustomer(cus);
		}
		mv.setViewName("redirect:/customer/customerList");
		return mv;
	}

	//客户类型等级
	@RequestMapping("/tochangetype")
	public ModelAndView mytochangetype(int[] unos, @RequestParam("utype") String utype, ModelAndView mv) {
		for (int i = 0; i < unos.length; i++) {
			Customer cus = customerService.SelectCustomerById(unos[i]);
			if (cus.getUlabel().equals("2"))
				continue;
			if (cus.getUtype().equals(utype))
				continue;
			cus.setUtype(utype);
			customerService.UpdateCustomer(cus);
		}
		mv.setViewName("redirect:/customer/customerList");
		return mv;
	}

	//设置下次联系时间
	@RequestMapping("/tochangenexttime")
	public ModelAndView mytochangenexttime(int[] unos, @RequestParam("nexttime") String nexttime, ModelAndView mv) {
		for (int i = 0; i < unos.length; i++) {
			Customer cus = customerService.SelectCustomerById(unos[i]);
			if (cus.getUlabel().equals("2"))
				continue;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date mynexttime = null;
			try {
				mynexttime = sdf.parse(nexttime);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (cus.getNexttime().equals(mynexttime))
				continue;
			cus.setNexttime(mynexttime);
			customerService.UpdateCustomer(cus);
		}
		mv.setViewName("redirect:/customer/customerList");
		return mv;
	}

	//共享客户
	@RequestMapping("/tosharecus")
	public ModelAndView mytosharecus(int[] unos, @RequestParam("uintroduction") String uintroduction, ModelAndView mv) {
		String nowperson = "";
		List<Admin> admins = adminService.SelectAllAdmins();
		for (Admin admin : admins) {
			if (admin.getAdstatus().equals("1")) {
				nowperson = admin.getAdname();
				break;
			}
		}
		for (int i = 0; i < unos.length; i++) {
			Customer cus = customerService.SelectCustomerById(unos[i]);
			if (!(cus.getPersoncharge().equals(nowperson)))// 不是当前管理员的客户共享无效
				continue;
			cus.setUintroduction(nowperson + " " + uintroduction);
			customerService.UpdateCustomer(cus);
		}
		mv.setViewName("redirect:/customer/customerList");
		return mv;
	}

	//新增客户
	@RequestMapping(value = "/save")
	public ModelAndView deptsave(@RequestParam("uname") String uname,
			@RequestParam("personcharge") String personcharge, @RequestParam("utype") String utype,
			@RequestParam("uprovince") String uprovince, @RequestParam("ucity") String ucity,
			@RequestParam("umobile") String umobile, @RequestParam("ulandline") String ulandline,
			@RequestParam("umailbox") String umailbox, @RequestParam("uqq") String uqq,
			@RequestParam("uwebsite") String uwebsite, @RequestParam("uaddress") String uaddress,
			@RequestParam("uintroduction") String uintroduction, ModelAndView mv) {
		Customer cus = new Customer();
		cus.setUname("null");
		cus.setPersoncharge("null");
		cus.setUtype("null");
		cus.setUprovince("null");
		cus.setUcity("null");
		cus.setUmobile("null");
		cus.setUlandline("null");
		cus.setUmailbox("null");
		cus.setUqq("null");
		cus.setUwebsite("null");
		cus.setUaddress("null");
		cus.setUintroduction("null");
		
		List<Customer> customers = customerService.SelectAllCustomers();
		int sizelist = customers.size();
		
		cus.setUno(sizelist+1);
		cus.setUname(uname);
		cus.setPersoncharge(personcharge);
		cus.setUtype(utype);
		cus.setUprovince(uprovince);
		cus.setUcity(ucity);
		cus.setUmobile(umobile);
		cus.setUlandline(ulandline);
		cus.setUmailbox(umailbox);
		cus.setUqq(uqq);
		cus.setUwebsite(uwebsite);
		cus.setUaddress(uaddress);
		cus.setUintroduction(uintroduction);

		Date createtime = new Date();
		cus.setUlabel("0");
		cus.setCreatetime(createtime);
		cus.setLastperson("null");

		List<Admin> admins = adminService.SelectAllAdmins();
		for (Admin admin : admins) {
			if (admin.getAdstatus().equals("1")) {
				cus.setUfounder(admin.getAdname());
				break;
			}
		}
		cus.setLasttime(createtime);
		cus.setNexttime(createtime);
		cus.setAllocatetime(createtime);
		customerService.InsertCustomer(cus);
		mv.setViewName("redirect:/customer/customerList");
		return mv;
	}

//	@RequestMapping(value = "/save2")
//	public ModelAndView deptsave2(@RequestParam("uno") int uno, @RequestParam("uname") String uname,
//			@RequestParam("usex") String usex, @RequestParam("uage") String uage, @RequestParam("uorder") String uorder,
//			@RequestParam("uleader") String uleader, @RequestParam("ucity") String ucity,
//			@RequestParam("ulastdate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date ulastdate,
//			@RequestParam("ulable") String ulable, ModelAndView mv) {
//		Customer cus = new Customer();
//		cus.setUno(uno);
//		cus.setUname(uname);
//		cus.setUsex(usex);
//		cus.setUage(uage);
//		cus.setUorder(uorder);
//		cus.setUleader(uleader);
//		cus.setUcity(ucity);
//		cus.setUlastdate(ulastdate);
//		cus.setUlable(ulable);
//		customerService.UpdateCustomer(cus);
//		mv.setViewName("redirect:/customer/customerList");
//		return mv;
//	}

}
