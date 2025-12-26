package com.sist.web.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.sist.web.vo.FoodVO;

public interface FoodService {
/*
@Select("SELECT fno, name, name, poster "
			+ "FROM menupan_food "
			+ "ORDER BY fno ASC "
			+ "OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY")
	public List<FoodVO> foodListData(int start);

	@Select("SELECT CEIL(COUNT(*)/12.0) FROM menupan_food")
	public int foodTotalPage();
	
	@Select("SELECT fno, name, name, poster "
			+ "FROM (SELECT fno, name, poster "
			+ "FROM menupan_food "
			+ "WHERE address LIKE '%'||#{address}||'%' "
			+ "ORDER BY fno ASC) "
			+ "OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY")
	public List<FoodVO> foodFindData(@Param("start") int start,@Param("address") String address);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM menupan_food "
			+ "WHERE address LIKE '%'||#{address}||'%' ")
	public int foodFindTotalPage(String address);
 */
	public List<FoodVO> foodListData(int start);
	public int foodTotalPage();
	public List<FoodVO> foodFindData(int start,String address);
	public int foodFindTotalPage(String address);
	public FoodVO foodDetailData(int fno);
	
}
