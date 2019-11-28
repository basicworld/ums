package com.wlfei.pojo;

public class Token {
	private String token;
	private int uid; // user id

	private long expire;

	public long getExpire() {
		return expire;
	}

	public void setExpire(long expire) {
		this.expire = expire;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	@Override
	public String toString() {
		return "Token [token=" + token + ", uid=" + uid + ", expire=" + expire + "]";
	}

	
}
