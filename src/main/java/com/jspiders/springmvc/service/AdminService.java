package com.jspiders.springmvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jspiders.springmvc.pojo.AdminPojo;
import com.jspiders.springmvc.repository.AdminRepository;

@Service
public class AdminService {

	@Autowired
	private AdminRepository repository;

	public AdminPojo getAdmin() {
		AdminPojo pojo=repository.getAdmin();
		return pojo;
	}

	public AdminPojo createAdmin(String username, String password) {
		AdminPojo pojo=repository.createAdmin(username,password);
		return pojo;
	}

	public AdminPojo login(String username, String password) {
        AdminPojo pojo=repository.login(username,password);
		return pojo;
	}

	
}
