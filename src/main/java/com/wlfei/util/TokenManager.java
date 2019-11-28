package com.wlfei.util;

import java.util.concurrent.ConcurrentHashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.wlfei.pojo.Token;

@Component
public class TokenManager{
	private static final Log logger = LogFactory.getLog(TokenManager.class);

	// token公共池 ，使用线程安全的map
	private static final ConcurrentHashMap<String, Token> tokenPool = new ConcurrentHashMap<>();

	// 过期时长
	private static final long expireDuration = 24 * 60 * 60 * 1000L;

	
	public int insert(Token t) {
		tokenPool.put(t.getToken(), t);
		return 1;
	}


	
	public int update(Token t) {
		// TODO Auto-generated method stub
		return insert(t);
	}

	/**
	 * 定时清理无效token
	 */
	@Scheduled(initialDelay = expireDuration, fixedDelay = expireDuration)
	private void cleanToken() {
		logger.info("cleanToken 开始clean token");

		tokenPool.forEach((key, value) -> {
			if (value.getExpire() <= System.currentTimeMillis()) {
				tokenPool.remove(key, value);
			}
		});
	}

	
	public int deleteByTokenString(String token) {
		if(null==token) {
			return 0;
		}
		Token t = tokenPool.get(token);
		int count = (null == t) ? 0 : 1;
		tokenPool.remove(token);
		return count;
	}

	
	public Token selectByTokenString(String token) {
		if(token==null) {
			return null;
		}
		// TODO Auto-generated method stub
		if(!tokenPool.contains(token)) {
			return tokenPool.get(token);
		}
		
		return null;
	}

}
