package com.sist.web.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sist.web.mapper.FoodMapper;
import com.sist.web.mapper.SeoulMapper;
import com.sist.web.vo.FoodVO;
import com.sist.web.vo.SeoulVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SeoulServiceImpl implements SeoulService{ 

	private final SeoulMapper mapper;
	private final FoodMapper fmapper;
	@Override
	public List<SeoulVO> seoulListData(Map map) {
		// TODO Auto-generated method stub
		return mapper.seoulListData(map);
	}

	@Override
	public int seoulTotalPage(Map map) {
		// TODO Auto-generated method stub
		return mapper.seoulTotalPage(map);
	}

	@Override
	public SeoulVO seoulDetailData(Map map) {
		// TODO Auto-generated method stub
		mapper.seoulHitIncrement(map);
		
		return mapper.seoulDetailData(map);
	}

	@Override
	public List<FoodVO> foodNearData4(String address) {
		// TODO Auto-generated method stub
		return fmapper.foodNearData4(address);
	}
	
	
	
}
