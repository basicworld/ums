package com.wlfei.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wlfei.pojo.Contact;
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

	@RequestMapping(value = "orgQuery", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String queryOrg(Pager pager, String keyword) {
		System.out.println("keyword>>>" + keyword);
		PageHelper.startPage(pager.getPage(), pager.getLimit());

		List<Organization> os = organizationService.list(keyword);
		int total = (int) new PageInfo<>(os).getTotal();
		pager.setTotal(total);

		contactService.fill(os); // 查询联系人
		for (Organization o : os) {
			System.out.println(o.getContact());

		}

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("code", 0);
		jsonObject.put("msg", "");
		jsonObject.put("count", pager.getTotal());
		jsonObject.put("data", os);
		return jsonObject.toString();
	}

	@RequestMapping(value = "orgDelete", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String orgDelete(int id) {

		organizationService.deleteById(id);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("code", 0);
		jsonObject.put("msg", "删除成功");
		return jsonObject.toString();

	}

	@RequestMapping(value = "orgUpdate", produces = "application/json; charset=utf-8", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String orgUpdate(Organization o, @RequestParam("contact_id") int contact_id,
			@RequestParam("contact_name") String contact_name, @RequestParam("contact_email") String contact_email,
			@RequestParam("contact_phone") String contact_phone,
			@RequestParam("contact_address") String contact_address) {
		System.out.println(o);
		Contact c = new Contact();
		if (contact_id > 0) {
			c.setId(contact_id);
			c.setName(contact_name);
			c.setEmail(contact_email);
			c.setPhone(contact_phone);
			c.setAddress(contact_address);
		}
		o.setContact(c);
		System.out.println(o);
		organizationService.update(o);

//		// HttpServletRequest request
//		InputStream in;
//		String str = "";
//		try {
//			in = request.getInputStream();
//			java.io.InputStreamReader ir = new java.io.InputStreamReader(in);
//			java.io.BufferedReader br = new BufferedReader(ir);
//
//			while ((str = br.readLine()) != null) {
//				System.out.println(str);
//			}
//
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		// java.io.BufferedInputStream bf = new java.io.BufferedInputStream(in);
//
////		System.out.println(map.getOrDefault("contact_id", null));

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("code", 0);
		jsonObject.put("msg", "更新成功");
		return jsonObject.toString();

	}

	@RequestMapping(value = "orgAdd", produces = "application/json; charset=utf-8", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String orgAdd(Organization o, @RequestParam("contact_name") String contact_name,
			@RequestParam("contact_email") String contact_email, @RequestParam("contact_phone") String contact_phone,
			@RequestParam("contact_address") String contact_address) {
		System.out.println(o);

		Contact c = new Contact();
		c.setName(contact_name);
		c.setEmail(contact_email);
		c.setPhone(contact_phone);
		c.setAddress(contact_address);
		o.setContact(c);
		organizationService.insert(o);

		

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("code", 0);
		jsonObject.put("msg", "新增成功【" + o.getId() + "】");
		return jsonObject.toString();

	}

}
