package com.jspiders.springmvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.jspiders.springmvc.pojo.AdminPojo;
import com.jspiders.springmvc.pojo.StudentPojo;
import com.jspiders.springmvc.service.StudentService;


@Controller
public class StudentController {
	@Autowired
	private StudentService service;

	@GetMapping("/home")
	public String home(@SessionAttribute(name="login",required = false) AdminPojo admin,ModelMap map) {
		if (admin != null) {
			return "home";	
		}
		map.addAttribute("msg","Session inactive.  please login  ");
		return "Login";
	}
	
	@GetMapping("/add")
	public String addPage(@SessionAttribute(name="login",required = false) AdminPojo admin,ModelMap map) {
		if (admin != null) {
			return "Add";
		}
		map.addAttribute("msg","Session inactive.  please login  ");
		return "Login";
		
	}
	
	@PostMapping("/add")
	public String addStudent(@RequestParam String name,@RequestParam String email,
			                 @RequestParam long contact,@RequestParam String address,
			                 ModelMap map,@SessionAttribute(name="login",required = false) AdminPojo admin) {
		
		if (admin != null) {
			StudentPojo pojo=service.addStudent(name,email,contact,address);
			List<StudentPojo> students=service.findAllStudent();
			if (pojo != null) {
				map.addAttribute("msg","student detatils added successfully..!");
				map.addAttribute("students",students);
			}else {
				map.addAttribute("msg","student details not added ...!");
				map.addAttribute("students",students);
			}
			return"Add";
		}
		map.addAttribute("msg","Session inactive.  please login  ");
		return "Login";
	}
	
	@GetMapping("/search")
	public String searchPage(@SessionAttribute(name="login",required = false) AdminPojo admin,ModelMap map) {
		if (admin != null) {
			return "Search";
		}
		map.addAttribute("msg","Session inactive.  please login  ");
		return "Login";
	}
	
	@PostMapping("/search")
	public String searchStudent(@RequestParam int id,ModelMap map,@SessionAttribute(name="login",required = false) AdminPojo admin) {
		
		if (admin != null) {
			StudentPojo pojo=service.searchStudent(id);
			
			if(pojo != null) {
				map.addAttribute("student",pojo);
				map.addAttribute("msg","Student data Found..!");
				return "Search";
			}
				map.addAttribute("msg","Student data not Found..!");
				return "Search";
		}
		
			map.addAttribute("msg","Session inactive.  please login  ");
			return "Login";
		
	}
	
	@GetMapping("/update")
	public String updatePage(@SessionAttribute(name="login",required = false) AdminPojo admin,ModelMap map) {
		if (admin != null) {
			List<StudentPojo> students=service.findAllStudent();
			map.addAttribute("students",students);
			return "Update";
		}
		
		map.addAttribute("msg","Session inactive.  please login  ");
		return "Login";
	}
	
	
	@PostMapping("/update")
	public String findStudentForUpdate(@RequestParam int id,@SessionAttribute(name="login",required = false) AdminPojo admin,ModelMap map) {
		
		if (admin != null) {
			StudentPojo pojo = service.searchStudent(id);
			
			if (pojo == null) {
				
				List<StudentPojo> students=service.findAllStudent();
				map.addAttribute("students",students);
				map.addAttribute("msg","data not present");
				return "Update";
			}
			map.addAttribute("student",pojo);
			return "Update";
		}
		
		map.addAttribute("msg","Session inactive.  please login  ");
		return "Login";
	}
	
	@PostMapping("/updateStudent")
	public String updateStudent(@SessionAttribute(name="login",required = false) AdminPojo admin,@RequestParam int id,@RequestParam String name,@RequestParam String email,@RequestParam long contact,@RequestParam String address,ModelMap map) {
		if (admin != null) {
			StudentPojo pojo=service.updateStudent(id,name,email,contact,address);
			if (pojo != null) {
				List<StudentPojo> students=service.findAllStudent();
				map.addAttribute("students",students);
				map.addAttribute("msg","data updated successfully..!");
				return "Update";
			}
			List<StudentPojo> students=service.findAllStudent();
			map.addAttribute("students",students);
			map.addAttribute("msg","data not updated ..!");
			return "Update";
		}
		
		map.addAttribute("msg","Session inactive.  please login  ");
		return "Login";
	}
	
	
	
	
	/* @PostMapping("/update")
	public String updateForm(@RequestParam int id,
								ModelMap map) {
		StudentPojo pojo = service.searchStudent(id);
		
		if (pojo != null) {
			map.addAttribute("student",pojo);
			return "Update";
		}
		
		List<StudentPojo> students = service.findAllStudent();
		map.addAttribute("students", students);
		map.addAttribute("msg", "Student data not found..!");
		return "Update";
	}
	*/
	
	@GetMapping("/remove")
	public String removePage(@SessionAttribute(name="login",required = false) AdminPojo admin,ModelMap map) {
		if (admin != null) {
			List<StudentPojo> students=service.findAllStudent();
			if (!students.isEmpty()) {
				map.addAttribute("students",students);
				return "Delete";
			}
			map.addAttribute("msg","Data not present");
			return "Delete";
		}
		
		
		map.addAttribute("msg","Session inactive.  please login  ");
		return "Login";
	}
	
	
	@PostMapping("/remove")
	public String removeStudent(@RequestParam int id,@SessionAttribute(name="login",required = false) AdminPojo admin,ModelMap map) {
	if (admin != null) {
		StudentPojo pojo=service.removeStudent(id);
		List<StudentPojo> students=service.findAllStudent();
		if (pojo != null) {
			map.addAttribute("msg","Student details removed successfully..!");
			map.addAttribute("students",students);
			return "Delete";
			
		}
		map.addAttribute("msg","Student data not present..!");
		map.addAttribute("students",students);
		return "Delete";
	}
		
		map.addAttribute("msg","Session inactive.  please login  ");
		return "Login";
	}
	
	
	
	
}
