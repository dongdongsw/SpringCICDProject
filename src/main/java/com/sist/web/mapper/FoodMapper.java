package com.sist.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.sist.web.vo.FoodVO;

@Mapper
@Repository
public interface FoodMapper {

	/*
	 <select id="foodNearData4" resultType="com.sist.web.vo.FoodVO" parameterType="string">
 		SELECT fno, name, poster, rownum
 		FROM (SELECT fno, name, poster 
 			FROM menupan_food 
 			WHERE address LIKE '%'||#{address}||'%'
 			ORDER BY hit DESC)
 		WHERE rownum &lt;=4
 	</select>
	 */
	public List<FoodVO> foodNearData4(String address);
}
