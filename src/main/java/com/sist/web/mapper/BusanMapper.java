package com.sist.web.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.sist.web.vo.BusanVO;

@Mapper
@Repository
public interface BusanMapper {

	/*
	 <select id="busanListData" resultType="com.sist.web.vo.BusanVO" parameterType="hashmap">
 		SELECT no, hit, contentid, image1, address, title, contenttype
 		FROM busantravel
 		<include refid="where-sql"/>
 		OFFSET #{start} ROWS FETCH NEXT 6 ROWS ONLY
 	</select>
	 */
	public List<BusanVO> busanListData(Map map);
	
	/*
 	<select id="busanTotalPage" resultType="int" parameterType="hashmap">
 		SELECT CEIL(COUNT(*)/6.0)
 		FROM busantravel
 		<include refid="where-sql"/>
 	</select>
	 */
	public int busanTotalPage(Map map);
}
