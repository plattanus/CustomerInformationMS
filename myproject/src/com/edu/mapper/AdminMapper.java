package com.edu.mapper;

import java.util.List;

import com.edu.entity.Admin;

public interface AdminMapper {

	public List<Admin> SelectAllAdmins();

	public List<Admin> SelectAdminsByParam(Admin ad);

	public int InsertAdmin(Admin ad);

	public int UpdateAdmin(Admin ad);

	public int DeleteAdmin(int adid);

	public Admin SelectAdminById(int adid);

}
