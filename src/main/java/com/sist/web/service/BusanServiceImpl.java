package com.sist.web.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sist.web.mapper.BusanMapper;
import com.sist.web.mapper.FoodMapper;
import com.sist.web.vo.BusanVO;
import com.sist.web.vo.FoodVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BusanServiceImpl implements BusanService{

	private final BusanMapper mapper;
	private final FoodMapper fmapper;

	@Override
	public List<BusanVO> busanListData(Map map) {
		// TODO Auto-generated method stub
		return mapper.busanListData(map);
	}

	@Override
	public int busanTotalPage(Map map) {
		// TODO Auto-generated method stub
		return mapper.busanTotalPage(map);
	}

	@Override
	public BusanVO busanDetailData(int no) {
		// TODO Auto-generated method stub
		mapper.busanHitIncrement(no);
		return mapper.busanDetailData(no);
	}

	@Override
	public List<FoodVO> foodNearData4(String address) {
		// TODO Auto-generated method stub
		return fmapper.foodNearData4(address);
	}
}
