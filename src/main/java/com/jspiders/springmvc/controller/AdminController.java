package com.jspiders.springmvc.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jspiders.springmvc.pojo.AdminPojo;
import com.jspiders.springmvc.service.AdminService;

import jakarta.servlet.http.HttpSession;


@Controller
public class AdminController {
	@Autowired
private AdminService service;

	@GetMapping("/createAccount")
	public String createAccountPage(ModelMap map) {
	
		AdminPojo pojo=service.getAdmin();
		if (pojo != null) {
			map.addAttribute("msg","Account already exists..!!!");
			return"Login";
		}
		return "CreateAccount";
	}

	
	@PostMapping("/createAccount")
	public String createAdmin(@RequestParam String username,@RequestParam String password,ModelMap map) {
	
		AdminPojo pojo=service.createAdmin(username,password);
		
		if (pojo != null) {
			map.addAttribute("msg", "Account created successfully..!");
			return "Login";
		}
		
		map.addAttribute("msg", "Account not created..!");
		return "Login";
	}
	
	
		@PostMapping("/login")
		public String login(@RequestParam String username,@RequestParam String password,ModelMap map ,HttpSession session) {
			AdminPojo pojo=service.login(username,password);
			if (pojo != null) {
				session.setAttribute("login", pojo);
				session.setMaxInactiveInterval(300);
				return "home";
			}
			map.addAttribute("msg","Invalid username & password");
			return"Login";
		}
		
		@GetMapping("/logout")
		public String logout(ModelMap map,HttpSession session) {
			session.invalidate();
			map.addAttribute("msg","Logout successfully..!!");
			return "Login";
		}
	
}