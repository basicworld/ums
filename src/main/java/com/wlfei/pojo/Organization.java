package com.wlfei.pojo;

import java.util.List;

public class Organization {
	private Integer id;

	private String fullname;

	private String briefname;

	private String orgcode;

	private String logolocation;

	private Contact contact;

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}

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

	@Override
	public String toString() {
		return "Organization [id=" + id + ", fullname=" + fullname + ", briefname=" + briefname + ", orgcode=" + orgcode
				+ ", logolocation=" + logolocation + ", contact=" + contact + "]";
	}
	
}