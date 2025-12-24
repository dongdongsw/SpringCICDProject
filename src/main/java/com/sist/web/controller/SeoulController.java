package com.sist.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SeoulController {

	private String[] url = {
		"",
		"location.jsp",
		"nature.jsp",
		"shop.jsp"
			
	};
	
	private String[] title= {
			"",
			"명소",
			"자연 & 관광",
			"쇼핑"
	};
	
	@GetMapping("/seoul")
	public String seoul_location(@RequestParam(name="type",required=false) String type, Model model) {
		
		if(type == null) {
			type="1";
		}
		int i = Integer.parseInt(type);
		model.addAttribute("title",title[i]);
		
		model.addAttribute("seoul_jsp", "../seoul/"+url[i]);
		model.addAttribute("main_jsp", "../seoul/seoul_main.jsp");
		return "main/main";
	}
	
	
}
