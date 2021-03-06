package com.wlfei.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wlfei.Annotation.TokenValid;


@Controller
@RequestMapping("")
public class PageController {
	@RequestMapping("hello")
	@TokenValid
	public String hello(Model model) {
		model.addAttribute("name", "wlfei");
		return "hello";
	}
	
	@RequestMapping("home")
	public String home(Model model) {
		return "home";
	}
	@RequestMapping("login")
	public String login(Model model) {
		return "login";
	}
	@RequestMapping("modal/orgEdit")
	public String modelOrgEdit() {
		return "include/modal/orgEdit";
	}

}
