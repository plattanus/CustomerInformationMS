package com.edu.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Customer {

	private int uno;
	private String uname; // 客户名称
	private String ulabel; // 标签
	private String personcharge; // 负责人
	private String utype; // 客户类型
	private String uprovince; // 省份
	private String ucity; // 城市
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date nexttime; // 下次联系时间
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createtime; // 创建时间
	private String ufounder; // 创建人
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date allocatetime; // 客户分配时间
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date lasttime; // 最后联系时间
	private String lastperson; // 最后联系人
	private String umobile; // 手机
	private String ulandline; // 座机
	private String umailbox; // 邮箱
	private String uqq; // QQ
	private String uwebsite; // 官网
	private String uaddress; // 地址
	private String uintroduction; // 简介

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUlabel() {
		return ulabel;
	}

	public void setUlabel(String ulabel) {
		this.ulabel = ulabel;
	}

	public String getPersoncharge() {
		return personcharge;
	}

	public void setPersoncharge(String personcharge) {
		this.personcharge = personcharge;
	}

	public String getUtype() {
		return utype;
	}

	public void setUtype(String utype) {
		this.utype = utype;
	}

	public String getUprovince() {
		return uprovince;
	}

	public void setUprovince(String uprovince) {
		this.uprovince = uprovince;
	}

	public String getUcity() {
		return ucity;
	}

	public void setUcity(String ucity) {
		this.ucity = ucity;
	}

	@DateTimeFormat(pattern="yyyy-MM-dd")
	public Date getNexttime() {
		return nexttime;
	}

	public void setNexttime(Date nexttime) {
		this.nexttime = nexttime;
	}

	@DateTimeFormat(pattern="yyyy-MM-dd")
	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public String getUfounder() {
		return ufounder;
	}

	public void setUfounder(String ufounder) {
		this.ufounder = ufounder;
	}

	@DateTimeFormat(pattern="yyyy-MM-dd")
	public Date getAllocatetime() {
		return allocatetime;
	}

	public void setAllocatetime(Date allocatetime) {
		this.allocatetime = allocatetime;
	}

	@DateTimeFormat(pattern="yyyy-MM-dd")
	public Date getLasttime() {
		return lasttime;
	}

	public void setLasttime(Date lasttime) {
		this.lasttime = lasttime;
	}

	public String getLastperson() {
		return lastperson;
	}

	public void setLastperson(String lastperson) {
		this.lastperson = lastperson;
	}

	public String getUmobile() {
		return umobile;
	}

	public void setUmobile(String umobile) {
		this.umobile = umobile;
	}

	public String getUlandline() {
		return ulandline;
	}

	public void setUlandline(String ulandline) {
		this.ulandline = ulandline;
	}

	public String getUmailbox() {
		return umailbox;
	}

	public void setUmailbox(String umailbox) {
		this.umailbox = umailbox;
	}

	public String getUqq() {
		return uqq;
	}

	public void setUqq(String uqq) {
		this.uqq = uqq;
	}

	public String getUwebsite() {
		return uwebsite;
	}

	public void setUwebsite(String uwebsite) {
		this.uwebsite = uwebsite;
	}

	public String getUaddress() {
		return uaddress;
	}

	public void setUaddress(String uaddress) {
		this.uaddress = uaddress;
	}

	public String getUintroduction() {
		return uintroduction;
	}

	public void setUintroduction(String uintroduction) {
		this.uintroduction = uintroduction;
	}

}
