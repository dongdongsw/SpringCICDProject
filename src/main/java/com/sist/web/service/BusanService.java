package com.sist.web.service;

import java.util.List;
import java.util.Map;

import com.sist.web.vo.BusanVO;
import com.sist.web.vo.FoodVO;

public interface BusanService {
	public List<BusanVO> busanListData(Map map);
	public int busanTotalPage(Map map);
	public BusanVO busanDetailData(int no);
	public List<FoodVO> foodNearData4(String address);
}
