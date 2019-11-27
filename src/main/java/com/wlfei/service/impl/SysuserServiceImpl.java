package com.wlfei.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wlfei.mapper.SysuserMapper;
import com.wlfei.pojo.Sysuser;
import com.wlfei.service.SysuserService;

@Service
public class SysuserServiceImpl implements SysuserService{
	@Autowired
	SysuserMapper sysuserMapper;

	@Override
	public int insert(Sysuser u) {
		// TODO Auto-generated method stub
		sysuserMapper.insert(u);
		return 0;
	}

	@Override
	public int update(Sysuser u) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Sysuser selectById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Sysuser> selectByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

}
