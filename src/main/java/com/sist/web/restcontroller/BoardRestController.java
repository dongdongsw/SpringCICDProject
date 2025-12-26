package com.sist.web.restcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sist.web.service.BoardService;
import com.sist.web.vo.BoardVO;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardRestController {

	private final BoardService bService;
	
	@GetMapping("/list_vue/")
	public ResponseEntity<Map> board_list_vue(@RequestParam("page") int page ){
		
		Map map = new HashMap<>();
		List<BoardVO> list = null;
		int totalpage = 0;
		try {
			
			list = bService.boardListData((page-1)-10);
			totalpage = bService.boardTotalPage();
			
			map.put("list", list);
			map.put("totalpage", totalpage);
			map.put("curpage", page);
			
		} catch (Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	/*
	 * @RequestBody => JSON => 객체 변환
	 * 				=> javascript에서 전송된 값
	 * 
	 * @ModelAttribute => Spring 자체에서 처리
	 * 		| 커맨드 객체값 받는 경우
	 * 		  --------- vo
	 * 
	 * @RequestParam => getParameter()
	 * 
	 * => Mybatis : procedure / function / trigger
	 * 				------------------------------
	 * 				PS/SQL : 호불호
	 * 						 ERP
	 * 				=> 댓글 
	 * 				=> JOIN / SUBQUERY => Function
	 * 				=> replycount / likecount => Trigger
	 * => 동적 쿼리 : 검색
	 * ----------------------------------------------------------JPA
	 */
	@PostMapping("/insert_vue/")
	public ResponseEntity<Map> board_list_vue(@RequestBody BoardVO vo){
		
		Map map = new HashMap<>();
		
		try {
			bService.boardInsert(vo);
			map.put("msg", "yes");
			
		} catch (Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	@GetMapping("/detail_vue/")
	public ResponseEntity<BoardVO> board_detail_vue(@RequestParam("no") int no){
		Map map = new HashMap<>();
		BoardVO vo = null;
		try {
			vo = bService.boardDetailData(no);
			
		} catch (Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(vo, HttpStatus.OK);
	}
	
	@GetMapping("/update_vue/")
	public ResponseEntity<BoardVO> board_update_vue(@RequestParam("no") int no){
		Map map = new HashMap<>();
		BoardVO vo = null;
		try {
			vo = bService.boardUpdateData(no);
			
		} catch (Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(vo, HttpStatus.OK);
	}
	
	@PutMapping("/update_ok_vue/")
	public ResponseEntity<Map> board_update_ok_vue(@RequestBody BoardVO vo){
		
		Map map = new HashMap<>();
		
		try {
			String res = bService.boardUpdate(vo);
			map.put("msg", res);
			
		} catch (Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	@DeleteMapping("/delete_vue/")
	public ResponseEntity<Map> board_delete_vue(@RequestParam("no") int no, @RequestParam("pwd") String pwd){
		
		Map map = new HashMap<>();
		try {
			String res = bService.boardDelete(no,pwd);
			map.put("msg", res);
			
		} catch (Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
}
