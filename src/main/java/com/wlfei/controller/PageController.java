package com.wlfei.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("")
public class PageController {
	@RequestMapping("hello")
	public String hello(Model model) {
		model.addAttribute("name", "wlfei");
		return "hello";
	}
	
	@RequestMapping("home")
	public String home(Model model) {
		return "home";
	}
	@RequestMapping("modal/orgEdit")
	public String modelOrgEdit() {
		return "include/modal/orgEdit";
	}

}
