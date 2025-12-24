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

import com.sist.web.service.SeoulService;
import com.sist.web.vo.SeoulVO;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/seoul")
public class SeoulRestController {

	private final SeoulService sService;
	private String[] tables = {
			"",
			"seoul_location",
			"seoul_nature",
			"seoul_shop"
	};
	
	@GetMapping("/list_vue/")
	public ResponseEntity<Map> seoul_list_vue(@RequestParam("page") int page, @RequestParam("type") int type){
		
		Map map = new HashMap<>();
	    System.out.println("type=" + type);
		
		List<SeoulVO> list = null;
		int totalpage = 0;
		final int BLOCK = 10;
		int startPage = 0;
		int endPage = 0;
		try {
			
			map.put("table_name", tables[type]);
			map.put("start", (page-1)*6);
			
			list = sService.seoulListData(map);
			totalpage = sService.seoulTotalPage(map);
			startPage = ((page-1)/BLOCK*BLOCK)+1;
			endPage = ((page-1)/BLOCK*BLOCK)+BLOCK;
			if(endPage > totalpage) endPage = totalpage;
			map.put("list", list);
			map.put("totalpage", totalpage);
			map.put("startPage", startPage);
			map.put("endPage", endPage);
			map.put("curpage", page);
			map.put("type", type);
			
		} catch (Exception ex) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
}
