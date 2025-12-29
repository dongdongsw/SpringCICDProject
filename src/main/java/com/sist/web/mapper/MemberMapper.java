package com.sist.web.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.sist.web.vo.MemberVO;

@Mapper
@Repository
public interface MemberMapper {

	// ID 체크
	@Select("SELECT COUNT(*) FROM member_1 WHERE id = #{id}")
	public int memberIdCheck(String id);
	
	// PWD 체크
	@Select("SELECT pwd, name, id, sex, address "
			+ "FROM member_1 "
			+ "WHERE id = #{id}")
	public MemberVO memberInfoData(String id);
}
