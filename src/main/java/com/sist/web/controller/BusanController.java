package com.sist.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BusanController {
	
	private String[] title= {
			"",
			"명소",
			"문화시설",
			"축제",
			"숙박",
			"쇼핑",
			"음식점"
	};

	@GetMapping("/busan")
	// => 리턴형 : String 화면 이동, void 다운로드, Ajax
	public String busan_list(@RequestParam(name="type",required=false) String type, Model model) {
		
		if(type == null) {
			type="1";
		}
		model.addAttribute("title",title[Integer.parseInt(type)]);
		
		model.addAttribute("busan_jsp", "../busan/busan_list.jsp");
		model.addAttribute("main_jsp","../busan/busan_main.jsp");
		return "main/main";
	}
}
