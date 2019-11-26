package com.wlfei.service.impl;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.wlfei.mapper.OrganizationMapper;
import com.wlfei.pojo.Contact;
import com.wlfei.pojo.Organization;
import com.wlfei.pojo.OrganizationExample;
import com.wlfei.service.ContactService;
import com.wlfei.service.OrganizationService;

@Service
public class OrganizationServiceImpl implements OrganizationService {
	@Autowired
	ContactService contactService;
	@Autowired
	OrganizationMapper organizationMapper;

	@Override
	public List<Organization> list() {
		OrganizationExample example = new OrganizationExample();
		example.setOrderByClause("id desc");
		return organizationMapper.selectByExample(example);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public int deleteById(int id) {
		List<Contact> cs = contactService.selectByOid(id);
		if (null != cs && cs.size() > 0) {
			for (Contact c : cs) {
				contactService.deleteById(c.getId());
			}
		}
		return organizationMapper.deleteByPrimaryKey(id);

	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public int update(Organization o) {
		// TODO Auto-generated method stub
		Contact c = o.getContact();
		contactService.update(c);
		return organizationMapper.updateByPrimaryKeySelective(o);
	}

	@Override
	public List<Organization> list(String keyword) {
		if(null==keyword || keyword.length()==0) {
			return list();
		}
		return organizationMapper.fuzzySelectByKeyword(keyword);
	}

}
