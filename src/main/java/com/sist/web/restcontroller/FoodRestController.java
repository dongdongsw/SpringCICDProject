package com.sist.web.restcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sist.web.service.FoodService;
import com.sist.web.vo.FoodVO;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/food")
public class FoodRestController {

	private final FoodService fService;
	
	@GetMapping("/find_vue/")
	public ResponseEntity<Map> food_find_vue(@RequestParam("page") int page,
			@RequestParam("address") String address){
		
		Map map = new HashMap<>();
		List<FoodVO> list = null;
		int totalpage = 0;
		int startPage = 0;
		int endPage = 0;
		final int BLOCK = 10;
		
		try {
			list = fService.foodFindData((page-1)*12, address);
			totalpage = fService.foodFindTotalPage(address);
			
			startPage = ((page-1)/BLOCK*BLOCK)+1;
			endPage = ((page-1)/BLOCK*BLOCK)+BLOCK;
			
			map.put("list", list);
			map.put("curpage", page);
			map.put("totalpage", totalpage);
			map.put("startPage", startPage);
			map.put("endPage", endPage);
			
		} catch (Exception ex) {
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	@GetMapping("/find_detail_vue/")
	public ResponseEntity<FoodVO> food_detail_vue(@RequestParam("fno") int fno){
		
		FoodVO vo = null;
		try {
			vo = fService.foodDetailData(fno);
		} catch (Exception e)  {
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(vo, HttpStatus.OK);
		
	}
	
	
}
