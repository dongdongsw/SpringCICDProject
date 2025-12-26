package com.sist.web.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sist.web.service.FoodService;
import com.sist.web.vo.FoodVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/food")
public class FoodController {

	private final FoodService fService;
	
	@GetMapping("/list")
	public String food_list(@RequestParam(name="page",required = false) String page,Model model) {
		
		if(page == null) {
			page = "1";
		}
		int curpage = Integer.parseInt(page);
		int rowSize = 12;
		int start = (curpage - 1) * rowSize;
		List<FoodVO> list = fService.foodListData(start);
		int totalpage = fService.foodTotalPage();
		
		final int BLOCK = 10;
		int startPage = ((curpage-1)/BLOCK*BLOCK) + 1;
		int endPage = ((curpage-1)/BLOCK*BLOCK) + BLOCK;
		
		if(endPage > totalpage) {
			endPage = totalpage;
		}
		model.addAttribute("list",list);
		model.addAttribute("curpage",curpage);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("main_jsp", "../food/list.jsp");
		return "main/main";
	}
	
	@GetMapping("/detail")
	public String food_detail(@RequestParam("fno") int fno, Model model) {
		
		FoodVO vo = fService.foodDetailData(fno);
		
		model.addAttribute("vo",vo);
		model.addAttribute("main_jsp", "../food/detail.jsp");
		return "main/main";
	}
	
}
