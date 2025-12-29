package com.sist.web.service;

import java.util.List;


import com.sist.web.vo.ReplyVO;

public interface ReplyService {

	public List<ReplyVO> replyListData(int cno, int type);
	
	public void replyInsert(ReplyVO vo);
}
