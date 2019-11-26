package com.wlfei.service;

import java.util.List;

import com.wlfei.pojo.Contact;
import com.wlfei.pojo.Organization;

public interface ContactService {
	// select by organization id
	List<Contact> selectByOid(int oid);
	// 填写联系人
	void fill(Organization o);

	// 为列表中的机构 填写联系人
	void fill(List<Organization> os);
	// 根据id删除联系人
	int deleteById(int id);
	
	int update(Contact c);
	
}
