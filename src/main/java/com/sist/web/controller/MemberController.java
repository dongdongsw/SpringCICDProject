package com.sist.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {

	@GetMapping("/member/login")
	public String member_login(Model model) {
		
		model.addAttribute("main_jsp", "../member/login.jsp");
		return "main/main";
	}
	
	@GetMapping("/member/login_ok")
	public String member_login_ok(HttpSession session,Model model) {
		
		session.setAttribute("id", "admin");
		return "redirect:/main";
	}
	
	@GetMapping("/member/logout")
	public String member_logout(HttpSession session) {
		
		session.invalidate();
		return "redirect:/main";
	}
}
