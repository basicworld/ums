package com.wlfei.service;

import java.util.List;

import com.wlfei.pojo.Sysuser;

public interface SysuserService {
	int insert(Sysuser u);

	int update(Sysuser u);

	Sysuser selectById(int id);

	List<Sysuser> selectByName(String name);
}
