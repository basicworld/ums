package com.wlfei.util;

import org.springframework.util.DigestUtils;

public class Md5Util {
	//盐，用于混交md5
		private static final String slat = "&%5123***&&%%$$#@";
		/**
		 * 生成md5
		 * @param seckillId
		 * @return
		 */
		public static String getMd5(String str) {
			String base = str +"/"+slat;
			String md5 = DigestUtils.md5DigestAsHex(base.getBytes());
			return md5;
		}
}
