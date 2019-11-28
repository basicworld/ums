package com.wlfei.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wlfei.pojo.Token;
import com.wlfei.service.TokenService;
import com.wlfei.util.TokenManager;

@Service
public class TokenServiceImpl implements TokenService {
	@Autowired
	TokenManager tokenMapper;

	@Override
	public int insert(Token t) {
		// TODO Auto-generated method stub
		return tokenMapper.insert(t);
	}

	@Override
	public int delete(String token) {
		// TODO Auto-generated method stub
		return tokenMapper.deleteByTokenString(token);
	}

	@Override
	public int update(Token t) {
		// TODO Auto-generated method stub
		return tokenMapper.update(t);
	}

	@Override
	public Token select(String token) {
		// TODO Auto-generated method stub
		return tokenMapper.selectByTokenString(token);
	}

}
