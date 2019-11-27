package com.wlfei.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("")
public class UserController {

	@RequestMapping(value = "userLogin", produces = "application/json; charset=utf-8", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String userLogin(String name, String password) {

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("code", 0);
		jsonObject.put("msg", "登录成功");
		jsonObject.put("token", name+password);
		return jsonObject.toString();
	}
}
