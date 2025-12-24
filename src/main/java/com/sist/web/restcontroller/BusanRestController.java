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

import com.sist.web.service.BusanService;
import com.sist.web.vo.BusanVO;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/busan")
public class BusanRestController {

	private final BusanService bService;
	
	@GetMapping("/list_vue/")
	public ResponseEntity<Map> busan_list_vue(@RequestParam(name="type",required= false) int type, @RequestParam(name="page",required = false) int page){
		
		Map map = new HashMap<>();
		int totalpage = 0;
		final int BLOCK = 10;
		int startPage = 0;
		int endPage = 0;
		
		try {
			map.put("type", type);
			map.put("start", (page-1)*6);
			
			List<BusanVO> list = bService.busanListData(map);
			totalpage = bService.busanTotalPage(map);
					
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
