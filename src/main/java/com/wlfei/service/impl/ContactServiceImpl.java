package com.wlfei.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wlfei.mapper.ContactMapper;
import com.wlfei.pojo.Contact;
import com.wlfei.pojo.ContactExample;
import com.wlfei.pojo.Organization;
import com.wlfei.service.ContactService;

@Service
public class ContactServiceImpl implements ContactService {
	@Autowired
	ContactMapper contactMapper;

	@Override
	public void fill(Organization o) {
		// TODO Auto-generated method stub
		List<Contact> cs = selectByOid(o.getId());
		if (null != cs && cs.size() > 0) {
			o.setContact(cs.get(0));
		}

	}

	@Override
	public void fill(List<Organization> os) {
		for (Organization o : os) {
			fill(o);
		}

	}

	@Override
	public List<Contact> selectByOid(int oid) {
		ContactExample example = new ContactExample();
		example.createCriteria().andOidEqualTo(oid);
		return contactMapper.selectByExample(example);
	}

	@Override
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		contactMapper.deleteByPrimaryKey(id);
		
	}

	

}
