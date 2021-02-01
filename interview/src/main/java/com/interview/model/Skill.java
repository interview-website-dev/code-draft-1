package com.interview.model;

public class Skill {
	public String Skillname;
	private String Proficiencylevel;
	private String Positionid;
	private String registered_time;
	private String latest_updated_time;

	public Skill() {
	}

	public Skill(String Positionid, String Skillname, String Proficiencylevel) {
		this.Positionid = Positionid;
		this.Skillname = Skillname;
		this.Proficiencylevel = Proficiencylevel;
	}

	public String getPositionid() {
		return Positionid;
	}

	public void setPositionid(String positionid) {
		Positionid = positionid;
	}

	public void setSkillname(String Skillname) {
		this.Skillname = Skillname;

	}

	public String getSkillname() {
		return Skillname;
	}

	public void setProficiencylevel(String Proficiencylevel) {
		this.Proficiencylevel = Proficiencylevel;

	}

	public String getProficiencylevel() {
		return Proficiencylevel;
	}

	public String getRegistered_time() {
		return registered_time;
	}

	public void setRegistered_time(String registered_time) {
		this.registered_time = registered_time;
	}

	public String getLatest_updated_time() {
		return latest_updated_time;
	}

	public void setLatest_updated_time(String latest_updated_time) {
		this.latest_updated_time = latest_updated_time;
	}

}