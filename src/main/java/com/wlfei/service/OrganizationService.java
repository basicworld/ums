package com.wlfei.service;

import java.util.List;

import com.wlfei.pojo.Contact;
import com.wlfei.pojo.Organization;

public interface OrganizationService {

	List<Organization> list();
	List<Organization> list(String keyword);

	int deleteById(int id);
	
	int update(Organization o);
	int insert(Organization o);

}
