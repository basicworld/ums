package ums;

import com.wlfei.util.PropertiesUtil;

public class TestPropertiesUtil {
	public static void main(String[] args) {
		System.out.println(PropertiesUtil.getValue("hello"));
		System.out.println(PropertiesUtil.getValue("hello2"));
		System.out.println(PropertiesUtil.getValue("hello2", "default world2"));
		System.out.println(PropertiesUtil.getValue("logo_file_path"));
	}
}
