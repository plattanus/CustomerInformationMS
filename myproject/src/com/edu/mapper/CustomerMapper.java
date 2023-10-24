package com.edu.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.edu.entity.Customer;

public interface CustomerMapper {

	public List<Customer> SelectAllCustomers();

	public List<Customer> SelectCustomersByParam(Customer cus);

	public List<Customer> SelectCustomersByParam2(@Param("ulabel")String ulabel, @Param("utype")String utype, @Param("nexttimebg")Date nexttimebg, @Param("nexttimeed")Date nexttimeed, @Param("personcharge")String personcharge);
	
	public List<Customer> SelectCustomersByParam3(@Param("ulabel")String ulabel, @Param("utype")String utype, @Param("createtimebg")Date createtimebg, @Param("createtimeed")Date createtimeed, @Param("allocatetimebg")Date allocatetimebg, @Param("allocatetimeed")Date allocatetimeed, @Param("nexttimebg")Date nexttimebg, @Param("nexttimeed")Date nexttimeed,  @Param("lasttimebg")Date lasttimebg, @Param("lasttimeed")Date lasttimeed);
	
	public int InsertCustomer(Customer cus);

	public int UpdateCustomer(Customer cus);

	public int DeleteCustomer(int uno);

	public Customer SelectCustomerById(int uno);
	
}
