package com.interview.model;

public class User {
	private String Userid;
	private String firstname;
	private String lastname;
	private String password;
	private String confirmpassword;
	private String companyemailid;
	private String oldCompanyemailid;
	private String mobilenumber;
	private String companyname;
	private String city;
	private String registeredtime;
	private String latestupdatedtime;

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		System.out.println("firstname: " + firstname);
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		System.out.println("lastname: " + lastname);
		this.lastname = lastname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		System.out.println("password: " + password);
		this.password = password;
	}

	public String getConfirmpassword() {
		return confirmpassword;
	}

	public void setConfirmpassword(String confirmpassword) {
		System.out.println("firstname: " + confirmpassword);
		this.confirmpassword = confirmpassword;
	}

	public String getCompanyemailid() {
		return companyemailid;
	}

	public void setCompanyemailid(String companyemailid) {
		this.companyemailid = companyemailid;
	}

	public String getMobilenumber() {
		return mobilenumber;
	}

	public void setMobilenumber(String mobilenumber) {
		this.mobilenumber = mobilenumber;
	}

	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getUserid() {
		return Userid;
	}

	public void setUserid(String userid) {
		Userid = userid;
	}

	public String getOldCompanyemailid() {
		return oldCompanyemailid;
	}

	public void setOldCompanyemailid(String oldCompanyemailid) {
		this.oldCompanyemailid = companyemailid;
	}

	public String getRegisteredtime() {
		return registeredtime;
	}

	public void setRegisteredtime(String registeredtime) {
		this.registeredtime = registeredtime;
	}

	public String getLatestupdatedtime() {
		return latestupdatedtime;
	}

	public void setLatestupdatedtime(String latestupdatedtime) {
		this.latestupdatedtime = latestupdatedtime;
	}

}