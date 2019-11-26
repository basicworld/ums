package com.wlfei.util;

import java.io.IOException;

import org.springframework.core.io.support.PropertiesLoaderUtils;

public class PropertiesUtil {
	public static String getValue(String key) {
		String fileName = "config.properties";
		String value = null;
		try {
			value = PropertiesLoaderUtils.loadAllProperties(fileName).getProperty(key);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return value;
	}

	public static String getValue(String key, String defaultValue) {
		String value = getValue(key);
		if (null == value) {
			return defaultValue;
		}
		return value;
	}

}
