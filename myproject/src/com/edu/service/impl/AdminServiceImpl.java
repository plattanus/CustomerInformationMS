package com.edu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.entity.Admin;
import com.edu.mapper.AdminMapper;
import com.edu.service.AdminService;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public List<Admin> SelectAllAdmins() {
		// TODO Auto-generated method stub
		return adminMapper.SelectAllAdmins();
	}

	@Override
	public List<Admin> SelectAdminsByParam(Admin ad) {
		// TODO Auto-generated method stub
		return adminMapper.SelectAdminsByParam(ad);
	}

	@Override
	public int InsertAdmin(Admin ad) {
		// TODO Auto-generated method stub
		return adminMapper.InsertAdmin(ad);
	}

	@Override
	public int UpdateAdmin(Admin ad) {
		// TODO Auto-generated method stub
		return adminMapper.UpdateAdmin(ad);
	}

	@Override
	public int DeleteAdmin(int adid) {
		// TODO Auto-generated method stub
		return adminMapper.DeleteAdmin(adid);
	}

	@Override
	public Admin SelectAdminById(int adid) {
		// TODO Auto-generated method stub
		return adminMapper.SelectAdminById(adid);
	}

}
