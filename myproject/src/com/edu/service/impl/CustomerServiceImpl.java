package com.edu.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.entity.Customer;
import com.edu.mapper.CustomerMapper;
import com.edu.service.CustomerService;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerMapper customerMapper;

	@Override
	public List<Customer> SelectAllCustomers() {
		// TODO Auto-generated method stub
		return customerMapper.SelectAllCustomers();
	}

	@Override
	public List<Customer> SelectCustomersByParam(Customer cus) {
		// TODO Auto-generated method stub
		return customerMapper.SelectCustomersByParam(cus);
	}

	@Override
	public List<Customer> SelectCustomersByParam2(@Param("ulabel")String ulabel, @Param("utype")String utype, @Param("nexttimebg")Date nexttimebg, @Param("nexttimeed")Date nexttimeed, @Param("personcharge")String personcharge) {
		// TODO Auto-generated method stub
		return customerMapper.SelectCustomersByParam2(ulabel, utype, nexttimebg, nexttimeed, personcharge);
	}
	
	@Override
	public List<Customer> SelectCustomersByParam3(@Param("ulabel")String ulabel, @Param("utype")String utype, @Param("createtimebg")Date createtimebg, @Param("createtimeed")Date createtimeed, @Param("allocatetimebg")Date allocatetimebg, @Param("allocatetimeed")Date allocatetimeed, @Param("nexttimebg")Date nexttimebg, @Param("nexttimeed")Date nexttimeed,  @Param("lasttimebg")Date lasttimebg, @Param("lasttimeed")Date lasttimeed) {
		// TODO Auto-generated method stub
		return customerMapper.SelectCustomersByParam3(ulabel, utype, createtimebg, createtimeed, allocatetimebg, allocatetimeed, nexttimebg, nexttimeed, lasttimebg, lasttimeed);
	}
	
	@Override
	public int InsertCustomer(Customer cus) {
		// TODO Auto-generated method stub
		return customerMapper.InsertCustomer(cus);
	}

	@Override
	public int UpdateCustomer(Customer cus) {
		// TODO Auto-generated method stub
		return customerMapper.UpdateCustomer(cus);
	}

	@Override
	public int DeleteCustomer(int uno) {
		// TODO Auto-generated method stub
		return customerMapper.DeleteCustomer(uno);
	}

	@Override
	public Customer SelectCustomerById(int uno) {
		// TODO Auto-generated method stub
		return customerMapper.SelectCustomerById(uno);
	}

}
