package com.interview.model;

public class CandidatePost {
	private String Userid;
	private String Positionid;
	private String Positionname;
	private String Date;
	private String Location;
	private String Address;
	private String Qualification;
	private String Salary;
	private String Noofposition;
	private String Registeredtime;
	private String Latestupdatedtime;
	private String companyname;

	public String getUserid() {
		return Userid;
	}

	public void setUserid(String userid) {
		Userid = userid;
	}

	public String getLatestupdatedtime() {
		return Latestupdatedtime;
	}

	public void setLatestupdatedtime(String latestupdatedtime) {
		Latestupdatedtime = latestupdatedtime;
	}

	public String getPositionid() {
		return Positionid;
	}

	public void setPositionid(String positionid) {
		Positionid = positionid;
	}

	public String getPositionname() {
		return Positionname;
	}

	public void setPositionname(String positionname) {
		Positionname = positionname;
	}

	public String getDate() {
		return Date;
	}

	public void setDate(String date) {
		Date = date;
	}

	public String getLocation() {
		return Location;
	}

	public void setLocation(String location) {
		Location = location;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getQualification() {
		return Qualification;
	}

	public void setQualification(String qualification) {
		Qualification = qualification;
	}

	public String getSalary() {
		return Salary;
	}

	public void setSalary(String salary) {
		Salary = salary;
	}

	public String getNoofposition() {
		return Noofposition;
	}

	public void setNoofposition(String noofposition) {
		Noofposition = noofposition;
	}

	public String getRegisteredtime() {
		return Registeredtime;
	}

	public void setRegisteredtime(String registeredtime) {
		Registeredtime = registeredtime;
	}

	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

}
