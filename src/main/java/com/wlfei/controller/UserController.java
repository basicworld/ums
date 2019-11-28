package com.wlfei.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.wlfei.interceptor.TokenInterceptor;
import com.wlfei.pojo.Sysuser;
import com.wlfei.pojo.Token;
import com.wlfei.service.TokenService;

@Controller
@RequestMapping("")
public class UserController {
	@Autowired
	TokenService tokenService;
	private static final Log logger = LogFactory.getLog(UserController.class);

	@RequestMapping(value = "userLogin", produces = "application/json; charset=utf-8", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String userLogin(String name, String password) {
		
		Sysuser user = new Sysuser();
		user.setId(1);
		user.setName(name);
		user.setPassword(password);
		
		Token token = TokenService.makeToken(user);
		
		tokenService.insert(token);
		logger.info(token);
		logger.info("登录成功，验证token查询功能:::" + tokenService.select(token.getToken()));

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("code", 0);
		jsonObject.put("msg", "登录成功");
		jsonObject.put("token", token.getToken());
		return jsonObject.toString();
	}
}
