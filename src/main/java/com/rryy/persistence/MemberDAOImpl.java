package com.rryy.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.rryy.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	
	// 마이 바티스 
	@Inject
	private SqlSession sql;
	
	//매퍼 
	private static String namespace = "com.rryy.mappers.memberMapper";
	
	
	//회원가입 
	@Override
	public void register(MemberVO vo) throws Exception{
		sql.insert(namespace + ".register", vo);
	}

	//로그인 
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return sql.selectOne(namespace + ".login", vo);
	}
	
	// 회원정보 수정 
	@Override
	public void modify(MemberVO vo) throws Exception{
		sql.update(namespace + ".modify", vo);
	}
	
	// 회원 탈퇴 
	@Override
	public void withdrawal(MemberVO vo) throws Exception{
		sql.delete(namespace+ ".withdrawal", vo);
	}

	// 아이디 중복 확인
	@Override
	public MemberVO idcheck(String userId) throws Exception{
		return sql.selectOne(namespace + ".idCheck", userId);
	}
	
}
