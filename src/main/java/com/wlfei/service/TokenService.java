package com.wlfei.service;

import com.wlfei.pojo.Sysuser;
import com.wlfei.pojo.Token;
import com.wlfei.util.Md5Util;

public interface TokenService {
	int insert(Token t);

	int delete(String token);

	int update(Token t);

	Token select(String token);

	static Token makeToken(Sysuser user) {
		Token t = new Token();
		t.setUid(user.getId());
		String tokenString = Md5Util.getMd5(user.toString() + System.currentTimeMillis());
		t.setToken(tokenString);
		// 过期时长
		long expireDuration = 24 * 60 * 60 * 1000L;
		t.setExpire(System.currentTimeMillis() + expireDuration);

		return t;
	};
}
