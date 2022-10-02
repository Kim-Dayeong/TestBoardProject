package com.rryy.persistence;

import com.rryy.domain.MemberVO;

public interface MemberDAO {
	
	//회원가입
	public void register(MemberVO vo) throws Exception;
	
	//로그인 
	public MemberVO login(MemberVO vo) throws Exception;
	
	// 회원정보 수정 
	public void modify(MemberVO vo) throws Exception;
	
	// 회원 탈퇴 
	public void withdrawal(MemberVO vo) throws Exception;
	
	// 아이디 중복 확인
	public MemberVO idcheck(String userId) throws Exception;

}
