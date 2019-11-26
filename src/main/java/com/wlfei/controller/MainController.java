package com.wlfei.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wlfei.pojo.Organization;
import com.wlfei.service.ContactService;
import com.wlfei.service.OrganizationService;
import com.wlfei.util.Pager;

@Controller
@RequestMapping("")
public class MainController {
	@Autowired
	OrganizationService organizationService;
	@Autowired
	ContactService contactService;
	
	@RequestMapping(value="orgQuery", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String queryOrg(Pager pager, String keyword) {
		System.out.println(pager);
		System.out.println(keyword);
		PageHelper.startPage(pager.getPage(), pager.getLimit());
		
		List<Organization> os = organizationService.list();
		int total = (int) new PageInfo<>(os).getTotal();
		pager.setTotal(total);
		
		contactService.fill(os);  // 查询联系人
		for(Organization o: os) {
			System.out.println(o.getContact());
			
		}
		
		JSONObject jsonObject = new JSONObject();  
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", pager.getTotal());
        jsonObject.put("data", os);
        return jsonObject.toString();
	}
	
	@RequestMapping(value="orgDelete", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String orgDelete(int id) {
		organizationService.deleteById(id);
		JSONObject jsonObject = new JSONObject();  
        jsonObject.put("code", 0);
        jsonObject.put("msg", "删除成功");
        return jsonObject.toString();
		
	}

}
