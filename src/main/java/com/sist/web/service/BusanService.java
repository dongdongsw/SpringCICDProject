package com.sist.web.service;

import java.util.List;
import java.util.Map;

import com.sist.web.vo.BusanVO;

public interface BusanService {
	public List<BusanVO> busanListData(Map map);
	public int busanTotalPage(Map map);
}
