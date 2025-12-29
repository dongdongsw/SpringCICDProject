package com.sist.web.restcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sist.web.service.ReplyService;
import com.sist.web.vo.ReplyVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class ReplyRestController {

	private final ReplyService rService;
	
	@GetMapping("/reply/list_vue/")
	public ResponseEntity<Map> reply_list_vue(
			@RequestParam("cno") int cno, 
			@RequestParam("type") int type,
			HttpSession session
			){
		
		Map map = new HashMap<>();
		try {
			
			List<ReplyVO> rList = rService.replyListData(cno, type);
 			map.put("rList", rList);
 			map.put("cno", cno);
 			map.put("type", type);
			map.put("sessionId", session.getAttribute("id"));
			
		} catch (Exception ex) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(map, HttpStatus.OK);
		
	}
	
	@PostMapping("/reply/insert_vue/")
	public ResponseEntity<Map> reply_insert_vue(@RequestBody ReplyVO vo, HttpSession session){
		
		Map map = new HashMap<>();
		try {
			
			String id = (String)session.getAttribute("id");
			String name = (String)session.getAttribute("name");
			
			vo.setId(id);
			vo.setName(name);
			rService.replyInsert(vo);
			
			
			List<ReplyVO> rList = rService.replyListData(vo.getCno(), vo.getType());
 			map.put("rList", rList);
 			map.put("cno", vo.getCno());
 			map.put("type", vo.getType());
			map.put("sessionId", session.getAttribute("id"));
 			
			
		} catch (Exception ex) {
			
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(map, HttpStatus.OK);
		
	}
}
