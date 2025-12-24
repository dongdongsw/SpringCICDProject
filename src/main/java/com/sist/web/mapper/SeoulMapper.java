package com.sist.web.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.sist.web.vo.SeoulVO;

@Repository
@Mapper
public interface SeoulMapper {

	/*
	  	<select id="seoulListData" resultType="com.sist.web.vo.SeoulVO" parameterType="hashmap">
	 		SELECT no, title, poster, address, hit
	 		FROM ${table_name}
	 		ORDER BY no ASC
	 		OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
	 	</select>
	 */
	public List<SeoulVO> seoulListData(Map map);
	// public abstract
	// 1.8 => default 메소드 => 구현 메소드 -> 추상 클래스 대체
	// 공통적으로 적용되는 기능 설정
	/*
	 	<select id="seoulTotalPage" resultType="int" parameterType="hashmap">
	 		SELECT CEIL(COUNT(*)/12.0)
	 		FROM ${table_name}
	 	</select
	 */
	// 인터페이스는 서로 다른 클래스 연결 (리모콘) => 모든 변수 / 모든 메소드는 public
	public int seoulTotalPage(Map map);
}
