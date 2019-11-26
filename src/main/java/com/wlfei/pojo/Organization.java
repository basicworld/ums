package com.wlfei.pojo;

public class Organization {
	private Contact contact;

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}

	private Integer id;

	private String fullname;

	private String briefname;

	private String orgcode;

	private String logolocation;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname == null ? null : fullname.trim();
	}

	public String getBriefname() {
		return briefname;
	}

	public void setBriefname(String briefname) {
		this.briefname = briefname == null ? null : briefname.trim();
	}

	public String getOrgcode() {
		return orgcode;
	}

	public void setOrgcode(String orgcode) {
		this.orgcode = orgcode == null ? null : orgcode.trim();
	}

	public String getLogolocation() {
		return logolocation;
	}

	public void setLogolocation(String logolocation) {
		this.logolocation = logolocation == null ? null : logolocation.trim();
	}
}