package com.sist.web.service;

import java.util.List;

import com.sist.web.vo.BoardVO;

public interface BoardService {
	public List<BoardVO> boardListData(int start);
	public int boardTotalPage();
	public void boardInsert(BoardVO vo);
	public BoardVO boardDetailData(int no);
	public String boardUpdate(BoardVO vo);
	public String boardDelete(int no, String pwd);
	public BoardVO boardUpdateData(int no);
}
