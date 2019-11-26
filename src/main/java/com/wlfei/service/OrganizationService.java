package com.wlfei.service;

import java.util.List;

import com.wlfei.pojo.Organization;

public interface OrganizationService {

	List<Organization> list();

	void deleteById(int id);

}
